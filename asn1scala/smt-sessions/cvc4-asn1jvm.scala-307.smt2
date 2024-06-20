; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6018 () Bool)

(assert start!6018)

(declare-fun b!28396 () Bool)

(declare-fun res!24653 () Bool)

(declare-fun e!19142 () Bool)

(assert (=> b!28396 (=> res!24653 e!19142)))

(declare-datatypes ((array!1755 0))(
  ( (array!1756 (arr!1222 (Array (_ BitVec 32) (_ BitVec 8))) (size!760 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1352 0))(
  ( (BitStream!1353 (buf!1087 array!1755) (currentByte!2412 (_ BitVec 32)) (currentBit!2407 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2223 0))(
  ( (Unit!2224) )
))
(declare-datatypes ((tuple2!3070 0))(
  ( (tuple2!3071 (_1!1622 Unit!2223) (_2!1622 BitStream!1352)) )
))
(declare-fun lt!39872 () tuple2!3070)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28396 (= res!24653 (not (invariant!0 (currentBit!2407 (_2!1622 lt!39872)) (currentByte!2412 (_2!1622 lt!39872)) (size!760 (buf!1087 (_2!1622 lt!39872))))))))

(declare-fun b!28397 () Bool)

(declare-fun e!19144 () Bool)

(declare-fun e!19143 () Bool)

(assert (=> b!28397 (= e!19144 e!19143)))

(declare-fun res!24648 () Bool)

(assert (=> b!28397 (=> res!24648 e!19143)))

(declare-fun thiss!1379 () BitStream!1352)

(declare-fun isPrefixOf!0 (BitStream!1352 BitStream!1352) Bool)

(assert (=> b!28397 (= res!24648 (not (isPrefixOf!0 thiss!1379 (_2!1622 lt!39872))))))

(declare-fun lt!39882 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28397 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39872)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872))) lt!39882)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!28397 (= lt!39882 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39883 () Unit!2223)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1352 BitStream!1352 (_ BitVec 64) (_ BitVec 64)) Unit!2223)

(assert (=> b!28397 (= lt!39883 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1622 lt!39872) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1755)

(declare-fun appendBitFromByte!0 (BitStream!1352 (_ BitVec 8) (_ BitVec 32)) tuple2!3070)

(assert (=> b!28397 (= lt!39872 (appendBitFromByte!0 thiss!1379 (select (arr!1222 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!24647 () Bool)

(declare-fun e!19139 () Bool)

(assert (=> start!6018 (=> (not res!24647) (not e!19139))))

(assert (=> start!6018 (= res!24647 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!760 srcBuffer!2))))))))

(assert (=> start!6018 e!19139))

(assert (=> start!6018 true))

(declare-fun array_inv!729 (array!1755) Bool)

(assert (=> start!6018 (array_inv!729 srcBuffer!2)))

(declare-fun e!19140 () Bool)

(declare-fun inv!12 (BitStream!1352) Bool)

(assert (=> start!6018 (and (inv!12 thiss!1379) e!19140)))

(declare-fun b!28398 () Bool)

(declare-fun res!24654 () Bool)

(assert (=> b!28398 (=> (not res!24654) (not e!19139))))

(assert (=> b!28398 (= res!24654 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 thiss!1379))) ((_ sign_extend 32) (currentByte!2412 thiss!1379)) ((_ sign_extend 32) (currentBit!2407 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!39881 () (_ BitVec 64))

(declare-fun b!28399 () Bool)

(declare-fun e!19141 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28399 (= e!19141 (= lt!39881 (bvsub (bvsub (bvadd (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!39872))) (currentByte!2412 (_2!1622 lt!39872)) (currentBit!2407 (_2!1622 lt!39872))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28400 () Bool)

(declare-fun res!24649 () Bool)

(declare-fun e!19134 () Bool)

(assert (=> b!28400 (=> res!24649 e!19134)))

(declare-fun lt!39867 () tuple2!3070)

(assert (=> b!28400 (= res!24649 (not (invariant!0 (currentBit!2407 (_2!1622 lt!39867)) (currentByte!2412 (_2!1622 lt!39867)) (size!760 (buf!1087 (_2!1622 lt!39867))))))))

(declare-fun b!28401 () Bool)

(declare-fun res!24645 () Bool)

(declare-fun e!19136 () Bool)

(assert (=> b!28401 (=> res!24645 e!19136)))

(declare-datatypes ((List!377 0))(
  ( (Nil!374) (Cons!373 (h!492 Bool) (t!1127 List!377)) )
))
(declare-fun lt!39869 () List!377)

(declare-fun length!103 (List!377) Int)

(assert (=> b!28401 (= res!24645 (<= (length!103 lt!39869) 0))))

(declare-fun b!28402 () Bool)

(assert (=> b!28402 (= e!19134 e!19142)))

(declare-fun res!24651 () Bool)

(assert (=> b!28402 (=> res!24651 e!19142)))

(assert (=> b!28402 (= res!24651 (not (= (size!760 (buf!1087 (_2!1622 lt!39872))) (size!760 (buf!1087 (_2!1622 lt!39867))))))))

(assert (=> b!28402 e!19141))

(declare-fun res!24652 () Bool)

(assert (=> b!28402 (=> (not res!24652) (not e!19141))))

(assert (=> b!28402 (= res!24652 (= (size!760 (buf!1087 (_2!1622 lt!39867))) (size!760 (buf!1087 thiss!1379))))))

(declare-fun b!28403 () Bool)

(assert (=> b!28403 (= e!19139 (not e!19144))))

(declare-fun res!24657 () Bool)

(assert (=> b!28403 (=> res!24657 e!19144)))

(assert (=> b!28403 (= res!24657 (bvsge i!635 to!314))))

(assert (=> b!28403 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39873 () Unit!2223)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1352) Unit!2223)

(assert (=> b!28403 (= lt!39873 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!39876 () (_ BitVec 64))

(assert (=> b!28403 (= lt!39876 (bitIndex!0 (size!760 (buf!1087 thiss!1379)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379)))))

(declare-fun b!28404 () Bool)

(declare-fun res!24644 () Bool)

(assert (=> b!28404 (=> res!24644 e!19134)))

(assert (=> b!28404 (= res!24644 (not (= (size!760 (buf!1087 thiss!1379)) (size!760 (buf!1087 (_2!1622 lt!39867))))))))

(declare-fun b!28405 () Bool)

(assert (=> b!28405 (= e!19142 e!19136)))

(declare-fun res!24656 () Bool)

(assert (=> b!28405 (=> res!24656 e!19136)))

(assert (=> b!28405 (= res!24656 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3072 0))(
  ( (tuple2!3073 (_1!1623 BitStream!1352) (_2!1623 BitStream!1352)) )
))
(declare-fun lt!39880 () tuple2!3072)

(declare-fun lt!39868 () List!377)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1352 BitStream!1352 (_ BitVec 64)) List!377)

(assert (=> b!28405 (= lt!39868 (bitStreamReadBitsIntoList!0 (_2!1622 lt!39867) (_1!1623 lt!39880) lt!39882))))

(declare-fun lt!39870 () tuple2!3072)

(assert (=> b!28405 (= lt!39869 (bitStreamReadBitsIntoList!0 (_2!1622 lt!39867) (_1!1623 lt!39870) (bvsub to!314 i!635)))))

(assert (=> b!28405 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872))) lt!39882)))

