; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34988 () Bool)

(assert start!34988)

(declare-fun res!137363 () Bool)

(declare-fun e!113974 () Bool)

(assert (=> start!34988 (=> (not res!137363) (not e!113974))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34988 (= res!137363 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34988 e!113974))

(assert (=> start!34988 true))

(declare-datatypes ((array!8295 0))(
  ( (array!8296 (arr!4630 (Array (_ BitVec 32) (_ BitVec 8))) (size!3709 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6574 0))(
  ( (BitStream!6575 (buf!4161 array!8295) (currentByte!7771 (_ BitVec 32)) (currentBit!7766 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6574)

(declare-fun e!113975 () Bool)

(declare-fun inv!12 (BitStream!6574) Bool)

(assert (=> start!34988 (and (inv!12 thiss!1577) e!113975)))

(declare-fun b!164857 () Bool)

(declare-fun res!137362 () Bool)

(assert (=> b!164857 (=> (not res!137362) (not e!113974))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164857 (= res!137362 (validate_offset_bits!1 ((_ sign_extend 32) (size!3709 (buf!4161 thiss!1577))) ((_ sign_extend 32) (currentByte!7771 thiss!1577)) ((_ sign_extend 32) (currentBit!7766 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164858 () Bool)

(declare-fun lt!258510 () (_ BitVec 32))

(assert (=> b!164858 (= e!113974 (and (bvslt lt!258510 #b00000000000000000000000010000000) (bvslt lt!258510 #b11111111111111111111111110000000)))))

(assert (=> b!164858 (= lt!258510 (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7766 thiss!1577))))))))

(declare-fun b!164859 () Bool)

(declare-fun array_inv!3450 (array!8295) Bool)

(assert (=> b!164859 (= e!113975 (array_inv!3450 (buf!4161 thiss!1577)))))

(assert (= (and start!34988 res!137363) b!164857))

(assert (= (and b!164857 res!137362) b!164858))

(assert (= start!34988 b!164859))

(declare-fun m!262219 () Bool)

(assert (=> start!34988 m!262219))

(declare-fun m!262221 () Bool)

(assert (=> b!164857 m!262221))

(declare-fun m!262223 () Bool)

(assert (=> b!164858 m!262223))

(declare-fun m!262225 () Bool)

(assert (=> b!164859 m!262225))

(push 1)

(assert (not b!164857))

(assert (not start!34988))

(assert (not b!164859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

