; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19218 () Bool)

(assert start!19218)

(declare-fun b!96252 () Bool)

(declare-fun e!63054 () Bool)

(declare-datatypes ((array!4489 0))(
  ( (array!4490 (arr!2648 (Array (_ BitVec 32) (_ BitVec 8))) (size!2052 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3584 0))(
  ( (BitStream!3585 (buf!2401 array!4489) (currentByte!4789 (_ BitVec 32)) (currentBit!4784 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3584)

(declare-fun array_inv!1857 (array!4489) Bool)

(assert (=> b!96252 (= e!63054 (array_inv!1857 (buf!2401 bitStream1!8)))))

(declare-fun b!96253 () Bool)

(declare-fun res!79129 () Bool)

(declare-fun e!63046 () Bool)

(assert (=> b!96253 (=> (not res!79129) (not e!63046))))

(declare-datatypes ((List!898 0))(
  ( (Nil!895) (Cons!894 (h!1013 Bool) (t!1648 List!898)) )
))
(declare-fun listBits!13 () List!898)

(declare-fun length!489 (List!898) Int)

(assert (=> b!96253 (= res!79129 (> (length!489 listBits!13) 0))))

(declare-fun b!96254 () Bool)

(declare-fun e!63052 () Bool)

(declare-fun thiss!1534 () BitStream!3584)

(assert (=> b!96254 (= e!63052 (array_inv!1857 (buf!2401 thiss!1534)))))

(declare-fun b!96255 () Bool)

(declare-fun res!79132 () Bool)

(assert (=> b!96255 (=> (not res!79132) (not e!63046))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!96255 (= res!79132 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96256 () Bool)

(declare-fun res!79125 () Bool)

(assert (=> b!96256 (=> (not res!79125) (not e!63046))))

(declare-fun bitStream2!8 () BitStream!3584)

(declare-fun base!8 () BitStream!3584)

(declare-fun isPrefixOf!0 (BitStream!3584 BitStream!3584) Bool)

(assert (=> b!96256 (= res!79125 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!96257 () Bool)

(declare-fun res!79121 () Bool)

(assert (=> b!96257 (=> (not res!79121) (not e!63046))))

(assert (=> b!96257 (= res!79121 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!96258 () Bool)

(declare-fun res!79122 () Bool)

(assert (=> b!96258 (=> (not res!79122) (not e!63046))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96258 (= res!79122 (bvslt (bitIndex!0 (size!2052 (buf!2401 base!8)) (currentByte!4789 base!8) (currentBit!4784 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!96259 () Bool)

(assert (=> b!96259 (= e!63046 (and (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!96260 () Bool)

(declare-fun res!79128 () Bool)

(assert (=> b!96260 (=> (not res!79128) (not e!63046))))

(assert (=> b!96260 (= res!79128 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!96261 () Bool)

(declare-fun res!79131 () Bool)

(assert (=> b!96261 (=> (not res!79131) (not e!63046))))

(assert (=> b!96261 (= res!79131 (and (= (buf!2401 bitStream1!8) (buf!2401 bitStream2!8)) (= (buf!2401 bitStream1!8) (buf!2401 base!8))))))

(declare-fun b!96251 () Bool)

(declare-fun e!63050 () Bool)

(assert (=> b!96251 (= e!63050 (array_inv!1857 (buf!2401 bitStream2!8)))))

(declare-fun res!79127 () Bool)

(assert (=> start!19218 (=> (not res!79127) (not e!63046))))

(assert (=> start!19218 (= res!79127 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19218 e!63046))

(assert (=> start!19218 true))

(declare-fun inv!12 (BitStream!3584) Bool)

(assert (=> start!19218 (and (inv!12 bitStream1!8) e!63054)))

(assert (=> start!19218 (and (inv!12 bitStream2!8) e!63050)))

(declare-fun e!63053 () Bool)

(assert (=> start!19218 (and (inv!12 base!8) e!63053)))

(assert (=> start!19218 (and (inv!12 thiss!1534) e!63052)))

(declare-fun b!96262 () Bool)

(declare-fun res!79123 () Bool)

(assert (=> b!96262 (=> (not res!79123) (not e!63046))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96262 (= res!79123 (validate_offset_bits!1 ((_ sign_extend 32) (size!2052 (buf!2401 bitStream1!8))) ((_ sign_extend 32) (currentByte!4789 bitStream1!8)) ((_ sign_extend 32) (currentBit!4784 bitStream1!8)) nBits!484))))

(declare-fun b!96263 () Bool)

(declare-fun res!79130 () Bool)

(assert (=> b!96263 (=> (not res!79130) (not e!63046))))

(assert (=> b!96263 (= res!79130 (validate_offset_bits!1 ((_ sign_extend 32) (size!2052 (buf!2401 bitStream2!8))) ((_ sign_extend 32) (currentByte!4789 bitStream2!8)) ((_ sign_extend 32) (currentBit!4784 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96264 () Bool)

(declare-fun res!79124 () Bool)

(assert (=> b!96264 (=> (not res!79124) (not e!63046))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3584 BitStream!3584 (_ BitVec 64)) List!898)

(assert (=> b!96264 (= res!79124 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!96265 () Bool)

(assert (=> b!96265 (= e!63053 (array_inv!1857 (buf!2401 base!8)))))

(declare-fun b!96266 () Bool)

(declare-fun res!79126 () Bool)

(assert (=> b!96266 (=> (not res!79126) (not e!63046))))

(declare-datatypes ((tuple2!7722 0))(
  ( (tuple2!7723 (_1!4110 BitStream!3584) (_2!4110 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3584) tuple2!7722)

(declare-fun head!595 (List!898) Bool)

(assert (=> b!96266 (= res!79126 (= (_2!4110 (readBitPure!0 bitStream1!8)) (head!595 listBits!13)))))

(declare-fun b!96267 () Bool)

(declare-fun res!79120 () Bool)

(assert (=> b!96267 (=> (not res!79120) (not e!63046))))

(assert (=> b!96267 (= res!79120 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2052 (buf!2401 bitStream1!8)) (currentByte!4789 bitStream1!8) (currentBit!4784 bitStream1!8))) (bitIndex!0 (size!2052 (buf!2401 bitStream2!8)) (currentByte!4789 bitStream2!8) (currentBit!4784 bitStream2!8))))))

(assert (= (and start!19218 res!79127) b!96253))

(assert (= (and b!96253 res!79129) b!96257))

(assert (= (and b!96257 res!79121) b!96256))

(assert (= (and b!96256 res!79125) b!96260))

(assert (= (and b!96260 res!79128) b!96261))

(assert (= (and b!96261 res!79131) b!96258))

(assert (= (and b!96258 res!79122) b!96267))

(assert (= (and b!96267 res!79120) b!96262))

(assert (= (and b!96262 res!79123) b!96263))

(assert (= (and b!96263 res!79130) b!96264))

(assert (= (and b!96264 res!79124) b!96255))

(assert (= (and b!96255 res!79132) b!96266))

(assert (= (and b!96266 res!79126) b!96259))

(assert (= start!19218 b!96252))

(assert (= start!19218 b!96251))

(assert (= start!19218 b!96265))

(assert (= start!19218 b!96254))

(declare-fun m!139599 () Bool)

(assert (=> b!96257 m!139599))

(declare-fun m!139601 () Bool)

(assert (=> b!96264 m!139601))

(declare-fun m!139603 () Bool)

(assert (=> b!96263 m!139603))

(declare-fun m!139605 () Bool)

(assert (=> b!96253 m!139605))

(declare-fun m!139607 () Bool)

(assert (=> b!96266 m!139607))

(declare-fun m!139609 () Bool)

(assert (=> b!96266 m!139609))

(declare-fun m!139611 () Bool)

(assert (=> start!19218 m!139611))

(declare-fun m!139613 () Bool)

(assert (=> start!19218 m!139613))

(declare-fun m!139615 () Bool)

(assert (=> start!19218 m!139615))

(declare-fun m!139617 () Bool)

(assert (=> start!19218 m!139617))

(declare-fun m!139619 () Bool)

(assert (=> b!96254 m!139619))

(declare-fun m!139621 () Bool)

(assert (=> b!96252 m!139621))

(declare-fun m!139623 () Bool)

(assert (=> b!96251 m!139623))

(declare-fun m!139625 () Bool)

(assert (=> b!96258 m!139625))

(declare-fun m!139627 () Bool)

(assert (=> b!96256 m!139627))

(declare-fun m!139629 () Bool)

(assert (=> b!96262 m!139629))

(declare-fun m!139631 () Bool)

(assert (=> b!96260 m!139631))

(declare-fun m!139633 () Bool)

(assert (=> b!96265 m!139633))

(declare-fun m!139635 () Bool)

(assert (=> b!96267 m!139635))

(declare-fun m!139637 () Bool)

(assert (=> b!96267 m!139637))

(push 1)

(assert (not b!96260))

(assert (not b!96258))

(assert (not start!19218))

(assert (not b!96254))

(assert (not b!96257))

(assert (not b!96262))

(assert (not b!96252))

(assert (not b!96251))

(assert (not b!96253))

(assert (not b!96263))

(assert (not b!96266))

(assert (not b!96264))

(assert (not b!96265))

(assert (not b!96256))

(assert (not b!96267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

