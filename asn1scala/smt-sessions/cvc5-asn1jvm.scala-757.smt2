; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21736 () Bool)

(assert start!21736)

(declare-fun b!109768 () Bool)

(declare-fun res!90588 () Bool)

(declare-fun e!71926 () Bool)

(assert (=> b!109768 (=> (not res!90588) (not e!71926))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!109768 (= res!90588 (bvslt i!615 nBits!396))))

(declare-fun b!109769 () Bool)

(declare-fun e!71922 () Bool)

(assert (=> b!109769 (= e!71922 e!71926)))

(declare-fun res!90582 () Bool)

(assert (=> b!109769 (=> (not res!90582) (not e!71926))))

(declare-datatypes ((array!4994 0))(
  ( (array!4995 (arr!2865 (Array (_ BitVec 32) (_ BitVec 8))) (size!2272 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4018 0))(
  ( (BitStream!4019 (buf!2666 array!4994) (currentByte!5208 (_ BitVec 32)) (currentBit!5203 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4018)

(declare-fun lt!166449 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109769 (= res!90582 (validate_offset_bits!1 ((_ sign_extend 32) (size!2272 (buf!2666 thiss!1305))) ((_ sign_extend 32) (currentByte!5208 thiss!1305)) ((_ sign_extend 32) (currentBit!5203 thiss!1305)) lt!166449))))

(assert (=> b!109769 (= lt!166449 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109770 () Bool)

(declare-fun e!71927 () Bool)

(declare-fun e!71917 () Bool)

(assert (=> b!109770 (= e!71927 e!71917)))

(declare-fun res!90583 () Bool)

(assert (=> b!109770 (=> res!90583 e!71917)))

(declare-datatypes ((tuple2!9120 0))(
  ( (tuple2!9121 (_1!4817 BitStream!4018) (_2!4817 BitStream!4018)) )
))
(declare-fun lt!166436 () tuple2!9120)

(declare-datatypes ((Unit!6709 0))(
  ( (Unit!6710) )
))
(declare-datatypes ((tuple2!9122 0))(
  ( (tuple2!9123 (_1!4818 Unit!6709) (_2!4818 BitStream!4018)) )
))
(declare-fun lt!166433 () tuple2!9122)

(declare-fun lt!166448 () (_ BitVec 64))

(declare-fun lt!166457 () (_ BitVec 64))

(declare-fun lt!166430 () BitStream!4018)

(assert (=> b!109770 (= res!90583 (or (not (= (_1!4817 lt!166436) lt!166430)) (not (= (size!2272 (buf!2666 thiss!1305)) (size!2272 (buf!2666 (_2!4818 lt!166433))))) (not (= lt!166457 (bvadd lt!166448 lt!166449)))))))

(declare-fun e!71924 () Bool)

(assert (=> b!109770 e!71924))

(declare-fun res!90579 () Bool)

(assert (=> b!109770 (=> (not res!90579) (not e!71924))))

(declare-fun lt!166447 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4018 (_ BitVec 64)) BitStream!4018)

(assert (=> b!109770 (= res!90579 (= (_1!4817 lt!166436) (withMovedBitIndex!0 (_2!4817 lt!166436) (bvsub lt!166447 lt!166457))))))

(declare-fun lt!166434 () tuple2!9122)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109770 (= lt!166447 (bitIndex!0 (size!2272 (buf!2666 (_2!4818 lt!166434))) (currentByte!5208 (_2!4818 lt!166434)) (currentBit!5203 (_2!4818 lt!166434))))))

(declare-fun lt!166437 () tuple2!9120)

(assert (=> b!109770 (= (_1!4817 lt!166437) (withMovedBitIndex!0 (_2!4817 lt!166437) (bvsub lt!166448 lt!166457)))))

(assert (=> b!109770 (= lt!166457 (bitIndex!0 (size!2272 (buf!2666 (_2!4818 lt!166433))) (currentByte!5208 (_2!4818 lt!166433)) (currentBit!5203 (_2!4818 lt!166433))))))

(assert (=> b!109770 (= lt!166448 (bitIndex!0 (size!2272 (buf!2666 thiss!1305)) (currentByte!5208 thiss!1305) (currentBit!5203 thiss!1305)))))

(declare-datatypes ((tuple2!9124 0))(
  ( (tuple2!9125 (_1!4819 BitStream!4018) (_2!4819 (_ BitVec 64))) )
))
(declare-fun lt!166454 () tuple2!9124)

(declare-fun lt!166438 () tuple2!9124)

(assert (=> b!109770 (and (= (_2!4819 lt!166454) (_2!4819 lt!166438)) (= (_1!4819 lt!166454) (_1!4819 lt!166438)))))

(declare-fun lt!166445 () (_ BitVec 64))

(declare-fun lt!166444 () Unit!6709)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6709)

(assert (=> b!109770 (= lt!166444 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4817 lt!166437) nBits!396 i!615 lt!166445))))

(declare-fun lt!166455 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9124)

(assert (=> b!109770 (= lt!166438 (readNLeastSignificantBitsLoopPure!0 lt!166430 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166455))))

(assert (=> b!109770 (= lt!166430 (withMovedBitIndex!0 (_1!4817 lt!166437) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!90578 () Bool)

(assert (=> start!21736 (=> (not res!90578) (not e!71922))))

(assert (=> start!21736 (= res!90578 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21736 e!71922))

(assert (=> start!21736 true))

(declare-fun e!71918 () Bool)

(declare-fun inv!12 (BitStream!4018) Bool)

(assert (=> start!21736 (and (inv!12 thiss!1305) e!71918)))

(declare-fun b!109771 () Bool)

(declare-fun lt!166452 () (_ BitVec 64))

(assert (=> b!109771 (= e!71917 (= (bvand lt!166445 lt!166452) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!109772 () Bool)

(declare-fun e!71921 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109772 (= e!71921 (invariant!0 (currentBit!5203 thiss!1305) (currentByte!5208 thiss!1305) (size!2272 (buf!2666 (_2!4818 lt!166433)))))))

(declare-fun b!109773 () Bool)

(declare-fun res!90589 () Bool)

(assert (=> b!109773 (=> (not res!90589) (not e!71921))))

(assert (=> b!109773 (= res!90589 (invariant!0 (currentBit!5203 thiss!1305) (currentByte!5208 thiss!1305) (size!2272 (buf!2666 (_2!4818 lt!166434)))))))

(declare-fun b!109774 () Bool)

(declare-fun array_inv!2074 (array!4994) Bool)

(assert (=> b!109774 (= e!71918 (array_inv!2074 (buf!2666 thiss!1305)))))

(declare-fun b!109775 () Bool)

(declare-fun lt!166431 () tuple2!9124)

(assert (=> b!109775 (= e!71924 (and (= lt!166448 (bvsub lt!166447 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4817 lt!166436) lt!166430)) (and (= (_2!4819 lt!166454) (_2!4819 lt!166431)) (= (_1!4819 lt!166454) (_2!4817 lt!166437))))))))

(declare-fun b!109776 () Bool)

(declare-fun e!71920 () Bool)

(declare-fun e!71919 () Bool)

(assert (=> b!109776 (= e!71920 e!71919)))

(declare-fun res!90591 () Bool)

(assert (=> b!109776 (=> (not res!90591) (not e!71919))))

(declare-fun lt!166435 () (_ BitVec 64))

(declare-fun lt!166428 () (_ BitVec 64))

(assert (=> b!109776 (= res!90591 (= lt!166435 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!166428)))))

(assert (=> b!109776 (= lt!166435 (bitIndex!0 (size!2272 (buf!2666 (_2!4818 lt!166434))) (currentByte!5208 (_2!4818 lt!166434)) (currentBit!5203 (_2!4818 lt!166434))))))

(assert (=> b!109776 (= lt!166428 (bitIndex!0 (size!2272 (buf!2666 thiss!1305)) (currentByte!5208 thiss!1305) (currentBit!5203 thiss!1305)))))

(declare-fun b!109777 () Bool)

(declare-fun e!71916 () Bool)

(declare-datatypes ((tuple2!9126 0))(
  ( (tuple2!9127 (_1!4820 BitStream!4018) (_2!4820 Bool)) )
))
(declare-fun lt!166441 () tuple2!9126)

(declare-fun lt!166432 () tuple2!9126)

(assert (=> b!109777 (= e!71916 (= (_2!4820 lt!166441) (_2!4820 lt!166432)))))

(declare-fun b!109778 () Bool)

(declare-fun res!90585 () Bool)

(assert (=> b!109778 (=> (not res!90585) (not e!71919))))

(declare-fun isPrefixOf!0 (BitStream!4018 BitStream!4018) Bool)

(assert (=> b!109778 (= res!90585 (isPrefixOf!0 thiss!1305 (_2!4818 lt!166434)))))

(declare-fun b!109779 () Bool)

(declare-fun e!71923 () Bool)

(assert (=> b!109779 (= e!71919 e!71923)))

(declare-fun res!90592 () Bool)

(assert (=> b!109779 (=> (not res!90592) (not e!71923))))

(declare-fun lt!166456 () Bool)

(declare-fun lt!166451 () tuple2!9126)

(assert (=> b!109779 (= res!90592 (and (= (_2!4820 lt!166451) lt!166456) (= (_1!4820 lt!166451) (_2!4818 lt!166434))))))

(declare-fun readBitPure!0 (BitStream!4018) tuple2!9126)

(declare-fun readerFrom!0 (BitStream!4018 (_ BitVec 32) (_ BitVec 32)) BitStream!4018)

(assert (=> b!109779 (= lt!166451 (readBitPure!0 (readerFrom!0 (_2!4818 lt!166434) (currentBit!5203 thiss!1305) (currentByte!5208 thiss!1305))))))

(declare-fun b!109780 () Bool)

(declare-fun res!90590 () Bool)

(assert (=> b!109780 (=> (not res!90590) (not e!71926))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109780 (= res!90590 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109781 () Bool)

(declare-fun res!90587 () Bool)

(assert (=> b!109781 (=> res!90587 e!71917)))

(assert (=> b!109781 (= res!90587 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2272 (buf!2666 (_1!4817 lt!166437)))) ((_ sign_extend 32) (currentByte!5208 (_1!4817 lt!166437))) ((_ sign_extend 32) (currentBit!5203 (_1!4817 lt!166437))) lt!166449)))))

(declare-fun b!109782 () Bool)

(assert (=> b!109782 (= e!71923 (= (bitIndex!0 (size!2272 (buf!2666 (_1!4820 lt!166451))) (currentByte!5208 (_1!4820 lt!166451)) (currentBit!5203 (_1!4820 lt!166451))) lt!166435))))

(declare-fun b!109783 () Bool)

(assert (=> b!109783 (= e!71926 (not e!71927))))

(declare-fun res!90584 () Bool)

(assert (=> b!109783 (=> res!90584 e!71927)))

(assert (=> b!109783 (= res!90584 (not (= (_1!4819 lt!166431) (_2!4817 lt!166436))))))

(assert (=> b!109783 (= lt!166431 (readNLeastSignificantBitsLoopPure!0 (_1!4817 lt!166436) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166455))))

(declare-fun lt!166443 () (_ BitVec 64))

(assert (=> b!109783 (validate_offset_bits!1 ((_ sign_extend 32) (size!2272 (buf!2666 (_2!4818 lt!166433)))) ((_ sign_extend 32) (currentByte!5208 (_2!4818 lt!166434))) ((_ sign_extend 32) (currentBit!5203 (_2!4818 lt!166434))) lt!166443)))

(declare-fun lt!166442 () Unit!6709)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4018 array!4994 (_ BitVec 64)) Unit!6709)

