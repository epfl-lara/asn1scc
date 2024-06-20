; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12232 () Bool)

(assert start!12232)

(declare-fun res!51979 () Bool)

(declare-fun e!41485 () Bool)

(assert (=> start!12232 (=> (not res!51979) (not e!41485))))

(declare-datatypes ((array!2792 0))(
  ( (array!2793 (arr!1840 (Array (_ BitVec 32) (_ BitVec 8))) (size!1276 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2792)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!12232 (= res!51979 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1276 srcBuffer!2))))))))

(assert (=> start!12232 e!41485))

(assert (=> start!12232 true))

(declare-fun array_inv!1170 (array!2792) Bool)

(assert (=> start!12232 (array_inv!1170 srcBuffer!2)))

(declare-datatypes ((BitStream!2222 0))(
  ( (BitStream!2223 (buf!1657 array!2792) (currentByte!3293 (_ BitVec 32)) (currentBit!3288 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2222)

(declare-fun e!41495 () Bool)

(declare-fun inv!12 (BitStream!2222) Bool)

(assert (=> start!12232 (and (inv!12 thiss!1379) e!41495)))

(declare-fun b!62440 () Bool)

(assert (=> b!62440 (= e!41495 (array_inv!1170 (buf!1657 thiss!1379)))))

(declare-fun b!62441 () Bool)

(declare-fun res!51968 () Bool)

(declare-fun e!41486 () Bool)

(assert (=> b!62441 (=> res!51968 e!41486)))

(declare-datatypes ((Unit!4247 0))(
  ( (Unit!4248) )
))
(declare-datatypes ((tuple2!5638 0))(
  ( (tuple2!5639 (_1!2930 Unit!4247) (_2!2930 BitStream!2222)) )
))
(declare-fun lt!97996 () tuple2!5638)

(declare-fun lt!97986 () tuple2!5638)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!62441 (= res!51968 (not (invariant!0 (currentBit!3288 (_2!2930 lt!97996)) (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97986))))))))

(declare-fun b!62442 () Bool)

(declare-fun res!51975 () Bool)

(assert (=> b!62442 (=> res!51975 e!41486)))

(assert (=> b!62442 (= res!51975 (not (invariant!0 (currentBit!3288 (_2!2930 lt!97996)) (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97996))))))))

(declare-fun lt!97990 () (_ BitVec 64))

(declare-fun e!41484 () Bool)

