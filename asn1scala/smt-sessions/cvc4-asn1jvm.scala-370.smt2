; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8552 () Bool)

(assert start!8552)

(declare-fun b!42680 () Bool)

(declare-fun e!28540 () Bool)

(declare-fun e!28535 () Bool)

(assert (=> b!42680 (= e!28540 (not e!28535))))

(declare-fun res!36309 () Bool)

(assert (=> b!42680 (=> res!36309 e!28535)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!42680 (= res!36309 (bvsge i!635 to!314))))

(declare-datatypes ((array!2196 0))(
  ( (array!2197 (arr!1492 (Array (_ BitVec 32) (_ BitVec 8))) (size!993 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1730 0))(
  ( (BitStream!1731 (buf!1324 array!2196) (currentByte!2788 (_ BitVec 32)) (currentBit!2783 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1730)

(declare-fun isPrefixOf!0 (BitStream!1730 BitStream!1730) Bool)

(assert (=> b!42680 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3040 0))(
  ( (Unit!3041) )
))
(declare-fun lt!64099 () Unit!3040)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1730) Unit!3040)

(assert (=> b!42680 (= lt!64099 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64098 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42680 (= lt!64098 (bitIndex!0 (size!993 (buf!1324 thiss!1379)) (currentByte!2788 thiss!1379) (currentBit!2783 thiss!1379)))))

(declare-fun b!42681 () Bool)

(declare-fun e!28539 () Bool)

(assert (=> b!42681 (= e!28535 e!28539)))

(declare-fun res!36311 () Bool)

(assert (=> b!42681 (=> res!36311 e!28539)))

(declare-datatypes ((tuple2!4194 0))(
  ( (tuple2!4195 (_1!2190 Unit!3040) (_2!2190 BitStream!1730)) )
))
(declare-fun lt!64102 () tuple2!4194)

(assert (=> b!42681 (= res!36311 (not (isPrefixOf!0 thiss!1379 (_2!2190 lt!64102))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42681 (validate_offset_bits!1 ((_ sign_extend 32) (size!993 (buf!1324 (_2!2190 lt!64102)))) ((_ sign_extend 32) (currentByte!2788 (_2!2190 lt!64102))) ((_ sign_extend 32) (currentBit!2783 (_2!2190 lt!64102))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64097 () Unit!3040)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1730 BitStream!1730 (_ BitVec 64) (_ BitVec 64)) Unit!3040)

(assert (=> b!42681 (= lt!64097 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2190 lt!64102) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2196)

(declare-fun appendBitFromByte!0 (BitStream!1730 (_ BitVec 8) (_ BitVec 32)) tuple2!4194)

(assert (=> b!42681 (= lt!64102 (appendBitFromByte!0 thiss!1379 (select (arr!1492 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!42682 () Bool)

(declare-fun e!28534 () Bool)

(declare-fun array_inv!918 (array!2196) Bool)

(assert (=> b!42682 (= e!28534 (array_inv!918 (buf!1324 thiss!1379)))))

(declare-fun b!42683 () Bool)

(declare-fun lt!64096 () tuple2!4194)

(assert (=> b!42683 (= e!28539 (isPrefixOf!0 (_2!2190 lt!64102) (_2!2190 lt!64096)))))

(assert (=> b!42683 (isPrefixOf!0 thiss!1379 (_2!2190 lt!64096))))

(declare-fun lt!64101 () Unit!3040)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1730 BitStream!1730 BitStream!1730) Unit!3040)

(assert (=> b!42683 (= lt!64101 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2190 lt!64102) (_2!2190 lt!64096)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1730 array!2196 (_ BitVec 64) (_ BitVec 64)) tuple2!4194)

(assert (=> b!42683 (= lt!64096 (appendBitsMSBFirstLoop!0 (_2!2190 lt!64102) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!28536 () Bool)

(assert (=> b!42683 e!28536))

(declare-fun res!36312 () Bool)

(assert (=> b!42683 (=> (not res!36312) (not e!28536))))

(assert (=> b!42683 (= res!36312 (validate_offset_bits!1 ((_ sign_extend 32) (size!993 (buf!1324 (_2!2190 lt!64102)))) ((_ sign_extend 32) (currentByte!2788 thiss!1379)) ((_ sign_extend 32) (currentBit!2783 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64100 () Unit!3040)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1730 array!2196 (_ BitVec 64)) Unit!3040)

(assert (=> b!42683 (= lt!64100 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1324 (_2!2190 lt!64102)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4196 0))(
  ( (tuple2!4197 (_1!2191 BitStream!1730) (_2!2191 BitStream!1730)) )
))
(declare-fun lt!64095 () tuple2!4196)

(declare-fun reader!0 (BitStream!1730 BitStream!1730) tuple2!4196)

(assert (=> b!42683 (= lt!64095 (reader!0 thiss!1379 (_2!2190 lt!64102)))))

(declare-fun res!36308 () Bool)

(assert (=> start!8552 (=> (not res!36308) (not e!28540))))

(assert (=> start!8552 (= res!36308 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!993 srcBuffer!2))))))))

(assert (=> start!8552 e!28540))

(assert (=> start!8552 true))

(assert (=> start!8552 (array_inv!918 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1730) Bool)

(assert (=> start!8552 (and (inv!12 thiss!1379) e!28534)))

(declare-fun b!42684 () Bool)

(declare-datatypes ((List!506 0))(
  ( (Nil!503) (Cons!502 (h!621 Bool) (t!1256 List!506)) )
))
(declare-fun head!325 (List!506) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1730 array!2196 (_ BitVec 64) (_ BitVec 64)) List!506)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1730 BitStream!1730 (_ BitVec 64)) List!506)

(assert (=> b!42684 (= e!28536 (= (head!325 (byteArrayBitContentToList!0 (_2!2190 lt!64102) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!325 (bitStreamReadBitsIntoList!0 (_2!2190 lt!64102) (_1!2191 lt!64095) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!42685 () Bool)

(declare-fun res!36310 () Bool)

(assert (=> b!42685 (=> (not res!36310) (not e!28540))))

(assert (=> b!42685 (= res!36310 (validate_offset_bits!1 ((_ sign_extend 32) (size!993 (buf!1324 thiss!1379))) ((_ sign_extend 32) (currentByte!2788 thiss!1379)) ((_ sign_extend 32) (currentBit!2783 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8552 res!36308) b!42685))

(assert (= (and b!42685 res!36310) b!42680))

(assert (= (and b!42680 (not res!36309)) b!42681))

(assert (= (and b!42681 (not res!36311)) b!42683))

(assert (= (and b!42683 res!36312) b!42684))

(assert (= start!8552 b!42682))

(declare-fun m!64743 () Bool)

(assert (=> b!42681 m!64743))

(declare-fun m!64745 () Bool)

(assert (=> b!42681 m!64745))

(declare-fun m!64747 () Bool)

(assert (=> b!42681 m!64747))

(declare-fun m!64749 () Bool)

(assert (=> b!42681 m!64749))

(assert (=> b!42681 m!64747))

(declare-fun m!64751 () Bool)

(assert (=> b!42681 m!64751))

(declare-fun m!64753 () Bool)

(assert (=> b!42684 m!64753))

(assert (=> b!42684 m!64753))

(declare-fun m!64755 () Bool)

(assert (=> b!42684 m!64755))

(declare-fun m!64757 () Bool)

(assert (=> b!42684 m!64757))

(assert (=> b!42684 m!64757))

(declare-fun m!64759 () Bool)

(assert (=> b!42684 m!64759))

(declare-fun m!64761 () Bool)

(assert (=> start!8552 m!64761))

(declare-fun m!64763 () Bool)

(assert (=> start!8552 m!64763))

(declare-fun m!64765 () Bool)

(assert (=> b!42685 m!64765))

(declare-fun m!64767 () Bool)

(assert (=> b!42682 m!64767))

(declare-fun m!64769 () Bool)

(assert (=> b!42680 m!64769))

(declare-fun m!64771 () Bool)

(assert (=> b!42680 m!64771))

(declare-fun m!64773 () Bool)

(assert (=> b!42680 m!64773))

(declare-fun m!64775 () Bool)

(assert (=> b!42683 m!64775))

(declare-fun m!64777 () Bool)

(assert (=> b!42683 m!64777))

(declare-fun m!64779 () Bool)

(assert (=> b!42683 m!64779))

(declare-fun m!64781 () Bool)

(assert (=> b!42683 m!64781))

(declare-fun m!64783 () Bool)

(assert (=> b!42683 m!64783))

(declare-fun m!64785 () Bool)

(assert (=> b!42683 m!64785))

(declare-fun m!64787 () Bool)

(assert (=> b!42683 m!64787))

(push 1)

(assert (not b!42682))

(assert (not b!42681))

(assert (not b!42685))

(assert (not b!42680))

(assert (not b!42683))

(assert (not start!8552))

(assert (not b!42684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