(declare-fun lt!39878 () Unit!2223)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1352 array!1755 (_ BitVec 64)) Unit!2223)

(assert (=> b!28405 (= lt!39878 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1622 lt!39872) (buf!1087 (_2!1622 lt!39867)) lt!39882))))

(declare-fun reader!0 (BitStream!1352 BitStream!1352) tuple2!3072)

(assert (=> b!28405 (= lt!39880 (reader!0 (_2!1622 lt!39872) (_2!1622 lt!39867)))))

(assert (=> b!28405 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 thiss!1379)) ((_ sign_extend 32) (currentBit!2407 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39879 () Unit!2223)

(assert (=> b!28405 (= lt!39879 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1087 (_2!1622 lt!39867)) (bvsub to!314 i!635)))))

(assert (=> b!28405 (= lt!39870 (reader!0 thiss!1379 (_2!1622 lt!39867)))))

(declare-fun b!28406 () Bool)

(assert (=> b!28406 (= e!19136 (not (= lt!39869 Nil!374)))))

(declare-fun tail!94 (List!377) List!377)

(assert (=> b!28406 (= lt!39868 (tail!94 lt!39869))))

(declare-fun lt!39875 () Unit!2223)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1352 BitStream!1352 BitStream!1352 BitStream!1352 (_ BitVec 64) List!377) Unit!2223)

(assert (=> b!28406 (= lt!39875 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1622 lt!39867) (_2!1622 lt!39867) (_1!1623 lt!39870) (_1!1623 lt!39880) (bvsub to!314 i!635) lt!39869))))

(declare-fun b!28407 () Bool)

(declare-fun e!19133 () Bool)

(assert (=> b!28407 (= e!19143 e!19133)))

(declare-fun res!24655 () Bool)

(assert (=> b!28407 (=> res!24655 e!19133)))

(assert (=> b!28407 (= res!24655 (not (isPrefixOf!0 (_2!1622 lt!39872) (_2!1622 lt!39867))))))

(assert (=> b!28407 (isPrefixOf!0 thiss!1379 (_2!1622 lt!39867))))

(declare-fun lt!39874 () Unit!2223)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1352 BitStream!1352 BitStream!1352) Unit!2223)

(assert (=> b!28407 (= lt!39874 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1622 lt!39872) (_2!1622 lt!39867)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1352 array!1755 (_ BitVec 64) (_ BitVec 64)) tuple2!3070)

