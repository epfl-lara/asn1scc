; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18572 () Bool)

(assert start!18572)

(declare-fun b!92115 () Bool)

(declare-fun res!76049 () Bool)

(declare-fun e!60564 () Bool)

(assert (=> b!92115 (=> (not res!76049) (not e!60564))))

(declare-datatypes ((array!4312 0))(
  ( (array!4313 (arr!2576 (Array (_ BitVec 32) (_ BitVec 8))) (size!1948 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3440 0))(
  ( (BitStream!3441 (buf!2329 array!4312) (currentByte!4643 (_ BitVec 32)) (currentBit!4638 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3440)

(declare-fun base!8 () BitStream!3440)

(declare-fun isPrefixOf!0 (BitStream!3440 BitStream!3440) Bool)

(assert (=> b!92115 (= res!76049 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun res!76052 () Bool)

(assert (=> start!18572 (=> (not res!76052) (not e!60564))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18572 (= res!76052 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18572 e!60564))

(assert (=> start!18572 true))

(declare-fun e!60560 () Bool)

(declare-fun inv!12 (BitStream!3440) Bool)

(assert (=> start!18572 (and (inv!12 bitStream1!8) e!60560)))

(declare-fun bitStream2!8 () BitStream!3440)

(declare-fun e!60558 () Bool)

(assert (=> start!18572 (and (inv!12 bitStream2!8) e!60558)))

(declare-fun e!60561 () Bool)

(assert (=> start!18572 (and (inv!12 base!8) e!60561)))

(declare-fun b!92116 () Bool)

(declare-fun array_inv!1785 (array!4312) Bool)

(assert (=> b!92116 (= e!60558 (array_inv!1785 (buf!2329 bitStream2!8)))))

(declare-fun b!92117 () Bool)

(assert (=> b!92117 (= e!60564 (or (bvsgt ((_ sign_extend 32) (size!1948 (buf!2329 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4643 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4638 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!92118 () Bool)

(assert (=> b!92118 (= e!60561 (array_inv!1785 (buf!2329 base!8)))))

(declare-fun b!92119 () Bool)

(assert (=> b!92119 (= e!60560 (array_inv!1785 (buf!2329 bitStream1!8)))))

(declare-fun b!92120 () Bool)

(declare-fun res!76054 () Bool)

(assert (=> b!92120 (=> (not res!76054) (not e!60564))))

(assert (=> b!92120 (= res!76054 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92121 () Bool)

(declare-fun res!76047 () Bool)

(assert (=> b!92121 (=> (not res!76047) (not e!60564))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92121 (= res!76047 (bvslt (bitIndex!0 (size!1948 (buf!2329 base!8)) (currentByte!4643 base!8) (currentBit!4638 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92122 () Bool)

(declare-fun res!76050 () Bool)

(assert (=> b!92122 (=> (not res!76050) (not e!60564))))

(assert (=> b!92122 (= res!76050 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92123 () Bool)

(declare-fun res!76051 () Bool)

(assert (=> b!92123 (=> (not res!76051) (not e!60564))))

(assert (=> b!92123 (= res!76051 (and (= (buf!2329 bitStream1!8) (buf!2329 bitStream2!8)) (= (buf!2329 bitStream1!8) (buf!2329 base!8))))))

(declare-fun b!92124 () Bool)

(declare-fun res!76053 () Bool)

(assert (=> b!92124 (=> (not res!76053) (not e!60564))))

(declare-datatypes ((List!826 0))(
  ( (Nil!823) (Cons!822 (h!941 Bool) (t!1576 List!826)) )
))
(declare-fun listBits!13 () List!826)

(declare-fun length!417 (List!826) Int)

(assert (=> b!92124 (= res!76053 (> (length!417 listBits!13) 0))))

(declare-fun b!92125 () Bool)

(declare-fun res!76048 () Bool)

(assert (=> b!92125 (=> (not res!76048) (not e!60564))))

(assert (=> b!92125 (= res!76048 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1948 (buf!2329 bitStream1!8)) (currentByte!4643 bitStream1!8) (currentBit!4638 bitStream1!8))) (bitIndex!0 (size!1948 (buf!2329 bitStream2!8)) (currentByte!4643 bitStream2!8) (currentBit!4638 bitStream2!8))))))

(assert (= (and start!18572 res!76052) b!92124))

(assert (= (and b!92124 res!76053) b!92115))

(assert (= (and b!92115 res!76049) b!92122))

(assert (= (and b!92122 res!76050) b!92120))

(assert (= (and b!92120 res!76054) b!92123))

(assert (= (and b!92123 res!76051) b!92121))

(assert (= (and b!92121 res!76047) b!92125))

(assert (= (and b!92125 res!76048) b!92117))

(assert (= start!18572 b!92119))

(assert (= start!18572 b!92116))

(assert (= start!18572 b!92118))

(declare-fun m!136149 () Bool)

(assert (=> b!92116 m!136149))

(declare-fun m!136151 () Bool)

(assert (=> b!92125 m!136151))

(declare-fun m!136153 () Bool)

(assert (=> b!92125 m!136153))

(declare-fun m!136155 () Bool)

(assert (=> b!92124 m!136155))

(declare-fun m!136157 () Bool)

(assert (=> b!92121 m!136157))

(declare-fun m!136159 () Bool)

(assert (=> b!92120 m!136159))

(declare-fun m!136161 () Bool)

(assert (=> b!92118 m!136161))

(declare-fun m!136163 () Bool)

(assert (=> b!92119 m!136163))

(declare-fun m!136165 () Bool)

(assert (=> start!18572 m!136165))

(declare-fun m!136167 () Bool)

(assert (=> start!18572 m!136167))

(declare-fun m!136169 () Bool)

(assert (=> start!18572 m!136169))

(declare-fun m!136171 () Bool)

(assert (=> b!92122 m!136171))

(declare-fun m!136173 () Bool)

(assert (=> b!92115 m!136173))

(push 1)

(assert (not b!92120))

(assert (not b!92116))

(assert (not start!18572))

(assert (not b!92124))

(assert (not b!92119))

(assert (not b!92115))

(assert (not b!92125))

(assert (not b!92121))

(assert (not b!92118))

(assert (not b!92122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

