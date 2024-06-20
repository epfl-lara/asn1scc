; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32602 () Bool)

(assert start!32602)

(declare-fun res!133757 () Bool)

(declare-fun e!109704 () Bool)

(assert (=> start!32602 (=> (not res!133757) (not e!109704))))

(declare-datatypes ((array!7666 0))(
  ( (array!7667 (arr!4387 (Array (_ BitVec 32) (_ BitVec 8))) (size!3466 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6100 0))(
  ( (BitStream!6101 (buf!3924 array!7666) (currentByte!7197 (_ BitVec 32)) (currentBit!7192 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6100)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32602 (= res!133757 (validate_offset_byte!0 ((_ sign_extend 32) (size!3466 (buf!3924 thiss!1602))) ((_ sign_extend 32) (currentByte!7197 thiss!1602)) ((_ sign_extend 32) (currentBit!7192 thiss!1602))))))

(assert (=> start!32602 e!109704))

(declare-fun e!109703 () Bool)

(declare-fun inv!12 (BitStream!6100) Bool)

(assert (=> start!32602 (and (inv!12 thiss!1602) e!109703)))

(declare-fun b!160289 () Bool)

(declare-fun lt!252933 () (_ BitVec 32))

(assert (=> b!160289 (= e!109704 (and (not (= #b00000000000000000000000000000000 (bvand lt!252933 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 lt!252933) #b10000000000000000000000000000000)))))))

(assert (=> b!160289 (= lt!252933 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7192 thiss!1602))))))

(declare-fun b!160290 () Bool)

(declare-fun array_inv!3213 (array!7666) Bool)

(assert (=> b!160290 (= e!109703 (array_inv!3213 (buf!3924 thiss!1602)))))

(assert (= (and start!32602 res!133757) b!160289))

(assert (= start!32602 b!160290))

(declare-fun m!253063 () Bool)

(assert (=> start!32602 m!253063))

(declare-fun m!253065 () Bool)

(assert (=> start!32602 m!253065))

(declare-fun m!253067 () Bool)

(assert (=> b!160290 m!253067))

(push 1)

(assert (not b!160290))

(assert (not start!32602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

