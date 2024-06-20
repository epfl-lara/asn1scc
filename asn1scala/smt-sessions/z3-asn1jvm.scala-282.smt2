; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5674 () Bool)

(assert start!5674)

(declare-fun b!23790 () Bool)

(declare-fun e!16149 () Bool)

(declare-fun e!16144 () Bool)

(assert (=> b!23790 (= e!16149 e!16144)))

(declare-fun res!20492 () Bool)

(assert (=> b!23790 (=> res!20492 e!16144)))

(declare-datatypes ((array!1597 0))(
  ( (array!1598 (arr!1140 (Array (_ BitVec 32) (_ BitVec 8))) (size!684 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1200 0))(
  ( (BitStream!1201 (buf!1005 array!1597) (currentByte!2318 (_ BitVec 32)) (currentBit!2313 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2011 0))(
  ( (Unit!2012) )
))
(declare-datatypes ((tuple2!2718 0))(
  ( (tuple2!2719 (_1!1446 Unit!2011) (_2!1446 BitStream!1200)) )
))
(declare-fun lt!34284 () tuple2!2718)

(declare-fun lt!34281 () tuple2!2718)

(declare-fun isPrefixOf!0 (BitStream!1200 BitStream!1200) Bool)

(assert (=> b!23790 (= res!20492 (not (isPrefixOf!0 (_2!1446 lt!34284) (_2!1446 lt!34281))))))

(declare-fun thiss!1379 () BitStream!1200)

(assert (=> b!23790 (isPrefixOf!0 thiss!1379 (_2!1446 lt!34281))))

(declare-fun lt!34276 () Unit!2011)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1200 BitStream!1200 BitStream!1200) Unit!2011)

(assert (=> b!23790 (= lt!34276 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1446 lt!34284) (_2!1446 lt!34281)))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!1597)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1200 array!1597 (_ BitVec 64) (_ BitVec 64)) tuple2!2718)

