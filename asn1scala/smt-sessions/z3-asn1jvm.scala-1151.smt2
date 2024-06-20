; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32604 () Bool)

(assert start!32604)

(declare-fun res!133760 () Bool)

(declare-fun e!109713 () Bool)

(assert (=> start!32604 (=> (not res!133760) (not e!109713))))

(declare-datatypes ((array!7668 0))(
  ( (array!7669 (arr!4388 (Array (_ BitVec 32) (_ BitVec 8))) (size!3467 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6102 0))(
  ( (BitStream!6103 (buf!3925 array!7668) (currentByte!7198 (_ BitVec 32)) (currentBit!7193 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6102)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32604 (= res!133760 (validate_offset_byte!0 ((_ sign_extend 32) (size!3467 (buf!3925 thiss!1602))) ((_ sign_extend 32) (currentByte!7198 thiss!1602)) ((_ sign_extend 32) (currentBit!7193 thiss!1602))))))

(assert (=> start!32604 e!109713))

(declare-fun e!109711 () Bool)

(declare-fun inv!12 (BitStream!6102) Bool)

(assert (=> start!32604 (and (inv!12 thiss!1602) e!109711)))

(declare-fun b!160295 () Bool)

(declare-fun lt!252936 () (_ BitVec 32))

(assert (=> b!160295 (= e!109713 (and (not (= #b00000000000000000000000000000000 (bvand lt!252936 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 lt!252936) #b10000000000000000000000000000000)))))))

(assert (=> b!160295 (= lt!252936 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7193 thiss!1602))))))

(declare-fun b!160296 () Bool)

(declare-fun array_inv!3214 (array!7668) Bool)

(assert (=> b!160296 (= e!109711 (array_inv!3214 (buf!3925 thiss!1602)))))

(assert (= (and start!32604 res!133760) b!160295))

(assert (= start!32604 b!160296))

(declare-fun m!253069 () Bool)

(assert (=> start!32604 m!253069))

(declare-fun m!253071 () Bool)

(assert (=> start!32604 m!253071))

(declare-fun m!253073 () Bool)

(assert (=> b!160296 m!253073))

(check-sat (not start!32604) (not b!160296))
