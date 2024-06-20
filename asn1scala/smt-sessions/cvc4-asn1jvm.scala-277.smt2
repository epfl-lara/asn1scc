; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5646 () Bool)

(assert start!5646)

(declare-fun lt!33799 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!15689 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1569 0))(
  ( (array!1570 (arr!1126 (Array (_ BitVec 32) (_ BitVec 8))) (size!670 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1172 0))(
  ( (BitStream!1173 (buf!991 array!1569) (currentByte!2304 (_ BitVec 32)) (currentBit!2299 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1983 0))(
  ( (Unit!1984) )
))
(declare-datatypes ((tuple2!2662 0))(
  ( (tuple2!2663 (_1!1418 Unit!1983) (_2!1418 BitStream!1172)) )
))
(declare-fun lt!33805 () tuple2!2662)

(declare-fun b!23202 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23202 (= e!15689 (= lt!33799 (bvsub (bvsub (bvadd (bitIndex!0 (size!670 (buf!991 (_2!1418 lt!33805))) (currentByte!2304 (_2!1418 lt!33805)) (currentBit!2299 (_2!1418 lt!33805))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23203 () Bool)

(declare-fun e!15681 () Bool)

(declare-fun thiss!1379 () BitStream!1172)

(declare-fun array_inv!639 (array!1569) Bool)

(assert (=> b!23203 (= e!15681 (array_inv!639 (buf!991 thiss!1379)))))

(declare-fun b!23204 () Bool)

(declare-fun e!15684 () Bool)

(assert (=> b!23204 (= e!15684 true)))

(declare-datatypes ((tuple2!2664 0))(
  ( (tuple2!2665 (_1!1419 BitStream!1172) (_2!1419 BitStream!1172)) )
))
(declare-fun lt!33808 () tuple2!2664)

(declare-fun lt!33802 () tuple2!2662)

(declare-fun reader!0 (BitStream!1172 BitStream!1172) tuple2!2664)

(assert (=> b!23204 (= lt!33808 (reader!0 thiss!1379 (_2!1418 lt!33802)))))

(declare-fun b!23205 () Bool)

(declare-fun e!15683 () Bool)

(declare-fun e!15686 () Bool)

(assert (=> b!23205 (= e!15683 e!15686)))

(declare-fun res!19953 () Bool)

(assert (=> b!23205 (=> res!19953 e!15686)))

(declare-fun lt!33803 () (_ BitVec 64))

(assert (=> b!23205 (= res!19953 (not (= lt!33799 (bvsub (bvadd lt!33803 to!314) i!635))))))

(assert (=> b!23205 (= lt!33799 (bitIndex!0 (size!670 (buf!991 (_2!1418 lt!33802))) (currentByte!2304 (_2!1418 lt!33802)) (currentBit!2299 (_2!1418 lt!33802))))))

(declare-fun res!19947 () Bool)

(declare-fun e!15687 () Bool)

(assert (=> start!5646 (=> (not res!19947) (not e!15687))))

(declare-fun srcBuffer!2 () array!1569)

(assert (=> start!5646 (= res!19947 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!670 srcBuffer!2))))))))

(assert (=> start!5646 e!15687))

(assert (=> start!5646 true))

(assert (=> start!5646 (array_inv!639 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1172) Bool)

(assert (=> start!5646 (and (inv!12 thiss!1379) e!15681)))

(declare-fun b!23206 () Bool)

(declare-fun res!19952 () Bool)

(assert (=> b!23206 (=> res!19952 e!15684)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23206 (= res!19952 (not (invariant!0 (currentBit!2299 (_2!1418 lt!33805)) (currentByte!2304 (_2!1418 lt!33805)) (size!670 (buf!991 (_2!1418 lt!33805))))))))

(declare-fun b!23207 () Bool)

(declare-fun res!19946 () Bool)

(assert (=> b!23207 (=> res!19946 e!15686)))

(assert (=> b!23207 (= res!19946 (not (invariant!0 (currentBit!2299 (_2!1418 lt!33802)) (currentByte!2304 (_2!1418 lt!33802)) (size!670 (buf!991 (_2!1418 lt!33802))))))))

(declare-fun b!23208 () Bool)

(declare-fun res!19949 () Bool)

(assert (=> b!23208 (=> res!19949 e!15684)))

(assert (=> b!23208 (= res!19949 (not (invariant!0 (currentBit!2299 (_2!1418 lt!33805)) (currentByte!2304 (_2!1418 lt!33805)) (size!670 (buf!991 (_2!1418 lt!33802))))))))

(declare-fun b!23209 () Bool)

(declare-fun e!15685 () Bool)

(declare-fun e!15688 () Bool)

(assert (=> b!23209 (= e!15685 e!15688)))

(declare-fun res!19945 () Bool)

(assert (=> b!23209 (=> res!19945 e!15688)))

(declare-fun isPrefixOf!0 (BitStream!1172 BitStream!1172) Bool)

(assert (=> b!23209 (= res!19945 (not (isPrefixOf!0 thiss!1379 (_2!1418 lt!33805))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23209 (validate_offset_bits!1 ((_ sign_extend 32) (size!670 (buf!991 (_2!1418 lt!33805)))) ((_ sign_extend 32) (currentByte!2304 (_2!1418 lt!33805))) ((_ sign_extend 32) (currentBit!2299 (_2!1418 lt!33805))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33807 () Unit!1983)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1172 BitStream!1172 (_ BitVec 64) (_ BitVec 64)) Unit!1983)

(assert (=> b!23209 (= lt!33807 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1418 lt!33805) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1172 (_ BitVec 8) (_ BitVec 32)) tuple2!2662)

(assert (=> b!23209 (= lt!33805 (appendBitFromByte!0 thiss!1379 (select (arr!1126 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23210 () Bool)

(assert (=> b!23210 (= e!15687 (not e!15685))))

(declare-fun res!19948 () Bool)

(assert (=> b!23210 (=> res!19948 e!15685)))

(assert (=> b!23210 (= res!19948 (bvsge i!635 to!314))))

(assert (=> b!23210 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33804 () Unit!1983)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1172) Unit!1983)

(assert (=> b!23210 (= lt!33804 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23210 (= lt!33803 (bitIndex!0 (size!670 (buf!991 thiss!1379)) (currentByte!2304 thiss!1379) (currentBit!2299 thiss!1379)))))

(declare-fun b!23211 () Bool)

(declare-fun e!15691 () Bool)

(declare-fun lt!33801 () tuple2!2664)

(declare-datatypes ((List!287 0))(
  ( (Nil!284) (Cons!283 (h!402 Bool) (t!1037 List!287)) )
))
(declare-fun head!124 (List!287) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1172 array!1569 (_ BitVec 64) (_ BitVec 64)) List!287)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1172 BitStream!1172 (_ BitVec 64)) List!287)

(assert (=> b!23211 (= e!15691 (= (head!124 (byteArrayBitContentToList!0 (_2!1418 lt!33805) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!124 (bitStreamReadBitsIntoList!0 (_2!1418 lt!33805) (_1!1419 lt!33801) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23212 () Bool)

(declare-fun res!19951 () Bool)

(assert (=> b!23212 (=> (not res!19951) (not e!15687))))

(assert (=> b!23212 (= res!19951 (validate_offset_bits!1 ((_ sign_extend 32) (size!670 (buf!991 thiss!1379))) ((_ sign_extend 32) (currentByte!2304 thiss!1379)) ((_ sign_extend 32) (currentBit!2299 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23213 () Bool)

(assert (=> b!23213 (= e!15686 e!15684)))

(declare-fun res!19944 () Bool)

(assert (=> b!23213 (=> res!19944 e!15684)))

(assert (=> b!23213 (= res!19944 (not (= (size!670 (buf!991 (_2!1418 lt!33805))) (size!670 (buf!991 (_2!1418 lt!33802))))))))

(assert (=> b!23213 e!15689))

(declare-fun res!19950 () Bool)

(assert (=> b!23213 (=> (not res!19950) (not e!15689))))

(assert (=> b!23213 (= res!19950 (= (size!670 (buf!991 (_2!1418 lt!33802))) (size!670 (buf!991 thiss!1379))))))

(declare-fun b!23214 () Bool)

(assert (=> b!23214 (= e!15688 e!15683)))

(declare-fun res!19943 () Bool)

(assert (=> b!23214 (=> res!19943 e!15683)))

(assert (=> b!23214 (= res!19943 (not (isPrefixOf!0 (_2!1418 lt!33805) (_2!1418 lt!33802))))))

(assert (=> b!23214 (isPrefixOf!0 thiss!1379 (_2!1418 lt!33802))))

(declare-fun lt!33800 () Unit!1983)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1172 BitStream!1172 BitStream!1172) Unit!1983)

(assert (=> b!23214 (= lt!33800 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1418 lt!33805) (_2!1418 lt!33802)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1172 array!1569 (_ BitVec 64) (_ BitVec 64)) tuple2!2662)

(assert (=> b!23214 (= lt!33802 (appendBitsMSBFirstLoop!0 (_2!1418 lt!33805) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!23214 e!15691))

(declare-fun res!19941 () Bool)

(assert (=> b!23214 (=> (not res!19941) (not e!15691))))

(assert (=> b!23214 (= res!19941 (validate_offset_bits!1 ((_ sign_extend 32) (size!670 (buf!991 (_2!1418 lt!33805)))) ((_ sign_extend 32) (currentByte!2304 thiss!1379)) ((_ sign_extend 32) (currentBit!2299 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33806 () Unit!1983)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1172 array!1569 (_ BitVec 64)) Unit!1983)

(assert (=> b!23214 (= lt!33806 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!991 (_2!1418 lt!33805)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!23214 (= lt!33801 (reader!0 thiss!1379 (_2!1418 lt!33805)))))

(declare-fun b!23215 () Bool)

(declare-fun res!19942 () Bool)

(assert (=> b!23215 (=> res!19942 e!15686)))

(assert (=> b!23215 (= res!19942 (not (= (size!670 (buf!991 thiss!1379)) (size!670 (buf!991 (_2!1418 lt!33802))))))))

(assert (= (and start!5646 res!19947) b!23212))

(assert (= (and b!23212 res!19951) b!23210))

(assert (= (and b!23210 (not res!19948)) b!23209))

(assert (= (and b!23209 (not res!19945)) b!23214))

(assert (= (and b!23214 res!19941) b!23211))

(assert (= (and b!23214 (not res!19943)) b!23205))

(assert (= (and b!23205 (not res!19953)) b!23207))

(assert (= (and b!23207 (not res!19946)) b!23215))

(assert (= (and b!23215 (not res!19942)) b!23213))

(assert (= (and b!23213 res!19950) b!23202))

(assert (= (and b!23213 (not res!19944)) b!23206))

(assert (= (and b!23206 (not res!19952)) b!23208))

(assert (= (and b!23208 (not res!19949)) b!23204))

(assert (= start!5646 b!23203))

(declare-fun m!32603 () Bool)

(assert (=> start!5646 m!32603))

(declare-fun m!32605 () Bool)

(assert (=> start!5646 m!32605))

(declare-fun m!32607 () Bool)

(assert (=> b!23211 m!32607))

(assert (=> b!23211 m!32607))

(declare-fun m!32609 () Bool)

(assert (=> b!23211 m!32609))

(declare-fun m!32611 () Bool)

(assert (=> b!23211 m!32611))

(assert (=> b!23211 m!32611))

(declare-fun m!32613 () Bool)

(assert (=> b!23211 m!32613))

(declare-fun m!32615 () Bool)

(assert (=> b!23204 m!32615))

(declare-fun m!32617 () Bool)

(assert (=> b!23208 m!32617))

(declare-fun m!32619 () Bool)

(assert (=> b!23212 m!32619))

(declare-fun m!32621 () Bool)

(assert (=> b!23203 m!32621))

(declare-fun m!32623 () Bool)

(assert (=> b!23202 m!32623))

(declare-fun m!32625 () Bool)

(assert (=> b!23209 m!32625))

(declare-fun m!32627 () Bool)

(assert (=> b!23209 m!32627))

(declare-fun m!32629 () Bool)

(assert (=> b!23209 m!32629))

(declare-fun m!32631 () Bool)

(assert (=> b!23209 m!32631))

(assert (=> b!23209 m!32627))

(declare-fun m!32633 () Bool)

(assert (=> b!23209 m!32633))

(declare-fun m!32635 () Bool)

(assert (=> b!23210 m!32635))

(declare-fun m!32637 () Bool)

(assert (=> b!23210 m!32637))

(declare-fun m!32639 () Bool)

(assert (=> b!23210 m!32639))

(declare-fun m!32641 () Bool)

(assert (=> b!23206 m!32641))

(declare-fun m!32643 () Bool)

(assert (=> b!23207 m!32643))

(declare-fun m!32645 () Bool)

(assert (=> b!23205 m!32645))

(declare-fun m!32647 () Bool)

(assert (=> b!23214 m!32647))

(declare-fun m!32649 () Bool)

(assert (=> b!23214 m!32649))

(declare-fun m!32651 () Bool)

(assert (=> b!23214 m!32651))

(declare-fun m!32653 () Bool)

(assert (=> b!23214 m!32653))

(declare-fun m!32655 () Bool)

(assert (=> b!23214 m!32655))

(declare-fun m!32657 () Bool)

(assert (=> b!23214 m!32657))

(declare-fun m!32659 () Bool)

(assert (=> b!23214 m!32659))

(push 1)

(assert (not b!23208))

(assert (not b!23214))

(assert (not b!23205))

(assert (not start!5646))

(assert (not b!23211))

(assert (not b!23203))

(assert (not b!23204))

(assert (not b!23209))

(assert (not b!23207))

(assert (not b!23202))

(assert (not b!23212))

(assert (not b!23206))

(assert (not b!23210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