(declare-fun b!62443 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!62443 (= e!41484 (= lt!97990 (bvsub (bvsub (bvadd (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!62444 () Bool)

(declare-fun e!41487 () Bool)

(assert (=> b!62444 (= e!41487 e!41486)))

(declare-fun res!51973 () Bool)

(assert (=> b!62444 (=> res!51973 e!41486)))

(assert (=> b!62444 (= res!51973 (not (= (size!1276 (buf!1657 (_2!2930 lt!97996))) (size!1276 (buf!1657 (_2!2930 lt!97986))))))))

(assert (=> b!62444 e!41484))

(declare-fun res!51978 () Bool)

(assert (=> b!62444 (=> (not res!51978) (not e!41484))))

(assert (=> b!62444 (= res!51978 (= (size!1276 (buf!1657 (_2!2930 lt!97986))) (size!1276 (buf!1657 thiss!1379))))))

(declare-fun b!62445 () Bool)

(declare-fun res!51980 () Bool)

(assert (=> b!62445 (=> (not res!51980) (not e!41485))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62445 (= res!51980 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 thiss!1379))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!62446 () Bool)

(declare-fun res!51970 () Bool)

(declare-fun e!41491 () Bool)

(assert (=> b!62446 (=> res!51970 e!41491)))

(declare-datatypes ((tuple2!5640 0))(
  ( (tuple2!5641 (_1!2931 BitStream!2222) (_2!2931 BitStream!2222)) )
))
(declare-fun lt!97992 () tuple2!5640)

(declare-fun lt!97998 () tuple2!5640)

(declare-fun isPrefixOf!0 (BitStream!2222 BitStream!2222) Bool)

(assert (=> b!62446 (= res!51970 (not (isPrefixOf!0 (_1!2931 lt!97992) (_1!2931 lt!97998))))))

(declare-fun b!62447 () Bool)

(declare-fun e!41492 () Bool)

(assert (=> b!62447 (= e!41492 e!41487)))

(declare-fun res!51967 () Bool)

(assert (=> b!62447 (=> res!51967 e!41487)))

(declare-fun lt!97994 () (_ BitVec 64))

(assert (=> b!62447 (= res!51967 (not (= lt!97990 (bvsub (bvadd lt!97994 to!314) i!635))))))

(assert (=> b!62447 (= lt!97990 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97986))) (currentByte!3293 (_2!2930 lt!97986)) (currentBit!3288 (_2!2930 lt!97986))))))

(declare-fun b!62448 () Bool)

(declare-fun res!51974 () Bool)

(assert (=> b!62448 (=> res!51974 e!41491)))

(assert (=> b!62448 (= res!51974 (not (isPrefixOf!0 (_1!2931 lt!97992) (_2!2930 lt!97986))))))

(declare-fun b!62449 () Bool)

(declare-fun e!41493 () Bool)

(declare-fun e!41489 () Bool)

(assert (=> b!62449 (= e!41493 e!41489)))

(declare-fun res!51972 () Bool)

(assert (=> b!62449 (=> res!51972 e!41489)))

(assert (=> b!62449 (= res!51972 (not (isPrefixOf!0 thiss!1379 (_2!2930 lt!97996))))))

(declare-fun lt!97987 () (_ BitVec 64))

(assert (=> b!62449 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!97987)))

(assert (=> b!62449 (= lt!97987 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97988 () Unit!4247)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2222 BitStream!2222 (_ BitVec 64) (_ BitVec 64)) Unit!4247)

(assert (=> b!62449 (= lt!97988 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2930 lt!97996) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2222 (_ BitVec 8) (_ BitVec 32)) tuple2!5638)

(assert (=> b!62449 (= lt!97996 (appendBitFromByte!0 thiss!1379 (select (arr!1840 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!62450 () Bool)

(assert (=> b!62450 (= e!41489 e!41492)))

(declare-fun res!51964 () Bool)

(assert (=> b!62450 (=> res!51964 e!41492)))

(assert (=> b!62450 (= res!51964 (not (isPrefixOf!0 (_2!2930 lt!97996) (_2!2930 lt!97986))))))

(assert (=> b!62450 (isPrefixOf!0 thiss!1379 (_2!2930 lt!97986))))

(declare-fun lt!97984 () Unit!4247)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2222 BitStream!2222 BitStream!2222) Unit!4247)

(assert (=> b!62450 (= lt!97984 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2930 lt!97996) (_2!2930 lt!97986)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2222 array!2792 (_ BitVec 64) (_ BitVec 64)) tuple2!5638)

(assert (=> b!62450 (= lt!97986 (appendBitsMSBFirstLoop!0 (_2!2930 lt!97996) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!41494 () Bool)

(assert (=> b!62450 e!41494))

(declare-fun res!51971 () Bool)

(assert (=> b!62450 (=> (not res!51971) (not e!41494))))

(assert (=> b!62450 (= res!51971 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97997 () Unit!4247)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2222 array!2792 (_ BitVec 64)) Unit!4247)

(assert (=> b!62450 (= lt!97997 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1657 (_2!2930 lt!97996)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97991 () tuple2!5640)

(declare-fun reader!0 (BitStream!2222 BitStream!2222) tuple2!5640)

(assert (=> b!62450 (= lt!97991 (reader!0 thiss!1379 (_2!2930 lt!97996)))))

(declare-fun b!62451 () Bool)

(assert (=> b!62451 (= e!41486 e!41491)))

(declare-fun res!51976 () Bool)

(assert (=> b!62451 (=> res!51976 e!41491)))

(assert (=> b!62451 (= res!51976 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!686 0))(
  ( (Nil!683) (Cons!682 (h!801 Bool) (t!1436 List!686)) )
))
(declare-fun lt!97985 () List!686)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2222 BitStream!2222 (_ BitVec 64)) List!686)

(assert (=> b!62451 (= lt!97985 (bitStreamReadBitsIntoList!0 (_2!2930 lt!97986) (_1!2931 lt!97998) lt!97987))))

(declare-fun lt!97999 () List!686)

(assert (=> b!62451 (= lt!97999 (bitStreamReadBitsIntoList!0 (_2!2930 lt!97986) (_1!2931 lt!97992) (bvsub to!314 i!635)))))

(assert (=> b!62451 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!97987)))

(declare-fun lt!97995 () Unit!4247)

(assert (=> b!62451 (= lt!97995 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2930 lt!97996) (buf!1657 (_2!2930 lt!97986)) lt!97987))))

(assert (=> b!62451 (= lt!97998 (reader!0 (_2!2930 lt!97996) (_2!2930 lt!97986)))))

(assert (=> b!62451 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!97989 () Unit!4247)

(assert (=> b!62451 (= lt!97989 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1657 (_2!2930 lt!97986)) (bvsub to!314 i!635)))))

(assert (=> b!62451 (= lt!97992 (reader!0 thiss!1379 (_2!2930 lt!97986)))))

(declare-fun b!62452 () Bool)

(declare-fun res!51981 () Bool)

(assert (=> b!62452 (=> res!51981 e!41487)))

(assert (=> b!62452 (= res!51981 (not (invariant!0 (currentBit!3288 (_2!2930 lt!97986)) (currentByte!3293 (_2!2930 lt!97986)) (size!1276 (buf!1657 (_2!2930 lt!97986))))))))

(declare-fun b!62453 () Bool)

(declare-fun head!505 (List!686) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2222 array!2792 (_ BitVec 64) (_ BitVec 64)) List!686)

(assert (=> b!62453 (= e!41494 (= (head!505 (byteArrayBitContentToList!0 (_2!2930 lt!97996) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!505 (bitStreamReadBitsIntoList!0 (_2!2930 lt!97996) (_1!2931 lt!97991) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!62454 () Bool)

(declare-fun res!51977 () Bool)

(assert (=> b!62454 (=> res!51977 e!41491)))

(assert (=> b!62454 (= res!51977 (not (isPrefixOf!0 (_1!2931 lt!97998) (_2!2930 lt!97986))))))

(declare-fun b!62455 () Bool)

(assert (=> b!62455 (= e!41491 (= (buf!1657 (_1!2931 lt!97992)) (buf!1657 (_1!2931 lt!97998))))))

(declare-fun b!62456 () Bool)

(declare-fun res!51966 () Bool)

(assert (=> b!62456 (=> res!51966 e!41487)))

(assert (=> b!62456 (= res!51966 (not (= (size!1276 (buf!1657 thiss!1379)) (size!1276 (buf!1657 (_2!2930 lt!97986))))))))

(declare-fun b!62457 () Bool)

(declare-fun res!51965 () Bool)

(assert (=> b!62457 (=> res!51965 e!41491)))

(declare-fun length!314 (List!686) Int)

(assert (=> b!62457 (= res!51965 (<= (length!314 lt!97999) 0))))

(declare-fun b!62458 () Bool)

(assert (=> b!62458 (= e!41485 (not e!41493))))

(declare-fun res!51969 () Bool)

(assert (=> b!62458 (=> res!51969 e!41493)))

(assert (=> b!62458 (= res!51969 (bvsge i!635 to!314))))

(assert (=> b!62458 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!97993 () Unit!4247)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2222) Unit!4247)

(assert (=> b!62458 (= lt!97993 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!62458 (= lt!97994 (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)))))

(assert (= (and start!12232 res!51979) b!62445))

(assert (= (and b!62445 res!51980) b!62458))

(assert (= (and b!62458 (not res!51969)) b!62449))

(assert (= (and b!62449 (not res!51972)) b!62450))

(assert (= (and b!62450 res!51971) b!62453))

(assert (= (and b!62450 (not res!51964)) b!62447))

(assert (= (and b!62447 (not res!51967)) b!62452))

(assert (= (and b!62452 (not res!51981)) b!62456))

(assert (= (and b!62456 (not res!51966)) b!62444))

(assert (= (and b!62444 res!51978) b!62443))

(assert (= (and b!62444 (not res!51973)) b!62442))

(assert (= (and b!62442 (not res!51975)) b!62441))

(assert (= (and b!62441 (not res!51968)) b!62451))

(assert (= (and b!62451 (not res!51976)) b!62457))

(assert (= (and b!62457 (not res!51965)) b!62448))

(assert (= (and b!62448 (not res!51974)) b!62454))

(assert (= (and b!62454 (not res!51977)) b!62446))

(assert (= (and b!62446 (not res!51970)) b!62455))

(assert (= start!12232 b!62440))

(declare-fun m!98735 () Bool)

(assert (=> b!62453 m!98735))

(assert (=> b!62453 m!98735))

(declare-fun m!98737 () Bool)

(assert (=> b!62453 m!98737))

(declare-fun m!98739 () Bool)

(assert (=> b!62453 m!98739))

(assert (=> b!62453 m!98739))

(declare-fun m!98741 () Bool)

(assert (=> b!62453 m!98741))

(declare-fun m!98743 () Bool)

(assert (=> b!62450 m!98743))

(declare-fun m!98745 () Bool)

(assert (=> b!62450 m!98745))

(declare-fun m!98747 () Bool)

(assert (=> b!62450 m!98747))

(declare-fun m!98749 () Bool)

(assert (=> b!62450 m!98749))

(declare-fun m!98751 () Bool)

(assert (=> b!62450 m!98751))

(declare-fun m!98753 () Bool)

(assert (=> b!62450 m!98753))

(declare-fun m!98755 () Bool)

(assert (=> b!62450 m!98755))

(declare-fun m!98757 () Bool)

(assert (=> b!62443 m!98757))

(declare-fun m!98759 () Bool)

(assert (=> b!62454 m!98759))

(declare-fun m!98761 () Bool)

(assert (=> b!62449 m!98761))

(declare-fun m!98763 () Bool)

(assert (=> b!62449 m!98763))

(declare-fun m!98765 () Bool)

(assert (=> b!62449 m!98765))

(declare-fun m!98767 () Bool)

(assert (=> b!62449 m!98767))

(assert (=> b!62449 m!98763))

(declare-fun m!98769 () Bool)

(assert (=> b!62449 m!98769))

(declare-fun m!98771 () Bool)

(assert (=> b!62452 m!98771))

(declare-fun m!98773 () Bool)

(assert (=> b!62440 m!98773))

(declare-fun m!98775 () Bool)

(assert (=> b!62441 m!98775))

(declare-fun m!98777 () Bool)

(assert (=> b!62457 m!98777))

(declare-fun m!98779 () Bool)

(assert (=> b!62445 m!98779))

(declare-fun m!98781 () Bool)

(assert (=> start!12232 m!98781))

(declare-fun m!98783 () Bool)

(assert (=> start!12232 m!98783))

(declare-fun m!98785 () Bool)

(assert (=> b!62447 m!98785))

(declare-fun m!98787 () Bool)

(assert (=> b!62446 m!98787))

(declare-fun m!98789 () Bool)

(assert (=> b!62458 m!98789))

(declare-fun m!98791 () Bool)

(assert (=> b!62458 m!98791))

(declare-fun m!98793 () Bool)

(assert (=> b!62458 m!98793))

(declare-fun m!98795 () Bool)

(assert (=> b!62442 m!98795))

(declare-fun m!98797 () Bool)

(assert (=> b!62448 m!98797))

(declare-fun m!98799 () Bool)

(assert (=> b!62451 m!98799))

(declare-fun m!98801 () Bool)

(assert (=> b!62451 m!98801))

(declare-fun m!98803 () Bool)

(assert (=> b!62451 m!98803))

(declare-fun m!98805 () Bool)

(assert (=> b!62451 m!98805))

(declare-fun m!98807 () Bool)

(assert (=> b!62451 m!98807))

(declare-fun m!98809 () Bool)

(assert (=> b!62451 m!98809))

(declare-fun m!98811 () Bool)

(assert (=> b!62451 m!98811))

(declare-fun m!98813 () Bool)

(assert (=> b!62451 m!98813))

(push 1)

(assert (not b!62447))

(assert (not b!62443))

(assert (not b!62445))

(assert (not b!62441))

(assert (not b!62457))

(assert (not b!62440))

(assert (not b!62453))

(assert (not b!62454))

(assert (not start!12232))

(assert (not b!62451))

(assert (not b!62442))

(assert (not b!62450))

(assert (not b!62448))

(assert (not b!62446))

(assert (not b!62449))

(assert (not b!62452))

(assert (not b!62458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19308 () Bool)

(declare-fun size!1279 (List!686) Int)

(assert (=> d!19308 (= (length!314 lt!97999) (size!1279 lt!97999))))

(declare-fun bs!4797 () Bool)

(assert (= bs!4797 d!19308))

(declare-fun m!98863 () Bool)

(assert (=> bs!4797 m!98863))

(assert (=> b!62457 d!19308))

(declare-fun d!19310 () Bool)

(declare-fun res!52029 () Bool)

(declare-fun e!41526 () Bool)

(assert (=> d!19310 (=> (not res!52029) (not e!41526))))

(assert (=> d!19310 (= res!52029 (= (size!1276 (buf!1657 (_1!2931 lt!97992))) (size!1276 (buf!1657 (_1!2931 lt!97998)))))))

(assert (=> d!19310 (= (isPrefixOf!0 (_1!2931 lt!97992) (_1!2931 lt!97998)) e!41526)))

(declare-fun b!62510 () Bool)

(declare-fun res!52027 () Bool)

(assert (=> b!62510 (=> (not res!52027) (not e!41526))))

(assert (=> b!62510 (= res!52027 (bvsle (bitIndex!0 (size!1276 (buf!1657 (_1!2931 lt!97992))) (currentByte!3293 (_1!2931 lt!97992)) (currentBit!3288 (_1!2931 lt!97992))) (bitIndex!0 (size!1276 (buf!1657 (_1!2931 lt!97998))) (currentByte!3293 (_1!2931 lt!97998)) (currentBit!3288 (_1!2931 lt!97998)))))))

(declare-fun b!62511 () Bool)

(declare-fun e!41525 () Bool)

(assert (=> b!62511 (= e!41526 e!41525)))

(declare-fun res!52028 () Bool)

(assert (=> b!62511 (=> res!52028 e!41525)))

(assert (=> b!62511 (= res!52028 (= (size!1276 (buf!1657 (_1!2931 lt!97992))) #b00000000000000000000000000000000))))

(declare-fun b!62512 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2792 array!2792 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62512 (= e!41525 (arrayBitRangesEq!0 (buf!1657 (_1!2931 lt!97992)) (buf!1657 (_1!2931 lt!97998)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1276 (buf!1657 (_1!2931 lt!97992))) (currentByte!3293 (_1!2931 lt!97992)) (currentBit!3288 (_1!2931 lt!97992)))))))

(assert (= (and d!19310 res!52029) b!62510))

(assert (= (and b!62510 res!52027) b!62511))

(assert (= (and b!62511 (not res!52028)) b!62512))

(declare-fun m!98865 () Bool)

(assert (=> b!62510 m!98865))

(declare-fun m!98867 () Bool)

(assert (=> b!62510 m!98867))

(assert (=> b!62512 m!98865))

(assert (=> b!62512 m!98865))

(declare-fun m!98869 () Bool)

(assert (=> b!62512 m!98869))

(assert (=> b!62446 d!19310))

(declare-fun d!19312 () Bool)

(declare-fun res!52032 () Bool)

(declare-fun e!41528 () Bool)

(assert (=> d!19312 (=> (not res!52032) (not e!41528))))

(assert (=> d!19312 (= res!52032 (= (size!1276 (buf!1657 (_1!2931 lt!97992))) (size!1276 (buf!1657 (_2!2930 lt!97986)))))))

(assert (=> d!19312 (= (isPrefixOf!0 (_1!2931 lt!97992) (_2!2930 lt!97986)) e!41528)))

(declare-fun b!62513 () Bool)

(declare-fun res!52030 () Bool)

(assert (=> b!62513 (=> (not res!52030) (not e!41528))))

(assert (=> b!62513 (= res!52030 (bvsle (bitIndex!0 (size!1276 (buf!1657 (_1!2931 lt!97992))) (currentByte!3293 (_1!2931 lt!97992)) (currentBit!3288 (_1!2931 lt!97992))) (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97986))) (currentByte!3293 (_2!2930 lt!97986)) (currentBit!3288 (_2!2930 lt!97986)))))))

(declare-fun b!62514 () Bool)

(declare-fun e!41527 () Bool)

(assert (=> b!62514 (= e!41528 e!41527)))

(declare-fun res!52031 () Bool)

(assert (=> b!62514 (=> res!52031 e!41527)))

(assert (=> b!62514 (= res!52031 (= (size!1276 (buf!1657 (_1!2931 lt!97992))) #b00000000000000000000000000000000))))

(declare-fun b!62515 () Bool)

(assert (=> b!62515 (= e!41527 (arrayBitRangesEq!0 (buf!1657 (_1!2931 lt!97992)) (buf!1657 (_2!2930 lt!97986)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1276 (buf!1657 (_1!2931 lt!97992))) (currentByte!3293 (_1!2931 lt!97992)) (currentBit!3288 (_1!2931 lt!97992)))))))

(assert (= (and d!19312 res!52032) b!62513))

(assert (= (and b!62513 res!52030) b!62514))

(assert (= (and b!62514 (not res!52031)) b!62515))

(assert (=> b!62513 m!98865))

(assert (=> b!62513 m!98785))

(assert (=> b!62515 m!98865))

(assert (=> b!62515 m!98865))

(declare-fun m!98871 () Bool)

(assert (=> b!62515 m!98871))

(assert (=> b!62448 d!19312))

(declare-fun d!19314 () Bool)

(declare-fun res!52035 () Bool)

(declare-fun e!41530 () Bool)

(assert (=> d!19314 (=> (not res!52035) (not e!41530))))

(assert (=> d!19314 (= res!52035 (= (size!1276 (buf!1657 thiss!1379)) (size!1276 (buf!1657 thiss!1379))))))

(assert (=> d!19314 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41530)))

(declare-fun b!62516 () Bool)

(declare-fun res!52033 () Bool)

(assert (=> b!62516 (=> (not res!52033) (not e!41530))))

(assert (=> b!62516 (= res!52033 (bvsle (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)) (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379))))))

(declare-fun b!62517 () Bool)

(declare-fun e!41529 () Bool)

(assert (=> b!62517 (= e!41530 e!41529)))

(declare-fun res!52034 () Bool)

(assert (=> b!62517 (=> res!52034 e!41529)))

(assert (=> b!62517 (= res!52034 (= (size!1276 (buf!1657 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62518 () Bool)

(assert (=> b!62518 (= e!41529 (arrayBitRangesEq!0 (buf!1657 thiss!1379) (buf!1657 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379))))))

(assert (= (and d!19314 res!52035) b!62516))

(assert (= (and b!62516 res!52033) b!62517))

(assert (= (and b!62517 (not res!52034)) b!62518))

(assert (=> b!62516 m!98793))

(assert (=> b!62516 m!98793))

(assert (=> b!62518 m!98793))

(assert (=> b!62518 m!98793))

(declare-fun m!98873 () Bool)

(assert (=> b!62518 m!98873))

(assert (=> b!62458 d!19314))

(declare-fun d!19316 () Bool)

(assert (=> d!19316 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!98086 () Unit!4247)

(declare-fun choose!11 (BitStream!2222) Unit!4247)

(assert (=> d!19316 (= lt!98086 (choose!11 thiss!1379))))

(assert (=> d!19316 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!98086)))

(declare-fun bs!4799 () Bool)

(assert (= bs!4799 d!19316))

(assert (=> bs!4799 m!98789))

(declare-fun m!98875 () Bool)

(assert (=> bs!4799 m!98875))

(assert (=> b!62458 d!19316))

(declare-fun d!19318 () Bool)

(declare-fun e!41533 () Bool)

(assert (=> d!19318 e!41533))

(declare-fun res!52040 () Bool)

(assert (=> d!19318 (=> (not res!52040) (not e!41533))))

(declare-fun lt!98104 () (_ BitVec 64))

(declare-fun lt!98100 () (_ BitVec 64))

(declare-fun lt!98099 () (_ BitVec 64))

(assert (=> d!19318 (= res!52040 (= lt!98100 (bvsub lt!98104 lt!98099)))))

(assert (=> d!19318 (or (= (bvand lt!98104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98104 lt!98099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19318 (= lt!98099 (remainingBits!0 ((_ sign_extend 32) (size!1276 (buf!1657 thiss!1379))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379))))))

(declare-fun lt!98102 () (_ BitVec 64))

(declare-fun lt!98101 () (_ BitVec 64))

(assert (=> d!19318 (= lt!98104 (bvmul lt!98102 lt!98101))))

(assert (=> d!19318 (or (= lt!98102 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98101 (bvsdiv (bvmul lt!98102 lt!98101) lt!98102)))))

(assert (=> d!19318 (= lt!98101 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19318 (= lt!98102 ((_ sign_extend 32) (size!1276 (buf!1657 thiss!1379))))))

(assert (=> d!19318 (= lt!98100 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3293 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3288 thiss!1379))))))

(assert (=> d!19318 (invariant!0 (currentBit!3288 thiss!1379) (currentByte!3293 thiss!1379) (size!1276 (buf!1657 thiss!1379)))))

(assert (=> d!19318 (= (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)) lt!98100)))

(declare-fun b!62523 () Bool)

(declare-fun res!52041 () Bool)

(assert (=> b!62523 (=> (not res!52041) (not e!41533))))

(assert (=> b!62523 (= res!52041 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98100))))

(declare-fun b!62524 () Bool)

(declare-fun lt!98103 () (_ BitVec 64))

(assert (=> b!62524 (= e!41533 (bvsle lt!98100 (bvmul lt!98103 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62524 (or (= lt!98103 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98103 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98103)))))

(assert (=> b!62524 (= lt!98103 ((_ sign_extend 32) (size!1276 (buf!1657 thiss!1379))))))

(assert (= (and d!19318 res!52040) b!62523))

(assert (= (and b!62523 res!52041) b!62524))

(declare-fun m!98877 () Bool)

(assert (=> d!19318 m!98877))

(declare-fun m!98879 () Bool)

(assert (=> d!19318 m!98879))

(assert (=> b!62458 d!19318))

(declare-fun d!19320 () Bool)

(declare-fun e!41534 () Bool)

(assert (=> d!19320 e!41534))

(declare-fun res!52042 () Bool)

(assert (=> d!19320 (=> (not res!52042) (not e!41534))))

(declare-fun lt!98106 () (_ BitVec 64))

(declare-fun lt!98110 () (_ BitVec 64))

(declare-fun lt!98105 () (_ BitVec 64))

(assert (=> d!19320 (= res!52042 (= lt!98106 (bvsub lt!98110 lt!98105)))))

(assert (=> d!19320 (or (= (bvand lt!98110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98105 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98110 lt!98105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19320 (= lt!98105 (remainingBits!0 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97986))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97986)))))))

(declare-fun lt!98108 () (_ BitVec 64))

(declare-fun lt!98107 () (_ BitVec 64))

(assert (=> d!19320 (= lt!98110 (bvmul lt!98108 lt!98107))))

(assert (=> d!19320 (or (= lt!98108 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98107 (bvsdiv (bvmul lt!98108 lt!98107) lt!98108)))))

(assert (=> d!19320 (= lt!98107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19320 (= lt!98108 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))))))

(assert (=> d!19320 (= lt!98106 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97986))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97986)))))))

(assert (=> d!19320 (invariant!0 (currentBit!3288 (_2!2930 lt!97986)) (currentByte!3293 (_2!2930 lt!97986)) (size!1276 (buf!1657 (_2!2930 lt!97986))))))

(assert (=> d!19320 (= (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97986))) (currentByte!3293 (_2!2930 lt!97986)) (currentBit!3288 (_2!2930 lt!97986))) lt!98106)))

