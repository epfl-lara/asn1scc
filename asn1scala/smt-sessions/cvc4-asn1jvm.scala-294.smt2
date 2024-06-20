; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5844 () Bool)

(assert start!5844)

(declare-fun res!22202 () Bool)

(declare-fun e!17554 () Bool)

(assert (=> start!5844 (=> (not res!22202) (not e!17554))))

(declare-datatypes ((array!1674 0))(
  ( (array!1675 (arr!1180 (Array (_ BitVec 32) (_ BitVec 8))) (size!721 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1674)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5844 (= res!22202 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!721 srcBuffer!2))))))))

(assert (=> start!5844 e!17554))

(assert (=> start!5844 true))

(declare-fun array_inv!690 (array!1674) Bool)

(assert (=> start!5844 (array_inv!690 srcBuffer!2)))

(declare-datatypes ((BitStream!1274 0))(
  ( (BitStream!1275 (buf!1045 array!1674) (currentByte!2364 (_ BitVec 32)) (currentBit!2359 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1274)

(declare-fun e!17548 () Bool)

(declare-fun inv!12 (BitStream!1274) Bool)

(assert (=> start!5844 (and (inv!12 thiss!1379) e!17548)))

(declare-fun b!25713 () Bool)

(declare-fun res!22198 () Bool)

(declare-fun e!17551 () Bool)

(assert (=> b!25713 (=> res!22198 e!17551)))

(declare-datatypes ((Unit!2115 0))(
  ( (Unit!2116) )
))
(declare-datatypes ((tuple2!2890 0))(
  ( (tuple2!2891 (_1!1532 Unit!2115) (_2!1532 BitStream!1274)) )
))
(declare-fun lt!36801 () tuple2!2890)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25713 (= res!22198 (not (invariant!0 (currentBit!2359 (_2!1532 lt!36801)) (currentByte!2364 (_2!1532 lt!36801)) (size!721 (buf!1045 (_2!1532 lt!36801))))))))

(declare-fun b!25714 () Bool)

(declare-fun res!22206 () Bool)

(declare-fun e!17544 () Bool)

(assert (=> b!25714 (=> res!22206 e!17544)))

(declare-fun lt!36807 () tuple2!2890)

(assert (=> b!25714 (= res!22206 (not (invariant!0 (currentBit!2359 (_2!1532 lt!36807)) (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36807))))))))

(declare-fun b!25715 () Bool)

(declare-fun e!17552 () Bool)

(declare-fun e!17545 () Bool)

(assert (=> b!25715 (= e!17552 e!17545)))

(declare-fun res!22199 () Bool)

(assert (=> b!25715 (=> res!22199 e!17545)))

(declare-fun isPrefixOf!0 (BitStream!1274 BitStream!1274) Bool)

(assert (=> b!25715 (= res!22199 (not (isPrefixOf!0 thiss!1379 (_2!1532 lt!36807))))))

(declare-fun lt!36800 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25715 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!36800)))

(assert (=> b!25715 (= lt!36800 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36809 () Unit!2115)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1274 BitStream!1274 (_ BitVec 64) (_ BitVec 64)) Unit!2115)

(assert (=> b!25715 (= lt!36809 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1532 lt!36807) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1274 (_ BitVec 8) (_ BitVec 32)) tuple2!2890)

(assert (=> b!25715 (= lt!36807 (appendBitFromByte!0 thiss!1379 (select (arr!1180 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25716 () Bool)

(declare-fun res!22205 () Bool)

(assert (=> b!25716 (=> res!22205 e!17544)))

(assert (=> b!25716 (= res!22205 (not (invariant!0 (currentBit!2359 (_2!1532 lt!36807)) (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36801))))))))

(declare-fun b!25717 () Bool)

(declare-fun lt!36802 () (_ BitVec 64))

(declare-fun e!17553 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25717 (= e!17553 (= lt!36802 (bvsub (bvsub (bvadd (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25718 () Bool)

(assert (=> b!25718 (= e!17554 (not e!17552))))

(declare-fun res!22196 () Bool)

(assert (=> b!25718 (=> res!22196 e!17552)))

(assert (=> b!25718 (= res!22196 (bvsge i!635 to!314))))

(assert (=> b!25718 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!36810 () Unit!2115)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1274) Unit!2115)

(assert (=> b!25718 (= lt!36810 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!36812 () (_ BitVec 64))

(assert (=> b!25718 (= lt!36812 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(declare-fun b!25719 () Bool)

(declare-fun e!17550 () Bool)

(assert (=> b!25719 (= e!17550 e!17551)))

(declare-fun res!22204 () Bool)

(assert (=> b!25719 (=> res!22204 e!17551)))

(assert (=> b!25719 (= res!22204 (not (= lt!36802 (bvsub (bvadd lt!36812 to!314) i!635))))))

(assert (=> b!25719 (= lt!36802 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36801))) (currentByte!2364 (_2!1532 lt!36801)) (currentBit!2359 (_2!1532 lt!36801))))))

(declare-fun b!25720 () Bool)

(assert (=> b!25720 (= e!17545 e!17550)))

(declare-fun res!22197 () Bool)

(assert (=> b!25720 (=> res!22197 e!17550)))

(assert (=> b!25720 (= res!22197 (not (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!36801))))))

(assert (=> b!25720 (isPrefixOf!0 thiss!1379 (_2!1532 lt!36801))))

(declare-fun lt!36811 () Unit!2115)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1274 BitStream!1274 BitStream!1274) Unit!2115)

(assert (=> b!25720 (= lt!36811 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1532 lt!36807) (_2!1532 lt!36801)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1274 array!1674 (_ BitVec 64) (_ BitVec 64)) tuple2!2890)

(assert (=> b!25720 (= lt!36801 (appendBitsMSBFirstLoop!0 (_2!1532 lt!36807) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!17549 () Bool)

(assert (=> b!25720 e!17549))

(declare-fun res!22195 () Bool)

(assert (=> b!25720 (=> (not res!22195) (not e!17549))))

(assert (=> b!25720 (= res!22195 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36813 () Unit!2115)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1274 array!1674 (_ BitVec 64)) Unit!2115)

(assert (=> b!25720 (= lt!36813 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1045 (_2!1532 lt!36807)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2892 0))(
  ( (tuple2!2893 (_1!1533 BitStream!1274) (_2!1533 BitStream!1274)) )
))
(declare-fun lt!36808 () tuple2!2892)

(declare-fun reader!0 (BitStream!1274 BitStream!1274) tuple2!2892)

(assert (=> b!25720 (= lt!36808 (reader!0 thiss!1379 (_2!1532 lt!36807)))))

(declare-fun b!25721 () Bool)

(declare-fun res!22194 () Bool)

(assert (=> b!25721 (=> (not res!22194) (not e!17554))))

(assert (=> b!25721 (= res!22194 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 thiss!1379))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!25722 () Bool)

(assert (=> b!25722 (= e!17551 e!17544)))

(declare-fun res!22201 () Bool)

(assert (=> b!25722 (=> res!22201 e!17544)))

(assert (=> b!25722 (= res!22201 (not (= (size!721 (buf!1045 (_2!1532 lt!36807))) (size!721 (buf!1045 (_2!1532 lt!36801))))))))

(assert (=> b!25722 e!17553))

(declare-fun res!22203 () Bool)

(assert (=> b!25722 (=> (not res!22203) (not e!17553))))

(assert (=> b!25722 (= res!22203 (= (size!721 (buf!1045 (_2!1532 lt!36801))) (size!721 (buf!1045 thiss!1379))))))

(declare-fun b!25723 () Bool)

(declare-fun lt!36804 () tuple2!2892)

(assert (=> b!25723 (= e!17544 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_1!1533 lt!36804)))) ((_ sign_extend 32) (currentByte!2364 (_1!1533 lt!36804))) ((_ sign_extend 32) (currentBit!2359 (_1!1533 lt!36804))) lt!36800))))

(declare-datatypes ((List!338 0))(
  ( (Nil!335) (Cons!334 (h!453 Bool) (t!1088 List!338)) )
))
(declare-fun lt!36805 () List!338)

(declare-fun lt!36806 () tuple2!2892)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1274 BitStream!1274 (_ BitVec 64)) List!338)

(assert (=> b!25723 (= lt!36805 (bitStreamReadBitsIntoList!0 (_2!1532 lt!36801) (_1!1533 lt!36806) (bvsub to!314 i!635)))))

(assert (=> b!25723 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!36800)))

(declare-fun lt!36814 () Unit!2115)

(assert (=> b!25723 (= lt!36814 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1532 lt!36807) (buf!1045 (_2!1532 lt!36801)) lt!36800))))

(assert (=> b!25723 (= lt!36804 (reader!0 (_2!1532 lt!36807) (_2!1532 lt!36801)))))

(assert (=> b!25723 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36803 () Unit!2115)

(assert (=> b!25723 (= lt!36803 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1045 (_2!1532 lt!36801)) (bvsub to!314 i!635)))))

(assert (=> b!25723 (= lt!36806 (reader!0 thiss!1379 (_2!1532 lt!36801)))))

(declare-fun b!25724 () Bool)

(assert (=> b!25724 (= e!17548 (array_inv!690 (buf!1045 thiss!1379)))))

(declare-fun b!25725 () Bool)

(declare-fun res!22200 () Bool)

(assert (=> b!25725 (=> res!22200 e!17551)))

(assert (=> b!25725 (= res!22200 (not (= (size!721 (buf!1045 thiss!1379)) (size!721 (buf!1045 (_2!1532 lt!36801))))))))

(declare-fun b!25726 () Bool)

(declare-fun head!175 (List!338) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1274 array!1674 (_ BitVec 64) (_ BitVec 64)) List!338)