(assert (=> b!28407 (= lt!39867 (appendBitsMSBFirstLoop!0 (_2!1622 lt!39872) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!19138 () Bool)

(assert (=> b!28407 e!19138))

(declare-fun res!24646 () Bool)

(assert (=> b!28407 (=> (not res!24646) (not e!19138))))

(assert (=> b!28407 (= res!24646 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39872)))) ((_ sign_extend 32) (currentByte!2412 thiss!1379)) ((_ sign_extend 32) (currentBit!2407 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39877 () Unit!2223)

(assert (=> b!28407 (= lt!39877 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1087 (_2!1622 lt!39872)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39871 () tuple2!3072)

(assert (=> b!28407 (= lt!39871 (reader!0 thiss!1379 (_2!1622 lt!39872)))))

(declare-fun b!28408 () Bool)

(declare-fun head!214 (List!377) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1352 array!1755 (_ BitVec 64) (_ BitVec 64)) List!377)

(assert (=> b!28408 (= e!19138 (= (head!214 (byteArrayBitContentToList!0 (_2!1622 lt!39872) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!214 (bitStreamReadBitsIntoList!0 (_2!1622 lt!39872) (_1!1623 lt!39871) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!28409 () Bool)

(assert (=> b!28409 (= e!19133 e!19134)))

(declare-fun res!24643 () Bool)

(assert (=> b!28409 (=> res!24643 e!19134)))

(assert (=> b!28409 (= res!24643 (not (= lt!39881 (bvsub (bvadd lt!39876 to!314) i!635))))))

(assert (=> b!28409 (= lt!39881 (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!39867))) (currentByte!2412 (_2!1622 lt!39867)) (currentBit!2407 (_2!1622 lt!39867))))))

(declare-fun b!28410 () Bool)

(assert (=> b!28410 (= e!19140 (array_inv!729 (buf!1087 thiss!1379)))))

(declare-fun b!28411 () Bool)

(declare-fun res!24650 () Bool)

(assert (=> b!28411 (=> res!24650 e!19142)))

(assert (=> b!28411 (= res!24650 (not (invariant!0 (currentBit!2407 (_2!1622 lt!39872)) (currentByte!2412 (_2!1622 lt!39872)) (size!760 (buf!1087 (_2!1622 lt!39867))))))))

(assert (= (and start!6018 res!24647) b!28398))

(assert (= (and b!28398 res!24654) b!28403))

(assert (= (and b!28403 (not res!24657)) b!28397))

(assert (= (and b!28397 (not res!24648)) b!28407))

(assert (= (and b!28407 res!24646) b!28408))

(assert (= (and b!28407 (not res!24655)) b!28409))

(assert (= (and b!28409 (not res!24643)) b!28400))

(assert (= (and b!28400 (not res!24649)) b!28404))

(assert (= (and b!28404 (not res!24644)) b!28402))

(assert (= (and b!28402 res!24652) b!28399))

(assert (= (and b!28402 (not res!24651)) b!28396))

(assert (= (and b!28396 (not res!24653)) b!28411))

(assert (= (and b!28411 (not res!24650)) b!28405))

(assert (= (and b!28405 (not res!24656)) b!28401))

(assert (= (and b!28401 (not res!24645)) b!28406))

(assert (= start!6018 b!28410))

(declare-fun m!40689 () Bool)

(assert (=> start!6018 m!40689))

(declare-fun m!40691 () Bool)

(assert (=> start!6018 m!40691))

(declare-fun m!40693 () Bool)

(assert (=> b!28406 m!40693))

(declare-fun m!40695 () Bool)

(assert (=> b!28406 m!40695))

(declare-fun m!40697 () Bool)

(assert (=> b!28400 m!40697))

(declare-fun m!40699 () Bool)

(assert (=> b!28407 m!40699))

(declare-fun m!40701 () Bool)

(assert (=> b!28407 m!40701))

(declare-fun m!40703 () Bool)

(assert (=> b!28407 m!40703))

(declare-fun m!40705 () Bool)

(assert (=> b!28407 m!40705))

(declare-fun m!40707 () Bool)

(assert (=> b!28407 m!40707))

(declare-fun m!40709 () Bool)

(assert (=> b!28407 m!40709))

(declare-fun m!40711 () Bool)

(assert (=> b!28407 m!40711))

(declare-fun m!40713 () Bool)

(assert (=> b!28403 m!40713))

(declare-fun m!40715 () Bool)

(assert (=> b!28403 m!40715))

(declare-fun m!40717 () Bool)

(assert (=> b!28403 m!40717))

(declare-fun m!40719 () Bool)

(assert (=> b!28409 m!40719))

(declare-fun m!40721 () Bool)

(assert (=> b!28399 m!40721))

(declare-fun m!40723 () Bool)

(assert (=> b!28397 m!40723))

(declare-fun m!40725 () Bool)

(assert (=> b!28397 m!40725))

(declare-fun m!40727 () Bool)

(assert (=> b!28397 m!40727))

(declare-fun m!40729 () Bool)

(assert (=> b!28397 m!40729))

(declare-fun m!40731 () Bool)

(assert (=> b!28397 m!40731))

(assert (=> b!28397 m!40727))

(declare-fun m!40733 () Bool)

(assert (=> b!28405 m!40733))

(declare-fun m!40735 () Bool)

(assert (=> b!28405 m!40735))

(declare-fun m!40737 () Bool)

(assert (=> b!28405 m!40737))

(declare-fun m!40739 () Bool)

(assert (=> b!28405 m!40739))

(declare-fun m!40741 () Bool)

(assert (=> b!28405 m!40741))

(declare-fun m!40743 () Bool)

(assert (=> b!28405 m!40743))

(declare-fun m!40745 () Bool)

(assert (=> b!28405 m!40745))

(declare-fun m!40747 () Bool)

(assert (=> b!28405 m!40747))

(declare-fun m!40749 () Bool)

(assert (=> b!28398 m!40749))

(declare-fun m!40751 () Bool)

(assert (=> b!28401 m!40751))

(declare-fun m!40753 () Bool)

(assert (=> b!28411 m!40753))

(declare-fun m!40755 () Bool)

(assert (=> b!28396 m!40755))

(declare-fun m!40757 () Bool)

(assert (=> b!28408 m!40757))

(assert (=> b!28408 m!40757))

(declare-fun m!40759 () Bool)

(assert (=> b!28408 m!40759))

(declare-fun m!40761 () Bool)

(assert (=> b!28408 m!40761))

(assert (=> b!28408 m!40761))

(declare-fun m!40763 () Bool)

(assert (=> b!28408 m!40763))

(declare-fun m!40765 () Bool)

(assert (=> b!28410 m!40765))

(push 1)

(assert (not b!28407))

(assert (not b!28403))

(assert (not b!28401))

(assert (not b!28409))

(assert (not b!28408))

(assert (not b!28397))

(assert (not b!28399))

(assert (not b!28406))

(assert (not start!6018))

(assert (not b!28411))

(assert (not b!28410))

(assert (not b!28398))

(assert (not b!28396))

(assert (not b!28400))

(assert (not b!28405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!28521 () Bool)

(declare-fun e!19199 () Unit!2223)

(declare-fun Unit!2244 () Unit!2223)

(assert (=> b!28521 (= e!19199 Unit!2244)))

(declare-fun b!28522 () Bool)

(declare-fun res!24726 () Bool)

(declare-fun e!19200 () Bool)

(assert (=> b!28522 (=> (not res!24726) (not e!19200))))

(declare-fun lt!40123 () tuple2!3072)

(assert (=> b!28522 (= res!24726 (isPrefixOf!0 (_1!1623 lt!40123) (_2!1622 lt!39872)))))

(declare-fun b!28523 () Bool)

(declare-fun res!24728 () Bool)

(assert (=> b!28523 (=> (not res!24728) (not e!19200))))

(assert (=> b!28523 (= res!24728 (isPrefixOf!0 (_2!1623 lt!40123) (_2!1622 lt!39867)))))

(declare-fun b!28524 () Bool)

(declare-fun lt!40126 () (_ BitVec 64))

(declare-fun lt!40122 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1352 (_ BitVec 64)) BitStream!1352)

(assert (=> b!28524 (= e!19200 (= (_1!1623 lt!40123) (withMovedBitIndex!0 (_2!1623 lt!40123) (bvsub lt!40122 lt!40126))))))

(assert (=> b!28524 (or (= (bvand lt!40122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40122 lt!40126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28524 (= lt!40126 (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!39867))) (currentByte!2412 (_2!1622 lt!39867)) (currentBit!2407 (_2!1622 lt!39867))))))

(assert (=> b!28524 (= lt!40122 (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!39872))) (currentByte!2412 (_2!1622 lt!39872)) (currentBit!2407 (_2!1622 lt!39872))))))

(declare-fun b!28525 () Bool)

(declare-fun lt!40116 () Unit!2223)

(assert (=> b!28525 (= e!19199 lt!40116)))

(declare-fun lt!40114 () (_ BitVec 64))

(assert (=> b!28525 (= lt!40114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40107 () (_ BitVec 64))

(assert (=> b!28525 (= lt!40107 (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!39872))) (currentByte!2412 (_2!1622 lt!39872)) (currentBit!2407 (_2!1622 lt!39872))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1755 array!1755 (_ BitVec 64) (_ BitVec 64)) Unit!2223)

(assert (=> b!28525 (= lt!40116 (arrayBitRangesEqSymmetric!0 (buf!1087 (_2!1622 lt!39872)) (buf!1087 (_2!1622 lt!39867)) lt!40114 lt!40107))))

(declare-fun arrayBitRangesEq!0 (array!1755 array!1755 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28525 (arrayBitRangesEq!0 (buf!1087 (_2!1622 lt!39867)) (buf!1087 (_2!1622 lt!39872)) lt!40114 lt!40107)))

(declare-fun d!7932 () Bool)

(assert (=> d!7932 e!19200))

(declare-fun res!24727 () Bool)

(assert (=> d!7932 (=> (not res!24727) (not e!19200))))

(assert (=> d!7932 (= res!24727 (isPrefixOf!0 (_1!1623 lt!40123) (_2!1623 lt!40123)))))

(declare-fun lt!40112 () BitStream!1352)

(assert (=> d!7932 (= lt!40123 (tuple2!3073 lt!40112 (_2!1622 lt!39867)))))

(declare-fun lt!40108 () Unit!2223)

(declare-fun lt!40121 () Unit!2223)

(assert (=> d!7932 (= lt!40108 lt!40121)))

(assert (=> d!7932 (isPrefixOf!0 lt!40112 (_2!1622 lt!39867))))

(assert (=> d!7932 (= lt!40121 (lemmaIsPrefixTransitive!0 lt!40112 (_2!1622 lt!39867) (_2!1622 lt!39867)))))

(declare-fun lt!40115 () Unit!2223)

(declare-fun lt!40125 () Unit!2223)

(assert (=> d!7932 (= lt!40115 lt!40125)))

(assert (=> d!7932 (isPrefixOf!0 lt!40112 (_2!1622 lt!39867))))

(assert (=> d!7932 (= lt!40125 (lemmaIsPrefixTransitive!0 lt!40112 (_2!1622 lt!39872) (_2!1622 lt!39867)))))

(declare-fun lt!40111 () Unit!2223)

(assert (=> d!7932 (= lt!40111 e!19199)))

(declare-fun c!1797 () Bool)

(assert (=> d!7932 (= c!1797 (not (= (size!760 (buf!1087 (_2!1622 lt!39872))) #b00000000000000000000000000000000)))))

(declare-fun lt!40110 () Unit!2223)

(declare-fun lt!40117 () Unit!2223)

(assert (=> d!7932 (= lt!40110 lt!40117)))

(assert (=> d!7932 (isPrefixOf!0 (_2!1622 lt!39867) (_2!1622 lt!39867))))

(assert (=> d!7932 (= lt!40117 (lemmaIsPrefixRefl!0 (_2!1622 lt!39867)))))

(declare-fun lt!40124 () Unit!2223)

(declare-fun lt!40109 () Unit!2223)

(assert (=> d!7932 (= lt!40124 lt!40109)))

(assert (=> d!7932 (= lt!40109 (lemmaIsPrefixRefl!0 (_2!1622 lt!39867)))))

(declare-fun lt!40113 () Unit!2223)

(declare-fun lt!40118 () Unit!2223)

(assert (=> d!7932 (= lt!40113 lt!40118)))

(assert (=> d!7932 (isPrefixOf!0 lt!40112 lt!40112)))

(assert (=> d!7932 (= lt!40118 (lemmaIsPrefixRefl!0 lt!40112))))

(declare-fun lt!40120 () Unit!2223)

(declare-fun lt!40119 () Unit!2223)

(assert (=> d!7932 (= lt!40120 lt!40119)))

(assert (=> d!7932 (isPrefixOf!0 (_2!1622 lt!39872) (_2!1622 lt!39872))))

(assert (=> d!7932 (= lt!40119 (lemmaIsPrefixRefl!0 (_2!1622 lt!39872)))))

(assert (=> d!7932 (= lt!40112 (BitStream!1353 (buf!1087 (_2!1622 lt!39867)) (currentByte!2412 (_2!1622 lt!39872)) (currentBit!2407 (_2!1622 lt!39872))))))

(assert (=> d!7932 (isPrefixOf!0 (_2!1622 lt!39872) (_2!1622 lt!39867))))

(assert (=> d!7932 (= (reader!0 (_2!1622 lt!39872) (_2!1622 lt!39867)) lt!40123)))

(assert (= (and d!7932 c!1797) b!28525))

(assert (= (and d!7932 (not c!1797)) b!28521))

(assert (= (and d!7932 res!24727) b!28522))

(assert (= (and b!28522 res!24726) b!28523))

(assert (= (and b!28523 res!24728) b!28524))

(declare-fun m!40917 () Bool)

(assert (=> b!28523 m!40917))

(assert (=> b!28525 m!40721))

(declare-fun m!40919 () Bool)

(assert (=> b!28525 m!40919))

(declare-fun m!40921 () Bool)

(assert (=> b!28525 m!40921))

(declare-fun m!40923 () Bool)

(assert (=> b!28524 m!40923))

(assert (=> b!28524 m!40719))

(assert (=> b!28524 m!40721))

(declare-fun m!40925 () Bool)

(assert (=> d!7932 m!40925))

(declare-fun m!40927 () Bool)

(assert (=> d!7932 m!40927))

(declare-fun m!40929 () Bool)

(assert (=> d!7932 m!40929))

(declare-fun m!40931 () Bool)

(assert (=> d!7932 m!40931))

(declare-fun m!40933 () Bool)

(assert (=> d!7932 m!40933))

(declare-fun m!40935 () Bool)

(assert (=> d!7932 m!40935))

(declare-fun m!40937 () Bool)

(assert (=> d!7932 m!40937))

(assert (=> d!7932 m!40711))

(declare-fun m!40939 () Bool)

(assert (=> d!7932 m!40939))

(declare-fun m!40941 () Bool)

(assert (=> d!7932 m!40941))

(declare-fun m!40943 () Bool)

(assert (=> d!7932 m!40943))

(declare-fun m!40945 () Bool)

(assert (=> b!28522 m!40945))

(assert (=> b!28405 d!7932))

(declare-fun b!28537 () Bool)

(declare-fun e!19205 () Bool)

(declare-fun lt!40133 () List!377)

(assert (=> b!28537 (= e!19205 (> (length!103 lt!40133) 0))))

(declare-fun b!28536 () Bool)

(declare-fun isEmpty!72 (List!377) Bool)

(assert (=> b!28536 (= e!19205 (isEmpty!72 lt!40133))))

(declare-fun b!28535 () Bool)

(declare-fun lt!40134 () (_ BitVec 64))

(declare-datatypes ((tuple2!3090 0))(
  ( (tuple2!3091 (_1!1632 Bool) (_2!1632 BitStream!1352)) )
))
(declare-fun lt!40135 () tuple2!3090)

(declare-datatypes ((tuple2!3092 0))(
  ( (tuple2!3093 (_1!1633 List!377) (_2!1633 BitStream!1352)) )
))
(declare-fun e!19206 () tuple2!3092)

(assert (=> b!28535 (= e!19206 (tuple2!3093 (Cons!373 (_1!1632 lt!40135) (bitStreamReadBitsIntoList!0 (_2!1622 lt!39867) (_2!1632 lt!40135) (bvsub lt!39882 lt!40134))) (_2!1632 lt!40135)))))

(declare-fun readBit!0 (BitStream!1352) tuple2!3090)

(assert (=> b!28535 (= lt!40135 (readBit!0 (_1!1623 lt!39880)))))

(assert (=> b!28535 (= lt!40134 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7934 () Bool)

(assert (=> d!7934 e!19205))

(declare-fun c!1802 () Bool)

(assert (=> d!7934 (= c!1802 (= lt!39882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7934 (= lt!40133 (_1!1633 e!19206))))

(declare-fun c!1803 () Bool)

(assert (=> d!7934 (= c!1803 (= lt!39882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7934 (bvsge lt!39882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7934 (= (bitStreamReadBitsIntoList!0 (_2!1622 lt!39867) (_1!1623 lt!39880) lt!39882) lt!40133)))

(declare-fun b!28534 () Bool)

(assert (=> b!28534 (= e!19206 (tuple2!3093 Nil!374 (_1!1623 lt!39880)))))

(assert (= (and d!7934 c!1803) b!28534))

(assert (= (and d!7934 (not c!1803)) b!28535))

(assert (= (and d!7934 c!1802) b!28536))

(assert (= (and d!7934 (not c!1802)) b!28537))

(declare-fun m!40947 () Bool)

(assert (=> b!28537 m!40947))

(declare-fun m!40949 () Bool)

(assert (=> b!28536 m!40949))

(declare-fun m!40951 () Bool)

(assert (=> b!28535 m!40951))

(declare-fun m!40953 () Bool)

(assert (=> b!28535 m!40953))

(assert (=> b!28405 d!7934))

(declare-fun d!7936 () Bool)

(assert (=> d!7936 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872))) lt!39882)))

(declare-fun lt!40138 () Unit!2223)

(declare-fun choose!9 (BitStream!1352 array!1755 (_ BitVec 64) BitStream!1352) Unit!2223)

(assert (=> d!7936 (= lt!40138 (choose!9 (_2!1622 lt!39872) (buf!1087 (_2!1622 lt!39867)) lt!39882 (BitStream!1353 (buf!1087 (_2!1622 lt!39867)) (currentByte!2412 (_2!1622 lt!39872)) (currentBit!2407 (_2!1622 lt!39872)))))))

(assert (=> d!7936 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1622 lt!39872) (buf!1087 (_2!1622 lt!39867)) lt!39882) lt!40138)))

(declare-fun bs!2294 () Bool)

(assert (= bs!2294 d!7936))

(assert (=> bs!2294 m!40743))

(declare-fun m!40955 () Bool)

(assert (=> bs!2294 m!40955))

(assert (=> b!28405 d!7936))

(declare-fun d!7938 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7938 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872))) lt!39882) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872)))) lt!39882))))