(assert (=> b!23790 (= lt!34281 (appendBitsMSBFirstLoop!0 (_2!1446 lt!34284) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16146 () Bool)

(assert (=> b!23790 e!16146))

(declare-fun res!20498 () Bool)

(assert (=> b!23790 (=> (not res!20498) (not e!16146))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23790 (= res!20498 (validate_offset_bits!1 ((_ sign_extend 32) (size!684 (buf!1005 (_2!1446 lt!34284)))) ((_ sign_extend 32) (currentByte!2318 thiss!1379)) ((_ sign_extend 32) (currentBit!2313 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34280 () Unit!2011)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1200 array!1597 (_ BitVec 64)) Unit!2011)

(assert (=> b!23790 (= lt!34280 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1005 (_2!1446 lt!34284)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2720 0))(
  ( (tuple2!2721 (_1!1447 BitStream!1200) (_2!1447 BitStream!1200)) )
))
(declare-fun lt!34283 () tuple2!2720)

(declare-fun reader!0 (BitStream!1200 BitStream!1200) tuple2!2720)

(assert (=> b!23790 (= lt!34283 (reader!0 thiss!1379 (_2!1446 lt!34284)))))

(declare-fun b!23791 () Bool)

(declare-fun e!16147 () Bool)

(declare-fun e!16150 () Bool)

(assert (=> b!23791 (= e!16147 (not e!16150))))

(declare-fun res!20490 () Bool)

(assert (=> b!23791 (=> res!20490 e!16150)))

(assert (=> b!23791 (= res!20490 (bvsge i!635 to!314))))

(assert (=> b!23791 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34278 () Unit!2011)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1200) Unit!2011)

(assert (=> b!23791 (= lt!34278 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34279 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23791 (= lt!34279 (bitIndex!0 (size!684 (buf!1005 thiss!1379)) (currentByte!2318 thiss!1379) (currentBit!2313 thiss!1379)))))

(declare-fun res!20496 () Bool)

(assert (=> start!5674 (=> (not res!20496) (not e!16147))))

(assert (=> start!5674 (= res!20496 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!684 srcBuffer!2))))))))

(assert (=> start!5674 e!16147))

(assert (=> start!5674 true))

(declare-fun array_inv!653 (array!1597) Bool)

(assert (=> start!5674 (array_inv!653 srcBuffer!2)))

(declare-fun e!16153 () Bool)

(declare-fun inv!12 (BitStream!1200) Bool)

(assert (=> start!5674 (and (inv!12 thiss!1379) e!16153)))

(declare-fun b!23792 () Bool)

(declare-fun e!16143 () Bool)

(assert (=> b!23792 (= e!16144 e!16143)))

(declare-fun res!20493 () Bool)

(assert (=> b!23792 (=> res!20493 e!16143)))

(declare-fun lt!34277 () (_ BitVec 64))

(assert (=> b!23792 (= res!20493 (not (= lt!34277 (bvsub (bvadd lt!34279 to!314) i!635))))))

(assert (=> b!23792 (= lt!34277 (bitIndex!0 (size!684 (buf!1005 (_2!1446 lt!34281))) (currentByte!2318 (_2!1446 lt!34281)) (currentBit!2313 (_2!1446 lt!34281))))))

(declare-fun b!23793 () Bool)

(declare-fun e!16151 () Bool)

(assert (=> b!23793 (= e!16143 e!16151)))

(declare-fun res!20487 () Bool)

(assert (=> b!23793 (=> res!20487 e!16151)))

(assert (=> b!23793 (= res!20487 (not (= (size!684 (buf!1005 (_2!1446 lt!34284))) (size!684 (buf!1005 (_2!1446 lt!34281))))))))

(declare-fun e!16145 () Bool)

(assert (=> b!23793 e!16145))

(declare-fun res!20495 () Bool)

(assert (=> b!23793 (=> (not res!20495) (not e!16145))))

(assert (=> b!23793 (= res!20495 (= (size!684 (buf!1005 (_2!1446 lt!34281))) (size!684 (buf!1005 thiss!1379))))))

(declare-fun b!23794 () Bool)

(assert (=> b!23794 (= e!16153 (array_inv!653 (buf!1005 thiss!1379)))))

(declare-fun b!23795 () Bool)

(declare-fun res!20494 () Bool)

(assert (=> b!23795 (=> res!20494 e!16151)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23795 (= res!20494 (not (invariant!0 (currentBit!2313 (_2!1446 lt!34284)) (currentByte!2318 (_2!1446 lt!34284)) (size!684 (buf!1005 (_2!1446 lt!34281))))))))

(declare-fun b!23796 () Bool)

(assert (=> b!23796 (= e!16145 (= lt!34277 (bvsub (bvsub (bvadd (bitIndex!0 (size!684 (buf!1005 (_2!1446 lt!34284))) (currentByte!2318 (_2!1446 lt!34284)) (currentBit!2313 (_2!1446 lt!34284))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23797 () Bool)

(declare-fun res!20491 () Bool)

(assert (=> b!23797 (=> res!20491 e!16143)))

(assert (=> b!23797 (= res!20491 (not (= (size!684 (buf!1005 thiss!1379)) (size!684 (buf!1005 (_2!1446 lt!34281))))))))

(declare-fun b!23798 () Bool)

(assert (=> b!23798 (= e!16150 e!16149)))

(declare-fun res!20497 () Bool)

(assert (=> b!23798 (=> res!20497 e!16149)))

(assert (=> b!23798 (= res!20497 (not (isPrefixOf!0 thiss!1379 (_2!1446 lt!34284))))))

(assert (=> b!23798 (validate_offset_bits!1 ((_ sign_extend 32) (size!684 (buf!1005 (_2!1446 lt!34284)))) ((_ sign_extend 32) (currentByte!2318 (_2!1446 lt!34284))) ((_ sign_extend 32) (currentBit!2313 (_2!1446 lt!34284))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34275 () Unit!2011)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1200 BitStream!1200 (_ BitVec 64) (_ BitVec 64)) Unit!2011)

(assert (=> b!23798 (= lt!34275 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1446 lt!34284) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1200 (_ BitVec 8) (_ BitVec 32)) tuple2!2718)

(assert (=> b!23798 (= lt!34284 (appendBitFromByte!0 thiss!1379 (select (arr!1140 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23799 () Bool)

(declare-fun res!20489 () Bool)

(assert (=> b!23799 (=> (not res!20489) (not e!16147))))

(assert (=> b!23799 (= res!20489 (validate_offset_bits!1 ((_ sign_extend 32) (size!684 (buf!1005 thiss!1379))) ((_ sign_extend 32) (currentByte!2318 thiss!1379)) ((_ sign_extend 32) (currentBit!2313 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23800 () Bool)

(declare-datatypes ((List!301 0))(
  ( (Nil!298) (Cons!297 (h!416 Bool) (t!1051 List!301)) )
))
(declare-fun head!138 (List!301) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1200 array!1597 (_ BitVec 64) (_ BitVec 64)) List!301)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1200 BitStream!1200 (_ BitVec 64)) List!301)

(assert (=> b!23800 (= e!16146 (= (head!138 (byteArrayBitContentToList!0 (_2!1446 lt!34284) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!138 (bitStreamReadBitsIntoList!0 (_2!1446 lt!34284) (_1!1447 lt!34283) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23801 () Bool)

(assert (=> b!23801 (= e!16151 true)))

(declare-fun lt!34285 () tuple2!2720)

(assert (=> b!23801 (= lt!34285 (reader!0 (_2!1446 lt!34284) (_2!1446 lt!34281)))))

(assert (=> b!23801 (validate_offset_bits!1 ((_ sign_extend 32) (size!684 (buf!1005 (_2!1446 lt!34281)))) ((_ sign_extend 32) (currentByte!2318 thiss!1379)) ((_ sign_extend 32) (currentBit!2313 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34282 () Unit!2011)

(assert (=> b!23801 (= lt!34282 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1005 (_2!1446 lt!34281)) (bvsub to!314 i!635)))))

(declare-fun lt!34274 () tuple2!2720)

(assert (=> b!23801 (= lt!34274 (reader!0 thiss!1379 (_2!1446 lt!34281)))))

(declare-fun b!23802 () Bool)

(declare-fun res!20488 () Bool)

(assert (=> b!23802 (=> res!20488 e!16151)))

(assert (=> b!23802 (= res!20488 (not (invariant!0 (currentBit!2313 (_2!1446 lt!34284)) (currentByte!2318 (_2!1446 lt!34284)) (size!684 (buf!1005 (_2!1446 lt!34284))))))))

(declare-fun b!23803 () Bool)

(declare-fun res!20499 () Bool)

(assert (=> b!23803 (=> res!20499 e!16143)))

(assert (=> b!23803 (= res!20499 (not (invariant!0 (currentBit!2313 (_2!1446 lt!34281)) (currentByte!2318 (_2!1446 lt!34281)) (size!684 (buf!1005 (_2!1446 lt!34281))))))))

(assert (= (and start!5674 res!20496) b!23799))

(assert (= (and b!23799 res!20489) b!23791))

(assert (= (and b!23791 (not res!20490)) b!23798))

(assert (= (and b!23798 (not res!20497)) b!23790))

(assert (= (and b!23790 res!20498) b!23800))

(assert (= (and b!23790 (not res!20492)) b!23792))

(assert (= (and b!23792 (not res!20493)) b!23803))

(assert (= (and b!23803 (not res!20499)) b!23797))

(assert (= (and b!23797 (not res!20491)) b!23793))

(assert (= (and b!23793 res!20495) b!23796))

(assert (= (and b!23793 (not res!20487)) b!23802))

(assert (= (and b!23802 (not res!20488)) b!23795))

(assert (= (and b!23795 (not res!20494)) b!23801))

(assert (= start!5674 b!23794))

(declare-fun m!33469 () Bool)

(assert (=> b!23792 m!33469))

(declare-fun m!33471 () Bool)

(assert (=> b!23798 m!33471))

(declare-fun m!33473 () Bool)

(assert (=> b!23798 m!33473))

(declare-fun m!33475 () Bool)

(assert (=> b!23798 m!33475))

(declare-fun m!33477 () Bool)

(assert (=> b!23798 m!33477))

(assert (=> b!23798 m!33471))

(declare-fun m!33479 () Bool)

(assert (=> b!23798 m!33479))

(declare-fun m!33481 () Bool)

(assert (=> b!23795 m!33481))

(declare-fun m!33483 () Bool)

(assert (=> b!23790 m!33483))

(declare-fun m!33485 () Bool)

(assert (=> b!23790 m!33485))

(declare-fun m!33487 () Bool)

(assert (=> b!23790 m!33487))

(declare-fun m!33489 () Bool)

(assert (=> b!23790 m!33489))

(declare-fun m!33491 () Bool)

(assert (=> b!23790 m!33491))

(declare-fun m!33493 () Bool)

(assert (=> b!23790 m!33493))

(declare-fun m!33495 () Bool)

(assert (=> b!23790 m!33495))

(declare-fun m!33497 () Bool)

(assert (=> b!23791 m!33497))

(declare-fun m!33499 () Bool)

(assert (=> b!23791 m!33499))

(declare-fun m!33501 () Bool)

(assert (=> b!23791 m!33501))

(declare-fun m!33503 () Bool)

(assert (=> b!23803 m!33503))

(declare-fun m!33505 () Bool)

(assert (=> b!23799 m!33505))

(declare-fun m!33507 () Bool)

(assert (=> start!5674 m!33507))

(declare-fun m!33509 () Bool)

(assert (=> start!5674 m!33509))

(declare-fun m!33511 () Bool)

(assert (=> b!23801 m!33511))

(declare-fun m!33513 () Bool)

(assert (=> b!23801 m!33513))

(declare-fun m!33515 () Bool)

(assert (=> b!23801 m!33515))

(declare-fun m!33517 () Bool)

(assert (=> b!23801 m!33517))

(declare-fun m!33519 () Bool)

(assert (=> b!23796 m!33519))

(declare-fun m!33521 () Bool)

(assert (=> b!23802 m!33521))

(declare-fun m!33523 () Bool)

(assert (=> b!23794 m!33523))

(declare-fun m!33525 () Bool)

(assert (=> b!23800 m!33525))

(assert (=> b!23800 m!33525))

(declare-fun m!33527 () Bool)

(assert (=> b!23800 m!33527))

(declare-fun m!33529 () Bool)

(assert (=> b!23800 m!33529))

(assert (=> b!23800 m!33529))

(declare-fun m!33531 () Bool)

(assert (=> b!23800 m!33531))

(check-sat (not b!23790) (not b!23791) (not start!5674) (not b!23796) (not b!23800) (not b!23799) (not b!23792) (not b!23801) (not b!23798) (not b!23803) (not b!23795) (not b!23802) (not b!23794))
