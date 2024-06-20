; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5994 () Bool)

(assert start!5994)

(declare-fun b!27708 () Bool)

(declare-fun res!23991 () Bool)

(declare-fun e!18705 () Bool)

(assert (=> b!27708 (=> res!23991 e!18705)))

(declare-datatypes ((array!1731 0))(
  ( (array!1732 (arr!1210 (Array (_ BitVec 32) (_ BitVec 8))) (size!748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1328 0))(
  ( (BitStream!1329 (buf!1075 array!1731) (currentByte!2400 (_ BitVec 32)) (currentBit!2395 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3022 0))(
  ( (tuple2!3023 (_1!1598 BitStream!1328) (_2!1598 BitStream!1328)) )
))
(declare-fun lt!39243 () tuple2!3022)

(declare-datatypes ((Unit!2199 0))(
  ( (Unit!2200) )
))
(declare-datatypes ((tuple2!3024 0))(
  ( (tuple2!3025 (_1!1599 Unit!2199) (_2!1599 BitStream!1328)) )
))
(declare-fun lt!39235 () tuple2!3024)

(declare-fun isPrefixOf!0 (BitStream!1328 BitStream!1328) Bool)

(assert (=> b!27708 (= res!23991 (not (isPrefixOf!0 (_1!1598 lt!39243) (_2!1599 lt!39235))))))

(declare-fun res!24003 () Bool)

(declare-fun e!18704 () Bool)

(assert (=> start!5994 (=> (not res!24003) (not e!18704))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!1731)

(assert (=> start!5994 (= res!24003 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!748 srcBuffer!2))))))))

(assert (=> start!5994 e!18704))

(assert (=> start!5994 true))

(declare-fun array_inv!717 (array!1731) Bool)

(assert (=> start!5994 (array_inv!717 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1328)

(declare-fun e!18710 () Bool)

(declare-fun inv!12 (BitStream!1328) Bool)

(assert (=> start!5994 (and (inv!12 thiss!1379) e!18710)))

(declare-fun b!27709 () Bool)

(declare-fun e!18702 () Bool)

(assert (=> b!27709 (= e!18704 (not e!18702))))

(declare-fun res!23996 () Bool)

(assert (=> b!27709 (=> res!23996 e!18702)))

(assert (=> b!27709 (= res!23996 (bvsge i!635 to!314))))

(assert (=> b!27709 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39238 () Unit!2199)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1328) Unit!2199)

(assert (=> b!27709 (= lt!39238 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!39241 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27709 (= lt!39241 (bitIndex!0 (size!748 (buf!1075 thiss!1379)) (currentByte!2400 thiss!1379) (currentBit!2395 thiss!1379)))))

(declare-fun b!27710 () Bool)

(declare-fun e!18701 () Bool)

(declare-fun e!18706 () Bool)

(assert (=> b!27710 (= e!18701 e!18706)))

(declare-fun res!23994 () Bool)

(assert (=> b!27710 (=> res!23994 e!18706)))

(declare-fun lt!39236 () tuple2!3024)

(assert (=> b!27710 (= res!23994 (not (= (size!748 (buf!1075 (_2!1599 lt!39236))) (size!748 (buf!1075 (_2!1599 lt!39235))))))))

(declare-fun e!18709 () Bool)

(assert (=> b!27710 e!18709))

(declare-fun res!24004 () Bool)

(assert (=> b!27710 (=> (not res!24004) (not e!18709))))

(assert (=> b!27710 (= res!24004 (= (size!748 (buf!1075 (_2!1599 lt!39235))) (size!748 (buf!1075 thiss!1379))))))

(declare-fun b!27711 () Bool)

(assert (=> b!27711 (= e!18710 (array_inv!717 (buf!1075 thiss!1379)))))

(declare-fun b!27712 () Bool)

(declare-fun e!18708 () Bool)

(declare-fun e!18711 () Bool)

(assert (=> b!27712 (= e!18708 e!18711)))

(declare-fun res!24005 () Bool)

(assert (=> b!27712 (=> res!24005 e!18711)))

(assert (=> b!27712 (= res!24005 (not (isPrefixOf!0 (_2!1599 lt!39236) (_2!1599 lt!39235))))))

(assert (=> b!27712 (isPrefixOf!0 thiss!1379 (_2!1599 lt!39235))))

(declare-fun lt!39227 () Unit!2199)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1328 BitStream!1328 BitStream!1328) Unit!2199)

