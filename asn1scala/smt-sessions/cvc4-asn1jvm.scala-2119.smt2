; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53704 () Bool)

(assert start!53704)

(declare-fun b!249676 () Bool)

(declare-fun e!173030 () Bool)

(declare-datatypes ((array!13613 0))(
  ( (array!13614 (arr!6957 (Array (_ BitVec 32) (_ BitVec 8))) (size!5970 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10862 0))(
  ( (BitStream!10863 (buf!6463 array!13613) (currentByte!11894 (_ BitVec 32)) (currentBit!11889 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21386 0))(
  ( (tuple2!21387 (_1!11618 BitStream!10862) (_2!11618 Bool)) )
))
(declare-fun lt!388357 () tuple2!21386)

(declare-fun lt!388359 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249676 (= e!173030 (= (bitIndex!0 (size!5970 (buf!6463 (_1!11618 lt!388357))) (currentByte!11894 (_1!11618 lt!388357)) (currentBit!11889 (_1!11618 lt!388357))) lt!388359))))

(declare-fun b!249677 () Bool)

(declare-fun e!173029 () Bool)

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!249677 (= e!173029 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-datatypes ((Unit!18076 0))(
  ( (Unit!18077) )
))
(declare-datatypes ((tuple2!21388 0))(
  ( (tuple2!21389 (_1!11619 Unit!18076) (_2!11619 BitStream!10862)) )
))
(declare-fun lt!388355 () tuple2!21388)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249677 (validate_offset_bits!1 ((_ sign_extend 32) (size!5970 (buf!6463 (_2!11619 lt!388355)))) ((_ sign_extend 32) (currentByte!11894 (_2!11619 lt!388355))) ((_ sign_extend 32) (currentBit!11889 (_2!11619 lt!388355))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun thiss!1005 () BitStream!10862)

(declare-fun lt!388358 () Unit!18076)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10862 BitStream!10862 (_ BitVec 64) (_ BitVec 64)) Unit!18076)

(assert (=> b!249677 (= lt!388358 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11619 lt!388355) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173028 () Bool)

(assert (=> b!249677 e!173028))

(declare-fun res!208965 () Bool)

(assert (=> b!249677 (=> (not res!208965) (not e!173028))))

(assert (=> b!249677 (= res!208965 (= (size!5970 (buf!6463 thiss!1005)) (size!5970 (buf!6463 (_2!11619 lt!388355)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10862 Bool) tuple2!21388)

(assert (=> b!249677 (= lt!388355 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!208966 () Bool)

(assert (=> start!53704 (=> (not res!208966) (not e!173029))))

(assert (=> start!53704 (= res!208966 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53704 e!173029))

(assert (=> start!53704 true))

(declare-fun e!173026 () Bool)

(declare-fun inv!12 (BitStream!10862) Bool)

(assert (=> start!53704 (and (inv!12 thiss!1005) e!173026)))

(declare-fun b!249678 () Bool)

(declare-fun e!173025 () Bool)

(assert (=> b!249678 (= e!173025 e!173030)))

(declare-fun res!208969 () Bool)

(assert (=> b!249678 (=> (not res!208969) (not e!173030))))

(assert (=> b!249678 (= res!208969 (and (= (_2!11618 lt!388357) bit!26) (= (_1!11618 lt!388357) (_2!11619 lt!388355))))))

(declare-fun readBitPure!0 (BitStream!10862) tuple2!21386)

(declare-fun readerFrom!0 (BitStream!10862 (_ BitVec 32) (_ BitVec 32)) BitStream!10862)

(assert (=> b!249678 (= lt!388357 (readBitPure!0 (readerFrom!0 (_2!11619 lt!388355) (currentBit!11889 thiss!1005) (currentByte!11894 thiss!1005))))))

(declare-fun b!249679 () Bool)

(declare-fun array_inv!5711 (array!13613) Bool)

(assert (=> b!249679 (= e!173026 (array_inv!5711 (buf!6463 thiss!1005)))))

(declare-fun b!249680 () Bool)

(declare-fun res!208971 () Bool)

(assert (=> b!249680 (=> (not res!208971) (not e!173029))))

(assert (=> b!249680 (= res!208971 (validate_offset_bits!1 ((_ sign_extend 32) (size!5970 (buf!6463 thiss!1005))) ((_ sign_extend 32) (currentByte!11894 thiss!1005)) ((_ sign_extend 32) (currentBit!11889 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249681 () Bool)

(declare-fun res!208967 () Bool)

(assert (=> b!249681 (=> (not res!208967) (not e!173029))))

(assert (=> b!249681 (= res!208967 (bvslt from!289 nBits!297))))

(declare-fun b!249682 () Bool)

(assert (=> b!249682 (= e!173028 e!173025)))

(declare-fun res!208968 () Bool)

(assert (=> b!249682 (=> (not res!208968) (not e!173025))))

(declare-fun lt!388356 () (_ BitVec 64))

(assert (=> b!249682 (= res!208968 (= lt!388359 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388356)))))

(assert (=> b!249682 (= lt!388359 (bitIndex!0 (size!5970 (buf!6463 (_2!11619 lt!388355))) (currentByte!11894 (_2!11619 lt!388355)) (currentBit!11889 (_2!11619 lt!388355))))))

(assert (=> b!249682 (= lt!388356 (bitIndex!0 (size!5970 (buf!6463 thiss!1005)) (currentByte!11894 thiss!1005) (currentBit!11889 thiss!1005)))))

(declare-fun b!249683 () Bool)

(declare-fun res!208970 () Bool)

(assert (=> b!249683 (=> (not res!208970) (not e!173025))))

(declare-fun isPrefixOf!0 (BitStream!10862 BitStream!10862) Bool)

(assert (=> b!249683 (= res!208970 (isPrefixOf!0 thiss!1005 (_2!11619 lt!388355)))))

(assert (= (and start!53704 res!208966) b!249680))

(assert (= (and b!249680 res!208971) b!249681))

(assert (= (and b!249681 res!208967) b!249677))

(assert (= (and b!249677 res!208965) b!249682))

(assert (= (and b!249682 res!208968) b!249683))

(assert (= (and b!249683 res!208970) b!249678))

(assert (= (and b!249678 res!208969) b!249676))

(assert (= start!53704 b!249679))

(declare-fun m!376077 () Bool)

(assert (=> b!249683 m!376077))

(declare-fun m!376079 () Bool)

(assert (=> b!249679 m!376079))

(declare-fun m!376081 () Bool)

(assert (=> b!249676 m!376081))

(declare-fun m!376083 () Bool)

(assert (=> start!53704 m!376083))

(declare-fun m!376085 () Bool)

(assert (=> b!249677 m!376085))

(declare-fun m!376087 () Bool)

(assert (=> b!249677 m!376087))

(declare-fun m!376089 () Bool)

(assert (=> b!249677 m!376089))

(declare-fun m!376091 () Bool)

(assert (=> b!249680 m!376091))

(declare-fun m!376093 () Bool)

(assert (=> b!249678 m!376093))

(assert (=> b!249678 m!376093))

(declare-fun m!376095 () Bool)

(assert (=> b!249678 m!376095))

(declare-fun m!376097 () Bool)

(assert (=> b!249682 m!376097))

(declare-fun m!376099 () Bool)

(assert (=> b!249682 m!376099))

(push 1)

(assert (not b!249683))

(assert (not b!249676))

(assert (not b!249679))

(assert (not start!53704))

(assert (not b!249680))

(assert (not b!249677))

(assert (not b!249682))

(assert (not b!249678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

