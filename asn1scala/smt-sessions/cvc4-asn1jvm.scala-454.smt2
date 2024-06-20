; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12124 () Bool)

(assert start!12124)

(declare-fun b!61850 () Bool)

(declare-fun e!41177 () Bool)

(declare-fun e!41170 () Bool)

(assert (=> b!61850 (= e!41177 e!41170)))

(declare-fun res!51523 () Bool)

(assert (=> b!61850 (=> res!51523 e!41170)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!96862 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!96873 () (_ BitVec 64))

(assert (=> b!61850 (= res!51523 (not (= lt!96873 (bvsub (bvadd lt!96862 to!314) i!635))))))

(declare-datatypes ((array!2783 0))(
  ( (array!2784 (arr!1834 (Array (_ BitVec 32) (_ BitVec 8))) (size!1270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2216 0))(
  ( (BitStream!2217 (buf!1651 array!2783) (currentByte!3281 (_ BitVec 32)) (currentBit!3276 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4211 0))(
  ( (Unit!4212) )
))
(declare-datatypes ((tuple2!5602 0))(
  ( (tuple2!5603 (_1!2912 Unit!4211) (_2!2912 BitStream!2216)) )
))
(declare-fun lt!96864 () tuple2!5602)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!61850 (= lt!96873 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864))))))

(declare-fun b!61851 () Bool)

(declare-fun res!51515 () Bool)

(assert (=> b!61851 (=> res!51515 e!41170)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!61851 (= res!51515 (not (invariant!0 (currentBit!3276 (_2!2912 lt!96864)) (currentByte!3281 (_2!2912 lt!96864)) (size!1270 (buf!1651 (_2!2912 lt!96864))))))))

(declare-fun b!61852 () Bool)

(declare-fun e!41166 () Bool)

(assert (=> b!61852 (= e!41170 e!41166)))

(declare-fun res!51512 () Bool)

(assert (=> b!61852 (=> res!51512 e!41166)))

(declare-fun lt!96874 () tuple2!5602)

(assert (=> b!61852 (= res!51512 (not (= (size!1270 (buf!1651 (_2!2912 lt!96874))) (size!1270 (buf!1651 (_2!2912 lt!96864))))))))

(declare-fun e!41168 () Bool)

(assert (=> b!61852 e!41168))

(declare-fun res!51520 () Bool)

(assert (=> b!61852 (=> (not res!51520) (not e!41168))))

(declare-fun thiss!1379 () BitStream!2216)

(assert (=> b!61852 (= res!51520 (= (size!1270 (buf!1651 (_2!2912 lt!96864))) (size!1270 (buf!1651 thiss!1379))))))

(declare-fun b!61853 () Bool)

(declare-fun e!41171 () Bool)

(declare-fun e!41173 () Bool)

(assert (=> b!61853 (= e!41171 (not e!41173))))

(declare-fun res!51528 () Bool)

(assert (=> b!61853 (=> res!51528 e!41173)))

(assert (=> b!61853 (= res!51528 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2216 BitStream!2216) Bool)

(assert (=> b!61853 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!96860 () Unit!4211)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2216) Unit!4211)

(assert (=> b!61853 (= lt!96860 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!61853 (= lt!96862 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(declare-fun b!61854 () Bool)

(declare-fun res!51517 () Bool)

(assert (=> b!61854 (=> res!51517 e!41170)))

(assert (=> b!61854 (= res!51517 (not (= (size!1270 (buf!1651 thiss!1379)) (size!1270 (buf!1651 (_2!2912 lt!96864))))))))

(declare-fun srcBuffer!2 () array!2783)

(declare-fun b!61855 () Bool)

(declare-datatypes ((tuple2!5604 0))(
  ( (tuple2!5605 (_1!2913 BitStream!2216) (_2!2913 BitStream!2216)) )
))
(declare-fun lt!96871 () tuple2!5604)

(declare-fun e!41172 () Bool)

(declare-datatypes ((List!683 0))(
  ( (Nil!680) (Cons!679 (h!798 Bool) (t!1433 List!683)) )
))
(declare-fun head!502 (List!683) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2216 array!2783 (_ BitVec 64) (_ BitVec 64)) List!683)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2216 BitStream!2216 (_ BitVec 64)) List!683)

(assert (=> b!61855 (= e!41172 (= (head!502 (byteArrayBitContentToList!0 (_2!2912 lt!96874) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!502 (bitStreamReadBitsIntoList!0 (_2!2912 lt!96874) (_1!2913 lt!96871) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!61856 () Bool)

(declare-fun e!41176 () Bool)

(declare-fun array_inv!1167 (array!2783) Bool)

(assert (=> b!61856 (= e!41176 (array_inv!1167 (buf!1651 thiss!1379)))))

(declare-fun b!61857 () Bool)

(declare-fun res!51526 () Bool)

(assert (=> b!61857 (=> res!51526 e!41166)))

(assert (=> b!61857 (= res!51526 (not (invariant!0 (currentBit!3276 (_2!2912 lt!96874)) (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96864))))))))

(declare-fun b!61858 () Bool)

(declare-fun e!41169 () Bool)

(declare-fun lt!96861 () tuple2!5604)

(declare-fun lt!96863 () tuple2!5604)

(assert (=> b!61858 (= e!41169 (isPrefixOf!0 (_1!2913 lt!96861) (_1!2913 lt!96863)))))

(declare-fun b!61859 () Bool)

(declare-fun e!41174 () Bool)

(assert (=> b!61859 (= e!41174 e!41177)))

(declare-fun res!51527 () Bool)

(assert (=> b!61859 (=> res!51527 e!41177)))

(assert (=> b!61859 (= res!51527 (not (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!96864))))))

(assert (=> b!61859 (isPrefixOf!0 thiss!1379 (_2!2912 lt!96864))))

(declare-fun lt!96868 () Unit!4211)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2216 BitStream!2216 BitStream!2216) Unit!4211)

(assert (=> b!61859 (= lt!96868 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2912 lt!96874) (_2!2912 lt!96864)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2216 array!2783 (_ BitVec 64) (_ BitVec 64)) tuple2!5602)

(assert (=> b!61859 (= lt!96864 (appendBitsMSBFirstLoop!0 (_2!2912 lt!96874) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!61859 e!41172))

(declare-fun res!51522 () Bool)

(assert (=> b!61859 (=> (not res!51522) (not e!41172))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61859 (= res!51522 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96870 () Unit!4211)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2216 array!2783 (_ BitVec 64)) Unit!4211)

(assert (=> b!61859 (= lt!96870 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1651 (_2!2912 lt!96874)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2216 BitStream!2216) tuple2!5604)

(assert (=> b!61859 (= lt!96871 (reader!0 thiss!1379 (_2!2912 lt!96874)))))

(declare-fun res!51518 () Bool)

(assert (=> start!12124 (=> (not res!51518) (not e!41171))))

(assert (=> start!12124 (= res!51518 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1270 srcBuffer!2))))))))

(assert (=> start!12124 e!41171))

(assert (=> start!12124 true))

(assert (=> start!12124 (array_inv!1167 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2216) Bool)

(assert (=> start!12124 (and (inv!12 thiss!1379) e!41176)))

(declare-fun b!61860 () Bool)

(declare-fun res!51525 () Bool)

(assert (=> b!61860 (=> res!51525 e!41169)))

(assert (=> b!61860 (= res!51525 (not (isPrefixOf!0 (_1!2913 lt!96863) (_2!2912 lt!96864))))))

(declare-fun b!61861 () Bool)

(declare-fun res!51521 () Bool)

(assert (=> b!61861 (=> res!51521 e!41166)))

(assert (=> b!61861 (= res!51521 (not (invariant!0 (currentBit!3276 (_2!2912 lt!96874)) (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96874))))))))

(declare-fun b!61862 () Bool)

(assert (=> b!61862 (= e!41173 e!41174)))

(declare-fun res!51524 () Bool)

(assert (=> b!61862 (=> res!51524 e!41174)))

(assert (=> b!61862 (= res!51524 (not (isPrefixOf!0 thiss!1379 (_2!2912 lt!96874))))))

(declare-fun lt!96869 () (_ BitVec 64))

(assert (=> b!61862 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!96869)))

(assert (=> b!61862 (= lt!96869 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96872 () Unit!4211)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2216 BitStream!2216 (_ BitVec 64) (_ BitVec 64)) Unit!4211)

(assert (=> b!61862 (= lt!96872 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2912 lt!96874) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2216 (_ BitVec 8) (_ BitVec 32)) tuple2!5602)