(assert (=> b!109783 (= lt!166442 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4818 lt!166434) (buf!2666 (_2!4818 lt!166433)) lt!166443))))

(assert (=> b!109783 (= lt!166443 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!166429 () tuple2!9126)

(declare-fun lt!166453 () (_ BitVec 64))

(assert (=> b!109783 (= lt!166455 (bvor lt!166445 (ite (_2!4820 lt!166429) lt!166453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109783 (= lt!166454 (readNLeastSignificantBitsLoopPure!0 (_1!4817 lt!166437) nBits!396 i!615 lt!166445))))

(assert (=> b!109783 (validate_offset_bits!1 ((_ sign_extend 32) (size!2272 (buf!2666 (_2!4818 lt!166433)))) ((_ sign_extend 32) (currentByte!5208 thiss!1305)) ((_ sign_extend 32) (currentBit!5203 thiss!1305)) lt!166449)))

(declare-fun lt!166439 () Unit!6709)

(assert (=> b!109783 (= lt!166439 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2666 (_2!4818 lt!166433)) lt!166449))))

(assert (=> b!109783 (= lt!166445 (bvand v!199 (bvnot lt!166452)))))

(assert (=> b!109783 (= lt!166452 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!109783 (= (_2!4820 lt!166429) lt!166456)))

(assert (=> b!109783 (= lt!166429 (readBitPure!0 (_1!4817 lt!166437)))))

(declare-fun reader!0 (BitStream!4018 BitStream!4018) tuple2!9120)

(assert (=> b!109783 (= lt!166436 (reader!0 (_2!4818 lt!166434) (_2!4818 lt!166433)))))

(assert (=> b!109783 (= lt!166437 (reader!0 thiss!1305 (_2!4818 lt!166433)))))

(assert (=> b!109783 e!71916))

(declare-fun res!90581 () Bool)

(assert (=> b!109783 (=> (not res!90581) (not e!71916))))

(assert (=> b!109783 (= res!90581 (= (bitIndex!0 (size!2272 (buf!2666 (_1!4820 lt!166441))) (currentByte!5208 (_1!4820 lt!166441)) (currentBit!5203 (_1!4820 lt!166441))) (bitIndex!0 (size!2272 (buf!2666 (_1!4820 lt!166432))) (currentByte!5208 (_1!4820 lt!166432)) (currentBit!5203 (_1!4820 lt!166432)))))))

(declare-fun lt!166446 () Unit!6709)

(declare-fun lt!166440 () BitStream!4018)

(declare-fun readBitPrefixLemma!0 (BitStream!4018 BitStream!4018) Unit!6709)

(assert (=> b!109783 (= lt!166446 (readBitPrefixLemma!0 lt!166440 (_2!4818 lt!166433)))))

(assert (=> b!109783 (= lt!166432 (readBitPure!0 (BitStream!4019 (buf!2666 (_2!4818 lt!166433)) (currentByte!5208 thiss!1305) (currentBit!5203 thiss!1305))))))

(assert (=> b!109783 (= lt!166441 (readBitPure!0 lt!166440))))

(assert (=> b!109783 (= lt!166440 (BitStream!4019 (buf!2666 (_2!4818 lt!166434)) (currentByte!5208 thiss!1305) (currentBit!5203 thiss!1305)))))

(assert (=> b!109783 e!71921))

(declare-fun res!90580 () Bool)

(assert (=> b!109783 (=> (not res!90580) (not e!71921))))

(assert (=> b!109783 (= res!90580 (isPrefixOf!0 thiss!1305 (_2!4818 lt!166433)))))

(declare-fun lt!166450 () Unit!6709)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4018 BitStream!4018 BitStream!4018) Unit!6709)

(assert (=> b!109783 (= lt!166450 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4818 lt!166434) (_2!4818 lt!166433)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4018 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9122)

(assert (=> b!109783 (= lt!166433 (appendNLeastSignificantBitsLoop!0 (_2!4818 lt!166434) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!109783 e!71920))

(declare-fun res!90586 () Bool)

(assert (=> b!109783 (=> (not res!90586) (not e!71920))))

(assert (=> b!109783 (= res!90586 (= (size!2272 (buf!2666 thiss!1305)) (size!2272 (buf!2666 (_2!4818 lt!166434)))))))

(declare-fun appendBit!0 (BitStream!4018 Bool) tuple2!9122)

(assert (=> b!109783 (= lt!166434 (appendBit!0 thiss!1305 lt!166456))))

(assert (=> b!109783 (= lt!166456 (not (= (bvand v!199 lt!166453) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109783 (= lt!166453 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!21736 res!90578) b!109769))

(assert (= (and b!109769 res!90582) b!109780))

(assert (= (and b!109780 res!90590) b!109768))

(assert (= (and b!109768 res!90588) b!109783))

(assert (= (and b!109783 res!90586) b!109776))

(assert (= (and b!109776 res!90591) b!109778))

(assert (= (and b!109778 res!90585) b!109779))

(assert (= (and b!109779 res!90592) b!109782))

(assert (= (and b!109783 res!90580) b!109773))

(assert (= (and b!109773 res!90589) b!109772))

(assert (= (and b!109783 res!90581) b!109777))

(assert (= (and b!109783 (not res!90584)) b!109770))

(assert (= (and b!109770 res!90579) b!109775))

(assert (= (and b!109770 (not res!90583)) b!109781))

(assert (= (and b!109781 (not res!90587)) b!109771))

(assert (= start!21736 b!109774))

(declare-fun m!163175 () Bool)

(assert (=> b!109780 m!163175))

(declare-fun m!163177 () Bool)

(assert (=> b!109772 m!163177))

(declare-fun m!163179 () Bool)

(assert (=> start!21736 m!163179))

(declare-fun m!163181 () Bool)

(assert (=> b!109770 m!163181))

(declare-fun m!163183 () Bool)

(assert (=> b!109770 m!163183))

(declare-fun m!163185 () Bool)

(assert (=> b!109770 m!163185))

(declare-fun m!163187 () Bool)

(assert (=> b!109770 m!163187))

(declare-fun m!163189 () Bool)

(assert (=> b!109770 m!163189))

(declare-fun m!163191 () Bool)

(assert (=> b!109770 m!163191))

(declare-fun m!163193 () Bool)

(assert (=> b!109770 m!163193))

(declare-fun m!163195 () Bool)

(assert (=> b!109770 m!163195))

(assert (=> b!109776 m!163185))

(assert (=> b!109776 m!163191))

(declare-fun m!163197 () Bool)

(assert (=> b!109782 m!163197))

(declare-fun m!163199 () Bool)

(assert (=> b!109773 m!163199))

(declare-fun m!163201 () Bool)

(assert (=> b!109774 m!163201))

(declare-fun m!163203 () Bool)

(assert (=> b!109778 m!163203))

(declare-fun m!163205 () Bool)

(assert (=> b!109769 m!163205))

(declare-fun m!163207 () Bool)

(assert (=> b!109779 m!163207))

(assert (=> b!109779 m!163207))

(declare-fun m!163209 () Bool)

(assert (=> b!109779 m!163209))

(declare-fun m!163211 () Bool)

(assert (=> b!109781 m!163211))

(declare-fun m!163213 () Bool)

(assert (=> b!109783 m!163213))

(declare-fun m!163215 () Bool)

(assert (=> b!109783 m!163215))

(declare-fun m!163217 () Bool)

(assert (=> b!109783 m!163217))

(declare-fun m!163219 () Bool)

(assert (=> b!109783 m!163219))

(declare-fun m!163221 () Bool)

(assert (=> b!109783 m!163221))

(declare-fun m!163223 () Bool)

(assert (=> b!109783 m!163223))

(declare-fun m!163225 () Bool)

(assert (=> b!109783 m!163225))

(declare-fun m!163227 () Bool)

(assert (=> b!109783 m!163227))

(declare-fun m!163229 () Bool)

(assert (=> b!109783 m!163229))

(declare-fun m!163231 () Bool)

(assert (=> b!109783 m!163231))

(declare-fun m!163233 () Bool)

(assert (=> b!109783 m!163233))

(declare-fun m!163235 () Bool)

(assert (=> b!109783 m!163235))

(declare-fun m!163237 () Bool)

(assert (=> b!109783 m!163237))

(declare-fun m!163239 () Bool)

(assert (=> b!109783 m!163239))

(declare-fun m!163241 () Bool)

(assert (=> b!109783 m!163241))

(declare-fun m!163243 () Bool)

(assert (=> b!109783 m!163243))

(declare-fun m!163245 () Bool)

(assert (=> b!109783 m!163245))

(declare-fun m!163247 () Bool)

(assert (=> b!109783 m!163247))

(declare-fun m!163249 () Bool)

(assert (=> b!109783 m!163249))

(push 1)

(assert (not b!109782))

(assert (not b!109773))

(assert (not b!109774))

(assert (not b!109781))

(assert (not b!109778))

(assert (not start!21736))

(assert (not b!109780))

(assert (not b!109783))

(assert (not b!109770))

(assert (not b!109769))

(assert (not b!109779))

(assert (not b!109772))

(assert (not b!109776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

