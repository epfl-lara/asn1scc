; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11858 () Bool)

(assert start!11858)

(declare-fun b!59622 () Bool)

(declare-fun e!39691 () Bool)

(declare-fun lt!93432 () (_ BitVec 64))

(declare-fun lt!93423 () (_ BitVec 64))

(assert (=> b!59622 (= e!39691 (or (= lt!93432 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!93432 (bvand lt!93423 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!59622 (= lt!93432 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2715 0))(
  ( (array!2716 (arr!1797 (Array (_ BitVec 32) (_ BitVec 8))) (size!1233 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2154 0))(
  ( (BitStream!2155 (buf!1614 array!2715) (currentByte!3232 (_ BitVec 32)) (currentBit!3227 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4089 0))(
  ( (Unit!4090) )
))
(declare-datatypes ((tuple2!5430 0))(
  ( (tuple2!5431 (_1!2826 Unit!4089) (_2!2826 BitStream!2154)) )
))
(declare-fun lt!93431 () tuple2!5430)

(declare-fun lt!93426 () tuple2!5430)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59622 (validate_offset_bits!1 ((_ sign_extend 32) (size!1233 (buf!1614 (_2!2826 lt!93431)))) ((_ sign_extend 32) (currentByte!3232 (_2!2826 lt!93426))) ((_ sign_extend 32) (currentBit!3227 (_2!2826 lt!93426))) lt!93423)))

(declare-fun lt!93422 () Unit!4089)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2154 array!2715 (_ BitVec 64)) Unit!4089)

(assert (=> b!59622 (= lt!93422 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2826 lt!93426) (buf!1614 (_2!2826 lt!93431)) lt!93423))))

(declare-datatypes ((tuple2!5432 0))(
  ( (tuple2!5433 (_1!2827 BitStream!2154) (_2!2827 BitStream!2154)) )
))
(declare-fun lt!93430 () tuple2!5432)

(declare-fun reader!0 (BitStream!2154 BitStream!2154) tuple2!5432)

(assert (=> b!59622 (= lt!93430 (reader!0 (_2!2826 lt!93426) (_2!2826 lt!93431)))))

(declare-fun thiss!1379 () BitStream!2154)

(assert (=> b!59622 (validate_offset_bits!1 ((_ sign_extend 32) (size!1233 (buf!1614 (_2!2826 lt!93431)))) ((_ sign_extend 32) (currentByte!3232 thiss!1379)) ((_ sign_extend 32) (currentBit!3227 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93435 () Unit!4089)

(assert (=> b!59622 (= lt!93435 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1614 (_2!2826 lt!93431)) (bvsub to!314 i!635)))))

(declare-fun lt!93424 () tuple2!5432)

(assert (=> b!59622 (= lt!93424 (reader!0 thiss!1379 (_2!2826 lt!93431)))))

(declare-fun b!59623 () Bool)

(declare-fun e!39694 () Bool)

(declare-fun e!39696 () Bool)

(assert (=> b!59623 (= e!39694 e!39696)))

(declare-fun res!49637 () Bool)

(assert (=> b!59623 (=> res!49637 e!39696)))

(declare-fun isPrefixOf!0 (BitStream!2154 BitStream!2154) Bool)

(assert (=> b!59623 (= res!49637 (not (isPrefixOf!0 (_2!2826 lt!93426) (_2!2826 lt!93431))))))

(assert (=> b!59623 (isPrefixOf!0 thiss!1379 (_2!2826 lt!93431))))

(declare-fun lt!93427 () Unit!4089)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2154 BitStream!2154 BitStream!2154) Unit!4089)

(assert (=> b!59623 (= lt!93427 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2826 lt!93426) (_2!2826 lt!93431)))))

(declare-fun srcBuffer!2 () array!2715)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2154 array!2715 (_ BitVec 64) (_ BitVec 64)) tuple2!5430)