(assert (=> b!27712 (= lt!39227 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1599 lt!39236) (_2!1599 lt!39235)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1328 array!1731 (_ BitVec 64) (_ BitVec 64)) tuple2!3024)

(assert (=> b!27712 (= lt!39235 (appendBitsMSBFirstLoop!0 (_2!1599 lt!39236) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18707 () Bool)

(assert (=> b!27712 e!18707))

(declare-fun res!24007 () Bool)

(assert (=> b!27712 (=> (not res!24007) (not e!18707))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27712 (= res!24007 (validate_offset_bits!1 ((_ sign_extend 32) (size!748 (buf!1075 (_2!1599 lt!39236)))) ((_ sign_extend 32) (currentByte!2400 thiss!1379)) ((_ sign_extend 32) (currentBit!2395 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39232 () Unit!2199)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1328 array!1731 (_ BitVec 64)) Unit!2199)

(assert (=> b!27712 (= lt!39232 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1075 (_2!1599 lt!39236)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39229 () tuple2!3022)

(declare-fun reader!0 (BitStream!1328 BitStream!1328) tuple2!3022)

(assert (=> b!27712 (= lt!39229 (reader!0 thiss!1379 (_2!1599 lt!39236)))))

(declare-fun b!27713 () Bool)

(declare-fun res!23993 () Bool)

(assert (=> b!27713 (=> res!23993 e!18701)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27713 (= res!23993 (not (invariant!0 (currentBit!2395 (_2!1599 lt!39235)) (currentByte!2400 (_2!1599 lt!39235)) (size!748 (buf!1075 (_2!1599 lt!39235))))))))

(declare-fun b!27714 () Bool)

(declare-fun res!24009 () Bool)

(assert (=> b!27714 (=> res!24009 e!18705)))

(declare-fun lt!39228 () (_ BitVec 64))

(declare-fun lt!39240 () tuple2!3022)

(assert (=> b!27714 (= res!24009 (or (not (= (buf!1075 (_1!1598 lt!39243)) (buf!1075 (_1!1598 lt!39240)))) (not (= (buf!1075 (_1!1598 lt!39243)) (buf!1075 (_2!1599 lt!39235)))) (bvsge lt!39228 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27715 () Bool)

(declare-datatypes ((List!365 0))(
  ( (Nil!362) (Cons!361 (h!480 Bool) (t!1115 List!365)) )
))
(declare-fun head!202 (List!365) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1328 array!1731 (_ BitVec 64) (_ BitVec 64)) List!365)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1328 BitStream!1328 (_ BitVec 64)) List!365)

(assert (=> b!27715 (= e!18707 (= (head!202 (byteArrayBitContentToList!0 (_2!1599 lt!39236) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!202 (bitStreamReadBitsIntoList!0 (_2!1599 lt!39236) (_1!1598 lt!39229) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27716 () Bool)

(declare-fun res!24006 () Bool)

(assert (=> b!27716 (=> res!24006 e!18706)))

(assert (=> b!27716 (= res!24006 (not (invariant!0 (currentBit!2395 (_2!1599 lt!39236)) (currentByte!2400 (_2!1599 lt!39236)) (size!748 (buf!1075 (_2!1599 lt!39235))))))))

(declare-fun b!27717 () Bool)

(declare-fun res!23995 () Bool)

(assert (=> b!27717 (=> res!23995 e!18705)))

(declare-fun lt!39233 () List!365)

(declare-fun length!91 (List!365) Int)

(assert (=> b!27717 (= res!23995 (<= (length!91 lt!39233) 0))))

(declare-fun b!27718 () Bool)

(declare-fun res!24008 () Bool)

(assert (=> b!27718 (=> (not res!24008) (not e!18704))))

(assert (=> b!27718 (= res!24008 (validate_offset_bits!1 ((_ sign_extend 32) (size!748 (buf!1075 thiss!1379))) ((_ sign_extend 32) (currentByte!2400 thiss!1379)) ((_ sign_extend 32) (currentBit!2395 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27719 () Bool)

(assert (=> b!27719 (= e!18711 e!18701)))

(declare-fun res!23997 () Bool)

(assert (=> b!27719 (=> res!23997 e!18701)))

(assert (=> b!27719 (= res!23997 (not (= lt!39228 (bvsub (bvadd lt!39241 to!314) i!635))))))

(assert (=> b!27719 (= lt!39228 (bitIndex!0 (size!748 (buf!1075 (_2!1599 lt!39235))) (currentByte!2400 (_2!1599 lt!39235)) (currentBit!2395 (_2!1599 lt!39235))))))

(declare-fun b!27720 () Bool)

(assert (=> b!27720 (= e!18702 e!18708)))

(declare-fun res!24000 () Bool)

(assert (=> b!27720 (=> res!24000 e!18708)))

(assert (=> b!27720 (= res!24000 (not (isPrefixOf!0 thiss!1379 (_2!1599 lt!39236))))))

(declare-fun lt!39231 () (_ BitVec 64))

(assert (=> b!27720 (validate_offset_bits!1 ((_ sign_extend 32) (size!748 (buf!1075 (_2!1599 lt!39236)))) ((_ sign_extend 32) (currentByte!2400 (_2!1599 lt!39236))) ((_ sign_extend 32) (currentBit!2395 (_2!1599 lt!39236))) lt!39231)))

(assert (=> b!27720 (= lt!39231 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39234 () Unit!2199)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1328 BitStream!1328 (_ BitVec 64) (_ BitVec 64)) Unit!2199)

(assert (=> b!27720 (= lt!39234 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1599 lt!39236) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1328 (_ BitVec 8) (_ BitVec 32)) tuple2!3024)

(assert (=> b!27720 (= lt!39236 (appendBitFromByte!0 thiss!1379 (select (arr!1210 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27721 () Bool)

(assert (=> b!27721 (= e!18709 (= lt!39228 (bvsub (bvsub (bvadd (bitIndex!0 (size!748 (buf!1075 (_2!1599 lt!39236))) (currentByte!2400 (_2!1599 lt!39236)) (currentBit!2395 (_2!1599 lt!39236))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27722 () Bool)

(assert (=> b!27722 (= e!18705 true)))

(declare-fun lt!39239 () (_ BitVec 64))

(assert (=> b!27722 (= lt!39239 (bitIndex!0 (size!748 (buf!1075 (_1!1598 lt!39240))) (currentByte!2400 (_1!1598 lt!39240)) (currentBit!2395 (_1!1598 lt!39240))))))

(declare-fun lt!39230 () (_ BitVec 64))

(assert (=> b!27722 (= lt!39230 (bitIndex!0 (size!748 (buf!1075 (_1!1598 lt!39243))) (currentByte!2400 (_1!1598 lt!39243)) (currentBit!2395 (_1!1598 lt!39243))))))

(declare-fun b!27723 () Bool)

(declare-fun res!24001 () Bool)

(assert (=> b!27723 (=> res!24001 e!18701)))

(assert (=> b!27723 (= res!24001 (not (= (size!748 (buf!1075 thiss!1379)) (size!748 (buf!1075 (_2!1599 lt!39235))))))))

(declare-fun b!27724 () Bool)

(declare-fun res!24002 () Bool)

(assert (=> b!27724 (=> res!24002 e!18705)))

(assert (=> b!27724 (= res!24002 (not (isPrefixOf!0 (_1!1598 lt!39240) (_2!1599 lt!39235))))))

(declare-fun b!27725 () Bool)

(assert (=> b!27725 (= e!18706 e!18705)))

(declare-fun res!23992 () Bool)

(assert (=> b!27725 (=> res!23992 e!18705)))

(assert (=> b!27725 (= res!23992 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39244 () List!365)

(assert (=> b!27725 (= lt!39244 (bitStreamReadBitsIntoList!0 (_2!1599 lt!39235) (_1!1598 lt!39240) lt!39231))))

(assert (=> b!27725 (= lt!39233 (bitStreamReadBitsIntoList!0 (_2!1599 lt!39235) (_1!1598 lt!39243) (bvsub to!314 i!635)))))

(assert (=> b!27725 (validate_offset_bits!1 ((_ sign_extend 32) (size!748 (buf!1075 (_2!1599 lt!39235)))) ((_ sign_extend 32) (currentByte!2400 (_2!1599 lt!39236))) ((_ sign_extend 32) (currentBit!2395 (_2!1599 lt!39236))) lt!39231)))

(declare-fun lt!39242 () Unit!2199)

(assert (=> b!27725 (= lt!39242 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1599 lt!39236) (buf!1075 (_2!1599 lt!39235)) lt!39231))))

(assert (=> b!27725 (= lt!39240 (reader!0 (_2!1599 lt!39236) (_2!1599 lt!39235)))))

(assert (=> b!27725 (validate_offset_bits!1 ((_ sign_extend 32) (size!748 (buf!1075 (_2!1599 lt!39235)))) ((_ sign_extend 32) (currentByte!2400 thiss!1379)) ((_ sign_extend 32) (currentBit!2395 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39237 () Unit!2199)

(assert (=> b!27725 (= lt!39237 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1075 (_2!1599 lt!39235)) (bvsub to!314 i!635)))))

(assert (=> b!27725 (= lt!39243 (reader!0 thiss!1379 (_2!1599 lt!39235)))))

(declare-fun b!27726 () Bool)

(declare-fun res!23998 () Bool)

(assert (=> b!27726 (=> res!23998 e!18706)))

(assert (=> b!27726 (= res!23998 (not (invariant!0 (currentBit!2395 (_2!1599 lt!39236)) (currentByte!2400 (_2!1599 lt!39236)) (size!748 (buf!1075 (_2!1599 lt!39236))))))))

(declare-fun b!27727 () Bool)

(declare-fun res!23999 () Bool)

(assert (=> b!27727 (=> res!23999 e!18705)))

(assert (=> b!27727 (= res!23999 (not (isPrefixOf!0 (_1!1598 lt!39243) (_1!1598 lt!39240))))))

(assert (= (and start!5994 res!24003) b!27718))

(assert (= (and b!27718 res!24008) b!27709))

(assert (= (and b!27709 (not res!23996)) b!27720))

(assert (= (and b!27720 (not res!24000)) b!27712))

(assert (= (and b!27712 res!24007) b!27715))

(assert (= (and b!27712 (not res!24005)) b!27719))

(assert (= (and b!27719 (not res!23997)) b!27713))

(assert (= (and b!27713 (not res!23993)) b!27723))

(assert (= (and b!27723 (not res!24001)) b!27710))

(assert (= (and b!27710 res!24004) b!27721))

(assert (= (and b!27710 (not res!23994)) b!27726))

(assert (= (and b!27726 (not res!23998)) b!27716))

(assert (= (and b!27716 (not res!24006)) b!27725))

(assert (= (and b!27725 (not res!23992)) b!27717))

(assert (= (and b!27717 (not res!23995)) b!27708))

(assert (= (and b!27708 (not res!23991)) b!27724))

(assert (= (and b!27724 (not res!24002)) b!27727))

(assert (= (and b!27727 (not res!23999)) b!27714))

(assert (= (and b!27714 (not res!24009)) b!27722))

(assert (= start!5994 b!27711))

(declare-fun m!39693 () Bool)

(assert (=> b!27722 m!39693))

(declare-fun m!39695 () Bool)

(assert (=> b!27722 m!39695))

(declare-fun m!39697 () Bool)

(assert (=> b!27711 m!39697))

(declare-fun m!39699 () Bool)

(assert (=> b!27719 m!39699))

(declare-fun m!39701 () Bool)

(assert (=> b!27720 m!39701))

(declare-fun m!39703 () Bool)

(assert (=> b!27720 m!39703))

(declare-fun m!39705 () Bool)

(assert (=> b!27720 m!39705))

(assert (=> b!27720 m!39703))

(declare-fun m!39707 () Bool)

(assert (=> b!27720 m!39707))

(declare-fun m!39709 () Bool)

(assert (=> b!27720 m!39709))

(declare-fun m!39711 () Bool)

(assert (=> b!27718 m!39711))

(declare-fun m!39713 () Bool)

(assert (=> b!27713 m!39713))

(declare-fun m!39715 () Bool)

(assert (=> b!27709 m!39715))

(declare-fun m!39717 () Bool)

(assert (=> b!27709 m!39717))

(declare-fun m!39719 () Bool)

(assert (=> b!27709 m!39719))

(declare-fun m!39721 () Bool)

(assert (=> b!27715 m!39721))

(assert (=> b!27715 m!39721))

(declare-fun m!39723 () Bool)

(assert (=> b!27715 m!39723))

(declare-fun m!39725 () Bool)

(assert (=> b!27715 m!39725))

(assert (=> b!27715 m!39725))

(declare-fun m!39727 () Bool)

(assert (=> b!27715 m!39727))

(declare-fun m!39729 () Bool)

(assert (=> b!27727 m!39729))

(declare-fun m!39731 () Bool)

(assert (=> b!27712 m!39731))

(declare-fun m!39733 () Bool)

(assert (=> b!27712 m!39733))

(declare-fun m!39735 () Bool)

(assert (=> b!27712 m!39735))

(declare-fun m!39737 () Bool)

(assert (=> b!27712 m!39737))

(declare-fun m!39739 () Bool)

(assert (=> b!27712 m!39739))

(declare-fun m!39741 () Bool)

(assert (=> b!27712 m!39741))

(declare-fun m!39743 () Bool)

(assert (=> b!27712 m!39743))

(declare-fun m!39745 () Bool)

(assert (=> b!27724 m!39745))

(declare-fun m!39747 () Bool)

(assert (=> b!27721 m!39747))

(declare-fun m!39749 () Bool)

(assert (=> b!27708 m!39749))

(declare-fun m!39751 () Bool)

(assert (=> start!5994 m!39751))

(declare-fun m!39753 () Bool)

(assert (=> start!5994 m!39753))

(declare-fun m!39755 () Bool)

(assert (=> b!27716 m!39755))

(declare-fun m!39757 () Bool)

(assert (=> b!27726 m!39757))

(declare-fun m!39759 () Bool)

(assert (=> b!27717 m!39759))

(declare-fun m!39761 () Bool)

(assert (=> b!27725 m!39761))

(declare-fun m!39763 () Bool)

(assert (=> b!27725 m!39763))

(declare-fun m!39765 () Bool)

(assert (=> b!27725 m!39765))

(declare-fun m!39767 () Bool)

(assert (=> b!27725 m!39767))

(declare-fun m!39769 () Bool)

(assert (=> b!27725 m!39769))

(declare-fun m!39771 () Bool)

(assert (=> b!27725 m!39771))

(declare-fun m!39773 () Bool)

(assert (=> b!27725 m!39773))

(declare-fun m!39775 () Bool)

(assert (=> b!27725 m!39775))

(push 1)

(assert (not b!27726))

(assert (not start!5994))

(assert (not b!27722))

(assert (not b!27713))

(assert (not b!27725))

(assert (not b!27720))

(assert (not b!27717))

(assert (not b!27724))

(assert (not b!27709))

(assert (not b!27718))

(assert (not b!27711))

(assert (not b!27712))

(assert (not b!27727))

(assert (not b!27708))

(assert (not b!27715))

(assert (not b!27716))

(assert (not b!27721))

(assert (not b!27719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

