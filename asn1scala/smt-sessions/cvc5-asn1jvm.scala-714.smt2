; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19996 () Bool)

(assert start!19996)

(declare-fun b!99698 () Bool)

(declare-fun res!81824 () Bool)

(declare-fun e!65261 () Bool)

(assert (=> b!99698 (=> res!81824 e!65261)))

(declare-datatypes ((array!4695 0))(
  ( (array!4696 (arr!2736 (Array (_ BitVec 32) (_ BitVec 8))) (size!2143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3760 0))(
  ( (BitStream!3761 (buf!2500 array!4695) (currentByte!4946 (_ BitVec 32)) (currentBit!4941 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6113 0))(
  ( (Unit!6114) )
))
(declare-datatypes ((tuple2!8038 0))(
  ( (tuple2!8039 (_1!4274 Unit!6113) (_2!4274 BitStream!3760)) )
))
(declare-fun lt!144471 () tuple2!8038)

(declare-fun thiss!1305 () BitStream!3760)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99698 (= res!81824 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2143 (buf!2500 (_2!4274 lt!144471)))) ((_ sign_extend 32) (currentByte!4946 thiss!1305)) ((_ sign_extend 32) (currentBit!4941 thiss!1305)))))))

(declare-fun b!99699 () Bool)

(declare-fun res!81821 () Bool)

(declare-fun e!65255 () Bool)