(assert (=> b!61862 (= lt!96874 (appendBitFromByte!0 thiss!1379 (select (arr!1834 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!61863 () Bool)

(declare-fun res!51513 () Bool)

(assert (=> b!61863 (=> res!51513 e!41169)))

(declare-fun lt!96859 () List!683)

(declare-fun length!311 (List!683) Int)

(assert (=> b!61863 (= res!51513 (<= (length!311 lt!96859) 0))))

(declare-fun b!61864 () Bool)

(assert (=> b!61864 (= e!41166 e!41169)))

(declare-fun res!51519 () Bool)

(assert (=> b!61864 (=> res!51519 e!41169)))

(assert (=> b!61864 (= res!51519 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!96865 () List!683)

(assert (=> b!61864 (= lt!96865 (bitStreamReadBitsIntoList!0 (_2!2912 lt!96864) (_1!2913 lt!96863) lt!96869))))

(assert (=> b!61864 (= lt!96859 (bitStreamReadBitsIntoList!0 (_2!2912 lt!96864) (_1!2913 lt!96861) (bvsub to!314 i!635)))))

(assert (=> b!61864 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!96869)))

(declare-fun lt!96866 () Unit!4211)

(assert (=> b!61864 (= lt!96866 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2912 lt!96874) (buf!1651 (_2!2912 lt!96864)) lt!96869))))

(assert (=> b!61864 (= lt!96863 (reader!0 (_2!2912 lt!96874) (_2!2912 lt!96864)))))

(assert (=> b!61864 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!96867 () Unit!4211)

(assert (=> b!61864 (= lt!96867 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1651 (_2!2912 lt!96864)) (bvsub to!314 i!635)))))

(assert (=> b!61864 (= lt!96861 (reader!0 thiss!1379 (_2!2912 lt!96864)))))

(declare-fun b!61865 () Bool)

(declare-fun res!51514 () Bool)

(assert (=> b!61865 (=> (not res!51514) (not e!41171))))

(assert (=> b!61865 (= res!51514 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 thiss!1379))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!61866 () Bool)

(declare-fun res!51516 () Bool)

(assert (=> b!61866 (=> res!51516 e!41169)))

(assert (=> b!61866 (= res!51516 (not (isPrefixOf!0 (_1!2913 lt!96861) (_2!2912 lt!96864))))))

(declare-fun b!61867 () Bool)

(assert (=> b!61867 (= e!41168 (= lt!96873 (bvsub (bvsub (bvadd (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!12124 res!51518) b!61865))

(assert (= (and b!61865 res!51514) b!61853))

(assert (= (and b!61853 (not res!51528)) b!61862))

(assert (= (and b!61862 (not res!51524)) b!61859))

(assert (= (and b!61859 res!51522) b!61855))

(assert (= (and b!61859 (not res!51527)) b!61850))

(assert (= (and b!61850 (not res!51523)) b!61851))

(assert (= (and b!61851 (not res!51515)) b!61854))

(assert (= (and b!61854 (not res!51517)) b!61852))

(assert (= (and b!61852 res!51520) b!61867))

(assert (= (and b!61852 (not res!51512)) b!61861))

(assert (= (and b!61861 (not res!51521)) b!61857))

(assert (= (and b!61857 (not res!51526)) b!61864))

(assert (= (and b!61864 (not res!51519)) b!61863))

(assert (= (and b!61863 (not res!51513)) b!61866))

(assert (= (and b!61866 (not res!51516)) b!61860))

(assert (= (and b!61860 (not res!51525)) b!61858))

(assert (= start!12124 b!61856))

(declare-fun m!97709 () Bool)

(assert (=> b!61867 m!97709))

(declare-fun m!97711 () Bool)

(assert (=> b!61855 m!97711))

(assert (=> b!61855 m!97711))

(declare-fun m!97713 () Bool)

(assert (=> b!61855 m!97713))

(declare-fun m!97715 () Bool)

(assert (=> b!61855 m!97715))

(assert (=> b!61855 m!97715))

(declare-fun m!97717 () Bool)

(assert (=> b!61855 m!97717))

(declare-fun m!97719 () Bool)

(assert (=> b!61860 m!97719))

(declare-fun m!97721 () Bool)

(assert (=> b!61864 m!97721))

(declare-fun m!97723 () Bool)

(assert (=> b!61864 m!97723))

(declare-fun m!97725 () Bool)

(assert (=> b!61864 m!97725))

(declare-fun m!97727 () Bool)

(assert (=> b!61864 m!97727))

(declare-fun m!97729 () Bool)

(assert (=> b!61864 m!97729))

(declare-fun m!97731 () Bool)

(assert (=> b!61864 m!97731))

(declare-fun m!97733 () Bool)

(assert (=> b!61864 m!97733))

(declare-fun m!97735 () Bool)

(assert (=> b!61864 m!97735))

(declare-fun m!97737 () Bool)

(assert (=> b!61865 m!97737))

(declare-fun m!97739 () Bool)

(assert (=> b!61850 m!97739))

(declare-fun m!97741 () Bool)

(assert (=> b!61858 m!97741))

(declare-fun m!97743 () Bool)

(assert (=> b!61856 m!97743))

(declare-fun m!97745 () Bool)

(assert (=> b!61857 m!97745))

(declare-fun m!97747 () Bool)

(assert (=> b!61863 m!97747))

(declare-fun m!97749 () Bool)

(assert (=> start!12124 m!97749))

(declare-fun m!97751 () Bool)

(assert (=> start!12124 m!97751))

(declare-fun m!97753 () Bool)

(assert (=> b!61861 m!97753))

(declare-fun m!97755 () Bool)

(assert (=> b!61853 m!97755))

(declare-fun m!97757 () Bool)

(assert (=> b!61853 m!97757))

(declare-fun m!97759 () Bool)

(assert (=> b!61853 m!97759))

(declare-fun m!97761 () Bool)

(assert (=> b!61866 m!97761))

(declare-fun m!97763 () Bool)

(assert (=> b!61859 m!97763))

(declare-fun m!97765 () Bool)

(assert (=> b!61859 m!97765))

(declare-fun m!97767 () Bool)

(assert (=> b!61859 m!97767))

(declare-fun m!97769 () Bool)

(assert (=> b!61859 m!97769))

(declare-fun m!97771 () Bool)

(assert (=> b!61859 m!97771))

(declare-fun m!97773 () Bool)

(assert (=> b!61859 m!97773))

(declare-fun m!97775 () Bool)

(assert (=> b!61859 m!97775))

(declare-fun m!97777 () Bool)

(assert (=> b!61851 m!97777))

(declare-fun m!97779 () Bool)

(assert (=> b!61862 m!97779))

(declare-fun m!97781 () Bool)

(assert (=> b!61862 m!97781))

(assert (=> b!61862 m!97779))

(declare-fun m!97783 () Bool)

(assert (=> b!61862 m!97783))

(declare-fun m!97785 () Bool)

(assert (=> b!61862 m!97785))

(declare-fun m!97787 () Bool)

(assert (=> b!61862 m!97787))

(push 1)

(assert (not b!61858))

(assert (not b!61864))

(assert (not b!61859))

(assert (not b!61860))

(assert (not b!61857))

(assert (not start!12124))

(assert (not b!61865))

(assert (not b!61853))

(assert (not b!61863))

(assert (not b!61851))

(assert (not b!61855))

(assert (not b!61850))

(assert (not b!61856))

(assert (not b!61862))

(assert (not b!61861))

(assert (not b!61867))

(assert (not b!61866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19066 () Bool)

(assert (=> d!19066 (= (array_inv!1167 srcBuffer!2) (bvsge (size!1270 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12124 d!19066))

(declare-fun d!19068 () Bool)

(assert (=> d!19068 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3276 thiss!1379) (currentByte!3281 thiss!1379) (size!1270 (buf!1651 thiss!1379))))))

(declare-fun bs!4752 () Bool)

(assert (= bs!4752 d!19068))

(declare-fun m!97801 () Bool)

(assert (=> bs!4752 m!97801))

(assert (=> start!12124 d!19068))

(declare-fun d!19072 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4754 () Bool)

(assert (= bs!4754 d!19072))

(declare-fun m!97805 () Bool)

(assert (=> bs!4754 m!97805))

(assert (=> b!61859 d!19072))

(declare-fun b!62114 () Bool)

(declare-fun e!41303 () tuple2!5602)

(declare-fun lt!97480 () tuple2!5602)

(declare-fun Unit!4223 () Unit!4211)

(assert (=> b!62114 (= e!41303 (tuple2!5603 Unit!4223 (_2!2912 lt!97480)))))

(declare-fun lt!97459 () tuple2!5602)

(assert (=> b!62114 (= lt!97459 (appendBitFromByte!0 (_2!2912 lt!96874) (select (arr!1834 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!97463 () (_ BitVec 64))

(assert (=> b!62114 (= lt!97463 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97477 () (_ BitVec 64))

(assert (=> b!62114 (= lt!97477 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97485 () Unit!4211)

(assert (=> b!62114 (= lt!97485 (validateOffsetBitsIneqLemma!0 (_2!2912 lt!96874) (_2!2912 lt!97459) lt!97463 lt!97477))))

(assert (=> b!62114 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!97459)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!97459))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!97459))) (bvsub lt!97463 lt!97477))))

(declare-fun lt!97479 () Unit!4211)

(assert (=> b!62114 (= lt!97479 lt!97485)))

(declare-fun lt!97490 () tuple2!5604)

(assert (=> b!62114 (= lt!97490 (reader!0 (_2!2912 lt!96874) (_2!2912 lt!97459)))))

(declare-fun lt!97460 () (_ BitVec 64))

(assert (=> b!62114 (= lt!97460 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97491 () Unit!4211)

(assert (=> b!62114 (= lt!97491 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2912 lt!96874) (buf!1651 (_2!2912 lt!97459)) lt!97460))))

(assert (=> b!62114 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!97459)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!97460)))

(declare-fun lt!97455 () Unit!4211)

(assert (=> b!62114 (= lt!97455 lt!97491)))

(assert (=> b!62114 (= (head!502 (byteArrayBitContentToList!0 (_2!2912 lt!97459) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!502 (bitStreamReadBitsIntoList!0 (_2!2912 lt!97459) (_1!2913 lt!97490) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97468 () Unit!4211)

(declare-fun Unit!4224 () Unit!4211)

(assert (=> b!62114 (= lt!97468 Unit!4224)))

(assert (=> b!62114 (= lt!97480 (appendBitsMSBFirstLoop!0 (_2!2912 lt!97459) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!97474 () Unit!4211)

(assert (=> b!62114 (= lt!97474 (lemmaIsPrefixTransitive!0 (_2!2912 lt!96874) (_2!2912 lt!97459) (_2!2912 lt!97480)))))

(assert (=> b!62114 (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!97480))))

(declare-fun lt!97484 () Unit!4211)

(assert (=> b!62114 (= lt!97484 lt!97474)))

(assert (=> b!62114 (= (size!1270 (buf!1651 (_2!2912 lt!97480))) (size!1270 (buf!1651 (_2!2912 lt!96874))))))

(declare-fun lt!97466 () Unit!4211)

(declare-fun Unit!4225 () Unit!4211)

(assert (=> b!62114 (= lt!97466 Unit!4225)))

(assert (=> b!62114 (= (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97480))) (currentByte!3281 (_2!2912 lt!97480)) (currentBit!3276 (_2!2912 lt!97480))) (bvsub (bvadd (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97454 () Unit!4211)

(declare-fun Unit!4226 () Unit!4211)

(assert (=> b!62114 (= lt!97454 Unit!4226)))

(assert (=> b!62114 (= (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97480))) (currentByte!3281 (_2!2912 lt!97480)) (currentBit!3276 (_2!2912 lt!97480))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97459))) (currentByte!3281 (_2!2912 lt!97459)) (currentBit!3276 (_2!2912 lt!97459))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97478 () Unit!4211)

(declare-fun Unit!4227 () Unit!4211)

(assert (=> b!62114 (= lt!97478 Unit!4227)))

(declare-fun lt!97495 () tuple2!5604)

(assert (=> b!62114 (= lt!97495 (reader!0 (_2!2912 lt!96874) (_2!2912 lt!97480)))))

(declare-fun lt!97462 () (_ BitVec 64))

(assert (=> b!62114 (= lt!97462 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97458 () Unit!4211)

(assert (=> b!62114 (= lt!97458 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2912 lt!96874) (buf!1651 (_2!2912 lt!97480)) lt!97462))))

(assert (=> b!62114 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!97480)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!97462)))

(declare-fun lt!97464 () Unit!4211)

(assert (=> b!62114 (= lt!97464 lt!97458)))

(declare-fun lt!97471 () tuple2!5604)

(declare-fun call!787 () tuple2!5604)

(assert (=> b!62114 (= lt!97471 call!787)))

(declare-fun lt!97475 () (_ BitVec 64))

(assert (=> b!62114 (= lt!97475 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97483 () Unit!4211)

(assert (=> b!62114 (= lt!97483 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2912 lt!97459) (buf!1651 (_2!2912 lt!97480)) lt!97475))))

(assert (=> b!62114 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!97480)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!97459))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!97459))) lt!97475)))

(declare-fun lt!97472 () Unit!4211)

(assert (=> b!62114 (= lt!97472 lt!97483)))

(declare-fun lt!97473 () List!683)

(assert (=> b!62114 (= lt!97473 (byteArrayBitContentToList!0 (_2!2912 lt!97480) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!97488 () List!683)

(assert (=> b!62114 (= lt!97488 (byteArrayBitContentToList!0 (_2!2912 lt!97480) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97461 () List!683)

(assert (=> b!62114 (= lt!97461 (bitStreamReadBitsIntoList!0 (_2!2912 lt!97480) (_1!2913 lt!97495) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!97452 () List!683)

(assert (=> b!62114 (= lt!97452 (bitStreamReadBitsIntoList!0 (_2!2912 lt!97480) (_1!2913 lt!97471) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97456 () (_ BitVec 64))

(assert (=> b!62114 (= lt!97456 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97467 () Unit!4211)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2216 BitStream!2216 BitStream!2216 BitStream!2216 (_ BitVec 64) List!683) Unit!4211)

(assert (=> b!62114 (= lt!97467 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2912 lt!97480) (_2!2912 lt!97480) (_1!2913 lt!97495) (_1!2913 lt!97471) lt!97456 lt!97461))))

(declare-fun tail!289 (List!683) List!683)

(assert (=> b!62114 (= (bitStreamReadBitsIntoList!0 (_2!2912 lt!97480) (_1!2913 lt!97471) (bvsub lt!97456 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!289 lt!97461))))

(declare-fun lt!97470 () Unit!4211)

(assert (=> b!62114 (= lt!97470 lt!97467)))

(declare-fun lt!97493 () Unit!4211)

(declare-fun lt!97465 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2783 array!2783 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4211)

(assert (=> b!62114 (= lt!97493 (arrayBitRangesEqImpliesEq!0 (buf!1651 (_2!2912 lt!97459)) (buf!1651 (_2!2912 lt!97480)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!97465 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97459))) (currentByte!3281 (_2!2912 lt!97459)) (currentBit!3276 (_2!2912 lt!97459)))))))

(declare-fun bitAt!0 (array!2783 (_ BitVec 64)) Bool)

(assert (=> b!62114 (= (bitAt!0 (buf!1651 (_2!2912 lt!97459)) lt!97465) (bitAt!0 (buf!1651 (_2!2912 lt!97480)) lt!97465))))

(declare-fun lt!97457 () Unit!4211)

(assert (=> b!62114 (= lt!97457 lt!97493)))

(declare-fun b!62115 () Bool)

(declare-fun e!41302 () Bool)

(declare-fun lt!97492 () (_ BitVec 64))

(assert (=> b!62115 (= e!41302 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!97492))))

(declare-fun b!62116 () Bool)

(declare-fun res!51703 () Bool)

(declare-fun e!41301 () Bool)

(assert (=> b!62116 (=> (not res!51703) (not e!41301))))

(declare-fun lt!97494 () tuple2!5602)

(assert (=> b!62116 (= res!51703 (invariant!0 (currentBit!3276 (_2!2912 lt!97494)) (currentByte!3281 (_2!2912 lt!97494)) (size!1270 (buf!1651 (_2!2912 lt!97494)))))))

(declare-fun b!62117 () Bool)

(declare-fun res!51708 () Bool)

(assert (=> b!62117 (=> (not res!51708) (not e!41301))))

(assert (=> b!62117 (= res!51708 (= (size!1270 (buf!1651 (_2!2912 lt!97494))) (size!1270 (buf!1651 (_2!2912 lt!96874)))))))

(declare-fun b!62118 () Bool)

(declare-fun res!51707 () Bool)

(assert (=> b!62118 (=> (not res!51707) (not e!41301))))

(assert (=> b!62118 (= res!51707 (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!97494)))))

(declare-fun b!62119 () Bool)

(declare-fun Unit!4228 () Unit!4211)

(assert (=> b!62119 (= e!41303 (tuple2!5603 Unit!4228 (_2!2912 lt!96874)))))

(assert (=> b!62119 (= (size!1270 (buf!1651 (_2!2912 lt!96874))) (size!1270 (buf!1651 (_2!2912 lt!96874))))))

(declare-fun lt!97476 () Unit!4211)

(declare-fun Unit!4229 () Unit!4211)

(assert (=> b!62119 (= lt!97476 Unit!4229)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2216 array!2783 array!2783 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5616 0))(
  ( (tuple2!5617 (_1!2919 array!2783) (_2!2919 BitStream!2216)) )
))
(declare-fun readBits!0 (BitStream!2216 (_ BitVec 64)) tuple2!5616)

(assert (=> b!62119 (checkByteArrayBitContent!0 (_2!2912 lt!96874) srcBuffer!2 (_1!2919 (readBits!0 (_1!2913 call!787) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!19076 () Bool)

(assert (=> d!19076 e!41301))

(declare-fun res!51705 () Bool)

(assert (=> d!19076 (=> (not res!51705) (not e!41301))))

(declare-fun lt!97481 () (_ BitVec 64))

(assert (=> d!19076 (= res!51705 (= (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97494))) (currentByte!3281 (_2!2912 lt!97494)) (currentBit!3276 (_2!2912 lt!97494))) (bvsub lt!97481 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19076 (or (= (bvand lt!97481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97481 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!97489 () (_ BitVec 64))

(assert (=> d!19076 (= lt!97481 (bvadd lt!97489 to!314))))

(assert (=> d!19076 (or (not (= (bvand lt!97489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!97489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!97489 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19076 (= lt!97489 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))))))

(assert (=> d!19076 (= lt!97494 e!41303)))

(declare-fun c!4389 () Bool)

(assert (=> d!19076 (= c!4389 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!97487 () Unit!4211)

(declare-fun lt!97469 () Unit!4211)

(assert (=> d!19076 (= lt!97487 lt!97469)))

(assert (=> d!19076 (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!96874))))

(assert (=> d!19076 (= lt!97469 (lemmaIsPrefixRefl!0 (_2!2912 lt!96874)))))

(assert (=> d!19076 (= lt!97465 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))))))

(assert (=> d!19076 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19076 (= (appendBitsMSBFirstLoop!0 (_2!2912 lt!96874) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!97494)))

(declare-fun lt!97482 () tuple2!5604)

(declare-fun b!62120 () Bool)

(assert (=> b!62120 (= e!41301 (= (bitStreamReadBitsIntoList!0 (_2!2912 lt!97494) (_1!2913 lt!97482) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2912 lt!97494) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!62120 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62120 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!97453 () Unit!4211)

(declare-fun lt!97486 () Unit!4211)

(assert (=> b!62120 (= lt!97453 lt!97486)))

(assert (=> b!62120 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!97494)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!97492)))

(assert (=> b!62120 (= lt!97486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2912 lt!96874) (buf!1651 (_2!2912 lt!97494)) lt!97492))))

(assert (=> b!62120 e!41302))

(declare-fun res!51706 () Bool)

(assert (=> b!62120 (=> (not res!51706) (not e!41302))))

(assert (=> b!62120 (= res!51706 (and (= (size!1270 (buf!1651 (_2!2912 lt!96874))) (size!1270 (buf!1651 (_2!2912 lt!97494)))) (bvsge lt!97492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62120 (= lt!97492 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!62120 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62120 (= lt!97482 (reader!0 (_2!2912 lt!96874) (_2!2912 lt!97494)))))

(declare-fun bm!784 () Bool)

(assert (=> bm!784 (= call!787 (reader!0 (ite c!4389 (_2!2912 lt!97459) (_2!2912 lt!96874)) (ite c!4389 (_2!2912 lt!97480) (_2!2912 lt!96874))))))

(declare-fun b!62121 () Bool)

(declare-fun res!51704 () Bool)

(assert (=> b!62121 (=> (not res!51704) (not e!41301))))

(assert (=> b!62121 (= res!51704 (= (size!1270 (buf!1651 (_2!2912 lt!96874))) (size!1270 (buf!1651 (_2!2912 lt!97494)))))))

(assert (= (and d!19076 c!4389) b!62114))

(assert (= (and d!19076 (not c!4389)) b!62119))

(assert (= (or b!62114 b!62119) bm!784))

(assert (= (and d!19076 res!51705) b!62116))

(assert (= (and b!62116 res!51703) b!62121))

(assert (= (and b!62121 res!51704) b!62118))

(assert (= (and b!62118 res!51707) b!62117))

(assert (= (and b!62117 res!51708) b!62120))

(assert (= (and b!62120 res!51706) b!62115))

(declare-fun m!98187 () Bool)

(assert (=> b!62116 m!98187))

(declare-fun m!98189 () Bool)

(assert (=> b!62114 m!98189))

(declare-fun m!98191 () Bool)

(assert (=> b!62114 m!98191))

(declare-fun m!98193 () Bool)

(assert (=> b!62114 m!98193))

(declare-fun m!98195 () Bool)

(assert (=> b!62114 m!98195))

(declare-fun m!98197 () Bool)

(assert (=> b!62114 m!98197))

(declare-fun m!98199 () Bool)

(assert (=> b!62114 m!98199))

(declare-fun m!98201 () Bool)

(assert (=> b!62114 m!98201))

(declare-fun m!98203 () Bool)

(assert (=> b!62114 m!98203))

(declare-fun m!98205 () Bool)

(assert (=> b!62114 m!98205))

(assert (=> b!62114 m!98201))

(declare-fun m!98207 () Bool)

(assert (=> b!62114 m!98207))

(declare-fun m!98209 () Bool)

(assert (=> b!62114 m!98209))

(declare-fun m!98211 () Bool)

(assert (=> b!62114 m!98211))

(declare-fun m!98213 () Bool)

(assert (=> b!62114 m!98213))

(assert (=> b!62114 m!98195))

(declare-fun m!98215 () Bool)

(assert (=> b!62114 m!98215))

(declare-fun m!98217 () Bool)

(assert (=> b!62114 m!98217))

(declare-fun m!98219 () Bool)

(assert (=> b!62114 m!98219))

(declare-fun m!98221 () Bool)

(assert (=> b!62114 m!98221))

(declare-fun m!98223 () Bool)

(assert (=> b!62114 m!98223))

(assert (=> b!62114 m!97709))

(declare-fun m!98225 () Bool)

(assert (=> b!62114 m!98225))

(assert (=> b!62114 m!98207))

(declare-fun m!98227 () Bool)

(assert (=> b!62114 m!98227))

(declare-fun m!98229 () Bool)

(assert (=> b!62114 m!98229))

(declare-fun m!98231 () Bool)

(assert (=> b!62114 m!98231))

(declare-fun m!98233 () Bool)

(assert (=> b!62114 m!98233))

(declare-fun m!98235 () Bool)

(assert (=> b!62114 m!98235))

(declare-fun m!98237 () Bool)

(assert (=> b!62114 m!98237))

(declare-fun m!98239 () Bool)

(assert (=> b!62114 m!98239))

(declare-fun m!98241 () Bool)

(assert (=> b!62114 m!98241))

(declare-fun m!98243 () Bool)

(assert (=> b!62114 m!98243))

(declare-fun m!98245 () Bool)

(assert (=> b!62114 m!98245))

(assert (=> b!62114 m!98233))

(declare-fun m!98247 () Bool)

(assert (=> b!62114 m!98247))

(declare-fun m!98249 () Bool)

(assert (=> b!62114 m!98249))

(declare-fun m!98251 () Bool)

(assert (=> b!62120 m!98251))

(declare-fun m!98253 () Bool)

(assert (=> b!62120 m!98253))

(declare-fun m!98255 () Bool)

(assert (=> b!62120 m!98255))

(declare-fun m!98257 () Bool)

(assert (=> b!62120 m!98257))

(declare-fun m!98259 () Bool)

(assert (=> b!62120 m!98259))

(declare-fun m!98261 () Bool)

(assert (=> b!62119 m!98261))

(declare-fun m!98263 () Bool)

(assert (=> b!62119 m!98263))

(declare-fun m!98265 () Bool)

(assert (=> b!62115 m!98265))

(declare-fun m!98267 () Bool)

(assert (=> b!62118 m!98267))

(declare-fun m!98269 () Bool)

(assert (=> bm!784 m!98269))

(declare-fun m!98271 () Bool)

(assert (=> d!19076 m!98271))

(assert (=> d!19076 m!97709))

(declare-fun m!98273 () Bool)

(assert (=> d!19076 m!98273))

(declare-fun m!98275 () Bool)

(assert (=> d!19076 m!98275))

(assert (=> b!61859 d!19076))

(declare-fun d!19182 () Bool)

(declare-fun res!51717 () Bool)

(declare-fun e!41309 () Bool)

(assert (=> d!19182 (=> (not res!51717) (not e!41309))))

(assert (=> d!19182 (= res!51717 (= (size!1270 (buf!1651 (_2!2912 lt!96874))) (size!1270 (buf!1651 (_2!2912 lt!96864)))))))

(assert (=> d!19182 (= (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!96864)) e!41309)))

(declare-fun b!62128 () Bool)

(declare-fun res!51715 () Bool)

(assert (=> b!62128 (=> (not res!51715) (not e!41309))))

(assert (=> b!62128 (= res!51715 (bvsle (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))) (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864)))))))

(declare-fun b!62129 () Bool)

(declare-fun e!41308 () Bool)

(assert (=> b!62129 (= e!41309 e!41308)))

(declare-fun res!51716 () Bool)

(assert (=> b!62129 (=> res!51716 e!41308)))

(assert (=> b!62129 (= res!51716 (= (size!1270 (buf!1651 (_2!2912 lt!96874))) #b00000000000000000000000000000000))))

(declare-fun b!62130 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2783 array!2783 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62130 (= e!41308 (arrayBitRangesEq!0 (buf!1651 (_2!2912 lt!96874)) (buf!1651 (_2!2912 lt!96864)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874)))))))

(assert (= (and d!19182 res!51717) b!62128))

(assert (= (and b!62128 res!51715) b!62129))

(assert (= (and b!62129 (not res!51716)) b!62130))

(assert (=> b!62128 m!97709))

(assert (=> b!62128 m!97739))

(assert (=> b!62130 m!97709))

(assert (=> b!62130 m!97709))

(declare-fun m!98277 () Bool)

(assert (=> b!62130 m!98277))

(assert (=> b!61859 d!19182))

(declare-fun d!19184 () Bool)

(assert (=> d!19184 (isPrefixOf!0 thiss!1379 (_2!2912 lt!96864))))

(declare-fun lt!97498 () Unit!4211)

(declare-fun choose!30 (BitStream!2216 BitStream!2216 BitStream!2216) Unit!4211)

(assert (=> d!19184 (= lt!97498 (choose!30 thiss!1379 (_2!2912 lt!96874) (_2!2912 lt!96864)))))

(assert (=> d!19184 (isPrefixOf!0 thiss!1379 (_2!2912 lt!96874))))

(assert (=> d!19184 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2912 lt!96874) (_2!2912 lt!96864)) lt!97498)))

(declare-fun bs!4773 () Bool)

(assert (= bs!4773 d!19184))

(assert (=> bs!4773 m!97775))

(declare-fun m!98279 () Bool)

(assert (=> bs!4773 m!98279))

(assert (=> bs!4773 m!97785))

(assert (=> b!61859 d!19184))

(declare-fun b!62141 () Bool)

(declare-fun res!51725 () Bool)

(declare-fun e!41315 () Bool)

(assert (=> b!62141 (=> (not res!51725) (not e!41315))))

(declare-fun lt!97552 () tuple2!5604)

(assert (=> b!62141 (= res!51725 (isPrefixOf!0 (_2!2913 lt!97552) (_2!2912 lt!96874)))))

(declare-fun b!62142 () Bool)

(declare-fun e!41314 () Unit!4211)

(declare-fun lt!97549 () Unit!4211)

(assert (=> b!62142 (= e!41314 lt!97549)))

(declare-fun lt!97557 () (_ BitVec 64))

(assert (=> b!62142 (= lt!97557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97540 () (_ BitVec 64))

(assert (=> b!62142 (= lt!97540 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2783 array!2783 (_ BitVec 64) (_ BitVec 64)) Unit!4211)

(assert (=> b!62142 (= lt!97549 (arrayBitRangesEqSymmetric!0 (buf!1651 thiss!1379) (buf!1651 (_2!2912 lt!96874)) lt!97557 lt!97540))))

(assert (=> b!62142 (arrayBitRangesEq!0 (buf!1651 (_2!2912 lt!96874)) (buf!1651 thiss!1379) lt!97557 lt!97540)))

(declare-fun d!19186 () Bool)

(assert (=> d!19186 e!41315))

(declare-fun res!51724 () Bool)

(assert (=> d!19186 (=> (not res!51724) (not e!41315))))

(assert (=> d!19186 (= res!51724 (isPrefixOf!0 (_1!2913 lt!97552) (_2!2913 lt!97552)))))

(declare-fun lt!97542 () BitStream!2216)

(assert (=> d!19186 (= lt!97552 (tuple2!5605 lt!97542 (_2!2912 lt!96874)))))

(declare-fun lt!97558 () Unit!4211)

(declare-fun lt!97544 () Unit!4211)

(assert (=> d!19186 (= lt!97558 lt!97544)))

(assert (=> d!19186 (isPrefixOf!0 lt!97542 (_2!2912 lt!96874))))

(assert (=> d!19186 (= lt!97544 (lemmaIsPrefixTransitive!0 lt!97542 (_2!2912 lt!96874) (_2!2912 lt!96874)))))

(declare-fun lt!97554 () Unit!4211)

(declare-fun lt!97556 () Unit!4211)

(assert (=> d!19186 (= lt!97554 lt!97556)))

(assert (=> d!19186 (isPrefixOf!0 lt!97542 (_2!2912 lt!96874))))

(assert (=> d!19186 (= lt!97556 (lemmaIsPrefixTransitive!0 lt!97542 thiss!1379 (_2!2912 lt!96874)))))

(declare-fun lt!97541 () Unit!4211)

(assert (=> d!19186 (= lt!97541 e!41314)))

(declare-fun c!4392 () Bool)

(assert (=> d!19186 (= c!4392 (not (= (size!1270 (buf!1651 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!97547 () Unit!4211)

(declare-fun lt!97548 () Unit!4211)

(assert (=> d!19186 (= lt!97547 lt!97548)))

(assert (=> d!19186 (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!96874))))

(assert (=> d!19186 (= lt!97548 (lemmaIsPrefixRefl!0 (_2!2912 lt!96874)))))

(declare-fun lt!97550 () Unit!4211)

(declare-fun lt!97543 () Unit!4211)

(assert (=> d!19186 (= lt!97550 lt!97543)))

(assert (=> d!19186 (= lt!97543 (lemmaIsPrefixRefl!0 (_2!2912 lt!96874)))))

(declare-fun lt!97545 () Unit!4211)

(declare-fun lt!97539 () Unit!4211)

(assert (=> d!19186 (= lt!97545 lt!97539)))

(assert (=> d!19186 (isPrefixOf!0 lt!97542 lt!97542)))

(assert (=> d!19186 (= lt!97539 (lemmaIsPrefixRefl!0 lt!97542))))

(declare-fun lt!97553 () Unit!4211)

(declare-fun lt!97551 () Unit!4211)

(assert (=> d!19186 (= lt!97553 lt!97551)))

(assert (=> d!19186 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19186 (= lt!97551 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19186 (= lt!97542 (BitStream!2217 (buf!1651 (_2!2912 lt!96874)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(assert (=> d!19186 (isPrefixOf!0 thiss!1379 (_2!2912 lt!96874))))

(assert (=> d!19186 (= (reader!0 thiss!1379 (_2!2912 lt!96874)) lt!97552)))

(declare-fun b!62143 () Bool)

(declare-fun res!51726 () Bool)

(assert (=> b!62143 (=> (not res!51726) (not e!41315))))

(assert (=> b!62143 (= res!51726 (isPrefixOf!0 (_1!2913 lt!97552) thiss!1379))))

(declare-fun lt!97555 () (_ BitVec 64))

(declare-fun lt!97546 () (_ BitVec 64))

(declare-fun b!62144 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2216 (_ BitVec 64)) BitStream!2216)

(assert (=> b!62144 (= e!41315 (= (_1!2913 lt!97552) (withMovedBitIndex!0 (_2!2913 lt!97552) (bvsub lt!97546 lt!97555))))))

(assert (=> b!62144 (or (= (bvand lt!97546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97555 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97546 lt!97555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62144 (= lt!97555 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))))))

(assert (=> b!62144 (= lt!97546 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(declare-fun b!62145 () Bool)

(declare-fun Unit!4232 () Unit!4211)

(assert (=> b!62145 (= e!41314 Unit!4232)))

(assert (= (and d!19186 c!4392) b!62142))

(assert (= (and d!19186 (not c!4392)) b!62145))

(assert (= (and d!19186 res!51724) b!62143))

(assert (= (and b!62143 res!51726) b!62141))

(assert (= (and b!62141 res!51725) b!62144))

(declare-fun m!98281 () Bool)

(assert (=> d!19186 m!98281))

(assert (=> d!19186 m!97785))

(declare-fun m!98283 () Bool)

(assert (=> d!19186 m!98283))

(assert (=> d!19186 m!97757))

(declare-fun m!98285 () Bool)

(assert (=> d!19186 m!98285))

(declare-fun m!98287 () Bool)

(assert (=> d!19186 m!98287))

(assert (=> d!19186 m!98273))

(assert (=> d!19186 m!98275))

(declare-fun m!98289 () Bool)

(assert (=> d!19186 m!98289))

(assert (=> d!19186 m!97755))

(declare-fun m!98291 () Bool)

(assert (=> d!19186 m!98291))

(declare-fun m!98293 () Bool)

(assert (=> b!62144 m!98293))

(assert (=> b!62144 m!97709))

(assert (=> b!62144 m!97759))

(declare-fun m!98295 () Bool)

(assert (=> b!62141 m!98295))

(assert (=> b!62142 m!97759))

(declare-fun m!98297 () Bool)

(assert (=> b!62142 m!98297))

(declare-fun m!98299 () Bool)

(assert (=> b!62142 m!98299))

(declare-fun m!98301 () Bool)

(assert (=> b!62143 m!98301))

(assert (=> b!61859 d!19186))

(declare-fun d!19188 () Bool)

(assert (=> d!19188 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97561 () Unit!4211)

(declare-fun choose!9 (BitStream!2216 array!2783 (_ BitVec 64) BitStream!2216) Unit!4211)

(assert (=> d!19188 (= lt!97561 (choose!9 thiss!1379 (buf!1651 (_2!2912 lt!96874)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2217 (buf!1651 (_2!2912 lt!96874)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379))))))

(assert (=> d!19188 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1651 (_2!2912 lt!96874)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97561)))

(declare-fun bs!4774 () Bool)

(assert (= bs!4774 d!19188))

(assert (=> bs!4774 m!97767))

(declare-fun m!98303 () Bool)

(assert (=> bs!4774 m!98303))

(assert (=> b!61859 d!19188))

(declare-fun d!19190 () Bool)

(declare-fun res!51729 () Bool)

(declare-fun e!41317 () Bool)

(assert (=> d!19190 (=> (not res!51729) (not e!41317))))

(assert (=> d!19190 (= res!51729 (= (size!1270 (buf!1651 thiss!1379)) (size!1270 (buf!1651 (_2!2912 lt!96864)))))))

(assert (=> d!19190 (= (isPrefixOf!0 thiss!1379 (_2!2912 lt!96864)) e!41317)))

(declare-fun b!62146 () Bool)

(declare-fun res!51727 () Bool)

(assert (=> b!62146 (=> (not res!51727) (not e!41317))))

(assert (=> b!62146 (= res!51727 (bvsle (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)) (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864)))))))

(declare-fun b!62147 () Bool)

(declare-fun e!41316 () Bool)

(assert (=> b!62147 (= e!41317 e!41316)))

(declare-fun res!51728 () Bool)

(assert (=> b!62147 (=> res!51728 e!41316)))

(assert (=> b!62147 (= res!51728 (= (size!1270 (buf!1651 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62148 () Bool)

(assert (=> b!62148 (= e!41316 (arrayBitRangesEq!0 (buf!1651 thiss!1379) (buf!1651 (_2!2912 lt!96864)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379))))))

(assert (= (and d!19190 res!51729) b!62146))

(assert (= (and b!62146 res!51727) b!62147))

(assert (= (and b!62147 (not res!51728)) b!62148))

(assert (=> b!62146 m!97759))

(assert (=> b!62146 m!97739))

(assert (=> b!62148 m!97759))

(assert (=> b!62148 m!97759))

(declare-fun m!98305 () Bool)

(assert (=> b!62148 m!98305))

(assert (=> b!61859 d!19190))

(declare-fun d!19192 () Bool)

(declare-fun res!51732 () Bool)

(declare-fun e!41319 () Bool)

(assert (=> d!19192 (=> (not res!51732) (not e!41319))))

(assert (=> d!19192 (= res!51732 (= (size!1270 (buf!1651 (_1!2913 lt!96861))) (size!1270 (buf!1651 (_1!2913 lt!96863)))))))

(assert (=> d!19192 (= (isPrefixOf!0 (_1!2913 lt!96861) (_1!2913 lt!96863)) e!41319)))

(declare-fun b!62149 () Bool)

(declare-fun res!51730 () Bool)

(assert (=> b!62149 (=> (not res!51730) (not e!41319))))

(assert (=> b!62149 (= res!51730 (bvsle (bitIndex!0 (size!1270 (buf!1651 (_1!2913 lt!96861))) (currentByte!3281 (_1!2913 lt!96861)) (currentBit!3276 (_1!2913 lt!96861))) (bitIndex!0 (size!1270 (buf!1651 (_1!2913 lt!96863))) (currentByte!3281 (_1!2913 lt!96863)) (currentBit!3276 (_1!2913 lt!96863)))))))

(declare-fun b!62150 () Bool)

(declare-fun e!41318 () Bool)

(assert (=> b!62150 (= e!41319 e!41318)))

(declare-fun res!51731 () Bool)

(assert (=> b!62150 (=> res!51731 e!41318)))

(assert (=> b!62150 (= res!51731 (= (size!1270 (buf!1651 (_1!2913 lt!96861))) #b00000000000000000000000000000000))))

(declare-fun b!62151 () Bool)

(assert (=> b!62151 (= e!41318 (arrayBitRangesEq!0 (buf!1651 (_1!2913 lt!96861)) (buf!1651 (_1!2913 lt!96863)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1270 (buf!1651 (_1!2913 lt!96861))) (currentByte!3281 (_1!2913 lt!96861)) (currentBit!3276 (_1!2913 lt!96861)))))))

(assert (= (and d!19192 res!51732) b!62149))

(assert (= (and b!62149 res!51730) b!62150))

(assert (= (and b!62150 (not res!51731)) b!62151))

(declare-fun m!98307 () Bool)

(assert (=> b!62149 m!98307))

(declare-fun m!98309 () Bool)

(assert (=> b!62149 m!98309))

(assert (=> b!62151 m!98307))

(assert (=> b!62151 m!98307))

(declare-fun m!98311 () Bool)

(assert (=> b!62151 m!98311))

(assert (=> b!61858 d!19192))

(declare-fun d!19194 () Bool)

(assert (=> d!19194 (= (invariant!0 (currentBit!3276 (_2!2912 lt!96874)) (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96864)))) (and (bvsge (currentBit!3276 (_2!2912 lt!96874)) #b00000000000000000000000000000000) (bvslt (currentBit!3276 (_2!2912 lt!96874)) #b00000000000000000000000000001000) (bvsge (currentByte!3281 (_2!2912 lt!96874)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96864)))) (and (= (currentBit!3276 (_2!2912 lt!96874)) #b00000000000000000000000000000000) (= (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96864))))))))))

(assert (=> b!61857 d!19194))

(declare-fun d!19196 () Bool)

(declare-fun e!41322 () Bool)

(assert (=> d!19196 e!41322))

(declare-fun res!51738 () Bool)

(assert (=> d!19196 (=> (not res!51738) (not e!41322))))

(declare-fun lt!97576 () (_ BitVec 64))

(declare-fun lt!97577 () (_ BitVec 64))

(declare-fun lt!97579 () (_ BitVec 64))

(assert (=> d!19196 (= res!51738 (= lt!97576 (bvsub lt!97577 lt!97579)))))

(assert (=> d!19196 (or (= (bvand lt!97577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97577 lt!97579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19196 (= lt!97579 (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874)))))))

(declare-fun lt!97574 () (_ BitVec 64))

(declare-fun lt!97578 () (_ BitVec 64))

(assert (=> d!19196 (= lt!97577 (bvmul lt!97574 lt!97578))))

(assert (=> d!19196 (or (= lt!97574 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!97578 (bvsdiv (bvmul lt!97574 lt!97578) lt!97574)))))

(assert (=> d!19196 (= lt!97578 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19196 (= lt!97574 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))))))

(assert (=> d!19196 (= lt!97576 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874)))))))

(assert (=> d!19196 (invariant!0 (currentBit!3276 (_2!2912 lt!96874)) (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96874))))))

(assert (=> d!19196 (= (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))) lt!97576)))

(declare-fun b!62156 () Bool)

(declare-fun res!51737 () Bool)

(assert (=> b!62156 (=> (not res!51737) (not e!41322))))

(assert (=> b!62156 (= res!51737 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!97576))))

(declare-fun b!62157 () Bool)

(declare-fun lt!97575 () (_ BitVec 64))

(assert (=> b!62157 (= e!41322 (bvsle lt!97576 (bvmul lt!97575 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62157 (or (= lt!97575 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!97575 #b0000000000000000000000000000000000000000000000000000000000001000) lt!97575)))))

(assert (=> b!62157 (= lt!97575 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))))))

(assert (= (and d!19196 res!51738) b!62156))

(assert (= (and b!62156 res!51737) b!62157))

(declare-fun m!98313 () Bool)

(assert (=> d!19196 m!98313))

(assert (=> d!19196 m!97753))

(assert (=> b!61867 d!19196))

(declare-fun d!19198 () Bool)

(assert (=> d!19198 (= (array_inv!1167 (buf!1651 thiss!1379)) (bvsge (size!1270 (buf!1651 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!61856 d!19198))

(declare-fun d!19200 () Bool)

(declare-fun res!51741 () Bool)

(declare-fun e!41324 () Bool)

(assert (=> d!19200 (=> (not res!51741) (not e!41324))))

(assert (=> d!19200 (= res!51741 (= (size!1270 (buf!1651 (_1!2913 lt!96861))) (size!1270 (buf!1651 (_2!2912 lt!96864)))))))

(assert (=> d!19200 (= (isPrefixOf!0 (_1!2913 lt!96861) (_2!2912 lt!96864)) e!41324)))

(declare-fun b!62158 () Bool)

(declare-fun res!51739 () Bool)

(assert (=> b!62158 (=> (not res!51739) (not e!41324))))

(assert (=> b!62158 (= res!51739 (bvsle (bitIndex!0 (size!1270 (buf!1651 (_1!2913 lt!96861))) (currentByte!3281 (_1!2913 lt!96861)) (currentBit!3276 (_1!2913 lt!96861))) (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864)))))))

(declare-fun b!62159 () Bool)

(declare-fun e!41323 () Bool)

(assert (=> b!62159 (= e!41324 e!41323)))

(declare-fun res!51740 () Bool)

(assert (=> b!62159 (=> res!51740 e!41323)))

(assert (=> b!62159 (= res!51740 (= (size!1270 (buf!1651 (_1!2913 lt!96861))) #b00000000000000000000000000000000))))

(declare-fun b!62160 () Bool)

(assert (=> b!62160 (= e!41323 (arrayBitRangesEq!0 (buf!1651 (_1!2913 lt!96861)) (buf!1651 (_2!2912 lt!96864)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1270 (buf!1651 (_1!2913 lt!96861))) (currentByte!3281 (_1!2913 lt!96861)) (currentBit!3276 (_1!2913 lt!96861)))))))

(assert (= (and d!19200 res!51741) b!62158))

(assert (= (and b!62158 res!51739) b!62159))

(assert (= (and b!62159 (not res!51740)) b!62160))

(assert (=> b!62158 m!98307))

(assert (=> b!62158 m!97739))

(assert (=> b!62160 m!98307))

(assert (=> b!62160 m!98307))

(declare-fun m!98315 () Bool)

(assert (=> b!62160 m!98315))

(assert (=> b!61866 d!19200))

(declare-fun d!19202 () Bool)

(assert (=> d!19202 (= (head!502 (byteArrayBitContentToList!0 (_2!2912 lt!96874) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!798 (byteArrayBitContentToList!0 (_2!2912 lt!96874) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61855 d!19202))

(declare-fun d!19204 () Bool)

(declare-fun c!4395 () Bool)

(assert (=> d!19204 (= c!4395 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41327 () List!683)

(assert (=> d!19204 (= (byteArrayBitContentToList!0 (_2!2912 lt!96874) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41327)))

(declare-fun b!62165 () Bool)

(assert (=> b!62165 (= e!41327 Nil!680)))

(declare-fun b!62166 () Bool)

(assert (=> b!62166 (= e!41327 (Cons!679 (not (= (bvand ((_ sign_extend 24) (select (arr!1834 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2912 lt!96874) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19204 c!4395) b!62165))

(assert (= (and d!19204 (not c!4395)) b!62166))

(assert (=> b!62166 m!97779))

(declare-fun m!98317 () Bool)

(assert (=> b!62166 m!98317))

(declare-fun m!98319 () Bool)

(assert (=> b!62166 m!98319))

(assert (=> b!61855 d!19204))

(declare-fun d!19206 () Bool)

(assert (=> d!19206 (= (head!502 (bitStreamReadBitsIntoList!0 (_2!2912 lt!96874) (_1!2913 lt!96871) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!798 (bitStreamReadBitsIntoList!0 (_2!2912 lt!96874) (_1!2913 lt!96871) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61855 d!19206))

(declare-fun b!62178 () Bool)

(declare-fun e!41332 () Bool)

(declare-fun lt!97587 () List!683)

(assert (=> b!62178 (= e!41332 (> (length!311 lt!97587) 0))))

(declare-fun b!62177 () Bool)

(declare-fun isEmpty!188 (List!683) Bool)

(assert (=> b!62177 (= e!41332 (isEmpty!188 lt!97587))))

(declare-fun d!19208 () Bool)

(assert (=> d!19208 e!41332))

(declare-fun c!4401 () Bool)

(assert (=> d!19208 (= c!4401 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5624 0))(
  ( (tuple2!5625 (_1!2923 List!683) (_2!2923 BitStream!2216)) )
))
(declare-fun e!41333 () tuple2!5624)

(assert (=> d!19208 (= lt!97587 (_1!2923 e!41333))))

(declare-fun c!4400 () Bool)

(assert (=> d!19208 (= c!4400 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19208 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19208 (= (bitStreamReadBitsIntoList!0 (_2!2912 lt!96874) (_1!2913 lt!96871) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97587)))

(declare-fun b!62175 () Bool)

(assert (=> b!62175 (= e!41333 (tuple2!5625 Nil!680 (_1!2913 lt!96871)))))

(declare-datatypes ((tuple2!5626 0))(
  ( (tuple2!5627 (_1!2924 Bool) (_2!2924 BitStream!2216)) )
))
(declare-fun lt!97586 () tuple2!5626)

(declare-fun b!62176 () Bool)

(declare-fun lt!97588 () (_ BitVec 64))

(assert (=> b!62176 (= e!41333 (tuple2!5625 (Cons!679 (_1!2924 lt!97586) (bitStreamReadBitsIntoList!0 (_2!2912 lt!96874) (_2!2924 lt!97586) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!97588))) (_2!2924 lt!97586)))))

(declare-fun readBit!0 (BitStream!2216) tuple2!5626)

(assert (=> b!62176 (= lt!97586 (readBit!0 (_1!2913 lt!96871)))))

(assert (=> b!62176 (= lt!97588 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19208 c!4400) b!62175))

(assert (= (and d!19208 (not c!4400)) b!62176))

(assert (= (and d!19208 c!4401) b!62177))

(assert (= (and d!19208 (not c!4401)) b!62178))

(declare-fun m!98321 () Bool)

(assert (=> b!62178 m!98321))

(declare-fun m!98323 () Bool)

(assert (=> b!62177 m!98323))

(declare-fun m!98325 () Bool)

(assert (=> b!62176 m!98325))

(declare-fun m!98327 () Bool)

(assert (=> b!62176 m!98327))

(assert (=> b!61855 d!19208))

(declare-fun d!19210 () Bool)

(assert (=> d!19210 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 thiss!1379))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 thiss!1379))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4775 () Bool)

(assert (= bs!4775 d!19210))

(declare-fun m!98329 () Bool)

(assert (=> bs!4775 m!98329))

(assert (=> b!61865 d!19210))

(declare-fun d!19212 () Bool)

(assert (=> d!19212 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4776 () Bool)

(assert (= bs!4776 d!19212))

(declare-fun m!98331 () Bool)

(assert (=> bs!4776 m!98331))

(assert (=> b!61864 d!19212))

(declare-fun d!19214 () Bool)

(assert (=> d!19214 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!96869) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874)))) lt!96869))))

(declare-fun bs!4777 () Bool)

(assert (= bs!4777 d!19214))

(declare-fun m!98333 () Bool)

(assert (=> bs!4777 m!98333))

(assert (=> b!61864 d!19214))

(declare-fun b!62182 () Bool)

(declare-fun e!41334 () Bool)

(declare-fun lt!97590 () List!683)

(assert (=> b!62182 (= e!41334 (> (length!311 lt!97590) 0))))

(declare-fun b!62181 () Bool)

(assert (=> b!62181 (= e!41334 (isEmpty!188 lt!97590))))

(declare-fun d!19216 () Bool)

(assert (=> d!19216 e!41334))

(declare-fun c!4403 () Bool)

(assert (=> d!19216 (= c!4403 (= lt!96869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41335 () tuple2!5624)

(assert (=> d!19216 (= lt!97590 (_1!2923 e!41335))))

(declare-fun c!4402 () Bool)

(assert (=> d!19216 (= c!4402 (= lt!96869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19216 (bvsge lt!96869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19216 (= (bitStreamReadBitsIntoList!0 (_2!2912 lt!96864) (_1!2913 lt!96863) lt!96869) lt!97590)))

(declare-fun b!62179 () Bool)

(assert (=> b!62179 (= e!41335 (tuple2!5625 Nil!680 (_1!2913 lt!96863)))))

(declare-fun lt!97589 () tuple2!5626)

(declare-fun b!62180 () Bool)

(declare-fun lt!97591 () (_ BitVec 64))

(assert (=> b!62180 (= e!41335 (tuple2!5625 (Cons!679 (_1!2924 lt!97589) (bitStreamReadBitsIntoList!0 (_2!2912 lt!96864) (_2!2924 lt!97589) (bvsub lt!96869 lt!97591))) (_2!2924 lt!97589)))))

(assert (=> b!62180 (= lt!97589 (readBit!0 (_1!2913 lt!96863)))))

(assert (=> b!62180 (= lt!97591 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19216 c!4402) b!62179))

(assert (= (and d!19216 (not c!4402)) b!62180))

(assert (= (and d!19216 c!4403) b!62181))

(assert (= (and d!19216 (not c!4403)) b!62182))

(declare-fun m!98335 () Bool)

(assert (=> b!62182 m!98335))

(declare-fun m!98337 () Bool)

(assert (=> b!62181 m!98337))

(declare-fun m!98339 () Bool)

(assert (=> b!62180 m!98339))

(declare-fun m!98341 () Bool)

(assert (=> b!62180 m!98341))

(assert (=> b!61864 d!19216))

(declare-fun b!62186 () Bool)

(declare-fun e!41336 () Bool)

(declare-fun lt!97593 () List!683)

(assert (=> b!62186 (= e!41336 (> (length!311 lt!97593) 0))))

(declare-fun b!62185 () Bool)

(assert (=> b!62185 (= e!41336 (isEmpty!188 lt!97593))))

(declare-fun d!19218 () Bool)

(assert (=> d!19218 e!41336))

(declare-fun c!4405 () Bool)

(assert (=> d!19218 (= c!4405 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41337 () tuple2!5624)

(assert (=> d!19218 (= lt!97593 (_1!2923 e!41337))))

(declare-fun c!4404 () Bool)

(assert (=> d!19218 (= c!4404 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19218 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19218 (= (bitStreamReadBitsIntoList!0 (_2!2912 lt!96864) (_1!2913 lt!96861) (bvsub to!314 i!635)) lt!97593)))

(declare-fun b!62183 () Bool)

(assert (=> b!62183 (= e!41337 (tuple2!5625 Nil!680 (_1!2913 lt!96861)))))

(declare-fun lt!97594 () (_ BitVec 64))

(declare-fun b!62184 () Bool)

(declare-fun lt!97592 () tuple2!5626)

(assert (=> b!62184 (= e!41337 (tuple2!5625 (Cons!679 (_1!2924 lt!97592) (bitStreamReadBitsIntoList!0 (_2!2912 lt!96864) (_2!2924 lt!97592) (bvsub (bvsub to!314 i!635) lt!97594))) (_2!2924 lt!97592)))))

(assert (=> b!62184 (= lt!97592 (readBit!0 (_1!2913 lt!96861)))))

(assert (=> b!62184 (= lt!97594 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19218 c!4404) b!62183))

(assert (= (and d!19218 (not c!4404)) b!62184))

(assert (= (and d!19218 c!4405) b!62185))

(assert (= (and d!19218 (not c!4405)) b!62186))

(declare-fun m!98343 () Bool)

(assert (=> b!62186 m!98343))

(declare-fun m!98345 () Bool)

(assert (=> b!62185 m!98345))

(declare-fun m!98347 () Bool)

(assert (=> b!62184 m!98347))

(declare-fun m!98349 () Bool)

(assert (=> b!62184 m!98349))

(assert (=> b!61864 d!19218))

(declare-fun b!62187 () Bool)

(declare-fun res!51743 () Bool)

(declare-fun e!41339 () Bool)

(assert (=> b!62187 (=> (not res!51743) (not e!41339))))

(declare-fun lt!97608 () tuple2!5604)

(assert (=> b!62187 (= res!51743 (isPrefixOf!0 (_2!2913 lt!97608) (_2!2912 lt!96864)))))

(declare-fun b!62188 () Bool)

(declare-fun e!41338 () Unit!4211)

(declare-fun lt!97605 () Unit!4211)

(assert (=> b!62188 (= e!41338 lt!97605)))

(declare-fun lt!97613 () (_ BitVec 64))

(assert (=> b!62188 (= lt!97613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97596 () (_ BitVec 64))

(assert (=> b!62188 (= lt!97596 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(assert (=> b!62188 (= lt!97605 (arrayBitRangesEqSymmetric!0 (buf!1651 thiss!1379) (buf!1651 (_2!2912 lt!96864)) lt!97613 lt!97596))))

(assert (=> b!62188 (arrayBitRangesEq!0 (buf!1651 (_2!2912 lt!96864)) (buf!1651 thiss!1379) lt!97613 lt!97596)))

(declare-fun d!19220 () Bool)

(assert (=> d!19220 e!41339))

(declare-fun res!51742 () Bool)

(assert (=> d!19220 (=> (not res!51742) (not e!41339))))

(assert (=> d!19220 (= res!51742 (isPrefixOf!0 (_1!2913 lt!97608) (_2!2913 lt!97608)))))

(declare-fun lt!97598 () BitStream!2216)

(assert (=> d!19220 (= lt!97608 (tuple2!5605 lt!97598 (_2!2912 lt!96864)))))

(declare-fun lt!97614 () Unit!4211)

(declare-fun lt!97600 () Unit!4211)

(assert (=> d!19220 (= lt!97614 lt!97600)))

(assert (=> d!19220 (isPrefixOf!0 lt!97598 (_2!2912 lt!96864))))

(assert (=> d!19220 (= lt!97600 (lemmaIsPrefixTransitive!0 lt!97598 (_2!2912 lt!96864) (_2!2912 lt!96864)))))

(declare-fun lt!97610 () Unit!4211)

(declare-fun lt!97612 () Unit!4211)

(assert (=> d!19220 (= lt!97610 lt!97612)))

(assert (=> d!19220 (isPrefixOf!0 lt!97598 (_2!2912 lt!96864))))

(assert (=> d!19220 (= lt!97612 (lemmaIsPrefixTransitive!0 lt!97598 thiss!1379 (_2!2912 lt!96864)))))

(declare-fun lt!97597 () Unit!4211)

(assert (=> d!19220 (= lt!97597 e!41338)))

(declare-fun c!4406 () Bool)

(assert (=> d!19220 (= c!4406 (not (= (size!1270 (buf!1651 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!97603 () Unit!4211)

(declare-fun lt!97604 () Unit!4211)

(assert (=> d!19220 (= lt!97603 lt!97604)))

(assert (=> d!19220 (isPrefixOf!0 (_2!2912 lt!96864) (_2!2912 lt!96864))))

(assert (=> d!19220 (= lt!97604 (lemmaIsPrefixRefl!0 (_2!2912 lt!96864)))))

(declare-fun lt!97606 () Unit!4211)

(declare-fun lt!97599 () Unit!4211)

(assert (=> d!19220 (= lt!97606 lt!97599)))

(assert (=> d!19220 (= lt!97599 (lemmaIsPrefixRefl!0 (_2!2912 lt!96864)))))

(declare-fun lt!97601 () Unit!4211)

(declare-fun lt!97595 () Unit!4211)

(assert (=> d!19220 (= lt!97601 lt!97595)))

(assert (=> d!19220 (isPrefixOf!0 lt!97598 lt!97598)))

(assert (=> d!19220 (= lt!97595 (lemmaIsPrefixRefl!0 lt!97598))))

(declare-fun lt!97609 () Unit!4211)

(declare-fun lt!97607 () Unit!4211)

(assert (=> d!19220 (= lt!97609 lt!97607)))

(assert (=> d!19220 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19220 (= lt!97607 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19220 (= lt!97598 (BitStream!2217 (buf!1651 (_2!2912 lt!96864)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(assert (=> d!19220 (isPrefixOf!0 thiss!1379 (_2!2912 lt!96864))))

(assert (=> d!19220 (= (reader!0 thiss!1379 (_2!2912 lt!96864)) lt!97608)))

(declare-fun b!62189 () Bool)

(declare-fun res!51744 () Bool)

(assert (=> b!62189 (=> (not res!51744) (not e!41339))))

(assert (=> b!62189 (= res!51744 (isPrefixOf!0 (_1!2913 lt!97608) thiss!1379))))

(declare-fun b!62190 () Bool)

(declare-fun lt!97611 () (_ BitVec 64))

(declare-fun lt!97602 () (_ BitVec 64))

(assert (=> b!62190 (= e!41339 (= (_1!2913 lt!97608) (withMovedBitIndex!0 (_2!2913 lt!97608) (bvsub lt!97602 lt!97611))))))

(assert (=> b!62190 (or (= (bvand lt!97602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97602 lt!97611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62190 (= lt!97611 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864))))))

(assert (=> b!62190 (= lt!97602 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(declare-fun b!62191 () Bool)

(declare-fun Unit!4241 () Unit!4211)

(assert (=> b!62191 (= e!41338 Unit!4241)))

(assert (= (and d!19220 c!4406) b!62188))

(assert (= (and d!19220 (not c!4406)) b!62191))

(assert (= (and d!19220 res!51742) b!62189))

(assert (= (and b!62189 res!51744) b!62187))

(assert (= (and b!62187 res!51743) b!62190))

(declare-fun m!98351 () Bool)

(assert (=> d!19220 m!98351))

(assert (=> d!19220 m!97775))

(declare-fun m!98353 () Bool)

(assert (=> d!19220 m!98353))

(assert (=> d!19220 m!97757))

(declare-fun m!98355 () Bool)

(assert (=> d!19220 m!98355))

(declare-fun m!98357 () Bool)

(assert (=> d!19220 m!98357))

(declare-fun m!98359 () Bool)

(assert (=> d!19220 m!98359))

(declare-fun m!98361 () Bool)

(assert (=> d!19220 m!98361))

(declare-fun m!98363 () Bool)

(assert (=> d!19220 m!98363))

(assert (=> d!19220 m!97755))

(declare-fun m!98365 () Bool)

(assert (=> d!19220 m!98365))

(declare-fun m!98367 () Bool)

(assert (=> b!62190 m!98367))

(assert (=> b!62190 m!97739))

(assert (=> b!62190 m!97759))

(declare-fun m!98369 () Bool)

(assert (=> b!62187 m!98369))

(assert (=> b!62188 m!97759))

(declare-fun m!98371 () Bool)

(assert (=> b!62188 m!98371))

(declare-fun m!98373 () Bool)

(assert (=> b!62188 m!98373))

(declare-fun m!98375 () Bool)

(assert (=> b!62189 m!98375))

(assert (=> b!61864 d!19220))

(declare-fun d!19222 () Bool)

(assert (=> d!19222 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!96869)))

(declare-fun lt!97615 () Unit!4211)

(assert (=> d!19222 (= lt!97615 (choose!9 (_2!2912 lt!96874) (buf!1651 (_2!2912 lt!96864)) lt!96869 (BitStream!2217 (buf!1651 (_2!2912 lt!96864)) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874)))))))

(assert (=> d!19222 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2912 lt!96874) (buf!1651 (_2!2912 lt!96864)) lt!96869) lt!97615)))

(declare-fun bs!4778 () Bool)

(assert (= bs!4778 d!19222))

(assert (=> bs!4778 m!97721))

(declare-fun m!98377 () Bool)

(assert (=> bs!4778 m!98377))

(assert (=> b!61864 d!19222))

(declare-fun d!19224 () Bool)

(assert (=> d!19224 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!97616 () Unit!4211)

(assert (=> d!19224 (= lt!97616 (choose!9 thiss!1379 (buf!1651 (_2!2912 lt!96864)) (bvsub to!314 i!635) (BitStream!2217 (buf!1651 (_2!2912 lt!96864)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379))))))

(assert (=> d!19224 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1651 (_2!2912 lt!96864)) (bvsub to!314 i!635)) lt!97616)))

(declare-fun bs!4779 () Bool)

(assert (= bs!4779 d!19224))

(assert (=> bs!4779 m!97733))

(declare-fun m!98379 () Bool)

(assert (=> bs!4779 m!98379))

(assert (=> b!61864 d!19224))

(declare-fun b!62192 () Bool)

(declare-fun res!51746 () Bool)

(declare-fun e!41341 () Bool)

(assert (=> b!62192 (=> (not res!51746) (not e!41341))))

(declare-fun lt!97630 () tuple2!5604)

(assert (=> b!62192 (= res!51746 (isPrefixOf!0 (_2!2913 lt!97630) (_2!2912 lt!96864)))))

(declare-fun b!62193 () Bool)

(declare-fun e!41340 () Unit!4211)

(declare-fun lt!97627 () Unit!4211)

(assert (=> b!62193 (= e!41340 lt!97627)))

(declare-fun lt!97635 () (_ BitVec 64))

(assert (=> b!62193 (= lt!97635 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97618 () (_ BitVec 64))

(assert (=> b!62193 (= lt!97618 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))))))

(assert (=> b!62193 (= lt!97627 (arrayBitRangesEqSymmetric!0 (buf!1651 (_2!2912 lt!96874)) (buf!1651 (_2!2912 lt!96864)) lt!97635 lt!97618))))

(assert (=> b!62193 (arrayBitRangesEq!0 (buf!1651 (_2!2912 lt!96864)) (buf!1651 (_2!2912 lt!96874)) lt!97635 lt!97618)))

(declare-fun d!19226 () Bool)

(assert (=> d!19226 e!41341))

(declare-fun res!51745 () Bool)

(assert (=> d!19226 (=> (not res!51745) (not e!41341))))

(assert (=> d!19226 (= res!51745 (isPrefixOf!0 (_1!2913 lt!97630) (_2!2913 lt!97630)))))

(declare-fun lt!97620 () BitStream!2216)

(assert (=> d!19226 (= lt!97630 (tuple2!5605 lt!97620 (_2!2912 lt!96864)))))

(declare-fun lt!97636 () Unit!4211)

(declare-fun lt!97622 () Unit!4211)

(assert (=> d!19226 (= lt!97636 lt!97622)))

(assert (=> d!19226 (isPrefixOf!0 lt!97620 (_2!2912 lt!96864))))

(assert (=> d!19226 (= lt!97622 (lemmaIsPrefixTransitive!0 lt!97620 (_2!2912 lt!96864) (_2!2912 lt!96864)))))

(declare-fun lt!97632 () Unit!4211)

(declare-fun lt!97634 () Unit!4211)

(assert (=> d!19226 (= lt!97632 lt!97634)))

(assert (=> d!19226 (isPrefixOf!0 lt!97620 (_2!2912 lt!96864))))

(assert (=> d!19226 (= lt!97634 (lemmaIsPrefixTransitive!0 lt!97620 (_2!2912 lt!96874) (_2!2912 lt!96864)))))

(declare-fun lt!97619 () Unit!4211)

(assert (=> d!19226 (= lt!97619 e!41340)))

(declare-fun c!4407 () Bool)

(assert (=> d!19226 (= c!4407 (not (= (size!1270 (buf!1651 (_2!2912 lt!96874))) #b00000000000000000000000000000000)))))

(declare-fun lt!97625 () Unit!4211)

(declare-fun lt!97626 () Unit!4211)

(assert (=> d!19226 (= lt!97625 lt!97626)))

(assert (=> d!19226 (isPrefixOf!0 (_2!2912 lt!96864) (_2!2912 lt!96864))))

(assert (=> d!19226 (= lt!97626 (lemmaIsPrefixRefl!0 (_2!2912 lt!96864)))))

(declare-fun lt!97628 () Unit!4211)

(declare-fun lt!97621 () Unit!4211)

(assert (=> d!19226 (= lt!97628 lt!97621)))

(assert (=> d!19226 (= lt!97621 (lemmaIsPrefixRefl!0 (_2!2912 lt!96864)))))

(declare-fun lt!97623 () Unit!4211)

(declare-fun lt!97617 () Unit!4211)

(assert (=> d!19226 (= lt!97623 lt!97617)))

(assert (=> d!19226 (isPrefixOf!0 lt!97620 lt!97620)))

(assert (=> d!19226 (= lt!97617 (lemmaIsPrefixRefl!0 lt!97620))))

(declare-fun lt!97631 () Unit!4211)

(declare-fun lt!97629 () Unit!4211)

(assert (=> d!19226 (= lt!97631 lt!97629)))

(assert (=> d!19226 (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!96874))))

(assert (=> d!19226 (= lt!97629 (lemmaIsPrefixRefl!0 (_2!2912 lt!96874)))))

(assert (=> d!19226 (= lt!97620 (BitStream!2217 (buf!1651 (_2!2912 lt!96864)) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))))))

(assert (=> d!19226 (isPrefixOf!0 (_2!2912 lt!96874) (_2!2912 lt!96864))))

(assert (=> d!19226 (= (reader!0 (_2!2912 lt!96874) (_2!2912 lt!96864)) lt!97630)))

(declare-fun b!62194 () Bool)

(declare-fun res!51747 () Bool)

(assert (=> b!62194 (=> (not res!51747) (not e!41341))))

(assert (=> b!62194 (= res!51747 (isPrefixOf!0 (_1!2913 lt!97630) (_2!2912 lt!96874)))))

(declare-fun lt!97633 () (_ BitVec 64))

(declare-fun b!62195 () Bool)

(declare-fun lt!97624 () (_ BitVec 64))

(assert (=> b!62195 (= e!41341 (= (_1!2913 lt!97630) (withMovedBitIndex!0 (_2!2913 lt!97630) (bvsub lt!97624 lt!97633))))))

(assert (=> b!62195 (or (= (bvand lt!97624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97633 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97624 lt!97633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62195 (= lt!97633 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864))))))

(assert (=> b!62195 (= lt!97624 (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874))))))

(declare-fun b!62196 () Bool)

(declare-fun Unit!4242 () Unit!4211)

(assert (=> b!62196 (= e!41340 Unit!4242)))

(assert (= (and d!19226 c!4407) b!62193))

(assert (= (and d!19226 (not c!4407)) b!62196))

(assert (= (and d!19226 res!51745) b!62194))

(assert (= (and b!62194 res!51747) b!62192))

(assert (= (and b!62192 res!51746) b!62195))

(declare-fun m!98381 () Bool)

(assert (=> d!19226 m!98381))

(assert (=> d!19226 m!97765))

(declare-fun m!98383 () Bool)

(assert (=> d!19226 m!98383))

(assert (=> d!19226 m!98275))

(declare-fun m!98385 () Bool)

(assert (=> d!19226 m!98385))

(declare-fun m!98387 () Bool)

(assert (=> d!19226 m!98387))

(assert (=> d!19226 m!98359))

(assert (=> d!19226 m!98361))

(declare-fun m!98389 () Bool)

(assert (=> d!19226 m!98389))

(assert (=> d!19226 m!98273))

(declare-fun m!98391 () Bool)

(assert (=> d!19226 m!98391))

(declare-fun m!98393 () Bool)

(assert (=> b!62195 m!98393))

(assert (=> b!62195 m!97739))

(assert (=> b!62195 m!97709))

(declare-fun m!98395 () Bool)

(assert (=> b!62192 m!98395))

(assert (=> b!62193 m!97709))

(declare-fun m!98397 () Bool)

(assert (=> b!62193 m!98397))

(declare-fun m!98399 () Bool)

(assert (=> b!62193 m!98399))

(declare-fun m!98401 () Bool)

(assert (=> b!62194 m!98401))

(assert (=> b!61864 d!19226))

(declare-fun d!19228 () Bool)

(declare-fun res!51750 () Bool)

(declare-fun e!41343 () Bool)

(assert (=> d!19228 (=> (not res!51750) (not e!41343))))

(assert (=> d!19228 (= res!51750 (= (size!1270 (buf!1651 thiss!1379)) (size!1270 (buf!1651 thiss!1379))))))

(assert (=> d!19228 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41343)))

(declare-fun b!62197 () Bool)

(declare-fun res!51748 () Bool)

(assert (=> b!62197 (=> (not res!51748) (not e!41343))))

(assert (=> b!62197 (= res!51748 (bvsle (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)) (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379))))))

(declare-fun b!62198 () Bool)

(declare-fun e!41342 () Bool)

(assert (=> b!62198 (= e!41343 e!41342)))

(declare-fun res!51749 () Bool)

(assert (=> b!62198 (=> res!51749 e!41342)))

(assert (=> b!62198 (= res!51749 (= (size!1270 (buf!1651 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62199 () Bool)

(assert (=> b!62199 (= e!41342 (arrayBitRangesEq!0 (buf!1651 thiss!1379) (buf!1651 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379))))))

(assert (= (and d!19228 res!51750) b!62197))

(assert (= (and b!62197 res!51748) b!62198))

(assert (= (and b!62198 (not res!51749)) b!62199))

(assert (=> b!62197 m!97759))

(assert (=> b!62197 m!97759))

(assert (=> b!62199 m!97759))

(assert (=> b!62199 m!97759))

(declare-fun m!98403 () Bool)

(assert (=> b!62199 m!98403))

(assert (=> b!61853 d!19228))

(declare-fun d!19230 () Bool)

(assert (=> d!19230 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!97639 () Unit!4211)

(declare-fun choose!11 (BitStream!2216) Unit!4211)

(assert (=> d!19230 (= lt!97639 (choose!11 thiss!1379))))

(assert (=> d!19230 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!97639)))

(declare-fun bs!4781 () Bool)

(assert (= bs!4781 d!19230))

(assert (=> bs!4781 m!97755))

(declare-fun m!98405 () Bool)

(assert (=> bs!4781 m!98405))

(assert (=> b!61853 d!19230))

(declare-fun d!19232 () Bool)

(declare-fun e!41344 () Bool)

(assert (=> d!19232 e!41344))

(declare-fun res!51752 () Bool)

(assert (=> d!19232 (=> (not res!51752) (not e!41344))))

(declare-fun lt!97645 () (_ BitVec 64))

(declare-fun lt!97643 () (_ BitVec 64))

(declare-fun lt!97642 () (_ BitVec 64))

(assert (=> d!19232 (= res!51752 (= lt!97642 (bvsub lt!97643 lt!97645)))))

(assert (=> d!19232 (or (= (bvand lt!97643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97645 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97643 lt!97645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19232 (= lt!97645 (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 thiss!1379))) ((_ sign_extend 32) (currentByte!3281 thiss!1379)) ((_ sign_extend 32) (currentBit!3276 thiss!1379))))))

(declare-fun lt!97640 () (_ BitVec 64))

(declare-fun lt!97644 () (_ BitVec 64))

(assert (=> d!19232 (= lt!97643 (bvmul lt!97640 lt!97644))))

(assert (=> d!19232 (or (= lt!97640 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!97644 (bvsdiv (bvmul lt!97640 lt!97644) lt!97640)))))

(assert (=> d!19232 (= lt!97644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19232 (= lt!97640 ((_ sign_extend 32) (size!1270 (buf!1651 thiss!1379))))))

(assert (=> d!19232 (= lt!97642 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3281 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3276 thiss!1379))))))

(assert (=> d!19232 (invariant!0 (currentBit!3276 thiss!1379) (currentByte!3281 thiss!1379) (size!1270 (buf!1651 thiss!1379)))))

(assert (=> d!19232 (= (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)) lt!97642)))

(declare-fun b!62200 () Bool)

(declare-fun res!51751 () Bool)

(assert (=> b!62200 (=> (not res!51751) (not e!41344))))

(assert (=> b!62200 (= res!51751 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!97642))))

(declare-fun b!62201 () Bool)

(declare-fun lt!97641 () (_ BitVec 64))

(assert (=> b!62201 (= e!41344 (bvsle lt!97642 (bvmul lt!97641 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62201 (or (= lt!97641 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!97641 #b0000000000000000000000000000000000000000000000000000000000001000) lt!97641)))))

(assert (=> b!62201 (= lt!97641 ((_ sign_extend 32) (size!1270 (buf!1651 thiss!1379))))))

(assert (= (and d!19232 res!51752) b!62200))

(assert (= (and b!62200 res!51751) b!62201))

(assert (=> d!19232 m!98329))

(assert (=> d!19232 m!97801))

(assert (=> b!61853 d!19232))

(declare-fun d!19234 () Bool)

(declare-fun size!1273 (List!683) Int)

(assert (=> d!19234 (= (length!311 lt!96859) (size!1273 lt!96859))))

(declare-fun bs!4782 () Bool)

(assert (= bs!4782 d!19234))

(declare-fun m!98407 () Bool)

(assert (=> bs!4782 m!98407))

(assert (=> b!61863 d!19234))

(declare-fun d!19236 () Bool)

(declare-fun res!51755 () Bool)

(declare-fun e!41346 () Bool)

(assert (=> d!19236 (=> (not res!51755) (not e!41346))))

(assert (=> d!19236 (= res!51755 (= (size!1270 (buf!1651 thiss!1379)) (size!1270 (buf!1651 (_2!2912 lt!96874)))))))

(assert (=> d!19236 (= (isPrefixOf!0 thiss!1379 (_2!2912 lt!96874)) e!41346)))

(declare-fun b!62202 () Bool)

(declare-fun res!51753 () Bool)

(assert (=> b!62202 (=> (not res!51753) (not e!41346))))

(assert (=> b!62202 (= res!51753 (bvsle (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)) (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96874))) (currentByte!3281 (_2!2912 lt!96874)) (currentBit!3276 (_2!2912 lt!96874)))))))

(declare-fun b!62203 () Bool)

(declare-fun e!41345 () Bool)

(assert (=> b!62203 (= e!41346 e!41345)))

(declare-fun res!51754 () Bool)

(assert (=> b!62203 (=> res!51754 e!41345)))

(assert (=> b!62203 (= res!51754 (= (size!1270 (buf!1651 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62204 () Bool)

(assert (=> b!62204 (= e!41345 (arrayBitRangesEq!0 (buf!1651 thiss!1379) (buf!1651 (_2!2912 lt!96874)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379))))))

(assert (= (and d!19236 res!51755) b!62202))

(assert (= (and b!62202 res!51753) b!62203))

(assert (= (and b!62203 (not res!51754)) b!62204))

(assert (=> b!62202 m!97759))

(assert (=> b!62202 m!97709))

(assert (=> b!62204 m!97759))

(assert (=> b!62204 m!97759))

(declare-fun m!98409 () Bool)

(assert (=> b!62204 m!98409))

(assert (=> b!61862 d!19236))

(declare-fun d!19238 () Bool)

(assert (=> d!19238 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) lt!96869) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874)))) lt!96869))))

(declare-fun bs!4783 () Bool)

(assert (= bs!4783 d!19238))

(assert (=> bs!4783 m!98313))

(assert (=> b!61862 d!19238))

(declare-fun d!19240 () Bool)

(declare-fun e!41349 () Bool)

(assert (=> d!19240 e!41349))

(declare-fun res!51758 () Bool)

(assert (=> d!19240 (=> (not res!51758) (not e!41349))))

(assert (=> d!19240 (= res!51758 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!97648 () Unit!4211)

(declare-fun choose!27 (BitStream!2216 BitStream!2216 (_ BitVec 64) (_ BitVec 64)) Unit!4211)

(assert (=> d!19240 (= lt!97648 (choose!27 thiss!1379 (_2!2912 lt!96874) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19240 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19240 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2912 lt!96874) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97648)))

(declare-fun b!62207 () Bool)

(assert (=> b!62207 (= e!41349 (validate_offset_bits!1 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96874)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96874))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96874))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19240 res!51758) b!62207))

(declare-fun m!98411 () Bool)

(assert (=> d!19240 m!98411))

(declare-fun m!98413 () Bool)

(assert (=> b!62207 m!98413))

(assert (=> b!61862 d!19240))

(declare-fun b!62265 () Bool)

(declare-fun res!51813 () Bool)

(declare-fun e!41377 () Bool)

(assert (=> b!62265 (=> (not res!51813) (not e!41377))))

(declare-fun lt!97842 () tuple2!5602)

(declare-fun lt!97843 () (_ BitVec 64))

(declare-fun lt!97846 () (_ BitVec 64))

(assert (=> b!62265 (= res!51813 (= (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97842))) (currentByte!3281 (_2!2912 lt!97842)) (currentBit!3276 (_2!2912 lt!97842))) (bvadd lt!97846 lt!97843)))))

(assert (=> b!62265 (or (not (= (bvand lt!97846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97843 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!97846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!97846 lt!97843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62265 (= lt!97843 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!62265 (= lt!97846 (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)))))

(declare-fun b!62266 () Bool)

(declare-fun res!51811 () Bool)

(declare-fun e!41379 () Bool)

(assert (=> b!62266 (=> (not res!51811) (not e!41379))))

(declare-fun lt!97836 () tuple2!5602)

(assert (=> b!62266 (= res!51811 (isPrefixOf!0 thiss!1379 (_2!2912 lt!97836)))))

(declare-fun b!62267 () Bool)

(declare-fun res!51814 () Bool)

(assert (=> b!62267 (=> (not res!51814) (not e!41377))))

(assert (=> b!62267 (= res!51814 (isPrefixOf!0 thiss!1379 (_2!2912 lt!97842)))))

(declare-fun b!62269 () Bool)

(declare-fun e!41376 () Bool)

(declare-datatypes ((tuple2!5628 0))(
  ( (tuple2!5629 (_1!2925 BitStream!2216) (_2!2925 Bool)) )
))
(declare-fun lt!97839 () tuple2!5628)

(assert (=> b!62269 (= e!41376 (= (bitIndex!0 (size!1270 (buf!1651 (_1!2925 lt!97839))) (currentByte!3281 (_1!2925 lt!97839)) (currentBit!3276 (_1!2925 lt!97839))) (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97842))) (currentByte!3281 (_2!2912 lt!97842)) (currentBit!3276 (_2!2912 lt!97842)))))))

(declare-fun b!62270 () Bool)

(declare-fun e!41378 () Bool)

(assert (=> b!62270 (= e!41379 e!41378)))

(declare-fun res!51807 () Bool)

(assert (=> b!62270 (=> (not res!51807) (not e!41378))))

(declare-fun lt!97844 () Bool)

(declare-fun lt!97841 () tuple2!5628)

(assert (=> b!62270 (= res!51807 (and (= (_2!2925 lt!97841) lt!97844) (= (_1!2925 lt!97841) (_2!2912 lt!97836))))))

(declare-fun readBitPure!0 (BitStream!2216) tuple2!5628)

(declare-fun readerFrom!0 (BitStream!2216 (_ BitVec 32) (_ BitVec 32)) BitStream!2216)

(assert (=> b!62270 (= lt!97841 (readBitPure!0 (readerFrom!0 (_2!2912 lt!97836) (currentBit!3276 thiss!1379) (currentByte!3281 thiss!1379))))))

(declare-fun b!62268 () Bool)

(assert (=> b!62268 (= e!41377 e!41376)))

(declare-fun res!51809 () Bool)

(assert (=> b!62268 (=> (not res!51809) (not e!41376))))

(declare-fun lt!97835 () (_ BitVec 8))

(assert (=> b!62268 (= res!51809 (and (= (_2!2925 lt!97839) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1834 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!97835)) #b00000000000000000000000000000000))) (= (_1!2925 lt!97839) (_2!2912 lt!97842))))))

(declare-fun lt!97838 () tuple2!5616)

(declare-fun lt!97845 () BitStream!2216)

(assert (=> b!62268 (= lt!97838 (readBits!0 lt!97845 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!62268 (= lt!97839 (readBitPure!0 lt!97845))))

(assert (=> b!62268 (= lt!97845 (readerFrom!0 (_2!2912 lt!97842) (currentBit!3276 thiss!1379) (currentByte!3281 thiss!1379)))))

(declare-fun d!19242 () Bool)

(assert (=> d!19242 e!41377))

(declare-fun res!51810 () Bool)

(assert (=> d!19242 (=> (not res!51810) (not e!41377))))

(assert (=> d!19242 (= res!51810 (= (size!1270 (buf!1651 (_2!2912 lt!97842))) (size!1270 (buf!1651 thiss!1379))))))

(declare-fun lt!97837 () array!2783)

(assert (=> d!19242 (= lt!97835 (select (arr!1834 lt!97837) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19242 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1270 lt!97837)))))

(assert (=> d!19242 (= lt!97837 (array!2784 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!97840 () tuple2!5602)

(assert (=> d!19242 (= lt!97842 (tuple2!5603 (_1!2912 lt!97840) (_2!2912 lt!97840)))))

(assert (=> d!19242 (= lt!97840 lt!97836)))

(assert (=> d!19242 e!41379))

(declare-fun res!51808 () Bool)

(assert (=> d!19242 (=> (not res!51808) (not e!41379))))

(assert (=> d!19242 (= res!51808 (= (size!1270 (buf!1651 thiss!1379)) (size!1270 (buf!1651 (_2!2912 lt!97836)))))))

(declare-fun appendBit!0 (BitStream!2216 Bool) tuple2!5602)

(assert (=> d!19242 (= lt!97836 (appendBit!0 thiss!1379 lt!97844))))

(assert (=> d!19242 (= lt!97844 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1834 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19242 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19242 (= (appendBitFromByte!0 thiss!1379 (select (arr!1834 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!97842)))

(declare-fun b!62271 () Bool)

(assert (=> b!62271 (= e!41378 (= (bitIndex!0 (size!1270 (buf!1651 (_1!2925 lt!97841))) (currentByte!3281 (_1!2925 lt!97841)) (currentBit!3276 (_1!2925 lt!97841))) (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97836))) (currentByte!3281 (_2!2912 lt!97836)) (currentBit!3276 (_2!2912 lt!97836)))))))

(declare-fun b!62272 () Bool)

(declare-fun res!51812 () Bool)

(assert (=> b!62272 (=> (not res!51812) (not e!41379))))

(assert (=> b!62272 (= res!51812 (= (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!97836))) (currentByte!3281 (_2!2912 lt!97836)) (currentBit!3276 (_2!2912 lt!97836))) (bvadd (bitIndex!0 (size!1270 (buf!1651 thiss!1379)) (currentByte!3281 thiss!1379) (currentBit!3276 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19242 res!51808) b!62272))

(assert (= (and b!62272 res!51812) b!62266))

(assert (= (and b!62266 res!51811) b!62270))

(assert (= (and b!62270 res!51807) b!62271))

(assert (= (and d!19242 res!51810) b!62265))

(assert (= (and b!62265 res!51813) b!62267))

(assert (= (and b!62267 res!51814) b!62268))

(assert (= (and b!62268 res!51809) b!62269))

(declare-fun m!98535 () Bool)

(assert (=> b!62268 m!98535))

(declare-fun m!98537 () Bool)

(assert (=> b!62268 m!98537))

(declare-fun m!98539 () Bool)

(assert (=> b!62268 m!98539))

(declare-fun m!98541 () Bool)

(assert (=> b!62265 m!98541))

(assert (=> b!62265 m!97759))

(declare-fun m!98543 () Bool)

(assert (=> b!62266 m!98543))

(declare-fun m!98545 () Bool)

(assert (=> b!62270 m!98545))

(assert (=> b!62270 m!98545))

(declare-fun m!98547 () Bool)

(assert (=> b!62270 m!98547))

(declare-fun m!98549 () Bool)

(assert (=> b!62271 m!98549))

(declare-fun m!98551 () Bool)

(assert (=> b!62271 m!98551))

(declare-fun m!98553 () Bool)

(assert (=> d!19242 m!98553))

(declare-fun m!98555 () Bool)

(assert (=> d!19242 m!98555))

(assert (=> d!19242 m!98317))

(assert (=> b!62272 m!98551))

(assert (=> b!62272 m!97759))

(declare-fun m!98557 () Bool)

(assert (=> b!62267 m!98557))

(declare-fun m!98559 () Bool)

(assert (=> b!62269 m!98559))

(assert (=> b!62269 m!98541))

(assert (=> b!61862 d!19242))

(declare-fun d!19264 () Bool)

(assert (=> d!19264 (= (invariant!0 (currentBit!3276 (_2!2912 lt!96864)) (currentByte!3281 (_2!2912 lt!96864)) (size!1270 (buf!1651 (_2!2912 lt!96864)))) (and (bvsge (currentBit!3276 (_2!2912 lt!96864)) #b00000000000000000000000000000000) (bvslt (currentBit!3276 (_2!2912 lt!96864)) #b00000000000000000000000000001000) (bvsge (currentByte!3281 (_2!2912 lt!96864)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3281 (_2!2912 lt!96864)) (size!1270 (buf!1651 (_2!2912 lt!96864)))) (and (= (currentBit!3276 (_2!2912 lt!96864)) #b00000000000000000000000000000000) (= (currentByte!3281 (_2!2912 lt!96864)) (size!1270 (buf!1651 (_2!2912 lt!96864))))))))))

(assert (=> b!61851 d!19264))

(declare-fun d!19266 () Bool)

(assert (=> d!19266 (= (invariant!0 (currentBit!3276 (_2!2912 lt!96874)) (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96874)))) (and (bvsge (currentBit!3276 (_2!2912 lt!96874)) #b00000000000000000000000000000000) (bvslt (currentBit!3276 (_2!2912 lt!96874)) #b00000000000000000000000000001000) (bvsge (currentByte!3281 (_2!2912 lt!96874)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96874)))) (and (= (currentBit!3276 (_2!2912 lt!96874)) #b00000000000000000000000000000000) (= (currentByte!3281 (_2!2912 lt!96874)) (size!1270 (buf!1651 (_2!2912 lt!96874))))))))))

(assert (=> b!61861 d!19266))

(declare-fun d!19268 () Bool)

(declare-fun e!41383 () Bool)

(assert (=> d!19268 e!41383))

(declare-fun res!51816 () Bool)

(assert (=> d!19268 (=> (not res!51816) (not e!41383))))

(declare-fun lt!97852 () (_ BitVec 64))

(declare-fun lt!97850 () (_ BitVec 64))

(declare-fun lt!97849 () (_ BitVec 64))

(assert (=> d!19268 (= res!51816 (= lt!97849 (bvsub lt!97850 lt!97852)))))

(assert (=> d!19268 (or (= (bvand lt!97850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97850 lt!97852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19268 (= lt!97852 (remainingBits!0 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))) ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96864))) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96864)))))))

(declare-fun lt!97847 () (_ BitVec 64))

(declare-fun lt!97851 () (_ BitVec 64))

(assert (=> d!19268 (= lt!97850 (bvmul lt!97847 lt!97851))))

(assert (=> d!19268 (or (= lt!97847 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!97851 (bvsdiv (bvmul lt!97847 lt!97851) lt!97847)))))

(assert (=> d!19268 (= lt!97851 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19268 (= lt!97847 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))))))

(assert (=> d!19268 (= lt!97849 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3281 (_2!2912 lt!96864))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3276 (_2!2912 lt!96864)))))))

(assert (=> d!19268 (invariant!0 (currentBit!3276 (_2!2912 lt!96864)) (currentByte!3281 (_2!2912 lt!96864)) (size!1270 (buf!1651 (_2!2912 lt!96864))))))

(assert (=> d!19268 (= (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864))) lt!97849)))

(declare-fun b!62279 () Bool)

(declare-fun res!51815 () Bool)

(assert (=> b!62279 (=> (not res!51815) (not e!41383))))

(assert (=> b!62279 (= res!51815 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!97849))))

(declare-fun b!62280 () Bool)

(declare-fun lt!97848 () (_ BitVec 64))

(assert (=> b!62280 (= e!41383 (bvsle lt!97849 (bvmul lt!97848 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62280 (or (= lt!97848 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!97848 #b0000000000000000000000000000000000000000000000000000000000001000) lt!97848)))))

(assert (=> b!62280 (= lt!97848 ((_ sign_extend 32) (size!1270 (buf!1651 (_2!2912 lt!96864)))))))

(assert (= (and d!19268 res!51816) b!62279))

(assert (= (and b!62279 res!51815) b!62280))

(declare-fun m!98563 () Bool)

(assert (=> d!19268 m!98563))

(assert (=> d!19268 m!97777))

(assert (=> b!61850 d!19268))

(declare-fun d!19274 () Bool)

(declare-fun res!51819 () Bool)

(declare-fun e!41387 () Bool)

(assert (=> d!19274 (=> (not res!51819) (not e!41387))))

(assert (=> d!19274 (= res!51819 (= (size!1270 (buf!1651 (_1!2913 lt!96863))) (size!1270 (buf!1651 (_2!2912 lt!96864)))))))

(assert (=> d!19274 (= (isPrefixOf!0 (_1!2913 lt!96863) (_2!2912 lt!96864)) e!41387)))

(declare-fun b!62285 () Bool)

(declare-fun res!51817 () Bool)

(assert (=> b!62285 (=> (not res!51817) (not e!41387))))

(assert (=> b!62285 (= res!51817 (bvsle (bitIndex!0 (size!1270 (buf!1651 (_1!2913 lt!96863))) (currentByte!3281 (_1!2913 lt!96863)) (currentBit!3276 (_1!2913 lt!96863))) (bitIndex!0 (size!1270 (buf!1651 (_2!2912 lt!96864))) (currentByte!3281 (_2!2912 lt!96864)) (currentBit!3276 (_2!2912 lt!96864)))))))

(declare-fun b!62286 () Bool)

(declare-fun e!41386 () Bool)

(assert (=> b!62286 (= e!41387 e!41386)))

(declare-fun res!51818 () Bool)

(assert (=> b!62286 (=> res!51818 e!41386)))

(assert (=> b!62286 (= res!51818 (= (size!1270 (buf!1651 (_1!2913 lt!96863))) #b00000000000000000000000000000000))))

(declare-fun b!62287 () Bool)

(assert (=> b!62287 (= e!41386 (arrayBitRangesEq!0 (buf!1651 (_1!2913 lt!96863)) (buf!1651 (_2!2912 lt!96864)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1270 (buf!1651 (_1!2913 lt!96863))) (currentByte!3281 (_1!2913 lt!96863)) (currentBit!3276 (_1!2913 lt!96863)))))))

(assert (= (and d!19274 res!51819) b!62285))

(assert (= (and b!62285 res!51817) b!62286))

(assert (= (and b!62286 (not res!51818)) b!62287))

(assert (=> b!62285 m!98309))

(assert (=> b!62285 m!97739))

(assert (=> b!62287 m!98309))

(assert (=> b!62287 m!98309))

(declare-fun m!98573 () Bool)

(assert (=> b!62287 m!98573))

(assert (=> b!61860 d!19274))

(push 1)

(assert (not d!19184))

(assert (not b!62190))

(assert (not b!62204))

(assert (not b!62182))

(assert (not b!62178))

(assert (not b!62193))

(assert (not b!62270))

(assert (not d!19222))

(assert (not b!62142))

(assert (not d!19232))

(assert (not d!19210))

(assert (not b!62188))

(assert (not d!19224))

(assert (not b!62130))

(assert (not b!62144))

(assert (not d!19230))

(assert (not b!62143))

(assert (not b!62151))

(assert (not b!62285))

(assert (not d!19226))

(assert (not b!62195))

(assert (not b!62194))

(assert (not b!62148))

(assert (not b!62180))

(assert (not d!19212))

(assert (not b!62265))

(assert (not d!19076))

(assert (not d!19238))

(assert (not b!62192))

(assert (not b!62207))

(assert (not b!62185))

(assert (not b!62197))

(assert (not d!19196))

(assert (not b!62115))

(assert (not b!62287))

(assert (not b!62272))

(assert (not b!62160))

(assert (not b!62120))

(assert (not b!62118))

(assert (not b!62114))

(assert (not b!62119))

(assert (not b!62268))

(assert (not b!62202))

(assert (not b!62266))

(assert (not b!62181))

(assert (not d!19188))

(assert (not b!62267))

(assert (not bm!784))

(assert (not d!19220))

(assert (not b!62176))

(assert (not d!19240))

(assert (not b!62187))

(assert (not d!19068))

(assert (not d!19242))

(assert (not b!62166))

(assert (not b!62149))

(assert (not b!62189))

(assert (not b!62184))

(assert (not b!62146))

(assert (not d!19186))

(assert (not d!19234))

(assert (not b!62116))

(assert (not b!62177))

(assert (not b!62158))

(assert (not b!62141))

(assert (not b!62199))

(assert (not d!19214))

(assert (not b!62271))

(assert (not b!62269))

(assert (not d!19268))

(assert (not b!62186))

(assert (not d!19072))

(assert (not b!62128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