(declare-fun b!62525 () Bool)

(declare-fun res!52043 () Bool)

(assert (=> b!62525 (=> (not res!52043) (not e!41534))))

(assert (=> b!62525 (= res!52043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98106))))

(declare-fun b!62526 () Bool)

(declare-fun lt!98109 () (_ BitVec 64))

(assert (=> b!62526 (= e!41534 (bvsle lt!98106 (bvmul lt!98109 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62526 (or (= lt!98109 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98109 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98109)))))

(assert (=> b!62526 (= lt!98109 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))))))

(assert (= (and d!19320 res!52042) b!62525))

(assert (= (and b!62525 res!52043) b!62526))

(declare-fun m!98881 () Bool)

(assert (=> d!19320 m!98881))

(assert (=> d!19320 m!98771))

(assert (=> b!62447 d!19320))

(declare-fun d!19322 () Bool)

(declare-fun res!52046 () Bool)

(declare-fun e!41536 () Bool)

(assert (=> d!19322 (=> (not res!52046) (not e!41536))))

(assert (=> d!19322 (= res!52046 (= (size!1276 (buf!1657 (_1!2931 lt!97998))) (size!1276 (buf!1657 (_2!2930 lt!97986)))))))

(assert (=> d!19322 (= (isPrefixOf!0 (_1!2931 lt!97998) (_2!2930 lt!97986)) e!41536)))

(declare-fun b!62527 () Bool)

(declare-fun res!52044 () Bool)

(assert (=> b!62527 (=> (not res!52044) (not e!41536))))

(assert (=> b!62527 (= res!52044 (bvsle (bitIndex!0 (size!1276 (buf!1657 (_1!2931 lt!97998))) (currentByte!3293 (_1!2931 lt!97998)) (currentBit!3288 (_1!2931 lt!97998))) (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97986))) (currentByte!3293 (_2!2930 lt!97986)) (currentBit!3288 (_2!2930 lt!97986)))))))

(declare-fun b!62528 () Bool)

(declare-fun e!41535 () Bool)

(assert (=> b!62528 (= e!41536 e!41535)))

(declare-fun res!52045 () Bool)

(assert (=> b!62528 (=> res!52045 e!41535)))

(assert (=> b!62528 (= res!52045 (= (size!1276 (buf!1657 (_1!2931 lt!97998))) #b00000000000000000000000000000000))))

(declare-fun b!62529 () Bool)

(assert (=> b!62529 (= e!41535 (arrayBitRangesEq!0 (buf!1657 (_1!2931 lt!97998)) (buf!1657 (_2!2930 lt!97986)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1276 (buf!1657 (_1!2931 lt!97998))) (currentByte!3293 (_1!2931 lt!97998)) (currentBit!3288 (_1!2931 lt!97998)))))))

(assert (= (and d!19322 res!52046) b!62527))

(assert (= (and b!62527 res!52044) b!62528))

(assert (= (and b!62528 (not res!52045)) b!62529))

(assert (=> b!62527 m!98867))

(assert (=> b!62527 m!98785))

(assert (=> b!62529 m!98867))

(assert (=> b!62529 m!98867))

(declare-fun m!98883 () Bool)

(assert (=> b!62529 m!98883))

(assert (=> b!62454 d!19322))

(declare-fun d!19324 () Bool)

(declare-fun e!41537 () Bool)

(assert (=> d!19324 e!41537))

(declare-fun res!52047 () Bool)

(assert (=> d!19324 (=> (not res!52047) (not e!41537))))

(declare-fun lt!98116 () (_ BitVec 64))

(declare-fun lt!98112 () (_ BitVec 64))

(declare-fun lt!98111 () (_ BitVec 64))

(assert (=> d!19324 (= res!52047 (= lt!98112 (bvsub lt!98116 lt!98111)))))

(assert (=> d!19324 (or (= (bvand lt!98116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98116 lt!98111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19324 (= lt!98111 (remainingBits!0 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996)))))))

(declare-fun lt!98114 () (_ BitVec 64))

(declare-fun lt!98113 () (_ BitVec 64))

(assert (=> d!19324 (= lt!98116 (bvmul lt!98114 lt!98113))))

(assert (=> d!19324 (or (= lt!98114 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98113 (bvsdiv (bvmul lt!98114 lt!98113) lt!98114)))))

(assert (=> d!19324 (= lt!98113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19324 (= lt!98114 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))))))

(assert (=> d!19324 (= lt!98112 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996)))))))

(assert (=> d!19324 (invariant!0 (currentBit!3288 (_2!2930 lt!97996)) (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97996))))))

(assert (=> d!19324 (= (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))) lt!98112)))

(declare-fun b!62530 () Bool)

(declare-fun res!52048 () Bool)

(assert (=> b!62530 (=> (not res!52048) (not e!41537))))

(assert (=> b!62530 (= res!52048 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!98112))))

(declare-fun b!62531 () Bool)

(declare-fun lt!98115 () (_ BitVec 64))