(assert (=> b!59623 (= lt!93431 (appendBitsMSBFirstLoop!0 (_2!2826 lt!93426) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39692 () Bool)

(assert (=> b!59623 e!39692))

(declare-fun res!49636 () Bool)

(assert (=> b!59623 (=> (not res!49636) (not e!39692))))

(assert (=> b!59623 (= res!49636 (validate_offset_bits!1 ((_ sign_extend 32) (size!1233 (buf!1614 (_2!2826 lt!93426)))) ((_ sign_extend 32) (currentByte!3232 thiss!1379)) ((_ sign_extend 32) (currentBit!3227 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93436 () Unit!4089)

(assert (=> b!59623 (= lt!93436 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1614 (_2!2826 lt!93426)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93433 () tuple2!5432)

(assert (=> b!59623 (= lt!93433 (reader!0 thiss!1379 (_2!2826 lt!93426)))))

(declare-fun b!59624 () Bool)

(declare-fun res!49643 () Bool)

(declare-fun e!39695 () Bool)

(assert (=> b!59624 (=> res!49643 e!39695)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59624 (= res!49643 (not (invariant!0 (currentBit!3227 (_2!2826 lt!93431)) (currentByte!3232 (_2!2826 lt!93431)) (size!1233 (buf!1614 (_2!2826 lt!93431))))))))

(declare-fun res!49644 () Bool)

(declare-fun e!39690 () Bool)

(assert (=> start!11858 (=> (not res!49644) (not e!39690))))

(assert (=> start!11858 (= res!49644 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1233 srcBuffer!2))))))))

(assert (=> start!11858 e!39690))

(assert (=> start!11858 true))

(declare-fun array_inv!1136 (array!2715) Bool)

(assert (=> start!11858 (array_inv!1136 srcBuffer!2)))

(declare-fun e!39693 () Bool)

(declare-fun inv!12 (BitStream!2154) Bool)

(assert (=> start!11858 (and (inv!12 thiss!1379) e!39693)))

(declare-fun b!59625 () Bool)

(declare-datatypes ((List!652 0))(
  ( (Nil!649) (Cons!648 (h!767 Bool) (t!1402 List!652)) )
))
(declare-fun head!471 (List!652) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2154 array!2715 (_ BitVec 64) (_ BitVec 64)) List!652)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2154 BitStream!2154 (_ BitVec 64)) List!652)

(assert (=> b!59625 (= e!39692 (= (head!471 (byteArrayBitContentToList!0 (_2!2826 lt!93426) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!471 (bitStreamReadBitsIntoList!0 (_2!2826 lt!93426) (_1!2827 lt!93433) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59626 () Bool)

(declare-fun res!49635 () Bool)

(assert (=> b!59626 (=> (not res!49635) (not e!39690))))

(assert (=> b!59626 (= res!49635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1233 (buf!1614 thiss!1379))) ((_ sign_extend 32) (currentByte!3232 thiss!1379)) ((_ sign_extend 32) (currentBit!3227 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59627 () Bool)

(declare-fun e!39688 () Bool)

(declare-fun lt!93434 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59627 (= e!39688 (= lt!93434 (bvsub (bvsub (bvadd (bitIndex!0 (size!1233 (buf!1614 (_2!2826 lt!93426))) (currentByte!3232 (_2!2826 lt!93426)) (currentBit!3227 (_2!2826 lt!93426))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59628 () Bool)

(assert (=> b!59628 (= e!39695 e!39691)))

(declare-fun res!49647 () Bool)

(assert (=> b!59628 (=> res!49647 e!39691)))

(assert (=> b!59628 (= res!49647 (not (= (size!1233 (buf!1614 (_2!2826 lt!93426))) (size!1233 (buf!1614 (_2!2826 lt!93431))))))))

(assert (=> b!59628 e!39688))

(declare-fun res!49642 () Bool)

(assert (=> b!59628 (=> (not res!49642) (not e!39688))))

(assert (=> b!59628 (= res!49642 (= (size!1233 (buf!1614 (_2!2826 lt!93431))) (size!1233 (buf!1614 thiss!1379))))))

(declare-fun b!59629 () Bool)

(declare-fun e!39689 () Bool)

(assert (=> b!59629 (= e!39689 e!39694)))

(declare-fun res!49645 () Bool)

(assert (=> b!59629 (=> res!49645 e!39694)))

(assert (=> b!59629 (= res!49645 (not (isPrefixOf!0 thiss!1379 (_2!2826 lt!93426))))))

(assert (=> b!59629 (validate_offset_bits!1 ((_ sign_extend 32) (size!1233 (buf!1614 (_2!2826 lt!93426)))) ((_ sign_extend 32) (currentByte!3232 (_2!2826 lt!93426))) ((_ sign_extend 32) (currentBit!3227 (_2!2826 lt!93426))) lt!93423)))

(assert (=> b!59629 (= lt!93423 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93425 () Unit!4089)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2154 BitStream!2154 (_ BitVec 64) (_ BitVec 64)) Unit!4089)

(assert (=> b!59629 (= lt!93425 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2826 lt!93426) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2154 (_ BitVec 8) (_ BitVec 32)) tuple2!5430)

(assert (=> b!59629 (= lt!93426 (appendBitFromByte!0 thiss!1379 (select (arr!1797 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59630 () Bool)

(assert (=> b!59630 (= e!39690 (not e!39689))))

(declare-fun res!49646 () Bool)

(assert (=> b!59630 (=> res!49646 e!39689)))

(assert (=> b!59630 (= res!49646 (bvsge i!635 to!314))))

(assert (=> b!59630 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93428 () Unit!4089)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2154) Unit!4089)

(assert (=> b!59630 (= lt!93428 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93429 () (_ BitVec 64))

(assert (=> b!59630 (= lt!93429 (bitIndex!0 (size!1233 (buf!1614 thiss!1379)) (currentByte!3232 thiss!1379) (currentBit!3227 thiss!1379)))))

(declare-fun b!59631 () Bool)

(declare-fun res!49639 () Bool)

(assert (=> b!59631 (=> res!49639 e!39691)))

(assert (=> b!59631 (= res!49639 (not (invariant!0 (currentBit!3227 (_2!2826 lt!93426)) (currentByte!3232 (_2!2826 lt!93426)) (size!1233 (buf!1614 (_2!2826 lt!93426))))))))

(declare-fun b!59632 () Bool)

(declare-fun res!49640 () Bool)

(assert (=> b!59632 (=> res!49640 e!39691)))

(assert (=> b!59632 (= res!49640 (not (invariant!0 (currentBit!3227 (_2!2826 lt!93426)) (currentByte!3232 (_2!2826 lt!93426)) (size!1233 (buf!1614 (_2!2826 lt!93431))))))))

(declare-fun b!59633 () Bool)

(assert (=> b!59633 (= e!39693 (array_inv!1136 (buf!1614 thiss!1379)))))

(declare-fun b!59634 () Bool)

(declare-fun res!49638 () Bool)

(assert (=> b!59634 (=> res!49638 e!39695)))

(assert (=> b!59634 (= res!49638 (not (= (size!1233 (buf!1614 thiss!1379)) (size!1233 (buf!1614 (_2!2826 lt!93431))))))))

(declare-fun b!59635 () Bool)

(assert (=> b!59635 (= e!39696 e!39695)))

(declare-fun res!49641 () Bool)

(assert (=> b!59635 (=> res!49641 e!39695)))

(assert (=> b!59635 (= res!49641 (not (= lt!93434 (bvsub (bvadd lt!93429 to!314) i!635))))))

(assert (=> b!59635 (= lt!93434 (bitIndex!0 (size!1233 (buf!1614 (_2!2826 lt!93431))) (currentByte!3232 (_2!2826 lt!93431)) (currentBit!3227 (_2!2826 lt!93431))))))

(assert (= (and start!11858 res!49644) b!59626))

(assert (= (and b!59626 res!49635) b!59630))

(assert (= (and b!59630 (not res!49646)) b!59629))

(assert (= (and b!59629 (not res!49645)) b!59623))

(assert (= (and b!59623 res!49636) b!59625))

(assert (= (and b!59623 (not res!49637)) b!59635))

(assert (= (and b!59635 (not res!49641)) b!59624))

(assert (= (and b!59624 (not res!49643)) b!59634))

(assert (= (and b!59634 (not res!49638)) b!59628))

(assert (= (and b!59628 res!49642) b!59627))

(assert (= (and b!59628 (not res!49647)) b!59631))

(assert (= (and b!59631 (not res!49639)) b!59632))

(assert (= (and b!59632 (not res!49640)) b!59622))

(assert (= start!11858 b!59633))

(declare-fun m!93897 () Bool)

(assert (=> b!59622 m!93897))

(declare-fun m!93899 () Bool)

(assert (=> b!59622 m!93899))

(declare-fun m!93901 () Bool)

(assert (=> b!59622 m!93901))

(declare-fun m!93903 () Bool)

(assert (=> b!59622 m!93903))

(declare-fun m!93905 () Bool)

(assert (=> b!59622 m!93905))

(declare-fun m!93907 () Bool)

(assert (=> b!59622 m!93907))

(declare-fun m!93909 () Bool)

(assert (=> b!59624 m!93909))

(declare-fun m!93911 () Bool)

(assert (=> b!59632 m!93911))

(declare-fun m!93913 () Bool)

(assert (=> b!59635 m!93913))

(declare-fun m!93915 () Bool)

(assert (=> b!59629 m!93915))

(declare-fun m!93917 () Bool)

(assert (=> b!59629 m!93917))

(declare-fun m!93919 () Bool)

(assert (=> b!59629 m!93919))

(assert (=> b!59629 m!93917))

(declare-fun m!93921 () Bool)

(assert (=> b!59629 m!93921))

(declare-fun m!93923 () Bool)

(assert (=> b!59629 m!93923))

(declare-fun m!93925 () Bool)

(assert (=> b!59631 m!93925))

(declare-fun m!93927 () Bool)

(assert (=> b!59623 m!93927))

(declare-fun m!93929 () Bool)

(assert (=> b!59623 m!93929))

(declare-fun m!93931 () Bool)

(assert (=> b!59623 m!93931))

(declare-fun m!93933 () Bool)

(assert (=> b!59623 m!93933))

(declare-fun m!93935 () Bool)

(assert (=> b!59623 m!93935))

(declare-fun m!93937 () Bool)

(assert (=> b!59623 m!93937))

(declare-fun m!93939 () Bool)

(assert (=> b!59623 m!93939))

(declare-fun m!93941 () Bool)

(assert (=> b!59627 m!93941))

(declare-fun m!93943 () Bool)

(assert (=> b!59626 m!93943))

(declare-fun m!93945 () Bool)

(assert (=> b!59630 m!93945))

(declare-fun m!93947 () Bool)

(assert (=> b!59630 m!93947))

(declare-fun m!93949 () Bool)

(assert (=> b!59630 m!93949))

(declare-fun m!93951 () Bool)

(assert (=> b!59633 m!93951))

(declare-fun m!93953 () Bool)

(assert (=> b!59625 m!93953))

(assert (=> b!59625 m!93953))

(declare-fun m!93955 () Bool)

(assert (=> b!59625 m!93955))

(declare-fun m!93957 () Bool)

(assert (=> b!59625 m!93957))

(assert (=> b!59625 m!93957))

(declare-fun m!93959 () Bool)

(assert (=> b!59625 m!93959))

(declare-fun m!93961 () Bool)

(assert (=> start!11858 m!93961))

(declare-fun m!93963 () Bool)

(assert (=> start!11858 m!93963))

(check-sat (not b!59630) (not b!59624) (not b!59631) (not b!59633) (not b!59623) (not b!59622) (not b!59625) (not b!59629) (not start!11858) (not b!59627) (not b!59626) (not b!59632) (not b!59635))
(check-sat)