(declare-fun bs!2295 () Bool)

(assert (= bs!2295 d!7938))

(declare-fun m!40957 () Bool)

(assert (=> bs!2295 m!40957))

(assert (=> b!28405 d!7938))

(declare-fun d!7940 () Bool)

(assert (=> d!7940 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 thiss!1379)) ((_ sign_extend 32) (currentBit!2407 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 thiss!1379)) ((_ sign_extend 32) (currentBit!2407 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2296 () Bool)

(assert (= bs!2296 d!7940))

(declare-fun m!40959 () Bool)

(assert (=> bs!2296 m!40959))

(assert (=> b!28405 d!7940))

(declare-fun b!28541 () Bool)

(declare-fun e!19207 () Bool)

(declare-fun lt!40139 () List!377)

(assert (=> b!28541 (= e!19207 (> (length!103 lt!40139) 0))))

(declare-fun b!28540 () Bool)

(assert (=> b!28540 (= e!19207 (isEmpty!72 lt!40139))))

(declare-fun lt!40140 () (_ BitVec 64))

(declare-fun lt!40141 () tuple2!3090)

(declare-fun b!28539 () Bool)

(declare-fun e!19208 () tuple2!3092)

(assert (=> b!28539 (= e!19208 (tuple2!3093 (Cons!373 (_1!1632 lt!40141) (bitStreamReadBitsIntoList!0 (_2!1622 lt!39867) (_2!1632 lt!40141) (bvsub (bvsub to!314 i!635) lt!40140))) (_2!1632 lt!40141)))))

(assert (=> b!28539 (= lt!40141 (readBit!0 (_1!1623 lt!39870)))))

(assert (=> b!28539 (= lt!40140 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7942 () Bool)

(assert (=> d!7942 e!19207))

(declare-fun c!1804 () Bool)

(assert (=> d!7942 (= c!1804 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7942 (= lt!40139 (_1!1633 e!19208))))

(declare-fun c!1805 () Bool)

(assert (=> d!7942 (= c!1805 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7942 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7942 (= (bitStreamReadBitsIntoList!0 (_2!1622 lt!39867) (_1!1623 lt!39870) (bvsub to!314 i!635)) lt!40139)))

(declare-fun b!28538 () Bool)

(assert (=> b!28538 (= e!19208 (tuple2!3093 Nil!374 (_1!1623 lt!39870)))))

(assert (= (and d!7942 c!1805) b!28538))

(assert (= (and d!7942 (not c!1805)) b!28539))

(assert (= (and d!7942 c!1804) b!28540))

(assert (= (and d!7942 (not c!1804)) b!28541))

(declare-fun m!40961 () Bool)

(assert (=> b!28541 m!40961))

(declare-fun m!40963 () Bool)

(assert (=> b!28540 m!40963))

(declare-fun m!40965 () Bool)

(assert (=> b!28539 m!40965))

(declare-fun m!40967 () Bool)

(assert (=> b!28539 m!40967))

(assert (=> b!28405 d!7942))

(declare-fun d!7944 () Bool)

(assert (=> d!7944 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39867)))) ((_ sign_extend 32) (currentByte!2412 thiss!1379)) ((_ sign_extend 32) (currentBit!2407 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!40142 () Unit!2223)

(assert (=> d!7944 (= lt!40142 (choose!9 thiss!1379 (buf!1087 (_2!1622 lt!39867)) (bvsub to!314 i!635) (BitStream!1353 (buf!1087 (_2!1622 lt!39867)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379))))))

(assert (=> d!7944 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1087 (_2!1622 lt!39867)) (bvsub to!314 i!635)) lt!40142)))

(declare-fun bs!2297 () Bool)

(assert (= bs!2297 d!7944))

(assert (=> bs!2297 m!40741))

(declare-fun m!40969 () Bool)

(assert (=> bs!2297 m!40969))

(assert (=> b!28405 d!7944))

(declare-fun b!28542 () Bool)

(declare-fun e!19209 () Unit!2223)

(declare-fun Unit!2246 () Unit!2223)

(assert (=> b!28542 (= e!19209 Unit!2246)))

(declare-fun b!28543 () Bool)

(declare-fun res!24729 () Bool)

(declare-fun e!19210 () Bool)

(assert (=> b!28543 (=> (not res!24729) (not e!19210))))

(declare-fun lt!40159 () tuple2!3072)

(assert (=> b!28543 (= res!24729 (isPrefixOf!0 (_1!1623 lt!40159) thiss!1379))))

(declare-fun b!28544 () Bool)

(declare-fun res!24731 () Bool)

(assert (=> b!28544 (=> (not res!24731) (not e!19210))))

(assert (=> b!28544 (= res!24731 (isPrefixOf!0 (_2!1623 lt!40159) (_2!1622 lt!39867)))))

(declare-fun lt!40162 () (_ BitVec 64))

(declare-fun b!28545 () Bool)

(declare-fun lt!40158 () (_ BitVec 64))

(assert (=> b!28545 (= e!19210 (= (_1!1623 lt!40159) (withMovedBitIndex!0 (_2!1623 lt!40159) (bvsub lt!40158 lt!40162))))))

(assert (=> b!28545 (or (= (bvand lt!40158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40158 lt!40162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28545 (= lt!40162 (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!39867))) (currentByte!2412 (_2!1622 lt!39867)) (currentBit!2407 (_2!1622 lt!39867))))))

(assert (=> b!28545 (= lt!40158 (bitIndex!0 (size!760 (buf!1087 thiss!1379)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379)))))

(declare-fun b!28546 () Bool)

(declare-fun lt!40152 () Unit!2223)

(assert (=> b!28546 (= e!19209 lt!40152)))

(declare-fun lt!40150 () (_ BitVec 64))

(assert (=> b!28546 (= lt!40150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40143 () (_ BitVec 64))

(assert (=> b!28546 (= lt!40143 (bitIndex!0 (size!760 (buf!1087 thiss!1379)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379)))))

(assert (=> b!28546 (= lt!40152 (arrayBitRangesEqSymmetric!0 (buf!1087 thiss!1379) (buf!1087 (_2!1622 lt!39867)) lt!40150 lt!40143))))

(assert (=> b!28546 (arrayBitRangesEq!0 (buf!1087 (_2!1622 lt!39867)) (buf!1087 thiss!1379) lt!40150 lt!40143)))

(declare-fun d!7946 () Bool)

(assert (=> d!7946 e!19210))

(declare-fun res!24730 () Bool)

(assert (=> d!7946 (=> (not res!24730) (not e!19210))))

(assert (=> d!7946 (= res!24730 (isPrefixOf!0 (_1!1623 lt!40159) (_2!1623 lt!40159)))))

(declare-fun lt!40148 () BitStream!1352)

(assert (=> d!7946 (= lt!40159 (tuple2!3073 lt!40148 (_2!1622 lt!39867)))))

(declare-fun lt!40144 () Unit!2223)

(declare-fun lt!40157 () Unit!2223)

(assert (=> d!7946 (= lt!40144 lt!40157)))

(assert (=> d!7946 (isPrefixOf!0 lt!40148 (_2!1622 lt!39867))))

(assert (=> d!7946 (= lt!40157 (lemmaIsPrefixTransitive!0 lt!40148 (_2!1622 lt!39867) (_2!1622 lt!39867)))))

(declare-fun lt!40151 () Unit!2223)

(declare-fun lt!40161 () Unit!2223)

(assert (=> d!7946 (= lt!40151 lt!40161)))

(assert (=> d!7946 (isPrefixOf!0 lt!40148 (_2!1622 lt!39867))))

(assert (=> d!7946 (= lt!40161 (lemmaIsPrefixTransitive!0 lt!40148 thiss!1379 (_2!1622 lt!39867)))))

(declare-fun lt!40147 () Unit!2223)

(assert (=> d!7946 (= lt!40147 e!19209)))

(declare-fun c!1806 () Bool)

(assert (=> d!7946 (= c!1806 (not (= (size!760 (buf!1087 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!40146 () Unit!2223)

(declare-fun lt!40153 () Unit!2223)

(assert (=> d!7946 (= lt!40146 lt!40153)))

(assert (=> d!7946 (isPrefixOf!0 (_2!1622 lt!39867) (_2!1622 lt!39867))))

(assert (=> d!7946 (= lt!40153 (lemmaIsPrefixRefl!0 (_2!1622 lt!39867)))))

(declare-fun lt!40160 () Unit!2223)

(declare-fun lt!40145 () Unit!2223)

(assert (=> d!7946 (= lt!40160 lt!40145)))

(assert (=> d!7946 (= lt!40145 (lemmaIsPrefixRefl!0 (_2!1622 lt!39867)))))

(declare-fun lt!40149 () Unit!2223)

(declare-fun lt!40154 () Unit!2223)

(assert (=> d!7946 (= lt!40149 lt!40154)))

(assert (=> d!7946 (isPrefixOf!0 lt!40148 lt!40148)))

(assert (=> d!7946 (= lt!40154 (lemmaIsPrefixRefl!0 lt!40148))))

(declare-fun lt!40156 () Unit!2223)

(declare-fun lt!40155 () Unit!2223)

(assert (=> d!7946 (= lt!40156 lt!40155)))

(assert (=> d!7946 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7946 (= lt!40155 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7946 (= lt!40148 (BitStream!1353 (buf!1087 (_2!1622 lt!39867)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379)))))

(assert (=> d!7946 (isPrefixOf!0 thiss!1379 (_2!1622 lt!39867))))

(assert (=> d!7946 (= (reader!0 thiss!1379 (_2!1622 lt!39867)) lt!40159)))

(assert (= (and d!7946 c!1806) b!28546))

(assert (= (and d!7946 (not c!1806)) b!28542))

(assert (= (and d!7946 res!24730) b!28543))

(assert (= (and b!28543 res!24729) b!28544))

(assert (= (and b!28544 res!24731) b!28545))

(declare-fun m!40971 () Bool)

(assert (=> b!28544 m!40971))

(assert (=> b!28546 m!40717))

(declare-fun m!40973 () Bool)

(assert (=> b!28546 m!40973))

(declare-fun m!40975 () Bool)

(assert (=> b!28546 m!40975))

(declare-fun m!40977 () Bool)

(assert (=> b!28545 m!40977))

(assert (=> b!28545 m!40719))

(assert (=> b!28545 m!40717))

(assert (=> d!7946 m!40925))

(assert (=> d!7946 m!40715))

(declare-fun m!40979 () Bool)

(assert (=> d!7946 m!40979))

(declare-fun m!40981 () Bool)

(assert (=> d!7946 m!40981))

(assert (=> d!7946 m!40713))

(declare-fun m!40983 () Bool)

(assert (=> d!7946 m!40983))

(declare-fun m!40985 () Bool)

(assert (=> d!7946 m!40985))

(assert (=> d!7946 m!40699))

(declare-fun m!40987 () Bool)

(assert (=> d!7946 m!40987))

(declare-fun m!40989 () Bool)

(assert (=> d!7946 m!40989))

(assert (=> d!7946 m!40943))

(declare-fun m!40991 () Bool)

(assert (=> b!28543 m!40991))

(assert (=> b!28405 d!7946))

(declare-fun d!7948 () Bool)

(assert (=> d!7948 (= (invariant!0 (currentBit!2407 (_2!1622 lt!39872)) (currentByte!2412 (_2!1622 lt!39872)) (size!760 (buf!1087 (_2!1622 lt!39872)))) (and (bvsge (currentBit!2407 (_2!1622 lt!39872)) #b00000000000000000000000000000000) (bvslt (currentBit!2407 (_2!1622 lt!39872)) #b00000000000000000000000000001000) (bvsge (currentByte!2412 (_2!1622 lt!39872)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2412 (_2!1622 lt!39872)) (size!760 (buf!1087 (_2!1622 lt!39872)))) (and (= (currentBit!2407 (_2!1622 lt!39872)) #b00000000000000000000000000000000) (= (currentByte!2412 (_2!1622 lt!39872)) (size!760 (buf!1087 (_2!1622 lt!39872))))))))))

(assert (=> b!28396 d!7948))

(declare-fun d!7950 () Bool)

(assert (=> d!7950 (= (tail!94 lt!39869) (t!1127 lt!39869))))

(assert (=> b!28406 d!7950))

(declare-fun d!7952 () Bool)

(declare-fun e!19213 () Bool)

(assert (=> d!7952 e!19213))

(declare-fun res!24734 () Bool)

(assert (=> d!7952 (=> (not res!24734) (not e!19213))))

(declare-fun lt!40168 () (_ BitVec 64))

(assert (=> d!7952 (= res!24734 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!40168) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!7952 (= lt!40168 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40167 () Unit!2223)

(declare-fun choose!42 (BitStream!1352 BitStream!1352 BitStream!1352 BitStream!1352 (_ BitVec 64) List!377) Unit!2223)

(assert (=> d!7952 (= lt!40167 (choose!42 (_2!1622 lt!39867) (_2!1622 lt!39867) (_1!1623 lt!39870) (_1!1623 lt!39880) (bvsub to!314 i!635) lt!39869))))

(assert (=> d!7952 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7952 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1622 lt!39867) (_2!1622 lt!39867) (_1!1623 lt!39870) (_1!1623 lt!39880) (bvsub to!314 i!635) lt!39869) lt!40167)))

(declare-fun b!28549 () Bool)

(assert (=> b!28549 (= e!19213 (= (bitStreamReadBitsIntoList!0 (_2!1622 lt!39867) (_1!1623 lt!39880) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!94 lt!39869)))))

(assert (= (and d!7952 res!24734) b!28549))

(declare-fun m!40993 () Bool)

(assert (=> d!7952 m!40993))

(declare-fun m!40995 () Bool)

(assert (=> b!28549 m!40995))

(assert (=> b!28549 m!40693))

(assert (=> b!28406 d!7952))

(declare-fun d!7954 () Bool)

(assert (=> d!7954 (= (head!214 (byteArrayBitContentToList!0 (_2!1622 lt!39872) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!492 (byteArrayBitContentToList!0 (_2!1622 lt!39872) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28408 d!7954))

(declare-fun d!7956 () Bool)

(declare-fun c!1809 () Bool)

(assert (=> d!7956 (= c!1809 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19216 () List!377)

(assert (=> d!7956 (= (byteArrayBitContentToList!0 (_2!1622 lt!39872) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19216)))

(declare-fun b!28554 () Bool)

(assert (=> b!28554 (= e!19216 Nil!374)))

(declare-fun b!28555 () Bool)

(assert (=> b!28555 (= e!19216 (Cons!373 (not (= (bvand ((_ sign_extend 24) (select (arr!1222 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1622 lt!39872) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7956 c!1809) b!28554))

(assert (= (and d!7956 (not c!1809)) b!28555))

(assert (=> b!28555 m!40727))

(declare-fun m!40997 () Bool)

(assert (=> b!28555 m!40997))

(declare-fun m!40999 () Bool)

(assert (=> b!28555 m!40999))

(assert (=> b!28408 d!7956))

(declare-fun d!7958 () Bool)

(assert (=> d!7958 (= (head!214 (bitStreamReadBitsIntoList!0 (_2!1622 lt!39872) (_1!1623 lt!39871) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!492 (bitStreamReadBitsIntoList!0 (_2!1622 lt!39872) (_1!1623 lt!39871) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28408 d!7958))

(declare-fun b!28559 () Bool)

(declare-fun e!19217 () Bool)

(declare-fun lt!40169 () List!377)

(assert (=> b!28559 (= e!19217 (> (length!103 lt!40169) 0))))

(declare-fun b!28558 () Bool)

(assert (=> b!28558 (= e!19217 (isEmpty!72 lt!40169))))

(declare-fun b!28557 () Bool)

(declare-fun lt!40170 () (_ BitVec 64))

(declare-fun e!19218 () tuple2!3092)

(declare-fun lt!40171 () tuple2!3090)

(assert (=> b!28557 (= e!19218 (tuple2!3093 (Cons!373 (_1!1632 lt!40171) (bitStreamReadBitsIntoList!0 (_2!1622 lt!39872) (_2!1632 lt!40171) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!40170))) (_2!1632 lt!40171)))))

(assert (=> b!28557 (= lt!40171 (readBit!0 (_1!1623 lt!39871)))))

(assert (=> b!28557 (= lt!40170 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7960 () Bool)

(assert (=> d!7960 e!19217))

(declare-fun c!1810 () Bool)

(assert (=> d!7960 (= c!1810 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7960 (= lt!40169 (_1!1633 e!19218))))

(declare-fun c!1811 () Bool)

(assert (=> d!7960 (= c!1811 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7960 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7960 (= (bitStreamReadBitsIntoList!0 (_2!1622 lt!39872) (_1!1623 lt!39871) #b0000000000000000000000000000000000000000000000000000000000000001) lt!40169)))

(declare-fun b!28556 () Bool)

(assert (=> b!28556 (= e!19218 (tuple2!3093 Nil!374 (_1!1623 lt!39871)))))

(assert (= (and d!7960 c!1811) b!28556))

(assert (= (and d!7960 (not c!1811)) b!28557))

(assert (= (and d!7960 c!1810) b!28558))

(assert (= (and d!7960 (not c!1810)) b!28559))

(declare-fun m!41001 () Bool)

(assert (=> b!28559 m!41001))

(declare-fun m!41003 () Bool)

(assert (=> b!28558 m!41003))

(declare-fun m!41005 () Bool)

(assert (=> b!28557 m!41005))

(declare-fun m!41007 () Bool)

(assert (=> b!28557 m!41007))

(assert (=> b!28408 d!7960))

(declare-fun d!7962 () Bool)

(declare-fun res!24742 () Bool)

(declare-fun e!19223 () Bool)

(assert (=> d!7962 (=> (not res!24742) (not e!19223))))

(assert (=> d!7962 (= res!24742 (= (size!760 (buf!1087 thiss!1379)) (size!760 (buf!1087 (_2!1622 lt!39872)))))))

(assert (=> d!7962 (= (isPrefixOf!0 thiss!1379 (_2!1622 lt!39872)) e!19223)))

(declare-fun b!28566 () Bool)

(declare-fun res!24741 () Bool)

(assert (=> b!28566 (=> (not res!24741) (not e!19223))))

(assert (=> b!28566 (= res!24741 (bvsle (bitIndex!0 (size!760 (buf!1087 thiss!1379)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379)) (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!39872))) (currentByte!2412 (_2!1622 lt!39872)) (currentBit!2407 (_2!1622 lt!39872)))))))

(declare-fun b!28567 () Bool)

(declare-fun e!19224 () Bool)

(assert (=> b!28567 (= e!19223 e!19224)))

(declare-fun res!24743 () Bool)

(assert (=> b!28567 (=> res!24743 e!19224)))

(assert (=> b!28567 (= res!24743 (= (size!760 (buf!1087 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28568 () Bool)

(assert (=> b!28568 (= e!19224 (arrayBitRangesEq!0 (buf!1087 thiss!1379) (buf!1087 (_2!1622 lt!39872)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!760 (buf!1087 thiss!1379)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379))))))

(assert (= (and d!7962 res!24742) b!28566))

(assert (= (and b!28566 res!24741) b!28567))

(assert (= (and b!28567 (not res!24743)) b!28568))

(assert (=> b!28566 m!40717))

(assert (=> b!28566 m!40721))

(assert (=> b!28568 m!40717))

(assert (=> b!28568 m!40717))

(declare-fun m!41009 () Bool)

(assert (=> b!28568 m!41009))

(assert (=> b!28397 d!7962))

(declare-fun d!7964 () Bool)

(assert (=> d!7964 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39872)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872))) lt!39882) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39872)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872)))) lt!39882))))

(declare-fun bs!2298 () Bool)

(assert (= bs!2298 d!7964))

(declare-fun m!41011 () Bool)

(assert (=> bs!2298 m!41011))

(assert (=> b!28397 d!7964))

(declare-fun d!7966 () Bool)

(declare-fun e!19227 () Bool)

(assert (=> d!7966 e!19227))

(declare-fun res!24746 () Bool)

(assert (=> d!7966 (=> (not res!24746) (not e!19227))))

(assert (=> d!7966 (= res!24746 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!40174 () Unit!2223)

(declare-fun choose!27 (BitStream!1352 BitStream!1352 (_ BitVec 64) (_ BitVec 64)) Unit!2223)

(assert (=> d!7966 (= lt!40174 (choose!27 thiss!1379 (_2!1622 lt!39872) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7966 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7966 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1622 lt!39872) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!40174)))

(declare-fun b!28571 () Bool)

(assert (=> b!28571 (= e!19227 (validate_offset_bits!1 ((_ sign_extend 32) (size!760 (buf!1087 (_2!1622 lt!39872)))) ((_ sign_extend 32) (currentByte!2412 (_2!1622 lt!39872))) ((_ sign_extend 32) (currentBit!2407 (_2!1622 lt!39872))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7966 res!24746) b!28571))

(declare-fun m!41013 () Bool)

(assert (=> d!7966 m!41013))

(declare-fun m!41015 () Bool)

(assert (=> b!28571 m!41015))

(assert (=> b!28397 d!7966))

(declare-fun b!28589 () Bool)

(declare-fun e!19237 () Bool)

(declare-datatypes ((tuple2!3094 0))(
  ( (tuple2!3095 (_1!1634 BitStream!1352) (_2!1634 Bool)) )
))
(declare-fun lt!40207 () tuple2!3094)

(declare-fun lt!40200 () tuple2!3070)

(assert (=> b!28589 (= e!19237 (= (bitIndex!0 (size!760 (buf!1087 (_1!1634 lt!40207))) (currentByte!2412 (_1!1634 lt!40207)) (currentBit!2407 (_1!1634 lt!40207))) (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!40200))) (currentByte!2412 (_2!1622 lt!40200)) (currentBit!2407 (_2!1622 lt!40200)))))))

(declare-fun b!28590 () Bool)

(declare-fun res!24767 () Bool)

(declare-fun e!19236 () Bool)

(assert (=> b!28590 (=> (not res!24767) (not e!19236))))

(declare-fun lt!40199 () (_ BitVec 64))

(declare-fun lt!40209 () (_ BitVec 64))

(assert (=> b!28590 (= res!24767 (= (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!40200))) (currentByte!2412 (_2!1622 lt!40200)) (currentBit!2407 (_2!1622 lt!40200))) (bvadd lt!40209 lt!40199)))))

(assert (=> b!28590 (or (not (= (bvand lt!40209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40199 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!40209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!40209 lt!40199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28590 (= lt!40199 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!28590 (= lt!40209 (bitIndex!0 (size!760 (buf!1087 thiss!1379)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379)))))

(declare-fun b!28591 () Bool)

(declare-fun res!24765 () Bool)

(assert (=> b!28591 (=> (not res!24765) (not e!19236))))

(assert (=> b!28591 (= res!24765 (isPrefixOf!0 thiss!1379 (_2!1622 lt!40200)))))

(declare-fun b!28592 () Bool)

(declare-fun res!24763 () Bool)

(declare-fun e!19238 () Bool)

(assert (=> b!28592 (=> (not res!24763) (not e!19238))))

(declare-fun lt!40201 () tuple2!3070)

(assert (=> b!28592 (= res!24763 (= (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!40201))) (currentByte!2412 (_2!1622 lt!40201)) (currentBit!2407 (_2!1622 lt!40201))) (bvadd (bitIndex!0 (size!760 (buf!1087 thiss!1379)) (currentByte!2412 thiss!1379) (currentBit!2407 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!7968 () Bool)

(assert (=> d!7968 e!19236))

(declare-fun res!24769 () Bool)

(assert (=> d!7968 (=> (not res!24769) (not e!19236))))

(assert (=> d!7968 (= res!24769 (= (size!760 (buf!1087 (_2!1622 lt!40200))) (size!760 (buf!1087 thiss!1379))))))

(declare-fun lt!40210 () (_ BitVec 8))

(declare-fun lt!40203 () array!1755)

(assert (=> d!7968 (= lt!40210 (select (arr!1222 lt!40203) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7968 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!760 lt!40203)))))

(assert (=> d!7968 (= lt!40203 (array!1756 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!40202 () tuple2!3070)

(assert (=> d!7968 (= lt!40200 (tuple2!3071 (_1!1622 lt!40202) (_2!1622 lt!40202)))))

(assert (=> d!7968 (= lt!40202 lt!40201)))

(assert (=> d!7968 e!19238))

(declare-fun res!24770 () Bool)

(assert (=> d!7968 (=> (not res!24770) (not e!19238))))

(assert (=> d!7968 (= res!24770 (= (size!760 (buf!1087 thiss!1379)) (size!760 (buf!1087 (_2!1622 lt!40201)))))))

(declare-fun lt!40204 () Bool)

(declare-fun appendBit!0 (BitStream!1352 Bool) tuple2!3070)

(assert (=> d!7968 (= lt!40201 (appendBit!0 thiss!1379 lt!40204))))

(assert (=> d!7968 (= lt!40204 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1222 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7968 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7968 (= (appendBitFromByte!0 thiss!1379 (select (arr!1222 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!40200)))

(declare-fun b!28593 () Bool)

(declare-fun e!19239 () Bool)

(assert (=> b!28593 (= e!19238 e!19239)))

(declare-fun res!24766 () Bool)

(assert (=> b!28593 (=> (not res!24766) (not e!19239))))

(declare-fun lt!40205 () tuple2!3094)

(assert (=> b!28593 (= res!24766 (and (= (_2!1634 lt!40205) lt!40204) (= (_1!1634 lt!40205) (_2!1622 lt!40201))))))

(declare-fun readBitPure!0 (BitStream!1352) tuple2!3094)

(declare-fun readerFrom!0 (BitStream!1352 (_ BitVec 32) (_ BitVec 32)) BitStream!1352)

(assert (=> b!28593 (= lt!40205 (readBitPure!0 (readerFrom!0 (_2!1622 lt!40201) (currentBit!2407 thiss!1379) (currentByte!2412 thiss!1379))))))

(declare-fun b!28594 () Bool)

(declare-fun res!24764 () Bool)

(assert (=> b!28594 (=> (not res!24764) (not e!19238))))

(assert (=> b!28594 (= res!24764 (isPrefixOf!0 thiss!1379 (_2!1622 lt!40201)))))

(declare-fun b!28595 () Bool)

(assert (=> b!28595 (= e!19239 (= (bitIndex!0 (size!760 (buf!1087 (_1!1634 lt!40205))) (currentByte!2412 (_1!1634 lt!40205)) (currentBit!2407 (_1!1634 lt!40205))) (bitIndex!0 (size!760 (buf!1087 (_2!1622 lt!40201))) (currentByte!2412 (_2!1622 lt!40201)) (currentBit!2407 (_2!1622 lt!40201)))))))

(declare-fun b!28596 () Bool)

(assert (=> b!28596 (= e!19236 e!19237)))

(declare-fun res!24768 () Bool)

(assert (=> b!28596 (=> (not res!24768) (not e!19237))))

(assert (=> b!28596 (= res!24768 (and (= (_2!1634 lt!40207) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1222 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!40210)) #b00000000000000000000000000000000))) (= (_1!1634 lt!40207) (_2!1622 lt!40200))))))

(declare-datatypes ((tuple2!3096 0))(
  ( (tuple2!3097 (_1!1635 array!1755) (_2!1635 BitStream!1352)) )
))
(declare-fun lt!40208 () tuple2!3096)

(declare-fun lt!40206 () BitStream!1352)

(declare-fun readBits!0 (BitStream!1352 (_ BitVec 64)) tuple2!3096)

(assert (=> b!28596 (= lt!40208 (readBits!0 lt!40206 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!28596 (= lt!40207 (readBitPure!0 lt!40206))))

(assert (=> b!28596 (= lt!40206 (readerFrom!0 (_2!1622 lt!40200) (currentBit!2407 thiss!1379) (currentByte!2412 thiss!1379)))))

(assert (= (and d!7968 res!24770) b!28592))

(assert (= (and b!28592 res!24763) b!28594))

(assert (= (and b!28594 res!24764) b!28593))

(assert (= (and b!28593 res!24766) b!28595))

(assert (= (and d!7968 res!24769) b!28590))

(assert (= (and b!28590 res!24767) b!28591))

(assert (= (and b!28591 res!24765) b!28596))

(assert (= (and b!28596 res!24768) b!28589))

(declare-fun m!41017 () Bool)

(assert (=> d!7968 m!41017))

(declare-fun m!41019 () Bool)

(assert (=> d!7968 m!41019))

(assert (=> d!7968 m!40997))

(declare-fun m!41021 () Bool)

(assert (=> b!28593 m!41021))

(assert (=> b!28593 m!41021))

(declare-fun m!41023 () Bool)

(assert (=> b!28593 m!41023))

(declare-fun m!41025 () Bool)

(assert (=> b!28589 m!41025))

(declare-fun m!41027 () Bool)

(assert (=> b!28589 m!41027))

(declare-fun m!41029 () Bool)