(assert (=> b!62531 (= e!41537 (bvsle lt!98112 (bvmul lt!98115 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62531 (or (= lt!98115 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!98115 #b0000000000000000000000000000000000000000000000000000000000001000) lt!98115)))))

(assert (=> b!62531 (= lt!98115 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))))))

(assert (= (and d!19324 res!52047) b!62530))

(assert (= (and b!62530 res!52048) b!62531))

(declare-fun m!98885 () Bool)

(assert (=> d!19324 m!98885))

(assert (=> d!19324 m!98795))

(assert (=> b!62443 d!19324))

(declare-fun d!19326 () Bool)

(assert (=> d!19326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 thiss!1379))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1276 (buf!1657 thiss!1379))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4800 () Bool)

(assert (= bs!4800 d!19326))

(assert (=> bs!4800 m!98877))

(assert (=> b!62445 d!19326))

(declare-fun d!19328 () Bool)

(assert (=> d!19328 (= (array_inv!1170 srcBuffer!2) (bvsge (size!1276 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12232 d!19328))

(declare-fun d!19330 () Bool)

(assert (=> d!19330 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3288 thiss!1379) (currentByte!3293 thiss!1379) (size!1276 (buf!1657 thiss!1379))))))

(declare-fun bs!4801 () Bool)

(assert (= bs!4801 d!19330))

(assert (=> bs!4801 m!98879))

(assert (=> start!12232 d!19330))

(declare-fun d!19332 () Bool)

(assert (=> d!19332 (= (invariant!0 (currentBit!3288 (_2!2930 lt!97986)) (currentByte!3293 (_2!2930 lt!97986)) (size!1276 (buf!1657 (_2!2930 lt!97986)))) (and (bvsge (currentBit!3288 (_2!2930 lt!97986)) #b00000000000000000000000000000000) (bvslt (currentBit!3288 (_2!2930 lt!97986)) #b00000000000000000000000000001000) (bvsge (currentByte!3293 (_2!2930 lt!97986)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3293 (_2!2930 lt!97986)) (size!1276 (buf!1657 (_2!2930 lt!97986)))) (and (= (currentBit!3288 (_2!2930 lt!97986)) #b00000000000000000000000000000000) (= (currentByte!3293 (_2!2930 lt!97986)) (size!1276 (buf!1657 (_2!2930 lt!97986))))))))))

(assert (=> b!62452 d!19332))

(declare-fun d!19334 () Bool)

(assert (=> d!19334 (= (invariant!0 (currentBit!3288 (_2!2930 lt!97996)) (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97986)))) (and (bvsge (currentBit!3288 (_2!2930 lt!97996)) #b00000000000000000000000000000000) (bvslt (currentBit!3288 (_2!2930 lt!97996)) #b00000000000000000000000000001000) (bvsge (currentByte!3293 (_2!2930 lt!97996)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97986)))) (and (= (currentBit!3288 (_2!2930 lt!97996)) #b00000000000000000000000000000000) (= (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97986))))))))))

(assert (=> b!62441 d!19334))

(declare-fun d!19336 () Bool)

(declare-fun e!41543 () Bool)

(assert (=> d!19336 e!41543))

(declare-fun c!4425 () Bool)

(assert (=> d!19336 (= c!4425 (= lt!97987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!98123 () List!686)

(declare-datatypes ((tuple2!5656 0))(
  ( (tuple2!5657 (_1!2939 List!686) (_2!2939 BitStream!2222)) )
))
(declare-fun e!41542 () tuple2!5656)

(assert (=> d!19336 (= lt!98123 (_1!2939 e!41542))))

(declare-fun c!4424 () Bool)

(assert (=> d!19336 (= c!4424 (= lt!97987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19336 (bvsge lt!97987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19336 (= (bitStreamReadBitsIntoList!0 (_2!2930 lt!97986) (_1!2931 lt!97998) lt!97987) lt!98123)))

(declare-fun b!62543 () Bool)

(assert (=> b!62543 (= e!41543 (> (length!314 lt!98123) 0))))

(declare-fun lt!98125 () (_ BitVec 64))

(declare-fun b!62541 () Bool)

(declare-datatypes ((tuple2!5658 0))(
  ( (tuple2!5659 (_1!2940 Bool) (_2!2940 BitStream!2222)) )
))
(declare-fun lt!98124 () tuple2!5658)

(assert (=> b!62541 (= e!41542 (tuple2!5657 (Cons!682 (_1!2940 lt!98124) (bitStreamReadBitsIntoList!0 (_2!2930 lt!97986) (_2!2940 lt!98124) (bvsub lt!97987 lt!98125))) (_2!2940 lt!98124)))))

(declare-fun readBit!0 (BitStream!2222) tuple2!5658)

(assert (=> b!62541 (= lt!98124 (readBit!0 (_1!2931 lt!97998)))))

(assert (=> b!62541 (= lt!98125 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!62542 () Bool)

(declare-fun isEmpty!191 (List!686) Bool)

(assert (=> b!62542 (= e!41543 (isEmpty!191 lt!98123))))

(declare-fun b!62540 () Bool)

(assert (=> b!62540 (= e!41542 (tuple2!5657 Nil!683 (_1!2931 lt!97998)))))

(assert (= (and d!19336 c!4424) b!62540))

(assert (= (and d!19336 (not c!4424)) b!62541))

(assert (= (and d!19336 c!4425) b!62542))

(assert (= (and d!19336 (not c!4425)) b!62543))

(declare-fun m!98887 () Bool)

(assert (=> b!62543 m!98887))

(declare-fun m!98889 () Bool)

(assert (=> b!62541 m!98889))

(declare-fun m!98891 () Bool)

(assert (=> b!62541 m!98891))

(declare-fun m!98893 () Bool)

(assert (=> b!62542 m!98893))

(assert (=> b!62451 d!19336))

(declare-fun d!19338 () Bool)

(assert (=> d!19338 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!97987) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996)))) lt!97987))))

(declare-fun bs!4802 () Bool)

(assert (= bs!4802 d!19338))

(declare-fun m!98895 () Bool)

(assert (=> bs!4802 m!98895))

(assert (=> b!62451 d!19338))

(declare-fun b!62554 () Bool)

(declare-fun e!41549 () Unit!4247)

(declare-fun Unit!4269 () Unit!4247)

(assert (=> b!62554 (= e!41549 Unit!4269)))

(declare-fun b!62555 () Bool)

(declare-fun res!52056 () Bool)

(declare-fun e!41548 () Bool)

(assert (=> b!62555 (=> (not res!52056) (not e!41548))))

(declare-fun lt!98183 () tuple2!5640)

(assert (=> b!62555 (= res!52056 (isPrefixOf!0 (_1!2931 lt!98183) thiss!1379))))

(declare-fun b!62556 () Bool)

(declare-fun lt!98174 () (_ BitVec 64))

(declare-fun lt!98179 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2222 (_ BitVec 64)) BitStream!2222)

(assert (=> b!62556 (= e!41548 (= (_1!2931 lt!98183) (withMovedBitIndex!0 (_2!2931 lt!98183) (bvsub lt!98179 lt!98174))))))

(assert (=> b!62556 (or (= (bvand lt!98179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98179 lt!98174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62556 (= lt!98174 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97986))) (currentByte!3293 (_2!2930 lt!97986)) (currentBit!3288 (_2!2930 lt!97986))))))

(assert (=> b!62556 (= lt!98179 (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)))))

(declare-fun b!62557 () Bool)

(declare-fun res!52057 () Bool)

(assert (=> b!62557 (=> (not res!52057) (not e!41548))))

(assert (=> b!62557 (= res!52057 (isPrefixOf!0 (_2!2931 lt!98183) (_2!2930 lt!97986)))))

(declare-fun b!62558 () Bool)

(declare-fun lt!98177 () Unit!4247)

(assert (=> b!62558 (= e!41549 lt!98177)))

(declare-fun lt!98181 () (_ BitVec 64))

(assert (=> b!62558 (= lt!98181 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98171 () (_ BitVec 64))

(assert (=> b!62558 (= lt!98171 (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2792 array!2792 (_ BitVec 64) (_ BitVec 64)) Unit!4247)

(assert (=> b!62558 (= lt!98177 (arrayBitRangesEqSymmetric!0 (buf!1657 thiss!1379) (buf!1657 (_2!2930 lt!97986)) lt!98181 lt!98171))))

(assert (=> b!62558 (arrayBitRangesEq!0 (buf!1657 (_2!2930 lt!97986)) (buf!1657 thiss!1379) lt!98181 lt!98171)))

(declare-fun d!19340 () Bool)

(assert (=> d!19340 e!41548))

(declare-fun res!52055 () Bool)

(assert (=> d!19340 (=> (not res!52055) (not e!41548))))

(assert (=> d!19340 (= res!52055 (isPrefixOf!0 (_1!2931 lt!98183) (_2!2931 lt!98183)))))

(declare-fun lt!98170 () BitStream!2222)

(assert (=> d!19340 (= lt!98183 (tuple2!5641 lt!98170 (_2!2930 lt!97986)))))

(declare-fun lt!98176 () Unit!4247)

(declare-fun lt!98173 () Unit!4247)

(assert (=> d!19340 (= lt!98176 lt!98173)))

(assert (=> d!19340 (isPrefixOf!0 lt!98170 (_2!2930 lt!97986))))

(assert (=> d!19340 (= lt!98173 (lemmaIsPrefixTransitive!0 lt!98170 (_2!2930 lt!97986) (_2!2930 lt!97986)))))

(declare-fun lt!98185 () Unit!4247)

(declare-fun lt!98180 () Unit!4247)

(assert (=> d!19340 (= lt!98185 lt!98180)))

(assert (=> d!19340 (isPrefixOf!0 lt!98170 (_2!2930 lt!97986))))

(assert (=> d!19340 (= lt!98180 (lemmaIsPrefixTransitive!0 lt!98170 thiss!1379 (_2!2930 lt!97986)))))

(declare-fun lt!98175 () Unit!4247)

(assert (=> d!19340 (= lt!98175 e!41549)))

(declare-fun c!4428 () Bool)

(assert (=> d!19340 (= c!4428 (not (= (size!1276 (buf!1657 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!98166 () Unit!4247)

(declare-fun lt!98169 () Unit!4247)

(assert (=> d!19340 (= lt!98166 lt!98169)))

(assert (=> d!19340 (isPrefixOf!0 (_2!2930 lt!97986) (_2!2930 lt!97986))))

(assert (=> d!19340 (= lt!98169 (lemmaIsPrefixRefl!0 (_2!2930 lt!97986)))))

(declare-fun lt!98172 () Unit!4247)

(declare-fun lt!98184 () Unit!4247)

(assert (=> d!19340 (= lt!98172 lt!98184)))

(assert (=> d!19340 (= lt!98184 (lemmaIsPrefixRefl!0 (_2!2930 lt!97986)))))

(declare-fun lt!98178 () Unit!4247)

(declare-fun lt!98182 () Unit!4247)

(assert (=> d!19340 (= lt!98178 lt!98182)))

(assert (=> d!19340 (isPrefixOf!0 lt!98170 lt!98170)))

(assert (=> d!19340 (= lt!98182 (lemmaIsPrefixRefl!0 lt!98170))))

(declare-fun lt!98167 () Unit!4247)

(declare-fun lt!98168 () Unit!4247)

(assert (=> d!19340 (= lt!98167 lt!98168)))

(assert (=> d!19340 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19340 (= lt!98168 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19340 (= lt!98170 (BitStream!2223 (buf!1657 (_2!2930 lt!97986)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)))))

(assert (=> d!19340 (isPrefixOf!0 thiss!1379 (_2!2930 lt!97986))))

(assert (=> d!19340 (= (reader!0 thiss!1379 (_2!2930 lt!97986)) lt!98183)))

(assert (= (and d!19340 c!4428) b!62558))

(assert (= (and d!19340 (not c!4428)) b!62554))

(assert (= (and d!19340 res!52055) b!62555))

(assert (= (and b!62555 res!52056) b!62557))

(assert (= (and b!62557 res!52057) b!62556))

(declare-fun m!98897 () Bool)

(assert (=> b!62557 m!98897))

(assert (=> b!62558 m!98793))

(declare-fun m!98899 () Bool)

(assert (=> b!62558 m!98899))

(declare-fun m!98901 () Bool)

(assert (=> b!62558 m!98901))

(assert (=> d!19340 m!98747))

(declare-fun m!98903 () Bool)

(assert (=> d!19340 m!98903))

(declare-fun m!98905 () Bool)

(assert (=> d!19340 m!98905))

(assert (=> d!19340 m!98791))

(declare-fun m!98907 () Bool)

(assert (=> d!19340 m!98907))

(declare-fun m!98909 () Bool)

(assert (=> d!19340 m!98909))

(declare-fun m!98911 () Bool)

(assert (=> d!19340 m!98911))

(declare-fun m!98913 () Bool)

(assert (=> d!19340 m!98913))

(declare-fun m!98915 () Bool)

(assert (=> d!19340 m!98915))

(declare-fun m!98917 () Bool)

(assert (=> d!19340 m!98917))

(assert (=> d!19340 m!98789))

(declare-fun m!98919 () Bool)

(assert (=> b!62556 m!98919))

(assert (=> b!62556 m!98785))

(assert (=> b!62556 m!98793))

(declare-fun m!98921 () Bool)

(assert (=> b!62555 m!98921))

(assert (=> b!62451 d!19340))

(declare-fun d!19342 () Bool)

(assert (=> d!19342 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4803 () Bool)

(assert (= bs!4803 d!19342))

(declare-fun m!98923 () Bool)

(assert (=> bs!4803 m!98923))

(assert (=> b!62451 d!19342))

(declare-fun b!62559 () Bool)

(declare-fun e!41551 () Unit!4247)

(declare-fun Unit!4270 () Unit!4247)

(assert (=> b!62559 (= e!41551 Unit!4270)))

(declare-fun b!62560 () Bool)

(declare-fun res!52059 () Bool)

(declare-fun e!41550 () Bool)

(assert (=> b!62560 (=> (not res!52059) (not e!41550))))

(declare-fun lt!98203 () tuple2!5640)

(assert (=> b!62560 (= res!52059 (isPrefixOf!0 (_1!2931 lt!98203) (_2!2930 lt!97996)))))

(declare-fun lt!98194 () (_ BitVec 64))

(declare-fun lt!98199 () (_ BitVec 64))

(declare-fun b!62561 () Bool)

(assert (=> b!62561 (= e!41550 (= (_1!2931 lt!98203) (withMovedBitIndex!0 (_2!2931 lt!98203) (bvsub lt!98199 lt!98194))))))

(assert (=> b!62561 (or (= (bvand lt!98199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98199 lt!98194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62561 (= lt!98194 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97986))) (currentByte!3293 (_2!2930 lt!97986)) (currentBit!3288 (_2!2930 lt!97986))))))

(assert (=> b!62561 (= lt!98199 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))))))

(declare-fun b!62562 () Bool)

(declare-fun res!52060 () Bool)

(assert (=> b!62562 (=> (not res!52060) (not e!41550))))

(assert (=> b!62562 (= res!52060 (isPrefixOf!0 (_2!2931 lt!98203) (_2!2930 lt!97986)))))

(declare-fun b!62563 () Bool)

(declare-fun lt!98197 () Unit!4247)

(assert (=> b!62563 (= e!41551 lt!98197)))

(declare-fun lt!98201 () (_ BitVec 64))

(assert (=> b!62563 (= lt!98201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!98191 () (_ BitVec 64))

(assert (=> b!62563 (= lt!98191 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))))))

(assert (=> b!62563 (= lt!98197 (arrayBitRangesEqSymmetric!0 (buf!1657 (_2!2930 lt!97996)) (buf!1657 (_2!2930 lt!97986)) lt!98201 lt!98191))))

(assert (=> b!62563 (arrayBitRangesEq!0 (buf!1657 (_2!2930 lt!97986)) (buf!1657 (_2!2930 lt!97996)) lt!98201 lt!98191)))

(declare-fun d!19344 () Bool)

(assert (=> d!19344 e!41550))

(declare-fun res!52058 () Bool)

(assert (=> d!19344 (=> (not res!52058) (not e!41550))))

(assert (=> d!19344 (= res!52058 (isPrefixOf!0 (_1!2931 lt!98203) (_2!2931 lt!98203)))))

(declare-fun lt!98190 () BitStream!2222)

(assert (=> d!19344 (= lt!98203 (tuple2!5641 lt!98190 (_2!2930 lt!97986)))))

(declare-fun lt!98196 () Unit!4247)

(declare-fun lt!98193 () Unit!4247)

(assert (=> d!19344 (= lt!98196 lt!98193)))

(assert (=> d!19344 (isPrefixOf!0 lt!98190 (_2!2930 lt!97986))))

(assert (=> d!19344 (= lt!98193 (lemmaIsPrefixTransitive!0 lt!98190 (_2!2930 lt!97986) (_2!2930 lt!97986)))))

(declare-fun lt!98205 () Unit!4247)

(declare-fun lt!98200 () Unit!4247)

(assert (=> d!19344 (= lt!98205 lt!98200)))

(assert (=> d!19344 (isPrefixOf!0 lt!98190 (_2!2930 lt!97986))))

(assert (=> d!19344 (= lt!98200 (lemmaIsPrefixTransitive!0 lt!98190 (_2!2930 lt!97996) (_2!2930 lt!97986)))))

(declare-fun lt!98195 () Unit!4247)

(assert (=> d!19344 (= lt!98195 e!41551)))

(declare-fun c!4429 () Bool)

(assert (=> d!19344 (= c!4429 (not (= (size!1276 (buf!1657 (_2!2930 lt!97996))) #b00000000000000000000000000000000)))))

(declare-fun lt!98186 () Unit!4247)

(declare-fun lt!98189 () Unit!4247)

(assert (=> d!19344 (= lt!98186 lt!98189)))

(assert (=> d!19344 (isPrefixOf!0 (_2!2930 lt!97986) (_2!2930 lt!97986))))

(assert (=> d!19344 (= lt!98189 (lemmaIsPrefixRefl!0 (_2!2930 lt!97986)))))

(declare-fun lt!98192 () Unit!4247)

(declare-fun lt!98204 () Unit!4247)

(assert (=> d!19344 (= lt!98192 lt!98204)))

(assert (=> d!19344 (= lt!98204 (lemmaIsPrefixRefl!0 (_2!2930 lt!97986)))))

(declare-fun lt!98198 () Unit!4247)

(declare-fun lt!98202 () Unit!4247)

(assert (=> d!19344 (= lt!98198 lt!98202)))

(assert (=> d!19344 (isPrefixOf!0 lt!98190 lt!98190)))

(assert (=> d!19344 (= lt!98202 (lemmaIsPrefixRefl!0 lt!98190))))

(declare-fun lt!98187 () Unit!4247)

(declare-fun lt!98188 () Unit!4247)

(assert (=> d!19344 (= lt!98187 lt!98188)))

(assert (=> d!19344 (isPrefixOf!0 (_2!2930 lt!97996) (_2!2930 lt!97996))))

(assert (=> d!19344 (= lt!98188 (lemmaIsPrefixRefl!0 (_2!2930 lt!97996)))))

(assert (=> d!19344 (= lt!98190 (BitStream!2223 (buf!1657 (_2!2930 lt!97986)) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))))))

(assert (=> d!19344 (isPrefixOf!0 (_2!2930 lt!97996) (_2!2930 lt!97986))))

(assert (=> d!19344 (= (reader!0 (_2!2930 lt!97996) (_2!2930 lt!97986)) lt!98203)))

(assert (= (and d!19344 c!4429) b!62563))

(assert (= (and d!19344 (not c!4429)) b!62559))

(assert (= (and d!19344 res!52058) b!62560))

(assert (= (and b!62560 res!52059) b!62562))

(assert (= (and b!62562 res!52060) b!62561))

(declare-fun m!98925 () Bool)

(assert (=> b!62562 m!98925))

(assert (=> b!62563 m!98757))

(declare-fun m!98927 () Bool)

(assert (=> b!62563 m!98927))

(declare-fun m!98929 () Bool)

(assert (=> b!62563 m!98929))

(assert (=> d!19344 m!98745))

(declare-fun m!98931 () Bool)

(assert (=> d!19344 m!98931))

(declare-fun m!98933 () Bool)

(assert (=> d!19344 m!98933))

(declare-fun m!98935 () Bool)

(assert (=> d!19344 m!98935))

(declare-fun m!98937 () Bool)

(assert (=> d!19344 m!98937))

(declare-fun m!98939 () Bool)

(assert (=> d!19344 m!98939))

(declare-fun m!98941 () Bool)

(assert (=> d!19344 m!98941))

(assert (=> d!19344 m!98913))

(declare-fun m!98943 () Bool)

(assert (=> d!19344 m!98943))

(assert (=> d!19344 m!98917))

(declare-fun m!98945 () Bool)

(assert (=> d!19344 m!98945))

(declare-fun m!98947 () Bool)

(assert (=> b!62561 m!98947))

(assert (=> b!62561 m!98785))

(assert (=> b!62561 m!98757))

(declare-fun m!98949 () Bool)

(assert (=> b!62560 m!98949))

(assert (=> b!62451 d!19344))

(declare-fun d!19346 () Bool)

(assert (=> d!19346 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!98208 () Unit!4247)

(declare-fun choose!9 (BitStream!2222 array!2792 (_ BitVec 64) BitStream!2222) Unit!4247)

(assert (=> d!19346 (= lt!98208 (choose!9 thiss!1379 (buf!1657 (_2!2930 lt!97986)) (bvsub to!314 i!635) (BitStream!2223 (buf!1657 (_2!2930 lt!97986)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379))))))

(assert (=> d!19346 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1657 (_2!2930 lt!97986)) (bvsub to!314 i!635)) lt!98208)))

(declare-fun bs!4804 () Bool)

(assert (= bs!4804 d!19346))

(assert (=> bs!4804 m!98805))

(declare-fun m!98951 () Bool)

(assert (=> bs!4804 m!98951))

(assert (=> b!62451 d!19346))

(declare-fun d!19348 () Bool)

(assert (=> d!19348 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97986)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!97987)))

(declare-fun lt!98209 () Unit!4247)

(assert (=> d!19348 (= lt!98209 (choose!9 (_2!2930 lt!97996) (buf!1657 (_2!2930 lt!97986)) lt!97987 (BitStream!2223 (buf!1657 (_2!2930 lt!97986)) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996)))))))

(assert (=> d!19348 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2930 lt!97996) (buf!1657 (_2!2930 lt!97986)) lt!97987) lt!98209)))

(declare-fun bs!4805 () Bool)

(assert (= bs!4805 d!19348))

(assert (=> bs!4805 m!98801))

(declare-fun m!98953 () Bool)

(assert (=> bs!4805 m!98953))

(assert (=> b!62451 d!19348))

(declare-fun d!19350 () Bool)

(declare-fun e!41553 () Bool)

(assert (=> d!19350 e!41553))

(declare-fun c!4431 () Bool)

(assert (=> d!19350 (= c!4431 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!98210 () List!686)

(declare-fun e!41552 () tuple2!5656)

(assert (=> d!19350 (= lt!98210 (_1!2939 e!41552))))

(declare-fun c!4430 () Bool)

(assert (=> d!19350 (= c!4430 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19350 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19350 (= (bitStreamReadBitsIntoList!0 (_2!2930 lt!97986) (_1!2931 lt!97992) (bvsub to!314 i!635)) lt!98210)))

(declare-fun b!62567 () Bool)

(assert (=> b!62567 (= e!41553 (> (length!314 lt!98210) 0))))

(declare-fun lt!98212 () (_ BitVec 64))

(declare-fun lt!98211 () tuple2!5658)

(declare-fun b!62565 () Bool)

(assert (=> b!62565 (= e!41552 (tuple2!5657 (Cons!682 (_1!2940 lt!98211) (bitStreamReadBitsIntoList!0 (_2!2930 lt!97986) (_2!2940 lt!98211) (bvsub (bvsub to!314 i!635) lt!98212))) (_2!2940 lt!98211)))))

(assert (=> b!62565 (= lt!98211 (readBit!0 (_1!2931 lt!97992)))))

(assert (=> b!62565 (= lt!98212 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!62566 () Bool)

(assert (=> b!62566 (= e!41553 (isEmpty!191 lt!98210))))

(declare-fun b!62564 () Bool)

(assert (=> b!62564 (= e!41552 (tuple2!5657 Nil!683 (_1!2931 lt!97992)))))

(assert (= (and d!19350 c!4430) b!62564))

(assert (= (and d!19350 (not c!4430)) b!62565))

(assert (= (and d!19350 c!4431) b!62566))

(assert (= (and d!19350 (not c!4431)) b!62567))

(declare-fun m!98955 () Bool)

(assert (=> b!62567 m!98955))

(declare-fun m!98957 () Bool)

(assert (=> b!62565 m!98957))

(declare-fun m!98959 () Bool)

(assert (=> b!62565 m!98959))

(declare-fun m!98961 () Bool)

(assert (=> b!62566 m!98961))

(assert (=> b!62451 d!19350))

(declare-fun d!19352 () Bool)

(assert (=> d!19352 (= (head!505 (byteArrayBitContentToList!0 (_2!2930 lt!97996) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!801 (byteArrayBitContentToList!0 (_2!2930 lt!97996) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62453 d!19352))

(declare-fun d!19354 () Bool)

(declare-fun c!4434 () Bool)

(assert (=> d!19354 (= c!4434 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41556 () List!686)

(assert (=> d!19354 (= (byteArrayBitContentToList!0 (_2!2930 lt!97996) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41556)))

(declare-fun b!62572 () Bool)

(assert (=> b!62572 (= e!41556 Nil!683)))

(declare-fun b!62573 () Bool)

(assert (=> b!62573 (= e!41556 (Cons!682 (not (= (bvand ((_ sign_extend 24) (select (arr!1840 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2930 lt!97996) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19354 c!4434) b!62572))

(assert (= (and d!19354 (not c!4434)) b!62573))

(assert (=> b!62573 m!98763))

(declare-fun m!98963 () Bool)

(assert (=> b!62573 m!98963))

(declare-fun m!98965 () Bool)

(assert (=> b!62573 m!98965))

(assert (=> b!62453 d!19354))

(declare-fun d!19356 () Bool)

(assert (=> d!19356 (= (head!505 (bitStreamReadBitsIntoList!0 (_2!2930 lt!97996) (_1!2931 lt!97991) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!801 (bitStreamReadBitsIntoList!0 (_2!2930 lt!97996) (_1!2931 lt!97991) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62453 d!19356))

(declare-fun d!19358 () Bool)

(declare-fun e!41558 () Bool)

(assert (=> d!19358 e!41558))

(declare-fun c!4436 () Bool)

(assert (=> d!19358 (= c!4436 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!98213 () List!686)

(declare-fun e!41557 () tuple2!5656)

(assert (=> d!19358 (= lt!98213 (_1!2939 e!41557))))

(declare-fun c!4435 () Bool)

(assert (=> d!19358 (= c!4435 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19358 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19358 (= (bitStreamReadBitsIntoList!0 (_2!2930 lt!97996) (_1!2931 lt!97991) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98213)))

(declare-fun b!62577 () Bool)

(assert (=> b!62577 (= e!41558 (> (length!314 lt!98213) 0))))

(declare-fun b!62575 () Bool)

(declare-fun lt!98215 () (_ BitVec 64))

(declare-fun lt!98214 () tuple2!5658)

(assert (=> b!62575 (= e!41557 (tuple2!5657 (Cons!682 (_1!2940 lt!98214) (bitStreamReadBitsIntoList!0 (_2!2930 lt!97996) (_2!2940 lt!98214) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!98215))) (_2!2940 lt!98214)))))

(assert (=> b!62575 (= lt!98214 (readBit!0 (_1!2931 lt!97991)))))

(assert (=> b!62575 (= lt!98215 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!62576 () Bool)

(assert (=> b!62576 (= e!41558 (isEmpty!191 lt!98213))))

(declare-fun b!62574 () Bool)

(assert (=> b!62574 (= e!41557 (tuple2!5657 Nil!683 (_1!2931 lt!97991)))))

(assert (= (and d!19358 c!4435) b!62574))

(assert (= (and d!19358 (not c!4435)) b!62575))

(assert (= (and d!19358 c!4436) b!62576))

(assert (= (and d!19358 (not c!4436)) b!62577))

(declare-fun m!98967 () Bool)

(assert (=> b!62577 m!98967))

(declare-fun m!98969 () Bool)

(assert (=> b!62575 m!98969))

(declare-fun m!98971 () Bool)

(assert (=> b!62575 m!98971))

(declare-fun m!98973 () Bool)

(assert (=> b!62576 m!98973))

(assert (=> b!62453 d!19358))

(declare-fun d!19360 () Bool)

(assert (=> d!19360 (= (invariant!0 (currentBit!3288 (_2!2930 lt!97996)) (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97996)))) (and (bvsge (currentBit!3288 (_2!2930 lt!97996)) #b00000000000000000000000000000000) (bvslt (currentBit!3288 (_2!2930 lt!97996)) #b00000000000000000000000000001000) (bvsge (currentByte!3293 (_2!2930 lt!97996)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97996)))) (and (= (currentBit!3288 (_2!2930 lt!97996)) #b00000000000000000000000000000000) (= (currentByte!3293 (_2!2930 lt!97996)) (size!1276 (buf!1657 (_2!2930 lt!97996))))))))))

(assert (=> b!62442 d!19360))

(declare-fun d!19362 () Bool)

(declare-fun res!52063 () Bool)

(declare-fun e!41560 () Bool)

(assert (=> d!19362 (=> (not res!52063) (not e!41560))))

(assert (=> d!19362 (= res!52063 (= (size!1276 (buf!1657 thiss!1379)) (size!1276 (buf!1657 (_2!2930 lt!97996)))))))

(assert (=> d!19362 (= (isPrefixOf!0 thiss!1379 (_2!2930 lt!97996)) e!41560)))

(declare-fun b!62578 () Bool)

(declare-fun res!52061 () Bool)

(assert (=> b!62578 (=> (not res!52061) (not e!41560))))

(assert (=> b!62578 (= res!52061 (bvsle (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)) (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996)))))))

(declare-fun b!62579 () Bool)

(declare-fun e!41559 () Bool)

(assert (=> b!62579 (= e!41560 e!41559)))

(declare-fun res!52062 () Bool)

(assert (=> b!62579 (=> res!52062 e!41559)))

(assert (=> b!62579 (= res!52062 (= (size!1276 (buf!1657 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62580 () Bool)

(assert (=> b!62580 (= e!41559 (arrayBitRangesEq!0 (buf!1657 thiss!1379) (buf!1657 (_2!2930 lt!97996)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379))))))

(assert (= (and d!19362 res!52063) b!62578))

(assert (= (and b!62578 res!52061) b!62579))

(assert (= (and b!62579 (not res!52062)) b!62580))

(assert (=> b!62578 m!98793))

(assert (=> b!62578 m!98757))

(assert (=> b!62580 m!98793))

(assert (=> b!62580 m!98793))

(declare-fun m!98975 () Bool)

(assert (=> b!62580 m!98975))

(assert (=> b!62449 d!19362))

(declare-fun d!19364 () Bool)

(assert (=> d!19364 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!97987) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996)))) lt!97987))))

(declare-fun bs!4806 () Bool)

(assert (= bs!4806 d!19364))

(assert (=> bs!4806 m!98885))

(assert (=> b!62449 d!19364))

(declare-fun d!19366 () Bool)

(declare-fun e!41563 () Bool)

(assert (=> d!19366 e!41563))

(declare-fun res!52066 () Bool)

(assert (=> d!19366 (=> (not res!52066) (not e!41563))))

(assert (=> d!19366 (= res!52066 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!98218 () Unit!4247)

(declare-fun choose!27 (BitStream!2222 BitStream!2222 (_ BitVec 64) (_ BitVec 64)) Unit!4247)

(assert (=> d!19366 (= lt!98218 (choose!27 thiss!1379 (_2!2930 lt!97996) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19366 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19366 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2930 lt!97996) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98218)))

(declare-fun b!62583 () Bool)

(assert (=> b!62583 (= e!41563 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19366 res!52066) b!62583))

(declare-fun m!98977 () Bool)

(assert (=> d!19366 m!98977))

(declare-fun m!98979 () Bool)

(assert (=> b!62583 m!98979))

(assert (=> b!62449 d!19366))

(declare-fun b!62601 () Bool)

(declare-fun e!41572 () Bool)

(declare-fun e!41575 () Bool)

(assert (=> b!62601 (= e!41572 e!41575)))

(declare-fun res!52090 () Bool)

(assert (=> b!62601 (=> (not res!52090) (not e!41575))))

(declare-datatypes ((tuple2!5662 0))(
  ( (tuple2!5663 (_1!2942 BitStream!2222) (_2!2942 Bool)) )
))
(declare-fun lt!98254 () tuple2!5662)

(declare-fun lt!98250 () tuple2!5638)

(declare-fun lt!98253 () Bool)

(assert (=> b!62601 (= res!52090 (and (= (_2!2942 lt!98254) lt!98253) (= (_1!2942 lt!98254) (_2!2930 lt!98250))))))

(declare-fun readBitPure!0 (BitStream!2222) tuple2!5662)

(declare-fun readerFrom!0 (BitStream!2222 (_ BitVec 32) (_ BitVec 32)) BitStream!2222)

(assert (=> b!62601 (= lt!98254 (readBitPure!0 (readerFrom!0 (_2!2930 lt!98250) (currentBit!3288 thiss!1379) (currentByte!3293 thiss!1379))))))

(declare-fun b!62602 () Bool)

(declare-fun res!52087 () Bool)

(declare-fun e!41574 () Bool)

(assert (=> b!62602 (=> (not res!52087) (not e!41574))))

(declare-fun lt!98243 () (_ BitVec 64))

(declare-fun lt!98249 () tuple2!5638)

(declare-fun lt!98252 () (_ BitVec 64))

(assert (=> b!62602 (= res!52087 (= (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98249))) (currentByte!3293 (_2!2930 lt!98249)) (currentBit!3288 (_2!2930 lt!98249))) (bvadd lt!98243 lt!98252)))))

(assert (=> b!62602 (or (not (= (bvand lt!98243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!98252 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!98243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!98243 lt!98252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62602 (= lt!98252 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!62602 (= lt!98243 (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)))))

(declare-fun b!62603 () Bool)

(declare-fun e!41573 () Bool)

(assert (=> b!62603 (= e!41574 e!41573)))

(declare-fun res!52085 () Bool)

(assert (=> b!62603 (=> (not res!52085) (not e!41573))))

(declare-fun lt!98247 () (_ BitVec 8))

(declare-fun lt!98244 () tuple2!5662)

(assert (=> b!62603 (= res!52085 (and (= (_2!2942 lt!98244) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1840 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!98247)) #b00000000000000000000000000000000))) (= (_1!2942 lt!98244) (_2!2930 lt!98249))))))

(declare-datatypes ((tuple2!5664 0))(
  ( (tuple2!5665 (_1!2943 array!2792) (_2!2943 BitStream!2222)) )
))
(declare-fun lt!98248 () tuple2!5664)

(declare-fun lt!98246 () BitStream!2222)

(declare-fun readBits!0 (BitStream!2222 (_ BitVec 64)) tuple2!5664)

(assert (=> b!62603 (= lt!98248 (readBits!0 lt!98246 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!62603 (= lt!98244 (readBitPure!0 lt!98246))))

(assert (=> b!62603 (= lt!98246 (readerFrom!0 (_2!2930 lt!98249) (currentBit!3288 thiss!1379) (currentByte!3293 thiss!1379)))))

(declare-fun d!19368 () Bool)

(assert (=> d!19368 e!41574))

(declare-fun res!52086 () Bool)

(assert (=> d!19368 (=> (not res!52086) (not e!41574))))

(assert (=> d!19368 (= res!52086 (= (size!1276 (buf!1657 (_2!2930 lt!98249))) (size!1276 (buf!1657 thiss!1379))))))

(declare-fun lt!98245 () array!2792)

(assert (=> d!19368 (= lt!98247 (select (arr!1840 lt!98245) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19368 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1276 lt!98245)))))

(assert (=> d!19368 (= lt!98245 (array!2793 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!98251 () tuple2!5638)

(assert (=> d!19368 (= lt!98249 (tuple2!5639 (_1!2930 lt!98251) (_2!2930 lt!98251)))))

(assert (=> d!19368 (= lt!98251 lt!98250)))

(assert (=> d!19368 e!41572))

(declare-fun res!52089 () Bool)

(assert (=> d!19368 (=> (not res!52089) (not e!41572))))

(assert (=> d!19368 (= res!52089 (= (size!1276 (buf!1657 thiss!1379)) (size!1276 (buf!1657 (_2!2930 lt!98250)))))))

(declare-fun appendBit!0 (BitStream!2222 Bool) tuple2!5638)

(assert (=> d!19368 (= lt!98250 (appendBit!0 thiss!1379 lt!98253))))

(assert (=> d!19368 (= lt!98253 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1840 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19368 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19368 (= (appendBitFromByte!0 thiss!1379 (select (arr!1840 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!98249)))

(declare-fun b!62604 () Bool)

(assert (=> b!62604 (= e!41573 (= (bitIndex!0 (size!1276 (buf!1657 (_1!2942 lt!98244))) (currentByte!3293 (_1!2942 lt!98244)) (currentBit!3288 (_1!2942 lt!98244))) (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98249))) (currentByte!3293 (_2!2930 lt!98249)) (currentBit!3288 (_2!2930 lt!98249)))))))

(declare-fun b!62605 () Bool)

(declare-fun res!52084 () Bool)

(assert (=> b!62605 (=> (not res!52084) (not e!41572))))

(assert (=> b!62605 (= res!52084 (isPrefixOf!0 thiss!1379 (_2!2930 lt!98250)))))

(declare-fun b!62606 () Bool)

(declare-fun res!52083 () Bool)

(assert (=> b!62606 (=> (not res!52083) (not e!41574))))

(assert (=> b!62606 (= res!52083 (isPrefixOf!0 thiss!1379 (_2!2930 lt!98249)))))

(declare-fun b!62607 () Bool)

(assert (=> b!62607 (= e!41575 (= (bitIndex!0 (size!1276 (buf!1657 (_1!2942 lt!98254))) (currentByte!3293 (_1!2942 lt!98254)) (currentBit!3288 (_1!2942 lt!98254))) (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98250))) (currentByte!3293 (_2!2930 lt!98250)) (currentBit!3288 (_2!2930 lt!98250)))))))

(declare-fun b!62608 () Bool)

(declare-fun res!52088 () Bool)

(assert (=> b!62608 (=> (not res!52088) (not e!41572))))

(assert (=> b!62608 (= res!52088 (= (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98250))) (currentByte!3293 (_2!2930 lt!98250)) (currentBit!3288 (_2!2930 lt!98250))) (bvadd (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19368 res!52089) b!62608))

(assert (= (and b!62608 res!52088) b!62605))

(assert (= (and b!62605 res!52084) b!62601))

(assert (= (and b!62601 res!52090) b!62607))

(assert (= (and d!19368 res!52086) b!62602))

(assert (= (and b!62602 res!52087) b!62606))

(assert (= (and b!62606 res!52083) b!62603))

(assert (= (and b!62603 res!52085) b!62604))

(declare-fun m!98981 () Bool)

(assert (=> b!62605 m!98981))

(declare-fun m!98983 () Bool)

(assert (=> b!62602 m!98983))

(assert (=> b!62602 m!98793))

(declare-fun m!98985 () Bool)

(assert (=> b!62601 m!98985))

(assert (=> b!62601 m!98985))

(declare-fun m!98987 () Bool)

(assert (=> b!62601 m!98987))

(declare-fun m!98989 () Bool)

(assert (=> b!62606 m!98989))

(declare-fun m!98991 () Bool)

(assert (=> d!19368 m!98991))

(declare-fun m!98993 () Bool)

(assert (=> d!19368 m!98993))

(assert (=> d!19368 m!98963))

(declare-fun m!98995 () Bool)

(assert (=> b!62604 m!98995))

(assert (=> b!62604 m!98983))

(declare-fun m!98997 () Bool)

(assert (=> b!62608 m!98997))

(assert (=> b!62608 m!98793))

(declare-fun m!98999 () Bool)

(assert (=> b!62607 m!98999))

(assert (=> b!62607 m!98997))

(declare-fun m!99001 () Bool)

(assert (=> b!62603 m!99001))

(declare-fun m!99003 () Bool)

(assert (=> b!62603 m!99003))

(declare-fun m!99005 () Bool)

(assert (=> b!62603 m!99005))

(assert (=> b!62449 d!19368))

(declare-fun d!19370 () Bool)

(assert (=> d!19370 (= (array_inv!1170 (buf!1657 thiss!1379)) (bvsge (size!1276 (buf!1657 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!62440 d!19370))

(declare-fun d!19372 () Bool)

(declare-fun res!52093 () Bool)

(declare-fun e!41577 () Bool)

(assert (=> d!19372 (=> (not res!52093) (not e!41577))))

(assert (=> d!19372 (= res!52093 (= (size!1276 (buf!1657 thiss!1379)) (size!1276 (buf!1657 (_2!2930 lt!97986)))))))

(assert (=> d!19372 (= (isPrefixOf!0 thiss!1379 (_2!2930 lt!97986)) e!41577)))

(declare-fun b!62609 () Bool)

(declare-fun res!52091 () Bool)

(assert (=> b!62609 (=> (not res!52091) (not e!41577))))

(assert (=> b!62609 (= res!52091 (bvsle (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379)) (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97986))) (currentByte!3293 (_2!2930 lt!97986)) (currentBit!3288 (_2!2930 lt!97986)))))))

(declare-fun b!62610 () Bool)

(declare-fun e!41576 () Bool)

(assert (=> b!62610 (= e!41577 e!41576)))

(declare-fun res!52092 () Bool)

(assert (=> b!62610 (=> res!52092 e!41576)))

(assert (=> b!62610 (= res!52092 (= (size!1276 (buf!1657 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62611 () Bool)

(assert (=> b!62611 (= e!41576 (arrayBitRangesEq!0 (buf!1657 thiss!1379) (buf!1657 (_2!2930 lt!97986)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1276 (buf!1657 thiss!1379)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379))))))

(assert (= (and d!19372 res!52093) b!62609))

(assert (= (and b!62609 res!52091) b!62610))

(assert (= (and b!62610 (not res!52092)) b!62611))

(assert (=> b!62609 m!98793))

(assert (=> b!62609 m!98785))

(assert (=> b!62611 m!98793))

(assert (=> b!62611 m!98793))

(declare-fun m!99007 () Bool)

(assert (=> b!62611 m!99007))

(assert (=> b!62450 d!19372))

(declare-fun d!19374 () Bool)

(assert (=> d!19374 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 thiss!1379)) ((_ sign_extend 32) (currentBit!3288 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98255 () Unit!4247)

(assert (=> d!19374 (= lt!98255 (choose!9 thiss!1379 (buf!1657 (_2!2930 lt!97996)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2223 (buf!1657 (_2!2930 lt!97996)) (currentByte!3293 thiss!1379) (currentBit!3288 thiss!1379))))))

(assert (=> d!19374 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1657 (_2!2930 lt!97996)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!98255)))

(declare-fun bs!4807 () Bool)

(assert (= bs!4807 d!19374))

(assert (=> bs!4807 m!98755))

(declare-fun m!99009 () Bool)

(assert (=> bs!4807 m!99009))

(assert (=> b!62450 d!19374))

(declare-fun b!62863 () Bool)

(declare-fun e!41701 () tuple2!5638)

(declare-fun lt!98952 () tuple2!5638)

(declare-fun Unit!4271 () Unit!4247)

(assert (=> b!62863 (= e!41701 (tuple2!5639 Unit!4271 (_2!2930 lt!98952)))))

(declare-fun lt!98954 () tuple2!5638)

(assert (=> b!62863 (= lt!98954 (appendBitFromByte!0 (_2!2930 lt!97996) (select (arr!1840 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!98932 () (_ BitVec 64))

(assert (=> b!62863 (= lt!98932 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98949 () (_ BitVec 64))

(assert (=> b!62863 (= lt!98949 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98918 () Unit!4247)

(assert (=> b!62863 (= lt!98918 (validateOffsetBitsIneqLemma!0 (_2!2930 lt!97996) (_2!2930 lt!98954) lt!98932 lt!98949))))

(assert (=> b!62863 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!98954)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!98954))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!98954))) (bvsub lt!98932 lt!98949))))

(declare-fun lt!98917 () Unit!4247)

(assert (=> b!62863 (= lt!98917 lt!98918)))

(declare-fun lt!98939 () tuple2!5640)

(assert (=> b!62863 (= lt!98939 (reader!0 (_2!2930 lt!97996) (_2!2930 lt!98954)))))

(declare-fun lt!98945 () (_ BitVec 64))

(assert (=> b!62863 (= lt!98945 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!98946 () Unit!4247)

(assert (=> b!62863 (= lt!98946 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2930 lt!97996) (buf!1657 (_2!2930 lt!98954)) lt!98945))))

(assert (=> b!62863 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!98954)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!98945)))

(declare-fun lt!98956 () Unit!4247)

(assert (=> b!62863 (= lt!98956 lt!98946)))

(assert (=> b!62863 (= (head!505 (byteArrayBitContentToList!0 (_2!2930 lt!98954) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!505 (bitStreamReadBitsIntoList!0 (_2!2930 lt!98954) (_1!2931 lt!98939) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98924 () Unit!4247)

(declare-fun Unit!4272 () Unit!4247)

(assert (=> b!62863 (= lt!98924 Unit!4272)))

(assert (=> b!62863 (= lt!98952 (appendBitsMSBFirstLoop!0 (_2!2930 lt!98954) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!98951 () Unit!4247)

(assert (=> b!62863 (= lt!98951 (lemmaIsPrefixTransitive!0 (_2!2930 lt!97996) (_2!2930 lt!98954) (_2!2930 lt!98952)))))

(assert (=> b!62863 (isPrefixOf!0 (_2!2930 lt!97996) (_2!2930 lt!98952))))

(declare-fun lt!98934 () Unit!4247)

(assert (=> b!62863 (= lt!98934 lt!98951)))

(assert (=> b!62863 (= (size!1276 (buf!1657 (_2!2930 lt!98952))) (size!1276 (buf!1657 (_2!2930 lt!97996))))))

(declare-fun lt!98915 () Unit!4247)

(declare-fun Unit!4273 () Unit!4247)

(assert (=> b!62863 (= lt!98915 Unit!4273)))

(assert (=> b!62863 (= (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98952))) (currentByte!3293 (_2!2930 lt!98952)) (currentBit!3288 (_2!2930 lt!98952))) (bvsub (bvadd (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98948 () Unit!4247)

(declare-fun Unit!4274 () Unit!4247)

(assert (=> b!62863 (= lt!98948 Unit!4274)))

(assert (=> b!62863 (= (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98952))) (currentByte!3293 (_2!2930 lt!98952)) (currentBit!3288 (_2!2930 lt!98952))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98954))) (currentByte!3293 (_2!2930 lt!98954)) (currentBit!3288 (_2!2930 lt!98954))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!98929 () Unit!4247)

(declare-fun Unit!4275 () Unit!4247)

(assert (=> b!62863 (= lt!98929 Unit!4275)))

(declare-fun lt!98931 () tuple2!5640)

(assert (=> b!62863 (= lt!98931 (reader!0 (_2!2930 lt!97996) (_2!2930 lt!98952)))))

(declare-fun lt!98930 () (_ BitVec 64))

(assert (=> b!62863 (= lt!98930 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98914 () Unit!4247)

(assert (=> b!62863 (= lt!98914 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2930 lt!97996) (buf!1657 (_2!2930 lt!98952)) lt!98930))))

(assert (=> b!62863 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!98952)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!98930)))

(declare-fun lt!98933 () Unit!4247)

(assert (=> b!62863 (= lt!98933 lt!98914)))

(declare-fun lt!98943 () tuple2!5640)

(declare-fun call!799 () tuple2!5640)

(assert (=> b!62863 (= lt!98943 call!799)))

(declare-fun lt!98923 () (_ BitVec 64))

(assert (=> b!62863 (= lt!98923 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!98936 () Unit!4247)

(assert (=> b!62863 (= lt!98936 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2930 lt!98954) (buf!1657 (_2!2930 lt!98952)) lt!98923))))

(assert (=> b!62863 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!98952)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!98954))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!98954))) lt!98923)))

(declare-fun lt!98955 () Unit!4247)

(assert (=> b!62863 (= lt!98955 lt!98936)))

(declare-fun lt!98922 () List!686)

(assert (=> b!62863 (= lt!98922 (byteArrayBitContentToList!0 (_2!2930 lt!98952) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!98919 () List!686)

(assert (=> b!62863 (= lt!98919 (byteArrayBitContentToList!0 (_2!2930 lt!98952) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98953 () List!686)

(assert (=> b!62863 (= lt!98953 (bitStreamReadBitsIntoList!0 (_2!2930 lt!98952) (_1!2931 lt!98931) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!98941 () List!686)

(assert (=> b!62863 (= lt!98941 (bitStreamReadBitsIntoList!0 (_2!2930 lt!98952) (_1!2931 lt!98943) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!98950 () (_ BitVec 64))

(assert (=> b!62863 (= lt!98950 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!98935 () Unit!4247)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2222 BitStream!2222 BitStream!2222 BitStream!2222 (_ BitVec 64) List!686) Unit!4247)

(assert (=> b!62863 (= lt!98935 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2930 lt!98952) (_2!2930 lt!98952) (_1!2931 lt!98931) (_1!2931 lt!98943) lt!98950 lt!98953))))

(declare-fun tail!293 (List!686) List!686)

(assert (=> b!62863 (= (bitStreamReadBitsIntoList!0 (_2!2930 lt!98952) (_1!2931 lt!98943) (bvsub lt!98950 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!293 lt!98953))))

(declare-fun lt!98928 () Unit!4247)

(assert (=> b!62863 (= lt!98928 lt!98935)))

(declare-fun lt!98957 () Unit!4247)

(declare-fun lt!98925 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2792 array!2792 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4247)

(assert (=> b!62863 (= lt!98957 (arrayBitRangesEqImpliesEq!0 (buf!1657 (_2!2930 lt!98954)) (buf!1657 (_2!2930 lt!98952)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!98925 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98954))) (currentByte!3293 (_2!2930 lt!98954)) (currentBit!3288 (_2!2930 lt!98954)))))))

(declare-fun bitAt!0 (array!2792 (_ BitVec 64)) Bool)

(assert (=> b!62863 (= (bitAt!0 (buf!1657 (_2!2930 lt!98954)) lt!98925) (bitAt!0 (buf!1657 (_2!2930 lt!98952)) lt!98925))))

(declare-fun lt!98938 () Unit!4247)

(assert (=> b!62863 (= lt!98938 lt!98957)))

(declare-fun b!62864 () Bool)

(declare-fun res!52263 () Bool)

(declare-fun e!41700 () Bool)

(assert (=> b!62864 (=> (not res!52263) (not e!41700))))

(declare-fun lt!98940 () tuple2!5638)

(assert (=> b!62864 (= res!52263 (isPrefixOf!0 (_2!2930 lt!97996) (_2!2930 lt!98940)))))

(declare-fun d!19376 () Bool)

(assert (=> d!19376 e!41700))

(declare-fun res!52266 () Bool)

(assert (=> d!19376 (=> (not res!52266) (not e!41700))))

(declare-fun lt!98942 () (_ BitVec 64))

(assert (=> d!19376 (= res!52266 (= (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!98940))) (currentByte!3293 (_2!2930 lt!98940)) (currentBit!3288 (_2!2930 lt!98940))) (bvsub lt!98942 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19376 (or (= (bvand lt!98942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!98942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!98942 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!98916 () (_ BitVec 64))

(assert (=> d!19376 (= lt!98942 (bvadd lt!98916 to!314))))

(assert (=> d!19376 (or (not (= (bvand lt!98916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!98916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!98916 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19376 (= lt!98916 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))))))

(assert (=> d!19376 (= lt!98940 e!41701)))

(declare-fun c!4478 () Bool)

(assert (=> d!19376 (= c!4478 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!98926 () Unit!4247)

(declare-fun lt!98927 () Unit!4247)

(assert (=> d!19376 (= lt!98926 lt!98927)))

(assert (=> d!19376 (isPrefixOf!0 (_2!2930 lt!97996) (_2!2930 lt!97996))))

(assert (=> d!19376 (= lt!98927 (lemmaIsPrefixRefl!0 (_2!2930 lt!97996)))))

(assert (=> d!19376 (= lt!98925 (bitIndex!0 (size!1276 (buf!1657 (_2!2930 lt!97996))) (currentByte!3293 (_2!2930 lt!97996)) (currentBit!3288 (_2!2930 lt!97996))))))

(assert (=> d!19376 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19376 (= (appendBitsMSBFirstLoop!0 (_2!2930 lt!97996) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!98940)))

(declare-fun b!62865 () Bool)

(declare-fun res!52261 () Bool)

(assert (=> b!62865 (=> (not res!52261) (not e!41700))))

(assert (=> b!62865 (= res!52261 (= (size!1276 (buf!1657 (_2!2930 lt!97996))) (size!1276 (buf!1657 (_2!2930 lt!98940)))))))

(declare-fun b!62866 () Bool)

(declare-fun res!52265 () Bool)

(assert (=> b!62866 (=> (not res!52265) (not e!41700))))

(assert (=> b!62866 (= res!52265 (= (size!1276 (buf!1657 (_2!2930 lt!98940))) (size!1276 (buf!1657 (_2!2930 lt!97996)))))))

(declare-fun b!62867 () Bool)

(declare-fun res!52262 () Bool)

(assert (=> b!62867 (=> (not res!52262) (not e!41700))))

(assert (=> b!62867 (= res!52262 (invariant!0 (currentBit!3288 (_2!2930 lt!98940)) (currentByte!3293 (_2!2930 lt!98940)) (size!1276 (buf!1657 (_2!2930 lt!98940)))))))

(declare-fun bm!796 () Bool)

(assert (=> bm!796 (= call!799 (reader!0 (ite c!4478 (_2!2930 lt!98954) (_2!2930 lt!97996)) (ite c!4478 (_2!2930 lt!98952) (_2!2930 lt!97996))))))

(declare-fun b!62868 () Bool)

(declare-fun e!41699 () Bool)

(declare-fun lt!98920 () (_ BitVec 64))

(assert (=> b!62868 (= e!41699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1276 (buf!1657 (_2!2930 lt!97996)))) ((_ sign_extend 32) (currentByte!3293 (_2!2930 lt!97996))) ((_ sign_extend 32) (currentBit!3288 (_2!2930 lt!97996))) lt!98920))))

(declare-fun b!62869 () Bool)

(declare-fun Unit!4276 () Unit!4247)

(assert (=> b!62869 (= e!41701 (tuple2!5639 Unit!4276 (_2!2930 lt!97996)))))

(assert (=> b!62869 (= (size!1276 (buf!1657 (_2!2930 lt!97996))) (size!1276 (buf!1657 (_2!2930 lt!97996))))))

