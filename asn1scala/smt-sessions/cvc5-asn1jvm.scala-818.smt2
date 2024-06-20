; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24170 () Bool)

(assert start!24170)

(declare-fun b!122490 () Bool)

(declare-fun e!80273 () Bool)

(declare-fun e!80271 () Bool)

(assert (=> b!122490 (= e!80273 e!80271)))

(declare-fun res!101517 () Bool)

(assert (=> b!122490 (=> (not res!101517) (not e!80271))))

(declare-datatypes ((array!5420 0))(
  ( (array!5421 (arr!3045 (Array (_ BitVec 32) (_ BitVec 8))) (size!2452 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4378 0))(
  ( (BitStream!4379 (buf!2892 array!5420) (currentByte!5589 (_ BitVec 32)) (currentBit!5584 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4378)

(declare-fun lt!192701 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122490 (= res!101517 (validate_offset_bits!1 ((_ sign_extend 32) (size!2452 (buf!2892 thiss!1305))) ((_ sign_extend 32) (currentByte!5589 thiss!1305)) ((_ sign_extend 32) (currentBit!5584 thiss!1305)) lt!192701))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!122490 (= lt!192701 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122491 () Bool)

(declare-fun e!80265 () Bool)

(declare-fun e!80268 () Bool)

(assert (=> b!122491 (= e!80265 e!80268)))

(declare-fun res!101518 () Bool)

(assert (=> b!122491 (=> (not res!101518) (not e!80268))))

(declare-fun lt!192713 () (_ BitVec 64))

(declare-fun lt!192695 () (_ BitVec 64))

(assert (=> b!122491 (= res!101518 (= lt!192713 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192695)))))

(declare-datatypes ((Unit!7543 0))(
  ( (Unit!7544) )
))
(declare-datatypes ((tuple2!10336 0))(
  ( (tuple2!10337 (_1!5433 Unit!7543) (_2!5433 BitStream!4378)) )
))
(declare-fun lt!192697 () tuple2!10336)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122491 (= lt!192713 (bitIndex!0 (size!2452 (buf!2892 (_2!5433 lt!192697))) (currentByte!5589 (_2!5433 lt!192697)) (currentBit!5584 (_2!5433 lt!192697))))))

(assert (=> b!122491 (= lt!192695 (bitIndex!0 (size!2452 (buf!2892 thiss!1305)) (currentByte!5589 thiss!1305) (currentBit!5584 thiss!1305)))))

(declare-fun b!122492 () Bool)

(declare-fun res!101520 () Bool)

(assert (=> b!122492 (=> (not res!101520) (not e!80271))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122492 (= res!101520 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun lt!192689 () tuple2!10336)

(declare-datatypes ((tuple2!10338 0))(
  ( (tuple2!10339 (_1!5434 BitStream!4378) (_2!5434 BitStream!4378)) )
))
(declare-fun lt!192688 () tuple2!10338)

(declare-fun lt!192690 () BitStream!4378)

(declare-fun e!80270 () Bool)

(declare-fun lt!192702 () (_ BitVec 64))

(declare-fun b!122493 () Bool)

(declare-fun lt!192696 () (_ BitVec 64))

(assert (=> b!122493 (= e!80270 (or (not (= (_1!5434 lt!192688) lt!192690)) (not (= (size!2452 (buf!2892 thiss!1305)) (size!2452 (buf!2892 (_2!5433 lt!192689))))) (not (= lt!192696 (bvadd lt!192702 lt!192701))) (bvsge lt!192701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80266 () Bool)

(assert (=> b!122493 e!80266))

(declare-fun res!101511 () Bool)

(assert (=> b!122493 (=> (not res!101511) (not e!80266))))

(declare-fun lt!192706 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4378 (_ BitVec 64)) BitStream!4378)

(assert (=> b!122493 (= res!101511 (= (_1!5434 lt!192688) (withMovedBitIndex!0 (_2!5434 lt!192688) (bvsub lt!192706 lt!192696))))))

(assert (=> b!122493 (= lt!192706 (bitIndex!0 (size!2452 (buf!2892 (_2!5433 lt!192697))) (currentByte!5589 (_2!5433 lt!192697)) (currentBit!5584 (_2!5433 lt!192697))))))

(declare-fun lt!192712 () tuple2!10338)

(assert (=> b!122493 (= (_1!5434 lt!192712) (withMovedBitIndex!0 (_2!5434 lt!192712) (bvsub lt!192702 lt!192696)))))

(assert (=> b!122493 (= lt!192696 (bitIndex!0 (size!2452 (buf!2892 (_2!5433 lt!192689))) (currentByte!5589 (_2!5433 lt!192689)) (currentBit!5584 (_2!5433 lt!192689))))))

(assert (=> b!122493 (= lt!192702 (bitIndex!0 (size!2452 (buf!2892 thiss!1305)) (currentByte!5589 thiss!1305) (currentBit!5584 thiss!1305)))))

(declare-datatypes ((tuple2!10340 0))(
  ( (tuple2!10341 (_1!5435 BitStream!4378) (_2!5435 (_ BitVec 64))) )
))
(declare-fun lt!192700 () tuple2!10340)

(declare-fun lt!192699 () tuple2!10340)

(assert (=> b!122493 (and (= (_2!5435 lt!192700) (_2!5435 lt!192699)) (= (_1!5435 lt!192700) (_1!5435 lt!192699)))))

(declare-fun lt!192704 () (_ BitVec 64))

(declare-fun lt!192692 () Unit!7543)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7543)

(assert (=> b!122493 (= lt!192692 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5434 lt!192712) nBits!396 i!615 lt!192704))))

(declare-fun lt!192686 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10340)

(assert (=> b!122493 (= lt!192699 (readNLeastSignificantBitsLoopPure!0 lt!192690 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192686))))

(assert (=> b!122493 (= lt!192690 (withMovedBitIndex!0 (_1!5434 lt!192712) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!192714 () tuple2!10340)

(declare-fun b!122494 () Bool)

(assert (=> b!122494 (= e!80266 (and (= lt!192702 (bvsub lt!192706 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5434 lt!192688) lt!192690)) (and (= (_2!5435 lt!192700) (_2!5435 lt!192714)) (= (_1!5435 lt!192700) (_2!5434 lt!192712))))))))

(declare-fun b!122495 () Bool)

(declare-fun res!101515 () Bool)

(assert (=> b!122495 (=> (not res!101515) (not e!80268))))

(declare-fun isPrefixOf!0 (BitStream!4378 BitStream!4378) Bool)

(assert (=> b!122495 (= res!101515 (isPrefixOf!0 thiss!1305 (_2!5433 lt!192697)))))

(declare-fun res!101513 () Bool)

(assert (=> start!24170 (=> (not res!101513) (not e!80273))))

(assert (=> start!24170 (= res!101513 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24170 e!80273))

(assert (=> start!24170 true))

(declare-fun e!80274 () Bool)

(declare-fun inv!12 (BitStream!4378) Bool)

(assert (=> start!24170 (and (inv!12 thiss!1305) e!80274)))

(declare-fun b!122496 () Bool)

(declare-fun e!80267 () Bool)

(declare-datatypes ((tuple2!10342 0))(
  ( (tuple2!10343 (_1!5436 BitStream!4378) (_2!5436 Bool)) )
))
(declare-fun lt!192698 () tuple2!10342)

(declare-fun lt!192709 () tuple2!10342)

(assert (=> b!122496 (= e!80267 (= (_2!5436 lt!192698) (_2!5436 lt!192709)))))

(declare-fun b!122497 () Bool)

(declare-fun res!101516 () Bool)

(assert (=> b!122497 (=> (not res!101516) (not e!80271))))

(assert (=> b!122497 (= res!101516 (bvslt i!615 nBits!396))))

(declare-fun b!122498 () Bool)

(assert (=> b!122498 (= e!80271 (not e!80270))))

(declare-fun res!101514 () Bool)

(assert (=> b!122498 (=> res!101514 e!80270)))

(assert (=> b!122498 (= res!101514 (not (= (_1!5435 lt!192714) (_2!5434 lt!192688))))))

(assert (=> b!122498 (= lt!192714 (readNLeastSignificantBitsLoopPure!0 (_1!5434 lt!192688) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192686))))

(declare-fun lt!192711 () (_ BitVec 64))

(assert (=> b!122498 (validate_offset_bits!1 ((_ sign_extend 32) (size!2452 (buf!2892 (_2!5433 lt!192689)))) ((_ sign_extend 32) (currentByte!5589 (_2!5433 lt!192697))) ((_ sign_extend 32) (currentBit!5584 (_2!5433 lt!192697))) lt!192711)))

(declare-fun lt!192708 () Unit!7543)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4378 array!5420 (_ BitVec 64)) Unit!7543)

(assert (=> b!122498 (= lt!192708 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5433 lt!192697) (buf!2892 (_2!5433 lt!192689)) lt!192711))))

(assert (=> b!122498 (= lt!192711 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192705 () tuple2!10342)

(declare-fun lt!192703 () (_ BitVec 64))

(assert (=> b!122498 (= lt!192686 (bvor lt!192704 (ite (_2!5436 lt!192705) lt!192703 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122498 (= lt!192700 (readNLeastSignificantBitsLoopPure!0 (_1!5434 lt!192712) nBits!396 i!615 lt!192704))))

(assert (=> b!122498 (validate_offset_bits!1 ((_ sign_extend 32) (size!2452 (buf!2892 (_2!5433 lt!192689)))) ((_ sign_extend 32) (currentByte!5589 thiss!1305)) ((_ sign_extend 32) (currentBit!5584 thiss!1305)) lt!192701)))

(declare-fun lt!192694 () Unit!7543)

(assert (=> b!122498 (= lt!192694 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2892 (_2!5433 lt!192689)) lt!192701))))

(assert (=> b!122498 (= lt!192704 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192693 () Bool)

(assert (=> b!122498 (= (_2!5436 lt!192705) lt!192693)))

(declare-fun readBitPure!0 (BitStream!4378) tuple2!10342)

(assert (=> b!122498 (= lt!192705 (readBitPure!0 (_1!5434 lt!192712)))))

(declare-fun reader!0 (BitStream!4378 BitStream!4378) tuple2!10338)

(assert (=> b!122498 (= lt!192688 (reader!0 (_2!5433 lt!192697) (_2!5433 lt!192689)))))

(assert (=> b!122498 (= lt!192712 (reader!0 thiss!1305 (_2!5433 lt!192689)))))

(assert (=> b!122498 e!80267))

(declare-fun res!101510 () Bool)

(assert (=> b!122498 (=> (not res!101510) (not e!80267))))

(assert (=> b!122498 (= res!101510 (= (bitIndex!0 (size!2452 (buf!2892 (_1!5436 lt!192698))) (currentByte!5589 (_1!5436 lt!192698)) (currentBit!5584 (_1!5436 lt!192698))) (bitIndex!0 (size!2452 (buf!2892 (_1!5436 lt!192709))) (currentByte!5589 (_1!5436 lt!192709)) (currentBit!5584 (_1!5436 lt!192709)))))))

(declare-fun lt!192687 () Unit!7543)

(declare-fun lt!192707 () BitStream!4378)

(declare-fun readBitPrefixLemma!0 (BitStream!4378 BitStream!4378) Unit!7543)

(assert (=> b!122498 (= lt!192687 (readBitPrefixLemma!0 lt!192707 (_2!5433 lt!192689)))))

(assert (=> b!122498 (= lt!192709 (readBitPure!0 (BitStream!4379 (buf!2892 (_2!5433 lt!192689)) (currentByte!5589 thiss!1305) (currentBit!5584 thiss!1305))))))

(assert (=> b!122498 (= lt!192698 (readBitPure!0 lt!192707))))

(assert (=> b!122498 (= lt!192707 (BitStream!4379 (buf!2892 (_2!5433 lt!192697)) (currentByte!5589 thiss!1305) (currentBit!5584 thiss!1305)))))

(declare-fun e!80272 () Bool)

(assert (=> b!122498 e!80272))

(declare-fun res!101512 () Bool)

(assert (=> b!122498 (=> (not res!101512) (not e!80272))))

(assert (=> b!122498 (= res!101512 (isPrefixOf!0 thiss!1305 (_2!5433 lt!192689)))))

(declare-fun lt!192691 () Unit!7543)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4378 BitStream!4378 BitStream!4378) Unit!7543)

(assert (=> b!122498 (= lt!192691 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5433 lt!192697) (_2!5433 lt!192689)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10336)

(assert (=> b!122498 (= lt!192689 (appendNLeastSignificantBitsLoop!0 (_2!5433 lt!192697) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122498 e!80265))

(declare-fun res!101508 () Bool)

(assert (=> b!122498 (=> (not res!101508) (not e!80265))))

(assert (=> b!122498 (= res!101508 (= (size!2452 (buf!2892 thiss!1305)) (size!2452 (buf!2892 (_2!5433 lt!192697)))))))

(declare-fun appendBit!0 (BitStream!4378 Bool) tuple2!10336)

(assert (=> b!122498 (= lt!192697 (appendBit!0 thiss!1305 lt!192693))))

(assert (=> b!122498 (= lt!192693 (not (= (bvand v!199 lt!192703) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122498 (= lt!192703 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122499 () Bool)

(declare-fun e!80264 () Bool)

(declare-fun lt!192710 () tuple2!10342)

(assert (=> b!122499 (= e!80264 (= (bitIndex!0 (size!2452 (buf!2892 (_1!5436 lt!192710))) (currentByte!5589 (_1!5436 lt!192710)) (currentBit!5584 (_1!5436 lt!192710))) lt!192713))))

(declare-fun b!122500 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122500 (= e!80272 (invariant!0 (currentBit!5584 thiss!1305) (currentByte!5589 thiss!1305) (size!2452 (buf!2892 (_2!5433 lt!192689)))))))

(declare-fun b!122501 () Bool)

(declare-fun res!101509 () Bool)

(assert (=> b!122501 (=> (not res!101509) (not e!80272))))

(assert (=> b!122501 (= res!101509 (invariant!0 (currentBit!5584 thiss!1305) (currentByte!5589 thiss!1305) (size!2452 (buf!2892 (_2!5433 lt!192697)))))))

(declare-fun b!122502 () Bool)

(assert (=> b!122502 (= e!80268 e!80264)))

(declare-fun res!101519 () Bool)

(assert (=> b!122502 (=> (not res!101519) (not e!80264))))

(assert (=> b!122502 (= res!101519 (and (= (_2!5436 lt!192710) lt!192693) (= (_1!5436 lt!192710) (_2!5433 lt!192697))))))

(declare-fun readerFrom!0 (BitStream!4378 (_ BitVec 32) (_ BitVec 32)) BitStream!4378)

(assert (=> b!122502 (= lt!192710 (readBitPure!0 (readerFrom!0 (_2!5433 lt!192697) (currentBit!5584 thiss!1305) (currentByte!5589 thiss!1305))))))

(declare-fun b!122503 () Bool)

(declare-fun array_inv!2254 (array!5420) Bool)

(assert (=> b!122503 (= e!80274 (array_inv!2254 (buf!2892 thiss!1305)))))

(assert (= (and start!24170 res!101513) b!122490))

(assert (= (and b!122490 res!101517) b!122492))

(assert (= (and b!122492 res!101520) b!122497))

(assert (= (and b!122497 res!101516) b!122498))

(assert (= (and b!122498 res!101508) b!122491))

(assert (= (and b!122491 res!101518) b!122495))

(assert (= (and b!122495 res!101515) b!122502))

(assert (= (and b!122502 res!101519) b!122499))

(assert (= (and b!122498 res!101512) b!122501))

(assert (= (and b!122501 res!101509) b!122500))

(assert (= (and b!122498 res!101510) b!122496))

(assert (= (and b!122498 (not res!101514)) b!122493))

(assert (= (and b!122493 res!101511) b!122494))

(assert (= start!24170 b!122503))

(declare-fun m!186047 () Bool)

(assert (=> b!122499 m!186047))

(declare-fun m!186049 () Bool)

(assert (=> b!122498 m!186049))

(declare-fun m!186051 () Bool)

(assert (=> b!122498 m!186051))

(declare-fun m!186053 () Bool)

(assert (=> b!122498 m!186053))

(declare-fun m!186055 () Bool)

(assert (=> b!122498 m!186055))

(declare-fun m!186057 () Bool)

(assert (=> b!122498 m!186057))

(declare-fun m!186059 () Bool)

(assert (=> b!122498 m!186059))

(declare-fun m!186061 () Bool)

(assert (=> b!122498 m!186061))

(declare-fun m!186063 () Bool)

(assert (=> b!122498 m!186063))

(declare-fun m!186065 () Bool)

(assert (=> b!122498 m!186065))

(declare-fun m!186067 () Bool)

(assert (=> b!122498 m!186067))

(declare-fun m!186069 () Bool)

(assert (=> b!122498 m!186069))

(declare-fun m!186071 () Bool)

(assert (=> b!122498 m!186071))

(declare-fun m!186073 () Bool)

(assert (=> b!122498 m!186073))

(declare-fun m!186075 () Bool)

(assert (=> b!122498 m!186075))

(declare-fun m!186077 () Bool)

(assert (=> b!122498 m!186077))

(declare-fun m!186079 () Bool)

(assert (=> b!122498 m!186079))

(declare-fun m!186081 () Bool)

(assert (=> b!122498 m!186081))

(declare-fun m!186083 () Bool)

(assert (=> b!122498 m!186083))

(declare-fun m!186085 () Bool)

(assert (=> b!122498 m!186085))

(declare-fun m!186087 () Bool)

(assert (=> b!122493 m!186087))

(declare-fun m!186089 () Bool)

(assert (=> b!122493 m!186089))

(declare-fun m!186091 () Bool)

(assert (=> b!122493 m!186091))

(declare-fun m!186093 () Bool)

(assert (=> b!122493 m!186093))

(declare-fun m!186095 () Bool)

(assert (=> b!122493 m!186095))

(declare-fun m!186097 () Bool)

(assert (=> b!122493 m!186097))

(declare-fun m!186099 () Bool)

(assert (=> b!122493 m!186099))

(declare-fun m!186101 () Bool)

(assert (=> b!122493 m!186101))

(declare-fun m!186103 () Bool)

(assert (=> b!122490 m!186103))

(declare-fun m!186105 () Bool)

(assert (=> b!122492 m!186105))

(declare-fun m!186107 () Bool)

(assert (=> b!122500 m!186107))

(declare-fun m!186109 () Bool)

(assert (=> b!122502 m!186109))

(assert (=> b!122502 m!186109))

(declare-fun m!186111 () Bool)

(assert (=> b!122502 m!186111))

(declare-fun m!186113 () Bool)

(assert (=> start!24170 m!186113))

(declare-fun m!186115 () Bool)

(assert (=> b!122503 m!186115))

(declare-fun m!186117 () Bool)

(assert (=> b!122501 m!186117))

(assert (=> b!122491 m!186095))

(assert (=> b!122491 m!186093))

(declare-fun m!186119 () Bool)

(assert (=> b!122495 m!186119))

(push 1)

(assert (not b!122492))

(assert (not start!24170))

(assert (not b!122490))

(assert (not b!122495))

(assert (not b!122491))

(assert (not b!122499))

(assert (not b!122500))

(assert (not b!122493))

(assert (not b!122498))

(assert (not b!122502))

(assert (not b!122503))

(assert (not b!122501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

