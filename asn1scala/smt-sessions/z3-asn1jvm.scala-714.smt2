; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19998 () Bool)

(assert start!19998)

(declare-fun b!99737 () Bool)

(declare-fun res!81850 () Bool)

(declare-fun e!65279 () Bool)

(assert (=> b!99737 (=> (not res!81850) (not e!65279))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!99737 (= res!81850 (bvslt i!615 nBits!396))))

(declare-fun b!99738 () Bool)

(declare-fun e!65286 () Bool)

(assert (=> b!99738 (= e!65279 (not e!65286))))

(declare-fun res!81852 () Bool)

(assert (=> b!99738 (=> res!81852 e!65286)))

(declare-datatypes ((array!4697 0))(
  ( (array!4698 (arr!2737 (Array (_ BitVec 32) (_ BitVec 8))) (size!2144 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3762 0))(
  ( (BitStream!3763 (buf!2501 array!4697) (currentByte!4947 (_ BitVec 32)) (currentBit!4942 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6115 0))(
  ( (Unit!6116) )
))
(declare-datatypes ((tuple2!8042 0))(
  ( (tuple2!8043 (_1!4276 Unit!6115) (_2!4276 BitStream!3762)) )
))
(declare-fun lt!144495 () tuple2!8042)

(declare-fun lt!144499 () tuple2!8042)

(assert (=> b!99738 (= res!81852 (not (= (size!2144 (buf!2501 (_2!4276 lt!144495))) (size!2144 (buf!2501 (_2!4276 lt!144499))))))))

(declare-fun e!65282 () Bool)

(assert (=> b!99738 e!65282))

(declare-fun res!81854 () Bool)

(assert (=> b!99738 (=> (not res!81854) (not e!65282))))

(declare-fun thiss!1305 () BitStream!3762)

(declare-fun isPrefixOf!0 (BitStream!3762 BitStream!3762) Bool)

(assert (=> b!99738 (= res!81854 (isPrefixOf!0 thiss!1305 (_2!4276 lt!144499)))))

(declare-fun lt!144497 () Unit!6115)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3762 BitStream!3762 BitStream!3762) Unit!6115)

(assert (=> b!99738 (= lt!144497 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4276 lt!144495) (_2!4276 lt!144499)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3762 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8042)

(assert (=> b!99738 (= lt!144499 (appendNLeastSignificantBitsLoop!0 (_2!4276 lt!144495) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65284 () Bool)

(assert (=> b!99738 e!65284))

(declare-fun res!81856 () Bool)

(assert (=> b!99738 (=> (not res!81856) (not e!65284))))

(assert (=> b!99738 (= res!81856 (= (size!2144 (buf!2501 thiss!1305)) (size!2144 (buf!2501 (_2!4276 lt!144495)))))))

(declare-fun lt!144500 () Bool)

(declare-fun appendBit!0 (BitStream!3762 Bool) tuple2!8042)

(assert (=> b!99738 (= lt!144495 (appendBit!0 thiss!1305 lt!144500))))

(assert (=> b!99738 (= lt!144500 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!81858 () Bool)

(assert (=> start!19998 (=> (not res!81858) (not e!65279))))

(assert (=> start!19998 (= res!81858 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19998 e!65279))

(assert (=> start!19998 true))

(declare-fun e!65280 () Bool)

(declare-fun inv!12 (BitStream!3762) Bool)

(assert (=> start!19998 (and (inv!12 thiss!1305) e!65280)))

(declare-fun b!99739 () Bool)

(declare-fun res!81857 () Bool)

(assert (=> b!99739 (=> (not res!81857) (not e!65279))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99739 (= res!81857 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99740 () Bool)

(declare-fun e!65283 () Bool)

(declare-fun e!65281 () Bool)

(assert (=> b!99740 (= e!65283 e!65281)))

(declare-fun res!81859 () Bool)

(assert (=> b!99740 (=> (not res!81859) (not e!65281))))

(declare-datatypes ((tuple2!8044 0))(
  ( (tuple2!8045 (_1!4277 BitStream!3762) (_2!4277 Bool)) )
))
(declare-fun lt!144501 () tuple2!8044)

(assert (=> b!99740 (= res!81859 (and (= (_2!4277 lt!144501) lt!144500) (= (_1!4277 lt!144501) (_2!4276 lt!144495))))))

(declare-fun readBitPure!0 (BitStream!3762) tuple2!8044)

(declare-fun readerFrom!0 (BitStream!3762 (_ BitVec 32) (_ BitVec 32)) BitStream!3762)

(assert (=> b!99740 (= lt!144501 (readBitPure!0 (readerFrom!0 (_2!4276 lt!144495) (currentBit!4942 thiss!1305) (currentByte!4947 thiss!1305))))))

(declare-fun b!99741 () Bool)

(declare-fun res!81853 () Bool)

(assert (=> b!99741 (=> res!81853 e!65286)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99741 (= res!81853 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2144 (buf!2501 (_2!4276 lt!144495)))) ((_ sign_extend 32) (currentByte!4947 thiss!1305)) ((_ sign_extend 32) (currentBit!4942 thiss!1305)))))))

(declare-fun b!99742 () Bool)

(declare-fun res!81855 () Bool)

(assert (=> b!99742 (=> res!81855 e!65286)))

(declare-fun arrayBitRangesEq!0 (array!4697 array!4697 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99742 (= res!81855 (not (arrayBitRangesEq!0 (buf!2501 (_2!4276 lt!144495)) (buf!2501 (_2!4276 lt!144499)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2144 (buf!2501 (_2!4276 lt!144495))) (currentByte!4947 thiss!1305) (currentBit!4942 thiss!1305))))))))

(declare-fun b!99743 () Bool)

(assert (=> b!99743 (= e!65284 e!65283)))

(declare-fun res!81860 () Bool)

(assert (=> b!99743 (=> (not res!81860) (not e!65283))))

(declare-fun lt!144498 () (_ BitVec 64))

(declare-fun lt!144502 () (_ BitVec 64))

(assert (=> b!99743 (= res!81860 (= lt!144498 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144502)))))

(assert (=> b!99743 (= lt!144498 (bitIndex!0 (size!2144 (buf!2501 (_2!4276 lt!144495))) (currentByte!4947 (_2!4276 lt!144495)) (currentBit!4942 (_2!4276 lt!144495))))))

(assert (=> b!99743 (= lt!144502 (bitIndex!0 (size!2144 (buf!2501 thiss!1305)) (currentByte!4947 thiss!1305) (currentBit!4942 thiss!1305)))))

(declare-fun b!99744 () Bool)

(declare-fun array_inv!1946 (array!4697) Bool)

(assert (=> b!99744 (= e!65280 (array_inv!1946 (buf!2501 thiss!1305)))))

(declare-fun b!99745 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99745 (= e!65282 (invariant!0 (currentBit!4942 thiss!1305) (currentByte!4947 thiss!1305) (size!2144 (buf!2501 (_2!4276 lt!144495)))))))

(declare-fun b!99746 () Bool)

(declare-fun res!81851 () Bool)

(assert (=> b!99746 (=> (not res!81851) (not e!65279))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99746 (= res!81851 (validate_offset_bits!1 ((_ sign_extend 32) (size!2144 (buf!2501 thiss!1305))) ((_ sign_extend 32) (currentByte!4947 thiss!1305)) ((_ sign_extend 32) (currentBit!4942 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99747 () Bool)

(assert (=> b!99747 (= e!65281 (= (bitIndex!0 (size!2144 (buf!2501 (_1!4277 lt!144501))) (currentByte!4947 (_1!4277 lt!144501)) (currentBit!4942 (_1!4277 lt!144501))) lt!144498))))

(declare-fun b!99748 () Bool)

(declare-fun res!81849 () Bool)

(assert (=> b!99748 (=> (not res!81849) (not e!65283))))

(assert (=> b!99748 (= res!81849 (isPrefixOf!0 thiss!1305 (_2!4276 lt!144495)))))

(declare-fun b!99749 () Bool)

(assert (=> b!99749 (= e!65286 true)))

(declare-fun lt!144496 () tuple2!8044)

(assert (=> b!99749 (= lt!144496 (readBitPure!0 (BitStream!3763 (buf!2501 (_2!4276 lt!144499)) (currentByte!4947 thiss!1305) (currentBit!4942 thiss!1305))))))

(declare-fun lt!144494 () tuple2!8044)

(assert (=> b!99749 (= lt!144494 (readBitPure!0 (BitStream!3763 (buf!2501 (_2!4276 lt!144495)) (currentByte!4947 thiss!1305) (currentBit!4942 thiss!1305))))))

(assert (=> b!99749 (invariant!0 (currentBit!4942 thiss!1305) (currentByte!4947 thiss!1305) (size!2144 (buf!2501 (_2!4276 lt!144499))))))

(assert (= (and start!19998 res!81858) b!99746))

(assert (= (and b!99746 res!81851) b!99739))

(assert (= (and b!99739 res!81857) b!99737))

(assert (= (and b!99737 res!81850) b!99738))

(assert (= (and b!99738 res!81856) b!99743))

(assert (= (and b!99743 res!81860) b!99748))

(assert (= (and b!99748 res!81849) b!99740))

(assert (= (and b!99740 res!81859) b!99747))

(assert (= (and b!99738 res!81854) b!99745))

(assert (= (and b!99738 (not res!81852)) b!99741))

(assert (= (and b!99741 (not res!81853)) b!99742))

(assert (= (and b!99742 (not res!81855)) b!99749))

(assert (= start!19998 b!99744))

(declare-fun m!145063 () Bool)

(assert (=> b!99749 m!145063))

(declare-fun m!145065 () Bool)

(assert (=> b!99749 m!145065))

(declare-fun m!145067 () Bool)

(assert (=> b!99749 m!145067))

(declare-fun m!145069 () Bool)

(assert (=> b!99741 m!145069))

(declare-fun m!145071 () Bool)

(assert (=> b!99746 m!145071))

(declare-fun m!145073 () Bool)

(assert (=> b!99745 m!145073))

(declare-fun m!145075 () Bool)

(assert (=> b!99740 m!145075))

(assert (=> b!99740 m!145075))

(declare-fun m!145077 () Bool)

(assert (=> b!99740 m!145077))

(declare-fun m!145079 () Bool)

(assert (=> start!19998 m!145079))

(declare-fun m!145081 () Bool)

(assert (=> b!99744 m!145081))

(declare-fun m!145083 () Bool)

(assert (=> b!99747 m!145083))

(declare-fun m!145085 () Bool)

(assert (=> b!99743 m!145085))

(declare-fun m!145087 () Bool)

(assert (=> b!99743 m!145087))

(declare-fun m!145089 () Bool)

(assert (=> b!99742 m!145089))

(declare-fun m!145091 () Bool)

(assert (=> b!99742 m!145091))

(declare-fun m!145093 () Bool)

(assert (=> b!99738 m!145093))

(declare-fun m!145095 () Bool)

(assert (=> b!99738 m!145095))

(declare-fun m!145097 () Bool)

(assert (=> b!99738 m!145097))

(declare-fun m!145099 () Bool)

(assert (=> b!99738 m!145099))

(declare-fun m!145101 () Bool)

(assert (=> b!99739 m!145101))

(declare-fun m!145103 () Bool)

(assert (=> b!99748 m!145103))

(check-sat (not start!19998) (not b!99742) (not b!99748) (not b!99745) (not b!99744) (not b!99747) (not b!99738) (not b!99746) (not b!99740) (not b!99749) (not b!99739) (not b!99741) (not b!99743))
