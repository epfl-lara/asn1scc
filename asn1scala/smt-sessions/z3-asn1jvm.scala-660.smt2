; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18570 () Bool)

(assert start!18570)

(declare-fun b!92082 () Bool)

(declare-fun e!60537 () Bool)

(declare-datatypes ((array!4310 0))(
  ( (array!4311 (arr!2575 (Array (_ BitVec 32) (_ BitVec 8))) (size!1947 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3438 0))(
  ( (BitStream!3439 (buf!2328 array!4310) (currentByte!4642 (_ BitVec 32)) (currentBit!4637 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3438)

(assert (=> b!92082 (= e!60537 (or (bvsgt ((_ sign_extend 32) (size!1947 (buf!2328 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4642 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4637 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!92083 () Bool)

(declare-fun res!76024 () Bool)

(assert (=> b!92083 (=> (not res!76024) (not e!60537))))

(declare-fun bitStream2!8 () BitStream!3438)

(declare-fun base!8 () BitStream!3438)

(declare-fun isPrefixOf!0 (BitStream!3438 BitStream!3438) Bool)

(assert (=> b!92083 (= res!76024 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92084 () Bool)

(declare-fun res!76028 () Bool)

(assert (=> b!92084 (=> (not res!76028) (not e!60537))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92084 (= res!76028 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1947 (buf!2328 bitStream1!8)) (currentByte!4642 bitStream1!8) (currentBit!4637 bitStream1!8))) (bitIndex!0 (size!1947 (buf!2328 bitStream2!8)) (currentByte!4642 bitStream2!8) (currentBit!4637 bitStream2!8))))))

(declare-fun b!92085 () Bool)

(declare-fun res!76023 () Bool)

(assert (=> b!92085 (=> (not res!76023) (not e!60537))))

(declare-datatypes ((List!825 0))(
  ( (Nil!822) (Cons!821 (h!940 Bool) (t!1575 List!825)) )
))
(declare-fun listBits!13 () List!825)

(declare-fun length!416 (List!825) Int)

(assert (=> b!92085 (= res!76023 (> (length!416 listBits!13) 0))))

(declare-fun b!92087 () Bool)

(declare-fun res!76025 () Bool)

(assert (=> b!92087 (=> (not res!76025) (not e!60537))))

(assert (=> b!92087 (= res!76025 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92088 () Bool)

(declare-fun e!60539 () Bool)

(declare-fun array_inv!1784 (array!4310) Bool)

(assert (=> b!92088 (= e!60539 (array_inv!1784 (buf!2328 base!8)))))

(declare-fun b!92089 () Bool)

(declare-fun res!76029 () Bool)

(assert (=> b!92089 (=> (not res!76029) (not e!60537))))

(assert (=> b!92089 (= res!76029 (and (= (buf!2328 bitStream1!8) (buf!2328 bitStream2!8)) (= (buf!2328 bitStream1!8) (buf!2328 base!8))))))

(declare-fun b!92090 () Bool)

(declare-fun res!76027 () Bool)

(assert (=> b!92090 (=> (not res!76027) (not e!60537))))

(assert (=> b!92090 (= res!76027 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun res!76026 () Bool)

(assert (=> start!18570 (=> (not res!76026) (not e!60537))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18570 (= res!76026 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18570 e!60537))

(assert (=> start!18570 true))

(declare-fun e!60542 () Bool)

(declare-fun inv!12 (BitStream!3438) Bool)

(assert (=> start!18570 (and (inv!12 bitStream1!8) e!60542)))

(declare-fun e!60543 () Bool)

(assert (=> start!18570 (and (inv!12 bitStream2!8) e!60543)))

(assert (=> start!18570 (and (inv!12 base!8) e!60539)))

(declare-fun b!92086 () Bool)

(assert (=> b!92086 (= e!60542 (array_inv!1784 (buf!2328 bitStream1!8)))))

(declare-fun b!92091 () Bool)

(assert (=> b!92091 (= e!60543 (array_inv!1784 (buf!2328 bitStream2!8)))))

(declare-fun b!92092 () Bool)

(declare-fun res!76030 () Bool)

(assert (=> b!92092 (=> (not res!76030) (not e!60537))))

(assert (=> b!92092 (= res!76030 (bvslt (bitIndex!0 (size!1947 (buf!2328 base!8)) (currentByte!4642 base!8) (currentBit!4637 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(assert (= (and start!18570 res!76026) b!92085))

(assert (= (and b!92085 res!76023) b!92090))

(assert (= (and b!92090 res!76027) b!92083))

(assert (= (and b!92083 res!76024) b!92087))

(assert (= (and b!92087 res!76025) b!92089))

(assert (= (and b!92089 res!76029) b!92092))

(assert (= (and b!92092 res!76030) b!92084))

(assert (= (and b!92084 res!76028) b!92082))

(assert (= start!18570 b!92086))

(assert (= start!18570 b!92091))

(assert (= start!18570 b!92088))

(declare-fun m!136123 () Bool)

(assert (=> b!92087 m!136123))

(declare-fun m!136125 () Bool)

(assert (=> b!92088 m!136125))

(declare-fun m!136127 () Bool)

(assert (=> b!92091 m!136127))

(declare-fun m!136129 () Bool)

(assert (=> b!92084 m!136129))

(declare-fun m!136131 () Bool)

(assert (=> b!92084 m!136131))

(declare-fun m!136133 () Bool)

(assert (=> start!18570 m!136133))

(declare-fun m!136135 () Bool)

(assert (=> start!18570 m!136135))

(declare-fun m!136137 () Bool)

(assert (=> start!18570 m!136137))

(declare-fun m!136139 () Bool)

(assert (=> b!92090 m!136139))

(declare-fun m!136141 () Bool)

(assert (=> b!92086 m!136141))

(declare-fun m!136143 () Bool)

(assert (=> b!92083 m!136143))

(declare-fun m!136145 () Bool)

(assert (=> b!92092 m!136145))

(declare-fun m!136147 () Bool)

(assert (=> b!92085 m!136147))

(check-sat (not b!92088) (not b!92085) (not b!92090) (not b!92084) (not b!92092) (not start!18570) (not b!92086) (not b!92083) (not b!92087) (not b!92091))
(check-sat)