(assert (=> b!25726 (= e!17549 (= (head!175 (byteArrayBitContentToList!0 (_2!1532 lt!36807) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!175 (bitStreamReadBitsIntoList!0 (_2!1532 lt!36807) (_1!1533 lt!36808) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5844 res!22202) b!25721))

(assert (= (and b!25721 res!22194) b!25718))

(assert (= (and b!25718 (not res!22196)) b!25715))

(assert (= (and b!25715 (not res!22199)) b!25720))

(assert (= (and b!25720 res!22195) b!25726))

(assert (= (and b!25720 (not res!22197)) b!25719))

(assert (= (and b!25719 (not res!22204)) b!25713))

(assert (= (and b!25713 (not res!22198)) b!25725))

(assert (= (and b!25725 (not res!22200)) b!25722))

(assert (= (and b!25722 res!22203) b!25717))

(assert (= (and b!25722 (not res!22201)) b!25714))

(assert (= (and b!25714 (not res!22206)) b!25716))

(assert (= (and b!25716 (not res!22205)) b!25723))

(assert (= start!5844 b!25724))

(declare-fun m!36705 () Bool)

(assert (=> b!25717 m!36705))

(declare-fun m!36707 () Bool)

(assert (=> start!5844 m!36707))

(declare-fun m!36709 () Bool)

(assert (=> start!5844 m!36709))

(declare-fun m!36711 () Bool)

(assert (=> b!25714 m!36711))

(declare-fun m!36713 () Bool)

(assert (=> b!25716 m!36713))

(declare-fun m!36715 () Bool)

(assert (=> b!25715 m!36715))

(declare-fun m!36717 () Bool)

(assert (=> b!25715 m!36717))

(declare-fun m!36719 () Bool)

(assert (=> b!25715 m!36719))

(assert (=> b!25715 m!36715))

(declare-fun m!36721 () Bool)

(assert (=> b!25715 m!36721))

(declare-fun m!36723 () Bool)

(assert (=> b!25715 m!36723))

(declare-fun m!36725 () Bool)

(assert (=> b!25724 m!36725))

(declare-fun m!36727 () Bool)

(assert (=> b!25721 m!36727))

(declare-fun m!36729 () Bool)

(assert (=> b!25719 m!36729))

(declare-fun m!36731 () Bool)

(assert (=> b!25723 m!36731))

(declare-fun m!36733 () Bool)

(assert (=> b!25723 m!36733))

(declare-fun m!36735 () Bool)

(assert (=> b!25723 m!36735))

(declare-fun m!36737 () Bool)

(assert (=> b!25723 m!36737))

(declare-fun m!36739 () Bool)

(assert (=> b!25723 m!36739))

(declare-fun m!36741 () Bool)

(assert (=> b!25723 m!36741))

(declare-fun m!36743 () Bool)

(assert (=> b!25723 m!36743))

(declare-fun m!36745 () Bool)

(assert (=> b!25723 m!36745))

(declare-fun m!36747 () Bool)

(assert (=> b!25720 m!36747))

(declare-fun m!36749 () Bool)

(assert (=> b!25720 m!36749))

(declare-fun m!36751 () Bool)

(assert (=> b!25720 m!36751))

(declare-fun m!36753 () Bool)

(assert (=> b!25720 m!36753))

(declare-fun m!36755 () Bool)

(assert (=> b!25720 m!36755))

(declare-fun m!36757 () Bool)

(assert (=> b!25720 m!36757))

(declare-fun m!36759 () Bool)

(assert (=> b!25720 m!36759))

(declare-fun m!36761 () Bool)

(assert (=> b!25713 m!36761))

(declare-fun m!36763 () Bool)

(assert (=> b!25718 m!36763))

(declare-fun m!36765 () Bool)

(assert (=> b!25718 m!36765))

(declare-fun m!36767 () Bool)

(assert (=> b!25718 m!36767))

(declare-fun m!36769 () Bool)

(assert (=> b!25726 m!36769))

(assert (=> b!25726 m!36769))

(declare-fun m!36771 () Bool)

(assert (=> b!25726 m!36771))

(declare-fun m!36773 () Bool)

(assert (=> b!25726 m!36773))

(assert (=> b!25726 m!36773))

(declare-fun m!36775 () Bool)

(assert (=> b!25726 m!36775))

(push 1)

(assert (not b!25716))

(assert (not b!25724))

(assert (not b!25721))

(assert (not b!25719))

(assert (not b!25718))

(assert (not b!25714))

(assert (not b!25723))

(assert (not b!25715))

(assert (not b!25726))

(assert (not b!25720))

(assert (not b!25717))

(assert (not b!25713))

(assert (not start!5844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7740 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7740 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 thiss!1379))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 thiss!1379))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2229 () Bool)

(assert (= bs!2229 d!7740))

(declare-fun m!37009 () Bool)

(assert (=> bs!2229 m!37009))

(assert (=> b!25721 d!7740))

(declare-fun b!25884 () Bool)

(declare-fun e!17634 () Unit!2115)

(declare-fun Unit!2127 () Unit!2115)

(assert (=> b!25884 (= e!17634 Unit!2127)))

(declare-fun b!25885 () Bool)

(declare-fun res!22308 () Bool)

(declare-fun e!17635 () Bool)

(assert (=> b!25885 (=> (not res!22308) (not e!17635))))

(declare-fun lt!37176 () tuple2!2892)

(assert (=> b!25885 (= res!22308 (isPrefixOf!0 (_1!1533 lt!37176) thiss!1379))))

(declare-fun b!25886 () Bool)

(declare-fun lt!37164 () Unit!2115)

(assert (=> b!25886 (= e!17634 lt!37164)))

(declare-fun lt!37170 () (_ BitVec 64))

(assert (=> b!25886 (= lt!37170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!37179 () (_ BitVec 64))

(assert (=> b!25886 (= lt!37179 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1674 array!1674 (_ BitVec 64) (_ BitVec 64)) Unit!2115)

(assert (=> b!25886 (= lt!37164 (arrayBitRangesEqSymmetric!0 (buf!1045 thiss!1379) (buf!1045 (_2!1532 lt!36807)) lt!37170 lt!37179))))

(declare-fun arrayBitRangesEq!0 (array!1674 array!1674 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25886 (arrayBitRangesEq!0 (buf!1045 (_2!1532 lt!36807)) (buf!1045 thiss!1379) lt!37170 lt!37179)))

(declare-fun d!7742 () Bool)

(assert (=> d!7742 e!17635))

(declare-fun res!22307 () Bool)

(assert (=> d!7742 (=> (not res!22307) (not e!17635))))

(assert (=> d!7742 (= res!22307 (isPrefixOf!0 (_1!1533 lt!37176) (_2!1533 lt!37176)))))

(declare-fun lt!37169 () BitStream!1274)

(assert (=> d!7742 (= lt!37176 (tuple2!2893 lt!37169 (_2!1532 lt!36807)))))

(declare-fun lt!37172 () Unit!2115)

(declare-fun lt!37173 () Unit!2115)

(assert (=> d!7742 (= lt!37172 lt!37173)))

(assert (=> d!7742 (isPrefixOf!0 lt!37169 (_2!1532 lt!36807))))

(assert (=> d!7742 (= lt!37173 (lemmaIsPrefixTransitive!0 lt!37169 (_2!1532 lt!36807) (_2!1532 lt!36807)))))

(declare-fun lt!37166 () Unit!2115)

(declare-fun lt!37175 () Unit!2115)

(assert (=> d!7742 (= lt!37166 lt!37175)))

(assert (=> d!7742 (isPrefixOf!0 lt!37169 (_2!1532 lt!36807))))

(assert (=> d!7742 (= lt!37175 (lemmaIsPrefixTransitive!0 lt!37169 thiss!1379 (_2!1532 lt!36807)))))

(declare-fun lt!37163 () Unit!2115)

(assert (=> d!7742 (= lt!37163 e!17634)))

(declare-fun c!1748 () Bool)

(assert (=> d!7742 (= c!1748 (not (= (size!721 (buf!1045 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!37160 () Unit!2115)

(declare-fun lt!37161 () Unit!2115)

(assert (=> d!7742 (= lt!37160 lt!37161)))

(assert (=> d!7742 (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!36807))))

(assert (=> d!7742 (= lt!37161 (lemmaIsPrefixRefl!0 (_2!1532 lt!36807)))))

(declare-fun lt!37168 () Unit!2115)

(declare-fun lt!37177 () Unit!2115)

(assert (=> d!7742 (= lt!37168 lt!37177)))

(assert (=> d!7742 (= lt!37177 (lemmaIsPrefixRefl!0 (_2!1532 lt!36807)))))

(declare-fun lt!37171 () Unit!2115)

(declare-fun lt!37178 () Unit!2115)

(assert (=> d!7742 (= lt!37171 lt!37178)))

(assert (=> d!7742 (isPrefixOf!0 lt!37169 lt!37169)))

(assert (=> d!7742 (= lt!37178 (lemmaIsPrefixRefl!0 lt!37169))))

(declare-fun lt!37174 () Unit!2115)

(declare-fun lt!37165 () Unit!2115)

(assert (=> d!7742 (= lt!37174 lt!37165)))

(assert (=> d!7742 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7742 (= lt!37165 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7742 (= lt!37169 (BitStream!1275 (buf!1045 (_2!1532 lt!36807)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(assert (=> d!7742 (isPrefixOf!0 thiss!1379 (_2!1532 lt!36807))))

(assert (=> d!7742 (= (reader!0 thiss!1379 (_2!1532 lt!36807)) lt!37176)))

(declare-fun b!25887 () Bool)

(declare-fun res!22309 () Bool)

(assert (=> b!25887 (=> (not res!22309) (not e!17635))))

(assert (=> b!25887 (= res!22309 (isPrefixOf!0 (_2!1533 lt!37176) (_2!1532 lt!36807)))))

(declare-fun b!25888 () Bool)

(declare-fun lt!37162 () (_ BitVec 64))

(declare-fun lt!37167 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1274 (_ BitVec 64)) BitStream!1274)

(assert (=> b!25888 (= e!17635 (= (_1!1533 lt!37176) (withMovedBitIndex!0 (_2!1533 lt!37176) (bvsub lt!37167 lt!37162))))))

(assert (=> b!25888 (or (= (bvand lt!37167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37167 lt!37162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25888 (= lt!37162 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))))))

(assert (=> b!25888 (= lt!37167 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(assert (= (and d!7742 c!1748) b!25886))

(assert (= (and d!7742 (not c!1748)) b!25884))

(assert (= (and d!7742 res!22307) b!25885))

(assert (= (and b!25885 res!22308) b!25887))

(assert (= (and b!25887 res!22309) b!25888))

(declare-fun m!37011 () Bool)

(assert (=> b!25888 m!37011))

(assert (=> b!25888 m!36705))

(assert (=> b!25888 m!36767))

(declare-fun m!37013 () Bool)

(assert (=> b!25887 m!37013))

(declare-fun m!37015 () Bool)

(assert (=> d!7742 m!37015))

(declare-fun m!37017 () Bool)

(assert (=> d!7742 m!37017))

(declare-fun m!37019 () Bool)

(assert (=> d!7742 m!37019))

(declare-fun m!37021 () Bool)

(assert (=> d!7742 m!37021))

(declare-fun m!37023 () Bool)

(assert (=> d!7742 m!37023))

(assert (=> d!7742 m!36763))

(assert (=> d!7742 m!36765))

(declare-fun m!37025 () Bool)

(assert (=> d!7742 m!37025))

(declare-fun m!37027 () Bool)

(assert (=> d!7742 m!37027))

(declare-fun m!37029 () Bool)

(assert (=> d!7742 m!37029))

(assert (=> d!7742 m!36717))

(assert (=> b!25886 m!36767))

(declare-fun m!37031 () Bool)

(assert (=> b!25886 m!37031))

(declare-fun m!37033 () Bool)

(assert (=> b!25886 m!37033))

(declare-fun m!37035 () Bool)

(assert (=> b!25885 m!37035))

(assert (=> b!25720 d!7742))

(declare-fun d!7744 () Bool)

(assert (=> d!7744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2230 () Bool)

(assert (= bs!2230 d!7744))

(declare-fun m!37037 () Bool)

(assert (=> bs!2230 m!37037))

(assert (=> b!25720 d!7744))

(declare-fun d!7746 () Bool)

(assert (=> d!7746 (isPrefixOf!0 thiss!1379 (_2!1532 lt!36801))))

(declare-fun lt!37182 () Unit!2115)

(declare-fun choose!30 (BitStream!1274 BitStream!1274 BitStream!1274) Unit!2115)

(assert (=> d!7746 (= lt!37182 (choose!30 thiss!1379 (_2!1532 lt!36807) (_2!1532 lt!36801)))))

(assert (=> d!7746 (isPrefixOf!0 thiss!1379 (_2!1532 lt!36807))))

(assert (=> d!7746 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1532 lt!36807) (_2!1532 lt!36801)) lt!37182)))

(declare-fun bs!2231 () Bool)

(assert (= bs!2231 d!7746))

(assert (=> bs!2231 m!36751))

(declare-fun m!37039 () Bool)

(assert (=> bs!2231 m!37039))

(assert (=> bs!2231 m!36717))

(assert (=> b!25720 d!7746))

(declare-fun d!7748 () Bool)

(declare-fun e!17675 () Bool)

(assert (=> d!7748 e!17675))

(declare-fun res!22377 () Bool)

(assert (=> d!7748 (=> (not res!22377) (not e!17675))))

(declare-fun lt!37456 () tuple2!2890)

(declare-fun lt!37488 () (_ BitVec 64))

(assert (=> d!7748 (= res!22377 (= (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37456))) (currentByte!2364 (_2!1532 lt!37456)) (currentBit!2359 (_2!1532 lt!37456))) (bvsub lt!37488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7748 (or (= (bvand lt!37488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!37491 () (_ BitVec 64))

(assert (=> d!7748 (= lt!37488 (bvadd lt!37491 to!314))))

(assert (=> d!7748 (or (not (= (bvand lt!37491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!37491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!37491 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7748 (= lt!37491 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))))))

(declare-fun e!17676 () tuple2!2890)

(assert (=> d!7748 (= lt!37456 e!17676)))

(declare-fun c!1759 () Bool)

(assert (=> d!7748 (= c!1759 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!37481 () Unit!2115)

(declare-fun lt!37490 () Unit!2115)

(assert (=> d!7748 (= lt!37481 lt!37490)))

(assert (=> d!7748 (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!36807))))

(assert (=> d!7748 (= lt!37490 (lemmaIsPrefixRefl!0 (_2!1532 lt!36807)))))

(declare-fun lt!37463 () (_ BitVec 64))

(assert (=> d!7748 (= lt!37463 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))))))

(assert (=> d!7748 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7748 (= (appendBitsMSBFirstLoop!0 (_2!1532 lt!36807) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!37456)))

(declare-fun b!25975 () Bool)

(declare-fun Unit!2129 () Unit!2115)

(assert (=> b!25975 (= e!17676 (tuple2!2891 Unit!2129 (_2!1532 lt!36807)))))

(assert (=> b!25975 (= (size!721 (buf!1045 (_2!1532 lt!36807))) (size!721 (buf!1045 (_2!1532 lt!36807))))))

(declare-fun lt!37474 () Unit!2115)

(declare-fun Unit!2130 () Unit!2115)

(assert (=> b!25975 (= lt!37474 Unit!2130)))

(declare-fun call!352 () tuple2!2892)

(declare-fun checkByteArrayBitContent!0 (BitStream!1274 array!1674 array!1674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2906 0))(
  ( (tuple2!2907 (_1!1540 array!1674) (_2!1540 BitStream!1274)) )
))
(declare-fun readBits!0 (BitStream!1274 (_ BitVec 64)) tuple2!2906)

(assert (=> b!25975 (checkByteArrayBitContent!0 (_2!1532 lt!36807) srcBuffer!2 (_1!1540 (readBits!0 (_1!1533 call!352) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!25976 () Bool)

(declare-fun res!22380 () Bool)

(assert (=> b!25976 (=> (not res!22380) (not e!17675))))

(assert (=> b!25976 (= res!22380 (= (size!721 (buf!1045 (_2!1532 lt!37456))) (size!721 (buf!1045 (_2!1532 lt!36807)))))))

(declare-fun b!25977 () Bool)

(declare-fun res!22379 () Bool)

(assert (=> b!25977 (=> (not res!22379) (not e!17675))))

(assert (=> b!25977 (= res!22379 (invariant!0 (currentBit!2359 (_2!1532 lt!37456)) (currentByte!2364 (_2!1532 lt!37456)) (size!721 (buf!1045 (_2!1532 lt!37456)))))))

(declare-fun b!25978 () Bool)

(declare-fun e!17677 () Bool)

(declare-fun lt!37487 () (_ BitVec 64))

(assert (=> b!25978 (= e!17677 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!37487))))

(declare-fun b!25979 () Bool)

(declare-fun lt!37498 () tuple2!2890)

(declare-fun Unit!2132 () Unit!2115)

(assert (=> b!25979 (= e!17676 (tuple2!2891 Unit!2132 (_2!1532 lt!37498)))))

(declare-fun lt!37472 () tuple2!2890)

(assert (=> b!25979 (= lt!37472 (appendBitFromByte!0 (_2!1532 lt!36807) (select (arr!1180 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!37468 () (_ BitVec 64))

(assert (=> b!25979 (= lt!37468 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37496 () (_ BitVec 64))

(assert (=> b!25979 (= lt!37496 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37485 () Unit!2115)

(assert (=> b!25979 (= lt!37485 (validateOffsetBitsIneqLemma!0 (_2!1532 lt!36807) (_2!1532 lt!37472) lt!37468 lt!37496))))

(assert (=> b!25979 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!37472)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!37472))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!37472))) (bvsub lt!37468 lt!37496))))

(declare-fun lt!37497 () Unit!2115)

(assert (=> b!25979 (= lt!37497 lt!37485)))

(declare-fun lt!37471 () tuple2!2892)

(assert (=> b!25979 (= lt!37471 (reader!0 (_2!1532 lt!36807) (_2!1532 lt!37472)))))

(declare-fun lt!37493 () (_ BitVec 64))

(assert (=> b!25979 (= lt!37493 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37489 () Unit!2115)

(assert (=> b!25979 (= lt!37489 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1532 lt!36807) (buf!1045 (_2!1532 lt!37472)) lt!37493))))

(assert (=> b!25979 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!37472)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!37493)))

(declare-fun lt!37478 () Unit!2115)

(assert (=> b!25979 (= lt!37478 lt!37489)))

(assert (=> b!25979 (= (head!175 (byteArrayBitContentToList!0 (_2!1532 lt!37472) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!175 (bitStreamReadBitsIntoList!0 (_2!1532 lt!37472) (_1!1533 lt!37471) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37475 () Unit!2115)

(declare-fun Unit!2133 () Unit!2115)

(assert (=> b!25979 (= lt!37475 Unit!2133)))

(assert (=> b!25979 (= lt!37498 (appendBitsMSBFirstLoop!0 (_2!1532 lt!37472) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!37484 () Unit!2115)

(assert (=> b!25979 (= lt!37484 (lemmaIsPrefixTransitive!0 (_2!1532 lt!36807) (_2!1532 lt!37472) (_2!1532 lt!37498)))))

(assert (=> b!25979 (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!37498))))

(declare-fun lt!37461 () Unit!2115)

(assert (=> b!25979 (= lt!37461 lt!37484)))

(assert (=> b!25979 (= (size!721 (buf!1045 (_2!1532 lt!37498))) (size!721 (buf!1045 (_2!1532 lt!36807))))))

(declare-fun lt!37470 () Unit!2115)

(declare-fun Unit!2134 () Unit!2115)

(assert (=> b!25979 (= lt!37470 Unit!2134)))

(assert (=> b!25979 (= (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37498))) (currentByte!2364 (_2!1532 lt!37498)) (currentBit!2359 (_2!1532 lt!37498))) (bvsub (bvadd (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37467 () Unit!2115)

(declare-fun Unit!2135 () Unit!2115)

(assert (=> b!25979 (= lt!37467 Unit!2135)))

(assert (=> b!25979 (= (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37498))) (currentByte!2364 (_2!1532 lt!37498)) (currentBit!2359 (_2!1532 lt!37498))) (bvsub (bvsub (bvadd (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37472))) (currentByte!2364 (_2!1532 lt!37472)) (currentBit!2359 (_2!1532 lt!37472))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37473 () Unit!2115)

(declare-fun Unit!2136 () Unit!2115)

(assert (=> b!25979 (= lt!37473 Unit!2136)))

(declare-fun lt!37460 () tuple2!2892)

(assert (=> b!25979 (= lt!37460 call!352)))

(declare-fun lt!37492 () (_ BitVec 64))

(assert (=> b!25979 (= lt!37492 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37477 () Unit!2115)

(assert (=> b!25979 (= lt!37477 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1532 lt!36807) (buf!1045 (_2!1532 lt!37498)) lt!37492))))

(assert (=> b!25979 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!37498)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!37492)))

(declare-fun lt!37465 () Unit!2115)

(assert (=> b!25979 (= lt!37465 lt!37477)))

(declare-fun lt!37486 () tuple2!2892)

(assert (=> b!25979 (= lt!37486 (reader!0 (_2!1532 lt!37472) (_2!1532 lt!37498)))))

(declare-fun lt!37459 () (_ BitVec 64))

(assert (=> b!25979 (= lt!37459 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37480 () Unit!2115)

(assert (=> b!25979 (= lt!37480 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1532 lt!37472) (buf!1045 (_2!1532 lt!37498)) lt!37459))))

(assert (=> b!25979 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!37498)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!37472))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!37472))) lt!37459)))

(declare-fun lt!37479 () Unit!2115)

(assert (=> b!25979 (= lt!37479 lt!37480)))

(declare-fun lt!37482 () List!338)

(assert (=> b!25979 (= lt!37482 (byteArrayBitContentToList!0 (_2!1532 lt!37498) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!37483 () List!338)

(assert (=> b!25979 (= lt!37483 (byteArrayBitContentToList!0 (_2!1532 lt!37498) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37457 () List!338)

(assert (=> b!25979 (= lt!37457 (bitStreamReadBitsIntoList!0 (_2!1532 lt!37498) (_1!1533 lt!37460) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!37462 () List!338)

(assert (=> b!25979 (= lt!37462 (bitStreamReadBitsIntoList!0 (_2!1532 lt!37498) (_1!1533 lt!37486) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!37464 () (_ BitVec 64))

(assert (=> b!25979 (= lt!37464 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!37469 () Unit!2115)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1274 BitStream!1274 BitStream!1274 BitStream!1274 (_ BitVec 64) List!338) Unit!2115)

(assert (=> b!25979 (= lt!37469 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1532 lt!37498) (_2!1532 lt!37498) (_1!1533 lt!37460) (_1!1533 lt!37486) lt!37464 lt!37457))))

(declare-fun tail!90 (List!338) List!338)

(assert (=> b!25979 (= (bitStreamReadBitsIntoList!0 (_2!1532 lt!37498) (_1!1533 lt!37486) (bvsub lt!37464 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!90 lt!37457))))

(declare-fun lt!37458 () Unit!2115)

(assert (=> b!25979 (= lt!37458 lt!37469)))

(declare-fun lt!37494 () Unit!2115)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1674 array!1674 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2115)

(assert (=> b!25979 (= lt!37494 (arrayBitRangesEqImpliesEq!0 (buf!1045 (_2!1532 lt!37472)) (buf!1045 (_2!1532 lt!37498)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!37463 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37472))) (currentByte!2364 (_2!1532 lt!37472)) (currentBit!2359 (_2!1532 lt!37472)))))))

(declare-fun bitAt!0 (array!1674 (_ BitVec 64)) Bool)

(assert (=> b!25979 (= (bitAt!0 (buf!1045 (_2!1532 lt!37472)) lt!37463) (bitAt!0 (buf!1045 (_2!1532 lt!37498)) lt!37463))))

(declare-fun lt!37455 () Unit!2115)

(assert (=> b!25979 (= lt!37455 lt!37494)))

(declare-fun b!25980 () Bool)

(declare-fun res!22375 () Bool)

(assert (=> b!25980 (=> (not res!22375) (not e!17675))))

(assert (=> b!25980 (= res!22375 (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!37456)))))

(declare-fun lt!37495 () tuple2!2892)

(declare-fun b!25981 () Bool)

(assert (=> b!25981 (= e!17675 (= (bitStreamReadBitsIntoList!0 (_2!1532 lt!37456) (_1!1533 lt!37495) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1532 lt!37456) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!25981 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25981 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!37466 () Unit!2115)

(declare-fun lt!37476 () Unit!2115)

(assert (=> b!25981 (= lt!37466 lt!37476)))

(assert (=> b!25981 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!37456)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!37487)))

(assert (=> b!25981 (= lt!37476 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1532 lt!36807) (buf!1045 (_2!1532 lt!37456)) lt!37487))))

(assert (=> b!25981 e!17677))

(declare-fun res!22376 () Bool)

(assert (=> b!25981 (=> (not res!22376) (not e!17677))))

(assert (=> b!25981 (= res!22376 (and (= (size!721 (buf!1045 (_2!1532 lt!36807))) (size!721 (buf!1045 (_2!1532 lt!37456)))) (bvsge lt!37487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25981 (= lt!37487 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!25981 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25981 (= lt!37495 (reader!0 (_2!1532 lt!36807) (_2!1532 lt!37456)))))

(declare-fun b!25982 () Bool)

(declare-fun res!22378 () Bool)

(assert (=> b!25982 (=> (not res!22378) (not e!17675))))

(assert (=> b!25982 (= res!22378 (= (size!721 (buf!1045 (_2!1532 lt!36807))) (size!721 (buf!1045 (_2!1532 lt!37456)))))))

(declare-fun bm!349 () Bool)

(assert (=> bm!349 (= call!352 (reader!0 (_2!1532 lt!36807) (ite c!1759 (_2!1532 lt!37498) (_2!1532 lt!36807))))))

(assert (= (and d!7748 c!1759) b!25979))

(assert (= (and d!7748 (not c!1759)) b!25975))

(assert (= (or b!25979 b!25975) bm!349))

(assert (= (and d!7748 res!22377) b!25977))

(assert (= (and b!25977 res!22379) b!25982))

(assert (= (and b!25982 res!22378) b!25980))

(assert (= (and b!25980 res!22375) b!25976))

(assert (= (and b!25976 res!22380) b!25981))

(assert (= (and b!25981 res!22376) b!25978))

(declare-fun m!37179 () Bool)

(assert (=> b!25977 m!37179))

(declare-fun m!37181 () Bool)

(assert (=> b!25978 m!37181))

(declare-fun m!37183 () Bool)

(assert (=> bm!349 m!37183))

(declare-fun m!37185 () Bool)

(assert (=> b!25981 m!37185))

(declare-fun m!37187 () Bool)

(assert (=> b!25981 m!37187))

(declare-fun m!37189 () Bool)

(assert (=> b!25981 m!37189))

(declare-fun m!37191 () Bool)

(assert (=> b!25981 m!37191))

(declare-fun m!37193 () Bool)

(assert (=> b!25981 m!37193))

(declare-fun m!37195 () Bool)

(assert (=> b!25979 m!37195))

(declare-fun m!37197 () Bool)

(assert (=> b!25979 m!37197))

(declare-fun m!37199 () Bool)

(assert (=> b!25979 m!37199))

(declare-fun m!37201 () Bool)

(assert (=> b!25979 m!37201))

(declare-fun m!37203 () Bool)

(assert (=> b!25979 m!37203))

(assert (=> b!25979 m!36705))

(declare-fun m!37205 () Bool)

(assert (=> b!25979 m!37205))

(declare-fun m!37207 () Bool)

(assert (=> b!25979 m!37207))

(declare-fun m!37209 () Bool)

(assert (=> b!25979 m!37209))

(declare-fun m!37211 () Bool)

(assert (=> b!25979 m!37211))

(declare-fun m!37213 () Bool)

(assert (=> b!25979 m!37213))

(declare-fun m!37215 () Bool)

(assert (=> b!25979 m!37215))

(declare-fun m!37217 () Bool)

(assert (=> b!25979 m!37217))

(declare-fun m!37219 () Bool)

(assert (=> b!25979 m!37219))

(declare-fun m!37221 () Bool)

(assert (=> b!25979 m!37221))

(declare-fun m!37223 () Bool)

(assert (=> b!25979 m!37223))

(declare-fun m!37225 () Bool)

(assert (=> b!25979 m!37225))

(declare-fun m!37227 () Bool)

(assert (=> b!25979 m!37227))

(declare-fun m!37229 () Bool)

(assert (=> b!25979 m!37229))

(declare-fun m!37231 () Bool)

(assert (=> b!25979 m!37231))

(declare-fun m!37233 () Bool)

(assert (=> b!25979 m!37233))

(declare-fun m!37235 () Bool)

(assert (=> b!25979 m!37235))

(declare-fun m!37237 () Bool)

(assert (=> b!25979 m!37237))

(declare-fun m!37239 () Bool)

(assert (=> b!25979 m!37239))

(assert (=> b!25979 m!37237))

(declare-fun m!37241 () Bool)

(assert (=> b!25979 m!37241))

(declare-fun m!37243 () Bool)

(assert (=> b!25979 m!37243))

(assert (=> b!25979 m!37205))

(declare-fun m!37245 () Bool)

(assert (=> b!25979 m!37245))

(declare-fun m!37247 () Bool)

(assert (=> b!25979 m!37247))

(declare-fun m!37249 () Bool)

(assert (=> b!25979 m!37249))

(declare-fun m!37251 () Bool)

(assert (=> b!25979 m!37251))

(assert (=> b!25979 m!37215))

(declare-fun m!37253 () Bool)

(assert (=> b!25979 m!37253))

(assert (=> b!25979 m!37221))

(declare-fun m!37255 () Bool)

(assert (=> b!25979 m!37255))

(declare-fun m!37257 () Bool)

(assert (=> d!7748 m!37257))

(assert (=> d!7748 m!36705))

(assert (=> d!7748 m!37029))

(assert (=> d!7748 m!37021))

(declare-fun m!37259 () Bool)

(assert (=> b!25980 m!37259))

(declare-fun m!37261 () Bool)

(assert (=> b!25975 m!37261))

(declare-fun m!37263 () Bool)

(assert (=> b!25975 m!37263))

(assert (=> b!25720 d!7748))

(declare-fun d!7780 () Bool)

(assert (=> d!7780 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!37501 () Unit!2115)

(declare-fun choose!9 (BitStream!1274 array!1674 (_ BitVec 64) BitStream!1274) Unit!2115)

(assert (=> d!7780 (= lt!37501 (choose!9 thiss!1379 (buf!1045 (_2!1532 lt!36807)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1275 (buf!1045 (_2!1532 lt!36807)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379))))))

(assert (=> d!7780 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1045 (_2!1532 lt!36807)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!37501)))

(declare-fun bs!2237 () Bool)

(assert (= bs!2237 d!7780))

(assert (=> bs!2237 m!36759))

(declare-fun m!37265 () Bool)

(assert (=> bs!2237 m!37265))

(assert (=> b!25720 d!7780))

(declare-fun d!7782 () Bool)

(declare-fun res!22388 () Bool)

(declare-fun e!17682 () Bool)

(assert (=> d!7782 (=> (not res!22388) (not e!17682))))

(assert (=> d!7782 (= res!22388 (= (size!721 (buf!1045 thiss!1379)) (size!721 (buf!1045 (_2!1532 lt!36801)))))))

(assert (=> d!7782 (= (isPrefixOf!0 thiss!1379 (_2!1532 lt!36801)) e!17682)))

(declare-fun b!25989 () Bool)

(declare-fun res!22387 () Bool)

(assert (=> b!25989 (=> (not res!22387) (not e!17682))))

(assert (=> b!25989 (= res!22387 (bvsle (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)) (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36801))) (currentByte!2364 (_2!1532 lt!36801)) (currentBit!2359 (_2!1532 lt!36801)))))))

(declare-fun b!25990 () Bool)

(declare-fun e!17683 () Bool)

(assert (=> b!25990 (= e!17682 e!17683)))

(declare-fun res!22389 () Bool)

(assert (=> b!25990 (=> res!22389 e!17683)))

(assert (=> b!25990 (= res!22389 (= (size!721 (buf!1045 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25991 () Bool)

(assert (=> b!25991 (= e!17683 (arrayBitRangesEq!0 (buf!1045 thiss!1379) (buf!1045 (_2!1532 lt!36801)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379))))))

(assert (= (and d!7782 res!22388) b!25989))

(assert (= (and b!25989 res!22387) b!25990))

(assert (= (and b!25990 (not res!22389)) b!25991))

(assert (=> b!25989 m!36767))

(assert (=> b!25989 m!36729))

(assert (=> b!25991 m!36767))

(assert (=> b!25991 m!36767))

(declare-fun m!37267 () Bool)

(assert (=> b!25991 m!37267))

(assert (=> b!25720 d!7782))

(declare-fun d!7784 () Bool)

(declare-fun res!22391 () Bool)

(declare-fun e!17684 () Bool)

(assert (=> d!7784 (=> (not res!22391) (not e!17684))))

(assert (=> d!7784 (= res!22391 (= (size!721 (buf!1045 (_2!1532 lt!36807))) (size!721 (buf!1045 (_2!1532 lt!36801)))))))

(assert (=> d!7784 (= (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!36801)) e!17684)))

(declare-fun b!25992 () Bool)

(declare-fun res!22390 () Bool)

(assert (=> b!25992 (=> (not res!22390) (not e!17684))))

(assert (=> b!25992 (= res!22390 (bvsle (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))) (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36801))) (currentByte!2364 (_2!1532 lt!36801)) (currentBit!2359 (_2!1532 lt!36801)))))))

(declare-fun b!25993 () Bool)

(declare-fun e!17685 () Bool)

(assert (=> b!25993 (= e!17684 e!17685)))

(declare-fun res!22392 () Bool)

(assert (=> b!25993 (=> res!22392 e!17685)))

(assert (=> b!25993 (= res!22392 (= (size!721 (buf!1045 (_2!1532 lt!36807))) #b00000000000000000000000000000000))))

(declare-fun b!25994 () Bool)

(assert (=> b!25994 (= e!17685 (arrayBitRangesEq!0 (buf!1045 (_2!1532 lt!36807)) (buf!1045 (_2!1532 lt!36801)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807)))))))

(assert (= (and d!7784 res!22391) b!25992))

(assert (= (and b!25992 res!22390) b!25993))

(assert (= (and b!25993 (not res!22392)) b!25994))

(assert (=> b!25992 m!36705))

(assert (=> b!25992 m!36729))

(assert (=> b!25994 m!36705))

(assert (=> b!25994 m!36705))

(declare-fun m!37269 () Bool)

(assert (=> b!25994 m!37269))

(assert (=> b!25720 d!7784))

(declare-fun d!7786 () Bool)

(assert (=> d!7786 (= (invariant!0 (currentBit!2359 (_2!1532 lt!36801)) (currentByte!2364 (_2!1532 lt!36801)) (size!721 (buf!1045 (_2!1532 lt!36801)))) (and (bvsge (currentBit!2359 (_2!1532 lt!36801)) #b00000000000000000000000000000000) (bvslt (currentBit!2359 (_2!1532 lt!36801)) #b00000000000000000000000000001000) (bvsge (currentByte!2364 (_2!1532 lt!36801)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2364 (_2!1532 lt!36801)) (size!721 (buf!1045 (_2!1532 lt!36801)))) (and (= (currentBit!2359 (_2!1532 lt!36801)) #b00000000000000000000000000000000) (= (currentByte!2364 (_2!1532 lt!36801)) (size!721 (buf!1045 (_2!1532 lt!36801))))))))))

(assert (=> b!25713 d!7786))

(declare-fun b!25995 () Bool)

(declare-fun e!17686 () Unit!2115)

(declare-fun Unit!2137 () Unit!2115)

(assert (=> b!25995 (= e!17686 Unit!2137)))

(declare-fun b!25996 () Bool)

(declare-fun res!22394 () Bool)

(declare-fun e!17687 () Bool)

(assert (=> b!25996 (=> (not res!22394) (not e!17687))))

(declare-fun lt!37518 () tuple2!2892)

(assert (=> b!25996 (= res!22394 (isPrefixOf!0 (_1!1533 lt!37518) (_2!1532 lt!36807)))))

(declare-fun b!25997 () Bool)

(declare-fun lt!37506 () Unit!2115)

(assert (=> b!25997 (= e!17686 lt!37506)))

(declare-fun lt!37512 () (_ BitVec 64))

(assert (=> b!25997 (= lt!37512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!37521 () (_ BitVec 64))

(assert (=> b!25997 (= lt!37521 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))))))

(assert (=> b!25997 (= lt!37506 (arrayBitRangesEqSymmetric!0 (buf!1045 (_2!1532 lt!36807)) (buf!1045 (_2!1532 lt!36801)) lt!37512 lt!37521))))

(assert (=> b!25997 (arrayBitRangesEq!0 (buf!1045 (_2!1532 lt!36801)) (buf!1045 (_2!1532 lt!36807)) lt!37512 lt!37521)))

(declare-fun d!7788 () Bool)

(assert (=> d!7788 e!17687))

(declare-fun res!22393 () Bool)

(assert (=> d!7788 (=> (not res!22393) (not e!17687))))

(assert (=> d!7788 (= res!22393 (isPrefixOf!0 (_1!1533 lt!37518) (_2!1533 lt!37518)))))

(declare-fun lt!37511 () BitStream!1274)

(assert (=> d!7788 (= lt!37518 (tuple2!2893 lt!37511 (_2!1532 lt!36801)))))

(declare-fun lt!37514 () Unit!2115)

(declare-fun lt!37515 () Unit!2115)

(assert (=> d!7788 (= lt!37514 lt!37515)))

(assert (=> d!7788 (isPrefixOf!0 lt!37511 (_2!1532 lt!36801))))

(assert (=> d!7788 (= lt!37515 (lemmaIsPrefixTransitive!0 lt!37511 (_2!1532 lt!36801) (_2!1532 lt!36801)))))

(declare-fun lt!37508 () Unit!2115)

(declare-fun lt!37517 () Unit!2115)

(assert (=> d!7788 (= lt!37508 lt!37517)))

(assert (=> d!7788 (isPrefixOf!0 lt!37511 (_2!1532 lt!36801))))

(assert (=> d!7788 (= lt!37517 (lemmaIsPrefixTransitive!0 lt!37511 (_2!1532 lt!36807) (_2!1532 lt!36801)))))

(declare-fun lt!37505 () Unit!2115)

(assert (=> d!7788 (= lt!37505 e!17686)))

(declare-fun c!1760 () Bool)

(assert (=> d!7788 (= c!1760 (not (= (size!721 (buf!1045 (_2!1532 lt!36807))) #b00000000000000000000000000000000)))))

(declare-fun lt!37502 () Unit!2115)

(declare-fun lt!37503 () Unit!2115)

(assert (=> d!7788 (= lt!37502 lt!37503)))

(assert (=> d!7788 (isPrefixOf!0 (_2!1532 lt!36801) (_2!1532 lt!36801))))

(assert (=> d!7788 (= lt!37503 (lemmaIsPrefixRefl!0 (_2!1532 lt!36801)))))

(declare-fun lt!37510 () Unit!2115)

(declare-fun lt!37519 () Unit!2115)

(assert (=> d!7788 (= lt!37510 lt!37519)))

(assert (=> d!7788 (= lt!37519 (lemmaIsPrefixRefl!0 (_2!1532 lt!36801)))))

(declare-fun lt!37513 () Unit!2115)

(declare-fun lt!37520 () Unit!2115)

(assert (=> d!7788 (= lt!37513 lt!37520)))

(assert (=> d!7788 (isPrefixOf!0 lt!37511 lt!37511)))

(assert (=> d!7788 (= lt!37520 (lemmaIsPrefixRefl!0 lt!37511))))

(declare-fun lt!37516 () Unit!2115)

(declare-fun lt!37507 () Unit!2115)

(assert (=> d!7788 (= lt!37516 lt!37507)))

(assert (=> d!7788 (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!36807))))

(assert (=> d!7788 (= lt!37507 (lemmaIsPrefixRefl!0 (_2!1532 lt!36807)))))

(assert (=> d!7788 (= lt!37511 (BitStream!1275 (buf!1045 (_2!1532 lt!36801)) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))))))

(assert (=> d!7788 (isPrefixOf!0 (_2!1532 lt!36807) (_2!1532 lt!36801))))

(assert (=> d!7788 (= (reader!0 (_2!1532 lt!36807) (_2!1532 lt!36801)) lt!37518)))

(declare-fun b!25998 () Bool)

(declare-fun res!22395 () Bool)

(assert (=> b!25998 (=> (not res!22395) (not e!17687))))

(assert (=> b!25998 (= res!22395 (isPrefixOf!0 (_2!1533 lt!37518) (_2!1532 lt!36801)))))

(declare-fun lt!37509 () (_ BitVec 64))

(declare-fun b!25999 () Bool)

(declare-fun lt!37504 () (_ BitVec 64))

(assert (=> b!25999 (= e!17687 (= (_1!1533 lt!37518) (withMovedBitIndex!0 (_2!1533 lt!37518) (bvsub lt!37509 lt!37504))))))

(assert (=> b!25999 (or (= (bvand lt!37509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37509 lt!37504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25999 (= lt!37504 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36801))) (currentByte!2364 (_2!1532 lt!36801)) (currentBit!2359 (_2!1532 lt!36801))))))

(assert (=> b!25999 (= lt!37509 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))))))

(assert (= (and d!7788 c!1760) b!25997))

(assert (= (and d!7788 (not c!1760)) b!25995))

(assert (= (and d!7788 res!22393) b!25996))

(assert (= (and b!25996 res!22394) b!25998))

(assert (= (and b!25998 res!22395) b!25999))

(declare-fun m!37271 () Bool)

(assert (=> b!25999 m!37271))

(assert (=> b!25999 m!36729))

(assert (=> b!25999 m!36705))

(declare-fun m!37273 () Bool)

(assert (=> b!25998 m!37273))

(declare-fun m!37275 () Bool)

(assert (=> d!7788 m!37275))

(declare-fun m!37277 () Bool)

(assert (=> d!7788 m!37277))

(declare-fun m!37279 () Bool)

(assert (=> d!7788 m!37279))

(declare-fun m!37281 () Bool)

(assert (=> d!7788 m!37281))

(declare-fun m!37283 () Bool)

(assert (=> d!7788 m!37283))

(assert (=> d!7788 m!37029))

(assert (=> d!7788 m!37021))

(declare-fun m!37285 () Bool)

(assert (=> d!7788 m!37285))

(declare-fun m!37287 () Bool)

(assert (=> d!7788 m!37287))

(declare-fun m!37289 () Bool)

(assert (=> d!7788 m!37289))

(assert (=> d!7788 m!36749))

(assert (=> b!25997 m!36705))

(declare-fun m!37291 () Bool)

(assert (=> b!25997 m!37291))

(declare-fun m!37293 () Bool)

(assert (=> b!25997 m!37293))

(declare-fun m!37295 () Bool)

(assert (=> b!25996 m!37295))

(assert (=> b!25723 d!7788))

(declare-fun d!7790 () Bool)

(assert (=> d!7790 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_1!1533 lt!36804)))) ((_ sign_extend 32) (currentByte!2364 (_1!1533 lt!36804))) ((_ sign_extend 32) (currentBit!2359 (_1!1533 lt!36804))) lt!36800) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 (_1!1533 lt!36804)))) ((_ sign_extend 32) (currentByte!2364 (_1!1533 lt!36804))) ((_ sign_extend 32) (currentBit!2359 (_1!1533 lt!36804)))) lt!36800))))

(declare-fun bs!2238 () Bool)

(assert (= bs!2238 d!7790))

(declare-fun m!37297 () Bool)

(assert (=> bs!2238 m!37297))

(assert (=> b!25723 d!7790))

(declare-fun d!7792 () Bool)

(assert (=> d!7792 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!37522 () Unit!2115)

(assert (=> d!7792 (= lt!37522 (choose!9 thiss!1379 (buf!1045 (_2!1532 lt!36801)) (bvsub to!314 i!635) (BitStream!1275 (buf!1045 (_2!1532 lt!36801)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379))))))

(assert (=> d!7792 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1045 (_2!1532 lt!36801)) (bvsub to!314 i!635)) lt!37522)))

(declare-fun bs!2239 () Bool)

(assert (= bs!2239 d!7792))

(assert (=> bs!2239 m!36737))

(declare-fun m!37299 () Bool)

(assert (=> bs!2239 m!37299))

(assert (=> b!25723 d!7792))

(declare-fun b!26000 () Bool)

(declare-fun e!17688 () Unit!2115)

(declare-fun Unit!2143 () Unit!2115)

(assert (=> b!26000 (= e!17688 Unit!2143)))

(declare-fun b!26001 () Bool)

(declare-fun res!22397 () Bool)

(declare-fun e!17689 () Bool)

(assert (=> b!26001 (=> (not res!22397) (not e!17689))))

(declare-fun lt!37539 () tuple2!2892)

(assert (=> b!26001 (= res!22397 (isPrefixOf!0 (_1!1533 lt!37539) thiss!1379))))

(declare-fun b!26002 () Bool)

(declare-fun lt!37527 () Unit!2115)

(assert (=> b!26002 (= e!17688 lt!37527)))

(declare-fun lt!37533 () (_ BitVec 64))

(assert (=> b!26002 (= lt!37533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!37542 () (_ BitVec 64))

(assert (=> b!26002 (= lt!37542 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(assert (=> b!26002 (= lt!37527 (arrayBitRangesEqSymmetric!0 (buf!1045 thiss!1379) (buf!1045 (_2!1532 lt!36801)) lt!37533 lt!37542))))

(assert (=> b!26002 (arrayBitRangesEq!0 (buf!1045 (_2!1532 lt!36801)) (buf!1045 thiss!1379) lt!37533 lt!37542)))

(declare-fun d!7794 () Bool)

(assert (=> d!7794 e!17689))

(declare-fun res!22396 () Bool)

(assert (=> d!7794 (=> (not res!22396) (not e!17689))))

(assert (=> d!7794 (= res!22396 (isPrefixOf!0 (_1!1533 lt!37539) (_2!1533 lt!37539)))))

(declare-fun lt!37532 () BitStream!1274)

(assert (=> d!7794 (= lt!37539 (tuple2!2893 lt!37532 (_2!1532 lt!36801)))))

(declare-fun lt!37535 () Unit!2115)

(declare-fun lt!37536 () Unit!2115)

(assert (=> d!7794 (= lt!37535 lt!37536)))

(assert (=> d!7794 (isPrefixOf!0 lt!37532 (_2!1532 lt!36801))))

(assert (=> d!7794 (= lt!37536 (lemmaIsPrefixTransitive!0 lt!37532 (_2!1532 lt!36801) (_2!1532 lt!36801)))))

(declare-fun lt!37529 () Unit!2115)

(declare-fun lt!37538 () Unit!2115)

(assert (=> d!7794 (= lt!37529 lt!37538)))

(assert (=> d!7794 (isPrefixOf!0 lt!37532 (_2!1532 lt!36801))))

(assert (=> d!7794 (= lt!37538 (lemmaIsPrefixTransitive!0 lt!37532 thiss!1379 (_2!1532 lt!36801)))))

(declare-fun lt!37526 () Unit!2115)

(assert (=> d!7794 (= lt!37526 e!17688)))

(declare-fun c!1761 () Bool)

(assert (=> d!7794 (= c!1761 (not (= (size!721 (buf!1045 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!37523 () Unit!2115)

(declare-fun lt!37524 () Unit!2115)

(assert (=> d!7794 (= lt!37523 lt!37524)))

(assert (=> d!7794 (isPrefixOf!0 (_2!1532 lt!36801) (_2!1532 lt!36801))))

(assert (=> d!7794 (= lt!37524 (lemmaIsPrefixRefl!0 (_2!1532 lt!36801)))))

(declare-fun lt!37531 () Unit!2115)

(declare-fun lt!37540 () Unit!2115)

(assert (=> d!7794 (= lt!37531 lt!37540)))

(assert (=> d!7794 (= lt!37540 (lemmaIsPrefixRefl!0 (_2!1532 lt!36801)))))

(declare-fun lt!37534 () Unit!2115)

(declare-fun lt!37541 () Unit!2115)

(assert (=> d!7794 (= lt!37534 lt!37541)))

(assert (=> d!7794 (isPrefixOf!0 lt!37532 lt!37532)))

(assert (=> d!7794 (= lt!37541 (lemmaIsPrefixRefl!0 lt!37532))))

(declare-fun lt!37537 () Unit!2115)

(declare-fun lt!37528 () Unit!2115)

(assert (=> d!7794 (= lt!37537 lt!37528)))

(assert (=> d!7794 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7794 (= lt!37528 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7794 (= lt!37532 (BitStream!1275 (buf!1045 (_2!1532 lt!36801)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(assert (=> d!7794 (isPrefixOf!0 thiss!1379 (_2!1532 lt!36801))))

(assert (=> d!7794 (= (reader!0 thiss!1379 (_2!1532 lt!36801)) lt!37539)))

(declare-fun b!26003 () Bool)

(declare-fun res!22398 () Bool)

(assert (=> b!26003 (=> (not res!22398) (not e!17689))))

(assert (=> b!26003 (= res!22398 (isPrefixOf!0 (_2!1533 lt!37539) (_2!1532 lt!36801)))))

(declare-fun lt!37530 () (_ BitVec 64))

(declare-fun b!26004 () Bool)

(declare-fun lt!37525 () (_ BitVec 64))

(assert (=> b!26004 (= e!17689 (= (_1!1533 lt!37539) (withMovedBitIndex!0 (_2!1533 lt!37539) (bvsub lt!37530 lt!37525))))))

(assert (=> b!26004 (or (= (bvand lt!37530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37530 lt!37525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!26004 (= lt!37525 (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36801))) (currentByte!2364 (_2!1532 lt!36801)) (currentBit!2359 (_2!1532 lt!36801))))))

(assert (=> b!26004 (= lt!37530 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(assert (= (and d!7794 c!1761) b!26002))

(assert (= (and d!7794 (not c!1761)) b!26000))

(assert (= (and d!7794 res!22396) b!26001))

(assert (= (and b!26001 res!22397) b!26003))

(assert (= (and b!26003 res!22398) b!26004))

(declare-fun m!37301 () Bool)

(assert (=> b!26004 m!37301))

(assert (=> b!26004 m!36729))

(assert (=> b!26004 m!36767))

(declare-fun m!37303 () Bool)

(assert (=> b!26003 m!37303))

(declare-fun m!37305 () Bool)

(assert (=> d!7794 m!37305))

(declare-fun m!37307 () Bool)

(assert (=> d!7794 m!37307))

(declare-fun m!37309 () Bool)

(assert (=> d!7794 m!37309))

(assert (=> d!7794 m!37281))

(declare-fun m!37311 () Bool)

(assert (=> d!7794 m!37311))

(assert (=> d!7794 m!36763))

(assert (=> d!7794 m!36765))

(declare-fun m!37313 () Bool)

(assert (=> d!7794 m!37313))

(declare-fun m!37315 () Bool)

(assert (=> d!7794 m!37315))

(assert (=> d!7794 m!37289))

(assert (=> d!7794 m!36751))

(assert (=> b!26002 m!36767))

(declare-fun m!37317 () Bool)

(assert (=> b!26002 m!37317))

(declare-fun m!37319 () Bool)

(assert (=> b!26002 m!37319))

(declare-fun m!37321 () Bool)

(assert (=> b!26001 m!37321))

(assert (=> b!25723 d!7794))

(declare-fun b!26016 () Bool)

(declare-fun e!17695 () Bool)

(declare-fun lt!37551 () List!338)

(declare-fun length!64 (List!338) Int)

(assert (=> b!26016 (= e!17695 (> (length!64 lt!37551) 0))))

(declare-fun b!26015 () Bool)

(declare-fun isEmpty!69 (List!338) Bool)

(assert (=> b!26015 (= e!17695 (isEmpty!69 lt!37551))))

(declare-fun d!7796 () Bool)

(assert (=> d!7796 e!17695))

(declare-fun c!1767 () Bool)

(assert (=> d!7796 (= c!1767 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!2912 0))(
  ( (tuple2!2913 (_1!1543 List!338) (_2!1543 BitStream!1274)) )
))
(declare-fun e!17694 () tuple2!2912)

(assert (=> d!7796 (= lt!37551 (_1!1543 e!17694))))

(declare-fun c!1766 () Bool)

(assert (=> d!7796 (= c!1766 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7796 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7796 (= (bitStreamReadBitsIntoList!0 (_2!1532 lt!36801) (_1!1533 lt!36806) (bvsub to!314 i!635)) lt!37551)))

(declare-fun lt!37549 () (_ BitVec 64))

(declare-datatypes ((tuple2!2914 0))(
  ( (tuple2!2915 (_1!1544 Bool) (_2!1544 BitStream!1274)) )
))
(declare-fun lt!37550 () tuple2!2914)

(declare-fun b!26014 () Bool)

(assert (=> b!26014 (= e!17694 (tuple2!2913 (Cons!334 (_1!1544 lt!37550) (bitStreamReadBitsIntoList!0 (_2!1532 lt!36801) (_2!1544 lt!37550) (bvsub (bvsub to!314 i!635) lt!37549))) (_2!1544 lt!37550)))))

(declare-fun readBit!0 (BitStream!1274) tuple2!2914)

(assert (=> b!26014 (= lt!37550 (readBit!0 (_1!1533 lt!36806)))))

(assert (=> b!26014 (= lt!37549 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!26013 () Bool)

(assert (=> b!26013 (= e!17694 (tuple2!2913 Nil!335 (_1!1533 lt!36806)))))

(assert (= (and d!7796 c!1766) b!26013))

(assert (= (and d!7796 (not c!1766)) b!26014))

(assert (= (and d!7796 c!1767) b!26015))

(assert (= (and d!7796 (not c!1767)) b!26016))

(declare-fun m!37323 () Bool)

(assert (=> b!26016 m!37323))

(declare-fun m!37325 () Bool)

(assert (=> b!26015 m!37325))

(declare-fun m!37327 () Bool)

(assert (=> b!26014 m!37327))

(declare-fun m!37329 () Bool)

(assert (=> b!26014 m!37329))

(assert (=> b!25723 d!7796))

(declare-fun d!7798 () Bool)

(assert (=> d!7798 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!36800) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807)))) lt!36800))))

(declare-fun bs!2240 () Bool)

(assert (= bs!2240 d!7798))

(declare-fun m!37331 () Bool)

(assert (=> bs!2240 m!37331))

(assert (=> b!25723 d!7798))

(declare-fun d!7800 () Bool)

(assert (=> d!7800 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!36800)))

(declare-fun lt!37552 () Unit!2115)

(assert (=> d!7800 (= lt!37552 (choose!9 (_2!1532 lt!36807) (buf!1045 (_2!1532 lt!36801)) lt!36800 (BitStream!1275 (buf!1045 (_2!1532 lt!36801)) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807)))))))

(assert (=> d!7800 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1532 lt!36807) (buf!1045 (_2!1532 lt!36801)) lt!36800) lt!37552)))

(declare-fun bs!2241 () Bool)

(assert (= bs!2241 d!7800))

(assert (=> bs!2241 m!36731))

(declare-fun m!37333 () Bool)

(assert (=> bs!2241 m!37333))

(assert (=> b!25723 d!7800))

(declare-fun d!7802 () Bool)

(assert (=> d!7802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2242 () Bool)

(assert (= bs!2242 d!7802))

(declare-fun m!37335 () Bool)

(assert (=> bs!2242 m!37335))

(assert (=> b!25723 d!7802))

(declare-fun d!7804 () Bool)

(assert (=> d!7804 (= (invariant!0 (currentBit!2359 (_2!1532 lt!36807)) (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36807)))) (and (bvsge (currentBit!2359 (_2!1532 lt!36807)) #b00000000000000000000000000000000) (bvslt (currentBit!2359 (_2!1532 lt!36807)) #b00000000000000000000000000001000) (bvsge (currentByte!2364 (_2!1532 lt!36807)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36807)))) (and (= (currentBit!2359 (_2!1532 lt!36807)) #b00000000000000000000000000000000) (= (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36807))))))))))

(assert (=> b!25714 d!7804))

(declare-fun d!7806 () Bool)

(assert (=> d!7806 (= (array_inv!690 (buf!1045 thiss!1379)) (bvsge (size!721 (buf!1045 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!25724 d!7806))

(declare-fun d!7808 () Bool)

(assert (=> d!7808 (= (head!175 (byteArrayBitContentToList!0 (_2!1532 lt!36807) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!453 (byteArrayBitContentToList!0 (_2!1532 lt!36807) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25726 d!7808))

(declare-fun d!7810 () Bool)

(declare-fun c!1770 () Bool)

(assert (=> d!7810 (= c!1770 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!17698 () List!338)

(assert (=> d!7810 (= (byteArrayBitContentToList!0 (_2!1532 lt!36807) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!17698)))

(declare-fun b!26021 () Bool)

(assert (=> b!26021 (= e!17698 Nil!335)))

(declare-fun b!26022 () Bool)

(assert (=> b!26022 (= e!17698 (Cons!334 (not (= (bvand ((_ sign_extend 24) (select (arr!1180 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1532 lt!36807) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7810 c!1770) b!26021))

(assert (= (and d!7810 (not c!1770)) b!26022))

(assert (=> b!26022 m!36715))

(declare-fun m!37337 () Bool)

(assert (=> b!26022 m!37337))

(declare-fun m!37339 () Bool)

(assert (=> b!26022 m!37339))

(assert (=> b!25726 d!7810))

(declare-fun d!7812 () Bool)

(assert (=> d!7812 (= (head!175 (bitStreamReadBitsIntoList!0 (_2!1532 lt!36807) (_1!1533 lt!36808) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!453 (bitStreamReadBitsIntoList!0 (_2!1532 lt!36807) (_1!1533 lt!36808) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25726 d!7812))

(declare-fun b!26026 () Bool)

(declare-fun e!17700 () Bool)

(declare-fun lt!37555 () List!338)

(assert (=> b!26026 (= e!17700 (> (length!64 lt!37555) 0))))

(declare-fun b!26025 () Bool)

(assert (=> b!26025 (= e!17700 (isEmpty!69 lt!37555))))

(declare-fun d!7814 () Bool)

(assert (=> d!7814 e!17700))

(declare-fun c!1772 () Bool)

(assert (=> d!7814 (= c!1772 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!17699 () tuple2!2912)

(assert (=> d!7814 (= lt!37555 (_1!1543 e!17699))))

(declare-fun c!1771 () Bool)

(assert (=> d!7814 (= c!1771 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7814 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7814 (= (bitStreamReadBitsIntoList!0 (_2!1532 lt!36807) (_1!1533 lt!36808) #b0000000000000000000000000000000000000000000000000000000000000001) lt!37555)))

(declare-fun lt!37554 () tuple2!2914)

(declare-fun lt!37553 () (_ BitVec 64))

(declare-fun b!26024 () Bool)

(assert (=> b!26024 (= e!17699 (tuple2!2913 (Cons!334 (_1!1544 lt!37554) (bitStreamReadBitsIntoList!0 (_2!1532 lt!36807) (_2!1544 lt!37554) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!37553))) (_2!1544 lt!37554)))))

(assert (=> b!26024 (= lt!37554 (readBit!0 (_1!1533 lt!36808)))))

(assert (=> b!26024 (= lt!37553 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!26023 () Bool)

(assert (=> b!26023 (= e!17699 (tuple2!2913 Nil!335 (_1!1533 lt!36808)))))

(assert (= (and d!7814 c!1771) b!26023))

(assert (= (and d!7814 (not c!1771)) b!26024))

(assert (= (and d!7814 c!1772) b!26025))

(assert (= (and d!7814 (not c!1772)) b!26026))

(declare-fun m!37341 () Bool)

(assert (=> b!26026 m!37341))

(declare-fun m!37343 () Bool)

(assert (=> b!26025 m!37343))

(declare-fun m!37345 () Bool)

(assert (=> b!26024 m!37345))

(declare-fun m!37347 () Bool)

(assert (=> b!26024 m!37347))

(assert (=> b!25726 d!7814))

(declare-fun d!7816 () Bool)

(declare-fun res!22400 () Bool)

(declare-fun e!17701 () Bool)

(assert (=> d!7816 (=> (not res!22400) (not e!17701))))

(assert (=> d!7816 (= res!22400 (= (size!721 (buf!1045 thiss!1379)) (size!721 (buf!1045 (_2!1532 lt!36807)))))))

(assert (=> d!7816 (= (isPrefixOf!0 thiss!1379 (_2!1532 lt!36807)) e!17701)))

(declare-fun b!26027 () Bool)

(declare-fun res!22399 () Bool)

(assert (=> b!26027 (=> (not res!22399) (not e!17701))))

(assert (=> b!26027 (= res!22399 (bvsle (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)) (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807)))))))

(declare-fun b!26028 () Bool)

(declare-fun e!17702 () Bool)

(assert (=> b!26028 (= e!17701 e!17702)))

(declare-fun res!22401 () Bool)

(assert (=> b!26028 (=> res!22401 e!17702)))

(assert (=> b!26028 (= res!22401 (= (size!721 (buf!1045 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!26029 () Bool)

(assert (=> b!26029 (= e!17702 (arrayBitRangesEq!0 (buf!1045 thiss!1379) (buf!1045 (_2!1532 lt!36807)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379))))))

(assert (= (and d!7816 res!22400) b!26027))

(assert (= (and b!26027 res!22399) b!26028))

(assert (= (and b!26028 (not res!22401)) b!26029))

(assert (=> b!26027 m!36767))

(assert (=> b!26027 m!36705))

(assert (=> b!26029 m!36767))

(assert (=> b!26029 m!36767))

(declare-fun m!37349 () Bool)

(assert (=> b!26029 m!37349))

(assert (=> b!25715 d!7816))

(declare-fun d!7818 () Bool)

(assert (=> d!7818 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) lt!36800) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807)))) lt!36800))))

(declare-fun bs!2243 () Bool)

(assert (= bs!2243 d!7818))

(declare-fun m!37351 () Bool)

(assert (=> bs!2243 m!37351))

(assert (=> b!25715 d!7818))

(declare-fun d!7820 () Bool)

(declare-fun e!17705 () Bool)

(assert (=> d!7820 e!17705))

(declare-fun res!22404 () Bool)

(assert (=> d!7820 (=> (not res!22404) (not e!17705))))

(assert (=> d!7820 (= res!22404 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!37558 () Unit!2115)

(declare-fun choose!27 (BitStream!1274 BitStream!1274 (_ BitVec 64) (_ BitVec 64)) Unit!2115)

(assert (=> d!7820 (= lt!37558 (choose!27 thiss!1379 (_2!1532 lt!36807) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7820 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7820 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1532 lt!36807) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!37558)))

(declare-fun b!26032 () Bool)

(assert (=> b!26032 (= e!17705 (validate_offset_bits!1 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7820 res!22404) b!26032))

(declare-fun m!37353 () Bool)

(assert (=> d!7820 m!37353))

(declare-fun m!37355 () Bool)

(assert (=> b!26032 m!37355))

(assert (=> b!25715 d!7820))

(declare-fun b!26066 () Bool)

(declare-fun e!17722 () Bool)

(declare-datatypes ((tuple2!2916 0))(
  ( (tuple2!2917 (_1!1545 BitStream!1274) (_2!1545 Bool)) )
))
(declare-fun lt!37675 () tuple2!2916)

(declare-fun lt!37676 () tuple2!2890)

(assert (=> b!26066 (= e!17722 (= (bitIndex!0 (size!721 (buf!1045 (_1!1545 lt!37675))) (currentByte!2364 (_1!1545 lt!37675)) (currentBit!2359 (_1!1545 lt!37675))) (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37676))) (currentByte!2364 (_2!1532 lt!37676)) (currentBit!2359 (_2!1532 lt!37676)))))))

(declare-fun b!26067 () Bool)

(declare-fun res!22440 () Bool)

(declare-fun e!17721 () Bool)

(assert (=> b!26067 (=> (not res!22440) (not e!17721))))

(declare-fun lt!37674 () (_ BitVec 64))

(declare-fun lt!37673 () (_ BitVec 64))

(declare-fun lt!37672 () tuple2!2890)

(assert (=> b!26067 (= res!22440 (= (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37672))) (currentByte!2364 (_2!1532 lt!37672)) (currentBit!2359 (_2!1532 lt!37672))) (bvadd lt!37674 lt!37673)))))

(assert (=> b!26067 (or (not (= (bvand lt!37674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37673 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!37674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!37674 lt!37673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!26067 (= lt!37673 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!26067 (= lt!37674 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)))))

(declare-fun b!26068 () Bool)

(declare-fun e!17720 () Bool)

(declare-fun lt!37681 () tuple2!2916)

(assert (=> b!26068 (= e!17720 (= (bitIndex!0 (size!721 (buf!1045 (_1!1545 lt!37681))) (currentByte!2364 (_1!1545 lt!37681)) (currentBit!2359 (_1!1545 lt!37681))) (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37672))) (currentByte!2364 (_2!1532 lt!37672)) (currentBit!2359 (_2!1532 lt!37672)))))))

(declare-fun b!26069 () Bool)

(assert (=> b!26069 (= e!17721 e!17720)))

(declare-fun res!22435 () Bool)

(assert (=> b!26069 (=> (not res!22435) (not e!17720))))

(declare-fun lt!37678 () (_ BitVec 8))

(assert (=> b!26069 (= res!22435 (and (= (_2!1545 lt!37681) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1180 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!37678)) #b00000000000000000000000000000000))) (= (_1!1545 lt!37681) (_2!1532 lt!37672))))))

(declare-fun lt!37680 () tuple2!2906)

(declare-fun lt!37682 () BitStream!1274)

(assert (=> b!26069 (= lt!37680 (readBits!0 lt!37682 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1274) tuple2!2916)

(assert (=> b!26069 (= lt!37681 (readBitPure!0 lt!37682))))

(declare-fun readerFrom!0 (BitStream!1274 (_ BitVec 32) (_ BitVec 32)) BitStream!1274)

(assert (=> b!26069 (= lt!37682 (readerFrom!0 (_2!1532 lt!37672) (currentBit!2359 thiss!1379) (currentByte!2364 thiss!1379)))))

(declare-fun b!26070 () Bool)

(declare-fun e!17723 () Bool)

(assert (=> b!26070 (= e!17723 e!17722)))

(declare-fun res!22433 () Bool)

(assert (=> b!26070 (=> (not res!22433) (not e!17722))))

(declare-fun lt!37677 () Bool)

(assert (=> b!26070 (= res!22433 (and (= (_2!1545 lt!37675) lt!37677) (= (_1!1545 lt!37675) (_2!1532 lt!37676))))))

(assert (=> b!26070 (= lt!37675 (readBitPure!0 (readerFrom!0 (_2!1532 lt!37676) (currentBit!2359 thiss!1379) (currentByte!2364 thiss!1379))))))

(declare-fun b!26071 () Bool)

(declare-fun res!22437 () Bool)

(assert (=> b!26071 (=> (not res!22437) (not e!17721))))

(assert (=> b!26071 (= res!22437 (isPrefixOf!0 thiss!1379 (_2!1532 lt!37672)))))

(declare-fun d!7822 () Bool)

(assert (=> d!7822 e!17721))

(declare-fun res!22434 () Bool)

(assert (=> d!7822 (=> (not res!22434) (not e!17721))))

(assert (=> d!7822 (= res!22434 (= (size!721 (buf!1045 (_2!1532 lt!37672))) (size!721 (buf!1045 thiss!1379))))))

(declare-fun lt!37671 () array!1674)

(assert (=> d!7822 (= lt!37678 (select (arr!1180 lt!37671) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7822 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!721 lt!37671)))))

(assert (=> d!7822 (= lt!37671 (array!1675 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!37679 () tuple2!2890)

(assert (=> d!7822 (= lt!37672 (tuple2!2891 (_1!1532 lt!37679) (_2!1532 lt!37679)))))

(assert (=> d!7822 (= lt!37679 lt!37676)))

(assert (=> d!7822 e!17723))

(declare-fun res!22439 () Bool)

(assert (=> d!7822 (=> (not res!22439) (not e!17723))))

(assert (=> d!7822 (= res!22439 (= (size!721 (buf!1045 thiss!1379)) (size!721 (buf!1045 (_2!1532 lt!37676)))))))

(declare-fun appendBit!0 (BitStream!1274 Bool) tuple2!2890)

(assert (=> d!7822 (= lt!37676 (appendBit!0 thiss!1379 lt!37677))))

(assert (=> d!7822 (= lt!37677 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1180 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7822 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7822 (= (appendBitFromByte!0 thiss!1379 (select (arr!1180 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!37672)))

(declare-fun b!26072 () Bool)

(declare-fun res!22438 () Bool)

(assert (=> b!26072 (=> (not res!22438) (not e!17723))))

(assert (=> b!26072 (= res!22438 (isPrefixOf!0 thiss!1379 (_2!1532 lt!37676)))))

(declare-fun b!26073 () Bool)

(declare-fun res!22436 () Bool)

(assert (=> b!26073 (=> (not res!22436) (not e!17723))))

(assert (=> b!26073 (= res!22436 (= (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!37676))) (currentByte!2364 (_2!1532 lt!37676)) (currentBit!2359 (_2!1532 lt!37676))) (bvadd (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7822 res!22439) b!26073))

(assert (= (and b!26073 res!22436) b!26072))

(assert (= (and b!26072 res!22438) b!26070))

(assert (= (and b!26070 res!22433) b!26066))

(assert (= (and d!7822 res!22434) b!26067))

(assert (= (and b!26067 res!22440) b!26071))

(assert (= (and b!26071 res!22437) b!26069))

(assert (= (and b!26069 res!22435) b!26068))

(declare-fun m!37357 () Bool)

(assert (=> b!26068 m!37357))

(declare-fun m!37359 () Bool)

(assert (=> b!26068 m!37359))

(declare-fun m!37361 () Bool)

(assert (=> b!26069 m!37361))

(declare-fun m!37363 () Bool)

(assert (=> b!26069 m!37363))

(declare-fun m!37365 () Bool)

(assert (=> b!26069 m!37365))

(assert (=> b!26067 m!37359))

(assert (=> b!26067 m!36767))

(declare-fun m!37367 () Bool)

(assert (=> d!7822 m!37367))

(declare-fun m!37369 () Bool)

(assert (=> d!7822 m!37369))

(assert (=> d!7822 m!37337))

(declare-fun m!37371 () Bool)

(assert (=> b!26072 m!37371))

(declare-fun m!37373 () Bool)

(assert (=> b!26073 m!37373))

(assert (=> b!26073 m!36767))

(declare-fun m!37375 () Bool)

(assert (=> b!26066 m!37375))

(assert (=> b!26066 m!37373))

(declare-fun m!37377 () Bool)

(assert (=> b!26071 m!37377))

(declare-fun m!37379 () Bool)

(assert (=> b!26070 m!37379))

(assert (=> b!26070 m!37379))

(declare-fun m!37381 () Bool)

(assert (=> b!26070 m!37381))

(assert (=> b!25715 d!7822))

(declare-fun d!7824 () Bool)

(declare-fun e!17729 () Bool)

(assert (=> d!7824 e!17729))

(declare-fun res!22452 () Bool)

(assert (=> d!7824 (=> (not res!22452) (not e!17729))))

(declare-fun lt!37739 () (_ BitVec 64))

(declare-fun lt!37743 () (_ BitVec 64))

(declare-fun lt!37744 () (_ BitVec 64))

(assert (=> d!7824 (= res!22452 (= lt!37739 (bvsub lt!37744 lt!37743)))))

(assert (=> d!7824 (or (= (bvand lt!37744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37744 lt!37743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7824 (= lt!37743 (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807)))))))

(declare-fun lt!37742 () (_ BitVec 64))

(declare-fun lt!37740 () (_ BitVec 64))

(assert (=> d!7824 (= lt!37744 (bvmul lt!37742 lt!37740))))

(assert (=> d!7824 (or (= lt!37742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!37740 (bvsdiv (bvmul lt!37742 lt!37740) lt!37742)))))

(assert (=> d!7824 (= lt!37740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7824 (= lt!37742 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))))))

(assert (=> d!7824 (= lt!37739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36807))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36807)))))))

(assert (=> d!7824 (invariant!0 (currentBit!2359 (_2!1532 lt!36807)) (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36807))))))

(assert (=> d!7824 (= (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36807))) (currentByte!2364 (_2!1532 lt!36807)) (currentBit!2359 (_2!1532 lt!36807))) lt!37739)))

(declare-fun b!26086 () Bool)

(declare-fun res!22451 () Bool)

(assert (=> b!26086 (=> (not res!22451) (not e!17729))))

(assert (=> b!26086 (= res!22451 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!37739))))

(declare-fun b!26087 () Bool)

(declare-fun lt!37741 () (_ BitVec 64))

(assert (=> b!26087 (= e!17729 (bvsle lt!37739 (bvmul lt!37741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!26087 (or (= lt!37741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!37741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!37741)))))

(assert (=> b!26087 (= lt!37741 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36807)))))))

(assert (= (and d!7824 res!22452) b!26086))

(assert (= (and b!26086 res!22451) b!26087))

(assert (=> d!7824 m!37351))

(assert (=> d!7824 m!36711))

(assert (=> b!25717 d!7824))

(declare-fun d!7826 () Bool)

(assert (=> d!7826 (= (array_inv!690 srcBuffer!2) (bvsge (size!721 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5844 d!7826))

(declare-fun d!7828 () Bool)

(assert (=> d!7828 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2359 thiss!1379) (currentByte!2364 thiss!1379) (size!721 (buf!1045 thiss!1379))))))

(declare-fun bs!2244 () Bool)

(assert (= bs!2244 d!7828))

(declare-fun m!37441 () Bool)

(assert (=> bs!2244 m!37441))

(assert (=> start!5844 d!7828))

(declare-fun d!7830 () Bool)

(assert (=> d!7830 (= (invariant!0 (currentBit!2359 (_2!1532 lt!36807)) (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36801)))) (and (bvsge (currentBit!2359 (_2!1532 lt!36807)) #b00000000000000000000000000000000) (bvslt (currentBit!2359 (_2!1532 lt!36807)) #b00000000000000000000000000001000) (bvsge (currentByte!2364 (_2!1532 lt!36807)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36801)))) (and (= (currentBit!2359 (_2!1532 lt!36807)) #b00000000000000000000000000000000) (= (currentByte!2364 (_2!1532 lt!36807)) (size!721 (buf!1045 (_2!1532 lt!36801))))))))))

(assert (=> b!25716 d!7830))

(declare-fun d!7832 () Bool)

(declare-fun res!22454 () Bool)

(declare-fun e!17730 () Bool)

(assert (=> d!7832 (=> (not res!22454) (not e!17730))))

(assert (=> d!7832 (= res!22454 (= (size!721 (buf!1045 thiss!1379)) (size!721 (buf!1045 thiss!1379))))))

(assert (=> d!7832 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!17730)))

(declare-fun b!26088 () Bool)

(declare-fun res!22453 () Bool)

(assert (=> b!26088 (=> (not res!22453) (not e!17730))))

(assert (=> b!26088 (= res!22453 (bvsle (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)) (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379))))))

(declare-fun b!26089 () Bool)

(declare-fun e!17731 () Bool)

(assert (=> b!26089 (= e!17730 e!17731)))

(declare-fun res!22455 () Bool)

(assert (=> b!26089 (=> res!22455 e!17731)))

(assert (=> b!26089 (= res!22455 (= (size!721 (buf!1045 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!26090 () Bool)

(assert (=> b!26090 (= e!17731 (arrayBitRangesEq!0 (buf!1045 thiss!1379) (buf!1045 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379))))))

(assert (= (and d!7832 res!22454) b!26088))

(assert (= (and b!26088 res!22453) b!26089))

(assert (= (and b!26089 (not res!22455)) b!26090))

(assert (=> b!26088 m!36767))

(assert (=> b!26088 m!36767))

(assert (=> b!26090 m!36767))

(assert (=> b!26090 m!36767))

(declare-fun m!37471 () Bool)

(assert (=> b!26090 m!37471))

(assert (=> b!25718 d!7832))

(declare-fun d!7834 () Bool)

(assert (=> d!7834 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!37767 () Unit!2115)

(declare-fun choose!11 (BitStream!1274) Unit!2115)

(assert (=> d!7834 (= lt!37767 (choose!11 thiss!1379))))

(assert (=> d!7834 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!37767)))

(declare-fun bs!2246 () Bool)

(assert (= bs!2246 d!7834))

(assert (=> bs!2246 m!36763))

(declare-fun m!37477 () Bool)

(assert (=> bs!2246 m!37477))

(assert (=> b!25718 d!7834))

(declare-fun d!7842 () Bool)

(declare-fun e!17738 () Bool)

(assert (=> d!7842 e!17738))

(declare-fun res!22466 () Bool)

(assert (=> d!7842 (=> (not res!22466) (not e!17738))))

(declare-fun lt!37773 () (_ BitVec 64))

(declare-fun lt!37768 () (_ BitVec 64))

(declare-fun lt!37772 () (_ BitVec 64))

(assert (=> d!7842 (= res!22466 (= lt!37768 (bvsub lt!37773 lt!37772)))))

(assert (=> d!7842 (or (= (bvand lt!37773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37773 lt!37772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7842 (= lt!37772 (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 thiss!1379))) ((_ sign_extend 32) (currentByte!2364 thiss!1379)) ((_ sign_extend 32) (currentBit!2359 thiss!1379))))))

(declare-fun lt!37771 () (_ BitVec 64))

(declare-fun lt!37769 () (_ BitVec 64))

(assert (=> d!7842 (= lt!37773 (bvmul lt!37771 lt!37769))))

(assert (=> d!7842 (or (= lt!37771 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!37769 (bvsdiv (bvmul lt!37771 lt!37769) lt!37771)))))

(assert (=> d!7842 (= lt!37769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7842 (= lt!37771 ((_ sign_extend 32) (size!721 (buf!1045 thiss!1379))))))

(assert (=> d!7842 (= lt!37768 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2364 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2359 thiss!1379))))))

(assert (=> d!7842 (invariant!0 (currentBit!2359 thiss!1379) (currentByte!2364 thiss!1379) (size!721 (buf!1045 thiss!1379)))))

(assert (=> d!7842 (= (bitIndex!0 (size!721 (buf!1045 thiss!1379)) (currentByte!2364 thiss!1379) (currentBit!2359 thiss!1379)) lt!37768)))

(declare-fun b!26102 () Bool)

(declare-fun res!22465 () Bool)

(assert (=> b!26102 (=> (not res!22465) (not e!17738))))

(assert (=> b!26102 (= res!22465 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!37768))))

(declare-fun b!26103 () Bool)

(declare-fun lt!37770 () (_ BitVec 64))

(assert (=> b!26103 (= e!17738 (bvsle lt!37768 (bvmul lt!37770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!26103 (or (= lt!37770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!37770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!37770)))))

(assert (=> b!26103 (= lt!37770 ((_ sign_extend 32) (size!721 (buf!1045 thiss!1379))))))

(assert (= (and d!7842 res!22466) b!26102))

(assert (= (and b!26102 res!22465) b!26103))

(assert (=> d!7842 m!37009))

(assert (=> d!7842 m!37441))

(assert (=> b!25718 d!7842))

(declare-fun d!7844 () Bool)

(declare-fun e!17739 () Bool)

(assert (=> d!7844 e!17739))

(declare-fun res!22468 () Bool)

(assert (=> d!7844 (=> (not res!22468) (not e!17739))))

(declare-fun lt!37774 () (_ BitVec 64))

(declare-fun lt!37779 () (_ BitVec 64))

(declare-fun lt!37778 () (_ BitVec 64))

(assert (=> d!7844 (= res!22468 (= lt!37774 (bvsub lt!37779 lt!37778)))))

(assert (=> d!7844 (or (= (bvand lt!37779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!37778 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!37779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!37779 lt!37778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7844 (= lt!37778 (remainingBits!0 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))) ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36801))) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36801)))))))

(declare-fun lt!37777 () (_ BitVec 64))

(declare-fun lt!37775 () (_ BitVec 64))

(assert (=> d!7844 (= lt!37779 (bvmul lt!37777 lt!37775))))

(assert (=> d!7844 (or (= lt!37777 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!37775 (bvsdiv (bvmul lt!37777 lt!37775) lt!37777)))))

(assert (=> d!7844 (= lt!37775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7844 (= lt!37777 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))))))

(assert (=> d!7844 (= lt!37774 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2364 (_2!1532 lt!36801))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2359 (_2!1532 lt!36801)))))))

(assert (=> d!7844 (invariant!0 (currentBit!2359 (_2!1532 lt!36801)) (currentByte!2364 (_2!1532 lt!36801)) (size!721 (buf!1045 (_2!1532 lt!36801))))))

(assert (=> d!7844 (= (bitIndex!0 (size!721 (buf!1045 (_2!1532 lt!36801))) (currentByte!2364 (_2!1532 lt!36801)) (currentBit!2359 (_2!1532 lt!36801))) lt!37774)))

(declare-fun b!26104 () Bool)

(declare-fun res!22467 () Bool)

(assert (=> b!26104 (=> (not res!22467) (not e!17739))))

(assert (=> b!26104 (= res!22467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!37774))))

(declare-fun b!26105 () Bool)

(declare-fun lt!37776 () (_ BitVec 64))

(assert (=> b!26105 (= e!17739 (bvsle lt!37774 (bvmul lt!37776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!26105 (or (= lt!37776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!37776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!37776)))))

(assert (=> b!26105 (= lt!37776 ((_ sign_extend 32) (size!721 (buf!1045 (_2!1532 lt!36801)))))))

(assert (= (and d!7844 res!22468) b!26104))

(assert (= (and b!26104 res!22467) b!26105))

(declare-fun m!37501 () Bool)

(assert (=> d!7844 m!37501))

(assert (=> d!7844 m!36761))

(assert (=> b!25719 d!7844))

(push 1)

(assert (not b!25989))

(assert (not b!25992))

(assert (not b!25978))

(assert (not d!7740))

(assert (not d!7748))

(assert (not d!7822))

(assert (not d!7780))

(assert (not d!7844))

(assert (not b!26025))

(assert (not b!26067))

(assert (not b!26066))

(assert (not b!26014))

(assert (not d!7790))

(assert (not d!7788))

(assert (not b!26001))

(assert (not b!26029))

(assert (not b!25888))

(assert (not d!7798))

(assert (not b!26016))

(assert (not b!25887))

(assert (not b!25980))

(assert (not d!7834))

(assert (not b!26072))

(assert (not b!26022))

(assert (not bm!349))

(assert (not b!25996))

(assert (not b!26069))

(assert (not d!7824))

(assert (not b!26004))

(assert (not d!7818))

(assert (not d!7744))

(assert (not b!26032))

(assert (not b!26015))

(assert (not b!25979))

(assert (not b!26026))

(assert (not d!7820))

(assert (not d!7800))

(assert (not b!25994))

(assert (not b!25981))

(assert (not b!26002))

(assert (not b!26090))

(assert (not b!26027))

(assert (not d!7802))

(assert (not b!25998))

(assert (not b!26071))

(assert (not b!25997))

(assert (not b!25999))

(assert (not b!26068))

(assert (not b!26024))

(assert (not b!25977))

(assert (not b!25991))

(assert (not b!25886))

(assert (not b!26003))

(assert (not d!7828))

(assert (not d!7792))

(assert (not b!26073))

(assert (not b!25885))

(assert (not b!26070))

(assert (not b!26088))

(assert (not d!7746))

(assert (not d!7742))

(assert (not d!7794))

(assert (not d!7842))

(assert (not b!25975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

