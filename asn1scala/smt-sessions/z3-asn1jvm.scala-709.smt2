; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19914 () Bool)

(assert start!19914)

(declare-fun b!99180 () Bool)

(declare-fun e!64916 () Bool)

(declare-datatypes ((array!4664 0))(
  ( (array!4665 (arr!2722 (Array (_ BitVec 32) (_ BitVec 8))) (size!2129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3732 0))(
  ( (BitStream!3733 (buf!2486 array!4664) (currentByte!4926 (_ BitVec 32)) (currentBit!4921 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3732)

(declare-fun array_inv!1931 (array!4664) Bool)

(assert (=> b!99180 (= e!64916 (array_inv!1931 (buf!2486 thiss!1305)))))

(declare-fun b!99181 () Bool)

(declare-fun e!64915 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!99181 (= e!64915 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun e!64917 () Bool)

(assert (=> b!99181 e!64917))

(declare-fun res!81341 () Bool)

(assert (=> b!99181 (=> (not res!81341) (not e!64917))))

(declare-datatypes ((Unit!6085 0))(
  ( (Unit!6086) )
))
(declare-datatypes ((tuple2!7976 0))(
  ( (tuple2!7977 (_1!4243 Unit!6085) (_2!4243 BitStream!3732)) )
))
(declare-fun lt!144082 () tuple2!7976)

(assert (=> b!99181 (= res!81341 (= (size!2129 (buf!2486 thiss!1305)) (size!2129 (buf!2486 (_2!4243 lt!144082)))))))

(declare-fun lt!144080 () Bool)

(declare-fun appendBit!0 (BitStream!3732 Bool) tuple2!7976)

(assert (=> b!99181 (= lt!144082 (appendBit!0 thiss!1305 lt!144080))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!99181 (= lt!144080 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99182 () Bool)

(declare-fun e!64912 () Bool)

(declare-fun e!64914 () Bool)

(assert (=> b!99182 (= e!64912 e!64914)))

(declare-fun res!81342 () Bool)

(assert (=> b!99182 (=> (not res!81342) (not e!64914))))

(declare-datatypes ((tuple2!7978 0))(
  ( (tuple2!7979 (_1!4244 BitStream!3732) (_2!4244 Bool)) )
))
(declare-fun lt!144079 () tuple2!7978)

(assert (=> b!99182 (= res!81342 (and (= (_2!4244 lt!144079) lt!144080) (= (_1!4244 lt!144079) (_2!4243 lt!144082))))))

(declare-fun readBitPure!0 (BitStream!3732) tuple2!7978)

(declare-fun readerFrom!0 (BitStream!3732 (_ BitVec 32) (_ BitVec 32)) BitStream!3732)

(assert (=> b!99182 (= lt!144079 (readBitPure!0 (readerFrom!0 (_2!4243 lt!144082) (currentBit!4921 thiss!1305) (currentByte!4926 thiss!1305))))))

(declare-fun b!99183 () Bool)

(assert (=> b!99183 (= e!64917 e!64912)))

(declare-fun res!81340 () Bool)

(assert (=> b!99183 (=> (not res!81340) (not e!64912))))

(declare-fun lt!144078 () (_ BitVec 64))

(declare-fun lt!144081 () (_ BitVec 64))

(assert (=> b!99183 (= res!81340 (= lt!144078 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144081)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99183 (= lt!144078 (bitIndex!0 (size!2129 (buf!2486 (_2!4243 lt!144082))) (currentByte!4926 (_2!4243 lt!144082)) (currentBit!4921 (_2!4243 lt!144082))))))

(assert (=> b!99183 (= lt!144081 (bitIndex!0 (size!2129 (buf!2486 thiss!1305)) (currentByte!4926 thiss!1305) (currentBit!4921 thiss!1305)))))

(declare-fun b!99184 () Bool)

(declare-fun res!81338 () Bool)

(assert (=> b!99184 (=> (not res!81338) (not e!64915))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99184 (= res!81338 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99185 () Bool)

(declare-fun res!81337 () Bool)

(assert (=> b!99185 (=> (not res!81337) (not e!64915))))

(assert (=> b!99185 (= res!81337 (bvslt i!615 nBits!396))))

(declare-fun b!99186 () Bool)

(declare-fun res!81344 () Bool)

(assert (=> b!99186 (=> (not res!81344) (not e!64912))))

(declare-fun isPrefixOf!0 (BitStream!3732 BitStream!3732) Bool)

(assert (=> b!99186 (= res!81344 (isPrefixOf!0 thiss!1305 (_2!4243 lt!144082)))))

(declare-fun res!81343 () Bool)

(assert (=> start!19914 (=> (not res!81343) (not e!64915))))

(assert (=> start!19914 (= res!81343 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19914 e!64915))

(assert (=> start!19914 true))

(declare-fun inv!12 (BitStream!3732) Bool)

(assert (=> start!19914 (and (inv!12 thiss!1305) e!64916)))

(declare-fun b!99187 () Bool)

(assert (=> b!99187 (= e!64914 (= (bitIndex!0 (size!2129 (buf!2486 (_1!4244 lt!144079))) (currentByte!4926 (_1!4244 lt!144079)) (currentBit!4921 (_1!4244 lt!144079))) lt!144078))))

(declare-fun b!99188 () Bool)

(declare-fun res!81339 () Bool)

(assert (=> b!99188 (=> (not res!81339) (not e!64915))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99188 (= res!81339 (validate_offset_bits!1 ((_ sign_extend 32) (size!2129 (buf!2486 thiss!1305))) ((_ sign_extend 32) (currentByte!4926 thiss!1305)) ((_ sign_extend 32) (currentBit!4921 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!19914 res!81343) b!99188))

(assert (= (and b!99188 res!81339) b!99184))

(assert (= (and b!99184 res!81338) b!99185))

(assert (= (and b!99185 res!81337) b!99181))

(assert (= (and b!99181 res!81341) b!99183))

(assert (= (and b!99183 res!81340) b!99186))

(assert (= (and b!99186 res!81344) b!99182))

(assert (= (and b!99182 res!81342) b!99187))

(assert (= start!19914 b!99180))

(declare-fun m!144587 () Bool)

(assert (=> b!99186 m!144587))

(declare-fun m!144589 () Bool)

(assert (=> b!99182 m!144589))

(assert (=> b!99182 m!144589))

(declare-fun m!144591 () Bool)

(assert (=> b!99182 m!144591))

(declare-fun m!144593 () Bool)

(assert (=> b!99181 m!144593))

(declare-fun m!144595 () Bool)

(assert (=> start!19914 m!144595))

(declare-fun m!144597 () Bool)

(assert (=> b!99188 m!144597))

(declare-fun m!144599 () Bool)

(assert (=> b!99183 m!144599))

(declare-fun m!144601 () Bool)

(assert (=> b!99183 m!144601))

(declare-fun m!144603 () Bool)

(assert (=> b!99187 m!144603))

(declare-fun m!144605 () Bool)

(assert (=> b!99180 m!144605))

(declare-fun m!144607 () Bool)

(assert (=> b!99184 m!144607))

(check-sat (not b!99181) (not b!99186) (not b!99184) (not b!99183) (not b!99182) (not b!99187) (not b!99188) (not start!19914) (not b!99180))
(check-sat)