(assert (=> b!99699 (=> (not res!81821) (not e!65255))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99699 (= res!81821 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99700 () Bool)

(declare-fun res!81822 () Bool)

(declare-fun e!65258 () Bool)

(assert (=> b!99700 (=> (not res!81822) (not e!65258))))

(declare-fun isPrefixOf!0 (BitStream!3760 BitStream!3760) Bool)

(assert (=> b!99700 (= res!81822 (isPrefixOf!0 thiss!1305 (_2!4274 lt!144471)))))

(declare-fun b!99701 () Bool)

(declare-fun e!65259 () Bool)

(declare-fun array_inv!1945 (array!4695) Bool)

(assert (=> b!99701 (= e!65259 (array_inv!1945 (buf!2500 thiss!1305)))))

(declare-fun b!99702 () Bool)

(declare-fun res!81816 () Bool)

(assert (=> b!99702 (=> (not res!81816) (not e!65255))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!99702 (= res!81816 (bvslt i!615 nBits!396))))

(declare-fun res!81819 () Bool)

(assert (=> start!19996 (=> (not res!81819) (not e!65255))))

(assert (=> start!19996 (= res!81819 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19996 e!65255))

(assert (=> start!19996 true))

(declare-fun inv!12 (BitStream!3760) Bool)

(assert (=> start!19996 (and (inv!12 thiss!1305) e!65259)))

(declare-fun b!99703 () Bool)

(assert (=> b!99703 (= e!65255 (not e!65261))))

(declare-fun res!81817 () Bool)

(assert (=> b!99703 (=> res!81817 e!65261)))

(declare-fun lt!144473 () tuple2!8038)

(assert (=> b!99703 (= res!81817 (not (= (size!2143 (buf!2500 (_2!4274 lt!144471))) (size!2143 (buf!2500 (_2!4274 lt!144473))))))))

(declare-fun e!65257 () Bool)

(assert (=> b!99703 e!65257))

(declare-fun res!81823 () Bool)

(assert (=> b!99703 (=> (not res!81823) (not e!65257))))

(assert (=> b!99703 (= res!81823 (isPrefixOf!0 thiss!1305 (_2!4274 lt!144473)))))

(declare-fun lt!144468 () Unit!6113)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3760 BitStream!3760 BitStream!3760) Unit!6113)

(assert (=> b!99703 (= lt!144468 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4274 lt!144471) (_2!4274 lt!144473)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8038)

(assert (=> b!99703 (= lt!144473 (appendNLeastSignificantBitsLoop!0 (_2!4274 lt!144471) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65260 () Bool)

(assert (=> b!99703 e!65260))

(declare-fun res!81814 () Bool)

(assert (=> b!99703 (=> (not res!81814) (not e!65260))))

(assert (=> b!99703 (= res!81814 (= (size!2143 (buf!2500 thiss!1305)) (size!2143 (buf!2500 (_2!4274 lt!144471)))))))

(declare-fun lt!144472 () Bool)

(declare-fun appendBit!0 (BitStream!3760 Bool) tuple2!8038)

(assert (=> b!99703 (= lt!144471 (appendBit!0 thiss!1305 lt!144472))))

(assert (=> b!99703 (= lt!144472 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99704 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99704 (= e!65257 (invariant!0 (currentBit!4941 thiss!1305) (currentByte!4946 thiss!1305) (size!2143 (buf!2500 (_2!4274 lt!144471)))))))

(declare-fun b!99705 () Bool)

(assert (=> b!99705 (= e!65261 true)))

(declare-datatypes ((tuple2!8040 0))(
  ( (tuple2!8041 (_1!4275 BitStream!3760) (_2!4275 Bool)) )
))
(declare-fun lt!144470 () tuple2!8040)

(declare-fun readBitPure!0 (BitStream!3760) tuple2!8040)

(assert (=> b!99705 (= lt!144470 (readBitPure!0 (BitStream!3761 (buf!2500 (_2!4274 lt!144473)) (currentByte!4946 thiss!1305) (currentBit!4941 thiss!1305))))))

(declare-fun lt!144474 () tuple2!8040)

(assert (=> b!99705 (= lt!144474 (readBitPure!0 (BitStream!3761 (buf!2500 (_2!4274 lt!144471)) (currentByte!4946 thiss!1305) (currentBit!4941 thiss!1305))))))

(assert (=> b!99705 (invariant!0 (currentBit!4941 thiss!1305) (currentByte!4946 thiss!1305) (size!2143 (buf!2500 (_2!4274 lt!144473))))))

(declare-fun b!99706 () Bool)

(declare-fun res!81820 () Bool)

(assert (=> b!99706 (=> res!81820 e!65261)))

(declare-fun arrayBitRangesEq!0 (array!4695 array!4695 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99706 (= res!81820 (not (arrayBitRangesEq!0 (buf!2500 (_2!4274 lt!144471)) (buf!2500 (_2!4274 lt!144473)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2143 (buf!2500 (_2!4274 lt!144471))) (currentByte!4946 thiss!1305) (currentBit!4941 thiss!1305))))))))

(declare-fun b!99707 () Bool)

(declare-fun e!65256 () Bool)

(declare-fun lt!144469 () tuple2!8040)

(declare-fun lt!144467 () (_ BitVec 64))

(assert (=> b!99707 (= e!65256 (= (bitIndex!0 (size!2143 (buf!2500 (_1!4275 lt!144469))) (currentByte!4946 (_1!4275 lt!144469)) (currentBit!4941 (_1!4275 lt!144469))) lt!144467))))

(declare-fun b!99708 () Bool)

(declare-fun res!81818 () Bool)

(assert (=> b!99708 (=> (not res!81818) (not e!65255))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99708 (= res!81818 (validate_offset_bits!1 ((_ sign_extend 32) (size!2143 (buf!2500 thiss!1305))) ((_ sign_extend 32) (currentByte!4946 thiss!1305)) ((_ sign_extend 32) (currentBit!4941 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99709 () Bool)

(assert (=> b!99709 (= e!65260 e!65258)))

(declare-fun res!81813 () Bool)

(assert (=> b!99709 (=> (not res!81813) (not e!65258))))

(declare-fun lt!144475 () (_ BitVec 64))

(assert (=> b!99709 (= res!81813 (= lt!144467 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144475)))))

(assert (=> b!99709 (= lt!144467 (bitIndex!0 (size!2143 (buf!2500 (_2!4274 lt!144471))) (currentByte!4946 (_2!4274 lt!144471)) (currentBit!4941 (_2!4274 lt!144471))))))

(assert (=> b!99709 (= lt!144475 (bitIndex!0 (size!2143 (buf!2500 thiss!1305)) (currentByte!4946 thiss!1305) (currentBit!4941 thiss!1305)))))

(declare-fun b!99710 () Bool)

(assert (=> b!99710 (= e!65258 e!65256)))

(declare-fun res!81815 () Bool)

(assert (=> b!99710 (=> (not res!81815) (not e!65256))))

(assert (=> b!99710 (= res!81815 (and (= (_2!4275 lt!144469) lt!144472) (= (_1!4275 lt!144469) (_2!4274 lt!144471))))))

(declare-fun readerFrom!0 (BitStream!3760 (_ BitVec 32) (_ BitVec 32)) BitStream!3760)

(assert (=> b!99710 (= lt!144469 (readBitPure!0 (readerFrom!0 (_2!4274 lt!144471) (currentBit!4941 thiss!1305) (currentByte!4946 thiss!1305))))))

(assert (= (and start!19996 res!81819) b!99708))

(assert (= (and b!99708 res!81818) b!99699))

(assert (= (and b!99699 res!81821) b!99702))

(assert (= (and b!99702 res!81816) b!99703))

(assert (= (and b!99703 res!81814) b!99709))

(assert (= (and b!99709 res!81813) b!99700))

(assert (= (and b!99700 res!81822) b!99710))

(assert (= (and b!99710 res!81815) b!99707))

(assert (= (and b!99703 res!81823) b!99704))

(assert (= (and b!99703 (not res!81817)) b!99698))

(assert (= (and b!99698 (not res!81824)) b!99706))

(assert (= (and b!99706 (not res!81820)) b!99705))

(assert (= start!19996 b!99701))

(declare-fun m!145021 () Bool)

(assert (=> start!19996 m!145021))

(declare-fun m!145023 () Bool)

(assert (=> b!99710 m!145023))

(assert (=> b!99710 m!145023))

(declare-fun m!145025 () Bool)

(assert (=> b!99710 m!145025))

(declare-fun m!145027 () Bool)

(assert (=> b!99708 m!145027))

(declare-fun m!145029 () Bool)

(assert (=> b!99706 m!145029))

(declare-fun m!145031 () Bool)

(assert (=> b!99706 m!145031))

(declare-fun m!145033 () Bool)

(assert (=> b!99705 m!145033))

(declare-fun m!145035 () Bool)

(assert (=> b!99705 m!145035))

(declare-fun m!145037 () Bool)

(assert (=> b!99705 m!145037))

(declare-fun m!145039 () Bool)

(assert (=> b!99707 m!145039))

(declare-fun m!145041 () Bool)

(assert (=> b!99699 m!145041))

(declare-fun m!145043 () Bool)

(assert (=> b!99701 m!145043))

(declare-fun m!145045 () Bool)

(assert (=> b!99698 m!145045))

(declare-fun m!145047 () Bool)

(assert (=> b!99703 m!145047))

(declare-fun m!145049 () Bool)

(assert (=> b!99703 m!145049))

(declare-fun m!145051 () Bool)

(assert (=> b!99703 m!145051))

(declare-fun m!145053 () Bool)

(assert (=> b!99703 m!145053))

(declare-fun m!145055 () Bool)

(assert (=> b!99704 m!145055))

(declare-fun m!145057 () Bool)

(assert (=> b!99709 m!145057))

(declare-fun m!145059 () Bool)

(assert (=> b!99709 m!145059))

(declare-fun m!145061 () Bool)

(assert (=> b!99700 m!145061))

(push 1)

(assert (not b!99699))

(assert (not b!99708))

(assert (not b!99698))

(assert (not b!99704))

(assert (not b!99700))

(assert (not b!99703))

(assert (not b!99706))

(assert (not start!19996))

(assert (not b!99705))

(assert (not b!99709))

(assert (not b!99701))

(assert (not b!99707))

(assert (not b!99710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

