; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31974 () Bool)

(assert start!31974)

(declare-datatypes ((array!7463 0))(
  ( (array!7464 (arr!4304 (Array (_ BitVec 32) (_ BitVec 8))) (size!3383 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5934 0))(
  ( (BitStream!5935 (buf!3841 array!7463) (currentByte!7051 (_ BitVec 32)) (currentBit!7046 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5934)

(assert (=> start!31974 (or (bvsgt ((_ sign_extend 32) (size!3383 (buf!3841 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7051 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7046 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!108074 () Bool)

(declare-fun inv!12 (BitStream!5934) Bool)

(assert (=> start!31974 (and (inv!12 thiss!1602) e!108074)))

(declare-fun b!158718 () Bool)

(declare-fun array_inv!3130 (array!7463) Bool)

(assert (=> b!158718 (= e!108074 (array_inv!3130 (buf!3841 thiss!1602)))))

(assert (= start!31974 b!158718))

(declare-fun m!249269 () Bool)

(assert (=> start!31974 m!249269))

(declare-fun m!249271 () Bool)

(assert (=> b!158718 m!249271))

(check-sat (not b!158718) (not start!31974))
(check-sat)
