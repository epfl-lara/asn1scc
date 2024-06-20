; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34992 () Bool)

(assert start!34992)

(declare-fun res!137375 () Bool)

(declare-fun e!113992 () Bool)

(assert (=> start!34992 (=> (not res!137375) (not e!113992))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34992 (= res!137375 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34992 e!113992))

(assert (=> start!34992 true))

(declare-datatypes ((array!8299 0))(
  ( (array!8300 (arr!4632 (Array (_ BitVec 32) (_ BitVec 8))) (size!3711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6578 0))(
  ( (BitStream!6579 (buf!4163 array!8299) (currentByte!7773 (_ BitVec 32)) (currentBit!7768 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6578)

(declare-fun e!113994 () Bool)

(declare-fun inv!12 (BitStream!6578) Bool)

(assert (=> start!34992 (and (inv!12 thiss!1577) e!113994)))

(declare-fun b!164875 () Bool)

(declare-fun res!137374 () Bool)

(assert (=> b!164875 (=> (not res!137374) (not e!113992))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164875 (= res!137374 (validate_offset_bits!1 ((_ sign_extend 32) (size!3711 (buf!4163 thiss!1577))) ((_ sign_extend 32) (currentByte!7773 thiss!1577)) ((_ sign_extend 32) (currentBit!7768 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164876 () Bool)

(declare-fun lt!258516 () (_ BitVec 32))

(assert (=> b!164876 (= e!113992 (and (bvslt lt!258516 #b00000000000000000000000010000000) (bvslt lt!258516 #b11111111111111111111111110000000)))))

(assert (=> b!164876 (= lt!258516 (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7768 thiss!1577))))))))

(declare-fun b!164877 () Bool)

(declare-fun array_inv!3452 (array!8299) Bool)

(assert (=> b!164877 (= e!113994 (array_inv!3452 (buf!4163 thiss!1577)))))

(assert (= (and start!34992 res!137375) b!164875))

(assert (= (and b!164875 res!137374) b!164876))

(assert (= start!34992 b!164877))

(declare-fun m!262235 () Bool)

(assert (=> start!34992 m!262235))

(declare-fun m!262237 () Bool)

(assert (=> b!164875 m!262237))

(declare-fun m!262239 () Bool)

(assert (=> b!164876 m!262239))

(declare-fun m!262241 () Bool)

(assert (=> b!164877 m!262241))

(push 1)

(assert (not start!34992))

(assert (not b!164877))

(assert (not b!164875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

