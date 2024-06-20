; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19994 () Bool)

(assert start!19994)

(declare-fun b!99662 () Bool)

(declare-fun res!81785 () Bool)

(declare-fun e!65238 () Bool)

(assert (=> b!99662 (=> (not res!81785) (not e!65238))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!99662 (= res!81785 (bvslt i!615 nBits!396))))

(declare-fun b!99663 () Bool)

(declare-fun res!81787 () Bool)

(declare-fun e!65237 () Bool)

(assert (=> b!99663 (=> (not res!81787) (not e!65237))))

(declare-datatypes ((array!4693 0))(
  ( (array!4694 (arr!2735 (Array (_ BitVec 32) (_ BitVec 8))) (size!2142 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3758 0))(
  ( (BitStream!3759 (buf!2499 array!4693) (currentByte!4945 (_ BitVec 32)) (currentBit!4940 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3758)

(declare-datatypes ((Unit!6111 0))(
  ( (Unit!6112) )
))
(declare-datatypes ((tuple2!8034 0))(
  ( (tuple2!8035 (_1!4272 Unit!6111) (_2!4272 BitStream!3758)) )
))
(declare-fun lt!144444 () tuple2!8034)

(declare-fun isPrefixOf!0 (BitStream!3758 BitStream!3758) Bool)

(assert (=> b!99663 (= res!81787 (isPrefixOf!0 thiss!1305 (_2!4272 lt!144444)))))

(declare-fun b!99664 () Bool)

(declare-fun e!65234 () Bool)

(assert (=> b!99664 (= e!65234 e!65237)))

(declare-fun res!81782 () Bool)

(assert (=> b!99664 (=> (not res!81782) (not e!65237))))

(declare-fun lt!144447 () (_ BitVec 64))

(declare-fun lt!144442 () (_ BitVec 64))

(assert (=> b!99664 (= res!81782 (= lt!144447 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144442)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99664 (= lt!144447 (bitIndex!0 (size!2142 (buf!2499 (_2!4272 lt!144444))) (currentByte!4945 (_2!4272 lt!144444)) (currentBit!4940 (_2!4272 lt!144444))))))

(assert (=> b!99664 (= lt!144442 (bitIndex!0 (size!2142 (buf!2499 thiss!1305)) (currentByte!4945 thiss!1305) (currentBit!4940 thiss!1305)))))

(declare-fun res!81783 () Bool)

(assert (=> start!19994 (=> (not res!81783) (not e!65238))))

(assert (=> start!19994 (= res!81783 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19994 e!65238))

(assert (=> start!19994 true))

(declare-fun e!65235 () Bool)

(declare-fun inv!12 (BitStream!3758) Bool)

(assert (=> start!19994 (and (inv!12 thiss!1305) e!65235)))

(declare-fun b!99665 () Bool)

(declare-fun e!65236 () Bool)

(assert (=> b!99665 (= e!65238 (not e!65236))))

(declare-fun res!81788 () Bool)

(assert (=> b!99665 (=> res!81788 e!65236)))

(assert (=> b!99665 (= res!81788 (not (isPrefixOf!0 thiss!1305 (_2!4272 lt!144444))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!144445 () tuple2!8034)

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3758 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8034)

(assert (=> b!99665 (= lt!144445 (appendNLeastSignificantBitsLoop!0 (_2!4272 lt!144444) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!99665 e!65234))

(declare-fun res!81781 () Bool)

(assert (=> b!99665 (=> (not res!81781) (not e!65234))))

(assert (=> b!99665 (= res!81781 (= (size!2142 (buf!2499 thiss!1305)) (size!2142 (buf!2499 (_2!4272 lt!144444)))))))

(declare-fun lt!144448 () Bool)

(declare-fun appendBit!0 (BitStream!3758 Bool) tuple2!8034)

(assert (=> b!99665 (= lt!144444 (appendBit!0 thiss!1305 lt!144448))))

(assert (=> b!99665 (= lt!144448 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99666 () Bool)

(declare-fun res!81784 () Bool)

(assert (=> b!99666 (=> (not res!81784) (not e!65238))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99666 (= res!81784 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99667 () Bool)

(declare-fun e!65233 () Bool)

(declare-datatypes ((tuple2!8036 0))(
  ( (tuple2!8037 (_1!4273 BitStream!3758) (_2!4273 Bool)) )
))
(declare-fun lt!144446 () tuple2!8036)

(assert (=> b!99667 (= e!65233 (= (bitIndex!0 (size!2142 (buf!2499 (_1!4273 lt!144446))) (currentByte!4945 (_1!4273 lt!144446)) (currentBit!4940 (_1!4273 lt!144446))) lt!144447))))

(declare-fun b!99668 () Bool)

(declare-fun array_inv!1944 (array!4693) Bool)

(assert (=> b!99668 (= e!65235 (array_inv!1944 (buf!2499 thiss!1305)))))

(declare-fun b!99669 () Bool)

(declare-fun res!81780 () Bool)

(assert (=> b!99669 (=> (not res!81780) (not e!65238))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99669 (= res!81780 (validate_offset_bits!1 ((_ sign_extend 32) (size!2142 (buf!2499 thiss!1305))) ((_ sign_extend 32) (currentByte!4945 thiss!1305)) ((_ sign_extend 32) (currentBit!4940 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99670 () Bool)

(assert (=> b!99670 (= e!65236 true)))

(declare-fun lt!144443 () Bool)

(assert (=> b!99670 (= lt!144443 (isPrefixOf!0 (_2!4272 lt!144444) (_2!4272 lt!144445)))))

(declare-fun b!99671 () Bool)

(assert (=> b!99671 (= e!65237 e!65233)))

(declare-fun res!81786 () Bool)

(assert (=> b!99671 (=> (not res!81786) (not e!65233))))

(assert (=> b!99671 (= res!81786 (and (= (_2!4273 lt!144446) lt!144448) (= (_1!4273 lt!144446) (_2!4272 lt!144444))))))

(declare-fun readBitPure!0 (BitStream!3758) tuple2!8036)

(declare-fun readerFrom!0 (BitStream!3758 (_ BitVec 32) (_ BitVec 32)) BitStream!3758)

(assert (=> b!99671 (= lt!144446 (readBitPure!0 (readerFrom!0 (_2!4272 lt!144444) (currentBit!4940 thiss!1305) (currentByte!4945 thiss!1305))))))

(assert (= (and start!19994 res!81783) b!99669))

(assert (= (and b!99669 res!81780) b!99666))

(assert (= (and b!99666 res!81784) b!99662))

(assert (= (and b!99662 res!81785) b!99665))

(assert (= (and b!99665 res!81781) b!99664))

(assert (= (and b!99664 res!81782) b!99663))

(assert (= (and b!99663 res!81787) b!99671))

(assert (= (and b!99671 res!81786) b!99667))

(assert (= (and b!99665 (not res!81788)) b!99670))

(assert (= start!19994 b!99668))

(declare-fun m!144995 () Bool)

(assert (=> b!99668 m!144995))

(declare-fun m!144997 () Bool)

(assert (=> b!99665 m!144997))

(declare-fun m!144999 () Bool)

(assert (=> b!99665 m!144999))

(declare-fun m!145001 () Bool)

(assert (=> b!99665 m!145001))

(declare-fun m!145003 () Bool)

(assert (=> b!99669 m!145003))

(declare-fun m!145005 () Bool)

(assert (=> b!99666 m!145005))

(declare-fun m!145007 () Bool)

(assert (=> b!99670 m!145007))

(declare-fun m!145009 () Bool)

(assert (=> b!99667 m!145009))

(declare-fun m!145011 () Bool)

(assert (=> b!99664 m!145011))

(declare-fun m!145013 () Bool)

(assert (=> b!99664 m!145013))

(declare-fun m!145015 () Bool)

(assert (=> start!19994 m!145015))

(declare-fun m!145017 () Bool)

(assert (=> b!99671 m!145017))

(assert (=> b!99671 m!145017))

(declare-fun m!145019 () Bool)

(assert (=> b!99671 m!145019))

(assert (=> b!99663 m!144997))

(push 1)

(assert (not b!99670))

(assert (not b!99663))

(assert (not b!99664))

(assert (not start!19994))

(assert (not b!99669))

(assert (not b!99666))

(assert (not b!99665))

(assert (not b!99671))

(assert (not b!99667))

(assert (not b!99668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

