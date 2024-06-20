; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7344 () Bool)

(assert start!7344)

(declare-fun b!35843 () Bool)

(declare-fun res!30585 () Bool)

(declare-fun e!23696 () Bool)

(assert (=> b!35843 (=> res!30585 e!23696)))

(declare-datatypes ((array!1911 0))(
  ( (array!1912 (arr!1336 (Array (_ BitVec 32) (_ BitVec 8))) (size!852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1478 0))(
  ( (BitStream!1479 (buf!1180 array!1911) (currentByte!2565 (_ BitVec 32)) (currentBit!2560 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2631 0))(
  ( (Unit!2632) )
))
(declare-datatypes ((tuple2!3558 0))(
  ( (tuple2!3559 (_1!1866 Unit!2631) (_2!1866 BitStream!1478)) )
))
(declare-fun lt!53513 () tuple2!3558)

(declare-fun lt!53517 () tuple2!3558)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!35843 (= res!30585 (not (invariant!0 (currentBit!2560 (_2!1866 lt!53513)) (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53517))))))))

(declare-fun b!35844 () Bool)

(declare-fun e!23687 () Bool)

(declare-fun e!23689 () Bool)

(assert (=> b!35844 (= e!23687 e!23689)))

(declare-fun res!30584 () Bool)

(assert (=> b!35844 (=> res!30584 e!23689)))

(declare-fun lt!53521 () Bool)

(declare-datatypes ((tuple2!3560 0))(
  ( (tuple2!3561 (_1!1867 BitStream!1478) (_2!1867 BitStream!1478)) )
))
(declare-fun lt!53504 () tuple2!3560)

(declare-fun lt!53519 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1911 (_ BitVec 64)) Bool)

(assert (=> b!35844 (= res!30584 (not (= lt!53521 (bitAt!0 (buf!1180 (_1!1867 lt!53504)) lt!53519))))))

(declare-fun lt!53525 () tuple2!3560)

(assert (=> b!35844 (= lt!53521 (bitAt!0 (buf!1180 (_1!1867 lt!53525)) lt!53519))))

(declare-fun b!35845 () Bool)

(declare-fun e!23691 () Bool)

(declare-fun e!23694 () Bool)

(assert (=> b!35845 (= e!23691 e!23694)))

(declare-fun res!30592 () Bool)

(assert (=> b!35845 (=> res!30592 e!23694)))

(declare-fun lt!53527 () Bool)

(declare-fun lt!53516 () Bool)

(assert (=> b!35845 (= res!30592 (not (= lt!53527 lt!53516)))))

(declare-fun lt!53512 () Bool)

(assert (=> b!35845 (= lt!53512 lt!53527)))

(assert (=> b!35845 (= lt!53527 (bitAt!0 (buf!1180 (_2!1866 lt!53517)) lt!53519))))

(declare-fun lt!53515 () Unit!2631)

(declare-fun lt!53507 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1911 array!1911 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2631)

(assert (=> b!35845 (= lt!53515 (arrayBitRangesEqImpliesEq!0 (buf!1180 (_2!1866 lt!53513)) (buf!1180 (_2!1866 lt!53517)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53519 lt!53507))))

(declare-fun b!35846 () Bool)

(declare-fun e!23695 () Bool)

(declare-fun e!23688 () Bool)

(assert (=> b!35846 (= e!23695 e!23688)))

(declare-fun res!30583 () Bool)

(assert (=> b!35846 (=> res!30583 e!23688)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!53508 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!35846 (= res!30583 (not (= lt!53508 (bvsub (bvadd lt!53519 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!35846 (= lt!53508 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53517))) (currentByte!2565 (_2!1866 lt!53517)) (currentBit!2560 (_2!1866 lt!53517))))))

(declare-fun b!35847 () Bool)

(declare-fun res!30597 () Bool)

(assert (=> b!35847 (=> res!30597 e!23688)))

(declare-fun thiss!1379 () BitStream!1478)

(assert (=> b!35847 (= res!30597 (not (= (size!852 (buf!1180 thiss!1379)) (size!852 (buf!1180 (_2!1866 lt!53517))))))))

(declare-fun srcBuffer!2 () array!1911)

(declare-fun e!23686 () Bool)

(declare-fun lt!53514 () tuple2!3560)

(declare-fun b!35848 () Bool)

(declare-datatypes ((List!440 0))(
  ( (Nil!437) (Cons!436 (h!555 Bool) (t!1190 List!440)) )
))
(declare-fun head!277 (List!440) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1478 array!1911 (_ BitVec 64) (_ BitVec 64)) List!440)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1478 BitStream!1478 (_ BitVec 64)) List!440)

(assert (=> b!35848 (= e!23686 (= (head!277 (byteArrayBitContentToList!0 (_2!1866 lt!53513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!277 (bitStreamReadBitsIntoList!0 (_2!1866 lt!53513) (_1!1867 lt!53514) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!35849 () Bool)

(declare-fun e!23697 () Bool)

(declare-fun e!23693 () Bool)

(assert (=> b!35849 (= e!23697 (not e!23693))))

(declare-fun res!30586 () Bool)

(assert (=> b!35849 (=> res!30586 e!23693)))

(assert (=> b!35849 (= res!30586 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1478 BitStream!1478) Bool)

(assert (=> b!35849 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!53523 () Unit!2631)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1478) Unit!2631)

(assert (=> b!35849 (= lt!53523 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!35849 (= lt!53519 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(declare-fun b!35850 () Bool)

(declare-fun e!23698 () Bool)

(assert (=> b!35850 (= e!23698 e!23687)))

(declare-fun res!30598 () Bool)

(assert (=> b!35850 (=> res!30598 e!23687)))

(declare-fun lt!53526 () List!440)

(declare-fun lt!53510 () List!440)

(assert (=> b!35850 (= res!30598 (not (= lt!53526 lt!53510)))))

(assert (=> b!35850 (= lt!53510 lt!53526)))

(declare-fun lt!53524 () List!440)

(declare-fun tail!157 (List!440) List!440)

(assert (=> b!35850 (= lt!53526 (tail!157 lt!53524))))

(declare-fun lt!53518 () Unit!2631)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1478 BitStream!1478 BitStream!1478 BitStream!1478 (_ BitVec 64) List!440) Unit!2631)

(assert (=> b!35850 (= lt!53518 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1866 lt!53517) (_2!1866 lt!53517) (_1!1867 lt!53525) (_1!1867 lt!53504) (bvsub to!314 i!635) lt!53524))))

(declare-fun res!30587 () Bool)

(assert (=> start!7344 (=> (not res!30587) (not e!23697))))

(assert (=> start!7344 (= res!30587 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!852 srcBuffer!2))))))))

(assert (=> start!7344 e!23697))

(assert (=> start!7344 true))

(declare-fun array_inv!792 (array!1911) Bool)

(assert (=> start!7344 (array_inv!792 srcBuffer!2)))

(declare-fun e!23683 () Bool)

(declare-fun inv!12 (BitStream!1478) Bool)

(assert (=> start!7344 (and (inv!12 thiss!1379) e!23683)))

(declare-fun b!35851 () Bool)

(assert (=> b!35851 (= e!23683 (array_inv!792 (buf!1180 thiss!1379)))))

(declare-fun b!35852 () Bool)

(declare-fun res!30596 () Bool)

(assert (=> b!35852 (=> res!30596 e!23698)))

(declare-fun length!166 (List!440) Int)

(assert (=> b!35852 (= res!30596 (<= (length!166 lt!53524) 0))))

(declare-fun b!35853 () Bool)

(assert (=> b!35853 (= e!23696 e!23698)))

(declare-fun res!30581 () Bool)

(assert (=> b!35853 (=> res!30581 e!23698)))

(assert (=> b!35853 (= res!30581 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!53522 () (_ BitVec 64))

(assert (=> b!35853 (= lt!53510 (bitStreamReadBitsIntoList!0 (_2!1866 lt!53517) (_1!1867 lt!53504) lt!53522))))

(assert (=> b!35853 (= lt!53524 (bitStreamReadBitsIntoList!0 (_2!1866 lt!53517) (_1!1867 lt!53525) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35853 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!53522)))

(declare-fun lt!53505 () Unit!2631)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1478 array!1911 (_ BitVec 64)) Unit!2631)

(assert (=> b!35853 (= lt!53505 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1866 lt!53513) (buf!1180 (_2!1866 lt!53517)) lt!53522))))

(declare-fun reader!0 (BitStream!1478 BitStream!1478) tuple2!3560)

(assert (=> b!35853 (= lt!53504 (reader!0 (_2!1866 lt!53513) (_2!1866 lt!53517)))))

(assert (=> b!35853 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53506 () Unit!2631)

(assert (=> b!35853 (= lt!53506 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1180 (_2!1866 lt!53517)) (bvsub to!314 i!635)))))

(assert (=> b!35853 (= lt!53525 (reader!0 thiss!1379 (_2!1866 lt!53517)))))

(declare-fun b!35854 () Bool)

(declare-fun e!23692 () Bool)

(assert (=> b!35854 (= e!23689 e!23692)))

(declare-fun res!30591 () Bool)

(assert (=> b!35854 (=> res!30591 e!23692)))

(assert (=> b!35854 (= res!30591 (not (= (head!277 (byteArrayBitContentToList!0 (_2!1866 lt!53517) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!53516)))))

(assert (=> b!35854 (= lt!53516 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!35855 () Bool)

(declare-fun e!23690 () Bool)

(assert (=> b!35855 (= e!23693 e!23690)))

(declare-fun res!30590 () Bool)

(assert (=> b!35855 (=> res!30590 e!23690)))

(assert (=> b!35855 (= res!30590 (not (isPrefixOf!0 thiss!1379 (_2!1866 lt!53513))))))

(assert (=> b!35855 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!53522)))

(assert (=> b!35855 (= lt!53522 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53509 () Unit!2631)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1478 BitStream!1478 (_ BitVec 64) (_ BitVec 64)) Unit!2631)

(assert (=> b!35855 (= lt!53509 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1866 lt!53513) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1478 (_ BitVec 8) (_ BitVec 32)) tuple2!3558)

(assert (=> b!35855 (= lt!53513 (appendBitFromByte!0 thiss!1379 (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!35856 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35856 (= e!23694 (validate_offset_bit!0 ((_ sign_extend 32) (size!852 (buf!1180 (_1!1867 lt!53525)))) ((_ sign_extend 32) (currentByte!2565 (_1!1867 lt!53525))) ((_ sign_extend 32) (currentBit!2560 (_1!1867 lt!53525)))))))

(declare-fun b!35857 () Bool)

(declare-fun res!30599 () Bool)

(assert (=> b!35857 (=> (not res!30599) (not e!23697))))

(assert (=> b!35857 (= res!30599 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 thiss!1379))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!35858 () Bool)

(assert (=> b!35858 (= e!23690 e!23695)))

(declare-fun res!30600 () Bool)

(assert (=> b!35858 (=> res!30600 e!23695)))

(assert (=> b!35858 (= res!30600 (not (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!53517))))))

(assert (=> b!35858 (isPrefixOf!0 thiss!1379 (_2!1866 lt!53517))))

(declare-fun lt!53520 () Unit!2631)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1478 BitStream!1478 BitStream!1478) Unit!2631)

(assert (=> b!35858 (= lt!53520 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1866 lt!53513) (_2!1866 lt!53517)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1478 array!1911 (_ BitVec 64) (_ BitVec 64)) tuple2!3558)

(assert (=> b!35858 (= lt!53517 (appendBitsMSBFirstLoop!0 (_2!1866 lt!53513) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!35858 e!23686))

(declare-fun res!30589 () Bool)

(assert (=> b!35858 (=> (not res!30589) (not e!23686))))

(assert (=> b!35858 (= res!30589 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53511 () Unit!2631)

(assert (=> b!35858 (= lt!53511 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1180 (_2!1866 lt!53513)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35858 (= lt!53514 (reader!0 thiss!1379 (_2!1866 lt!53513)))))

(declare-fun b!35859 () Bool)

(declare-fun res!30594 () Bool)

(assert (=> b!35859 (=> res!30594 e!23688)))

(assert (=> b!35859 (= res!30594 (not (invariant!0 (currentBit!2560 (_2!1866 lt!53517)) (currentByte!2565 (_2!1866 lt!53517)) (size!852 (buf!1180 (_2!1866 lt!53517))))))))

(declare-fun b!35860 () Bool)

(declare-fun res!30595 () Bool)

(assert (=> b!35860 (=> res!30595 e!23696)))

(assert (=> b!35860 (= res!30595 (not (invariant!0 (currentBit!2560 (_2!1866 lt!53513)) (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53513))))))))

(declare-fun b!35861 () Bool)

(assert (=> b!35861 (= e!23688 e!23696)))

(declare-fun res!30593 () Bool)

(assert (=> b!35861 (=> res!30593 e!23696)))

(assert (=> b!35861 (= res!30593 (not (= (size!852 (buf!1180 (_2!1866 lt!53513))) (size!852 (buf!1180 (_2!1866 lt!53517))))))))

(assert (=> b!35861 (= lt!53508 (bvsub (bvsub (bvadd lt!53507 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35861 (= lt!53507 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))))))

(assert (=> b!35861 (= (size!852 (buf!1180 (_2!1866 lt!53517))) (size!852 (buf!1180 thiss!1379)))))

(declare-fun b!35862 () Bool)

(declare-fun res!30588 () Bool)

(assert (=> b!35862 (=> res!30588 e!23689)))

(assert (=> b!35862 (= res!30588 (not (= (head!277 lt!53524) lt!53521)))))

(declare-fun b!35863 () Bool)

(assert (=> b!35863 (= e!23692 e!23691)))

(declare-fun res!30582 () Bool)

(assert (=> b!35863 (=> res!30582 e!23691)))

(assert (=> b!35863 (= res!30582 (not (= lt!53512 lt!53516)))))

(assert (=> b!35863 (= lt!53512 (bitAt!0 (buf!1180 (_2!1866 lt!53513)) lt!53519))))

(assert (= (and start!7344 res!30587) b!35857))

(assert (= (and b!35857 res!30599) b!35849))

(assert (= (and b!35849 (not res!30586)) b!35855))

(assert (= (and b!35855 (not res!30590)) b!35858))

(assert (= (and b!35858 res!30589) b!35848))

(assert (= (and b!35858 (not res!30600)) b!35846))

(assert (= (and b!35846 (not res!30583)) b!35859))

(assert (= (and b!35859 (not res!30594)) b!35847))

(assert (= (and b!35847 (not res!30597)) b!35861))

(assert (= (and b!35861 (not res!30593)) b!35860))

(assert (= (and b!35860 (not res!30595)) b!35843))

(assert (= (and b!35843 (not res!30585)) b!35853))

(assert (= (and b!35853 (not res!30581)) b!35852))

(assert (= (and b!35852 (not res!30596)) b!35850))

(assert (= (and b!35850 (not res!30598)) b!35844))

(assert (= (and b!35844 (not res!30584)) b!35862))

(assert (= (and b!35862 (not res!30588)) b!35854))

(assert (= (and b!35854 (not res!30591)) b!35863))

(assert (= (and b!35863 (not res!30582)) b!35845))

(assert (= (and b!35845 (not res!30592)) b!35856))

(assert (= start!7344 b!35851))

(declare-fun m!53887 () Bool)

(assert (=> b!35846 m!53887))

(declare-fun m!53889 () Bool)

(assert (=> b!35860 m!53889))

(declare-fun m!53891 () Bool)

(assert (=> b!35858 m!53891))

(declare-fun m!53893 () Bool)

(assert (=> b!35858 m!53893))

(declare-fun m!53895 () Bool)

(assert (=> b!35858 m!53895))

(declare-fun m!53897 () Bool)

(assert (=> b!35858 m!53897))

(declare-fun m!53899 () Bool)

(assert (=> b!35858 m!53899))

(declare-fun m!53901 () Bool)

(assert (=> b!35858 m!53901))

(declare-fun m!53903 () Bool)

(assert (=> b!35858 m!53903))

(declare-fun m!53905 () Bool)

(assert (=> b!35848 m!53905))

(assert (=> b!35848 m!53905))

(declare-fun m!53907 () Bool)

(assert (=> b!35848 m!53907))

(declare-fun m!53909 () Bool)

(assert (=> b!35848 m!53909))

(assert (=> b!35848 m!53909))

(declare-fun m!53911 () Bool)

(assert (=> b!35848 m!53911))

(declare-fun m!53913 () Bool)

(assert (=> b!35863 m!53913))

(declare-fun m!53915 () Bool)

(assert (=> b!35859 m!53915))

(declare-fun m!53917 () Bool)

(assert (=> b!35853 m!53917))

(declare-fun m!53919 () Bool)

(assert (=> b!35853 m!53919))

(declare-fun m!53921 () Bool)

(assert (=> b!35853 m!53921))

(declare-fun m!53923 () Bool)

(assert (=> b!35853 m!53923))

(declare-fun m!53925 () Bool)

(assert (=> b!35853 m!53925))

(declare-fun m!53927 () Bool)

(assert (=> b!35853 m!53927))

(declare-fun m!53929 () Bool)

(assert (=> b!35853 m!53929))

(declare-fun m!53931 () Bool)

(assert (=> b!35853 m!53931))

(declare-fun m!53933 () Bool)

(assert (=> b!35851 m!53933))

(declare-fun m!53935 () Bool)

(assert (=> b!35852 m!53935))

(declare-fun m!53937 () Bool)

(assert (=> b!35844 m!53937))

(declare-fun m!53939 () Bool)

(assert (=> b!35844 m!53939))

(declare-fun m!53941 () Bool)

(assert (=> b!35862 m!53941))

(declare-fun m!53943 () Bool)

(assert (=> b!35843 m!53943))

(declare-fun m!53945 () Bool)

(assert (=> b!35845 m!53945))

(declare-fun m!53947 () Bool)

(assert (=> b!35845 m!53947))

(declare-fun m!53949 () Bool)

(assert (=> b!35857 m!53949))

(declare-fun m!53951 () Bool)

(assert (=> b!35849 m!53951))

(declare-fun m!53953 () Bool)

(assert (=> b!35849 m!53953))

(declare-fun m!53955 () Bool)

(assert (=> b!35849 m!53955))

(declare-fun m!53957 () Bool)

(assert (=> b!35855 m!53957))

(declare-fun m!53959 () Bool)

(assert (=> b!35855 m!53959))

(declare-fun m!53961 () Bool)

(assert (=> b!35855 m!53961))

(assert (=> b!35855 m!53959))

(declare-fun m!53963 () Bool)

(assert (=> b!35855 m!53963))

(declare-fun m!53965 () Bool)

(assert (=> b!35855 m!53965))

(declare-fun m!53967 () Bool)

(assert (=> start!7344 m!53967))

(declare-fun m!53969 () Bool)

(assert (=> start!7344 m!53969))

(declare-fun m!53971 () Bool)

(assert (=> b!35856 m!53971))

(declare-fun m!53973 () Bool)

(assert (=> b!35854 m!53973))

(assert (=> b!35854 m!53973))

(declare-fun m!53975 () Bool)

(assert (=> b!35854 m!53975))

(declare-fun m!53977 () Bool)

(assert (=> b!35854 m!53977))

(declare-fun m!53979 () Bool)

(assert (=> b!35861 m!53979))

(declare-fun m!53981 () Bool)

(assert (=> b!35850 m!53981))

(declare-fun m!53983 () Bool)

(assert (=> b!35850 m!53983))

(push 1)

(assert (not b!35857))

(assert (not b!35851))

(assert (not b!35856))

(assert (not start!7344))

(assert (not b!35858))

(assert (not b!35844))

(assert (not b!35861))

(assert (not b!35848))

(assert (not b!35863))

(assert (not b!35862))

(assert (not b!35855))

(assert (not b!35845))

(assert (not b!35859))

(assert (not b!35853))

(assert (not b!35860))

(assert (not b!35843))

(assert (not b!35849))

(assert (not b!35852))

(assert (not b!35850))

(assert (not b!35854))

(assert (not b!35846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!10502 () Bool)

(assert (=> d!10502 (= (head!277 (byteArrayBitContentToList!0 (_2!1866 lt!53517) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!555 (byteArrayBitContentToList!0 (_2!1866 lt!53517) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!35854 d!10502))

(declare-fun d!10504 () Bool)

(declare-fun c!2442 () Bool)

(assert (=> d!10504 (= c!2442 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23747 () List!440)

(assert (=> d!10504 (= (byteArrayBitContentToList!0 (_2!1866 lt!53517) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!23747)))

(declare-fun b!35949 () Bool)

(assert (=> b!35949 (= e!23747 Nil!437)))

(declare-fun b!35950 () Bool)

(assert (=> b!35950 (= e!23747 (Cons!436 (not (= (bvand ((_ sign_extend 24) (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1866 lt!53517) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10504 c!2442) b!35949))

(assert (= (and d!10504 (not c!2442)) b!35950))

(assert (=> b!35950 m!53959))

(declare-fun m!54099 () Bool)

(assert (=> b!35950 m!54099))

(declare-fun m!54101 () Bool)

(assert (=> b!35950 m!54101))

(assert (=> b!35854 d!10504))

(declare-fun d!10508 () Bool)

(assert (=> d!10508 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2830 () Bool)

(assert (= bs!2830 d!10508))

(assert (=> bs!2830 m!53959))

(assert (=> bs!2830 m!54099))

(assert (=> b!35854 d!10508))

(declare-fun d!10510 () Bool)

(declare-fun res!30653 () Bool)

(declare-fun e!23753 () Bool)

(assert (=> d!10510 (=> (not res!30653) (not e!23753))))

(assert (=> d!10510 (= res!30653 (= (size!852 (buf!1180 thiss!1379)) (size!852 (buf!1180 (_2!1866 lt!53513)))))))

(assert (=> d!10510 (= (isPrefixOf!0 thiss!1379 (_2!1866 lt!53513)) e!23753)))

(declare-fun b!35957 () Bool)

(declare-fun res!30654 () Bool)

(assert (=> b!35957 (=> (not res!30654) (not e!23753))))

(assert (=> b!35957 (= res!30654 (bvsle (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)) (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513)))))))

(declare-fun b!35958 () Bool)

(declare-fun e!23752 () Bool)

(assert (=> b!35958 (= e!23753 e!23752)))

(declare-fun res!30652 () Bool)

(assert (=> b!35958 (=> res!30652 e!23752)))

(assert (=> b!35958 (= res!30652 (= (size!852 (buf!1180 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35959 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1911 array!1911 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35959 (= e!23752 (arrayBitRangesEq!0 (buf!1180 thiss!1379) (buf!1180 (_2!1866 lt!53513)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379))))))

(assert (= (and d!10510 res!30653) b!35957))

(assert (= (and b!35957 res!30654) b!35958))

(assert (= (and b!35958 (not res!30652)) b!35959))

(assert (=> b!35957 m!53955))

(assert (=> b!35957 m!53979))

(assert (=> b!35959 m!53955))

(assert (=> b!35959 m!53955))

(declare-fun m!54103 () Bool)

(assert (=> b!35959 m!54103))

(assert (=> b!35855 d!10510))

(declare-fun d!10512 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10512 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!53522) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513)))) lt!53522))))

(declare-fun bs!2831 () Bool)

(assert (= bs!2831 d!10512))

(declare-fun m!54105 () Bool)

(assert (=> bs!2831 m!54105))

(assert (=> b!35855 d!10512))

(declare-fun d!10514 () Bool)

(declare-fun e!23756 () Bool)

(assert (=> d!10514 e!23756))

(declare-fun res!30657 () Bool)

(assert (=> d!10514 (=> (not res!30657) (not e!23756))))

(assert (=> d!10514 (= res!30657 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!53659 () Unit!2631)

(declare-fun choose!27 (BitStream!1478 BitStream!1478 (_ BitVec 64) (_ BitVec 64)) Unit!2631)

(assert (=> d!10514 (= lt!53659 (choose!27 thiss!1379 (_2!1866 lt!53513) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10514 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10514 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1866 lt!53513) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!53659)))

(declare-fun b!35962 () Bool)

(assert (=> b!35962 (= e!23756 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10514 res!30657) b!35962))

(declare-fun m!54107 () Bool)

(assert (=> d!10514 m!54107))

(declare-fun m!54109 () Bool)

(assert (=> b!35962 m!54109))

(assert (=> b!35855 d!10514))

(declare-fun b!36035 () Bool)

(declare-fun e!23793 () Bool)

(declare-fun e!23794 () Bool)

(assert (=> b!36035 (= e!23793 e!23794)))

(declare-fun res!30729 () Bool)

(assert (=> b!36035 (=> (not res!30729) (not e!23794))))

(declare-fun lt!53779 () Bool)

(declare-fun lt!53768 () tuple2!3558)

(declare-datatypes ((tuple2!3568 0))(
  ( (tuple2!3569 (_1!1871 BitStream!1478) (_2!1871 Bool)) )
))
(declare-fun lt!53769 () tuple2!3568)

(assert (=> b!36035 (= res!30729 (and (= (_2!1871 lt!53769) lt!53779) (= (_1!1871 lt!53769) (_2!1866 lt!53768))))))

(declare-fun readBitPure!0 (BitStream!1478) tuple2!3568)

(declare-fun readerFrom!0 (BitStream!1478 (_ BitVec 32) (_ BitVec 32)) BitStream!1478)

(assert (=> b!36035 (= lt!53769 (readBitPure!0 (readerFrom!0 (_2!1866 lt!53768) (currentBit!2560 thiss!1379) (currentByte!2565 thiss!1379))))))

(declare-fun b!36036 () Bool)

(declare-fun res!30734 () Bool)

(assert (=> b!36036 (=> (not res!30734) (not e!23793))))

(assert (=> b!36036 (= res!30734 (isPrefixOf!0 thiss!1379 (_2!1866 lt!53768)))))

(declare-fun b!36037 () Bool)

(declare-fun e!23795 () Bool)

(declare-fun lt!53778 () tuple2!3568)

(declare-fun lt!53776 () tuple2!3558)

(assert (=> b!36037 (= e!23795 (= (bitIndex!0 (size!852 (buf!1180 (_1!1871 lt!53778))) (currentByte!2565 (_1!1871 lt!53778)) (currentBit!2560 (_1!1871 lt!53778))) (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53776))) (currentByte!2565 (_2!1866 lt!53776)) (currentBit!2560 (_2!1866 lt!53776)))))))

(declare-fun b!36038 () Bool)

(declare-fun res!30728 () Bool)

(assert (=> b!36038 (=> (not res!30728) (not e!23793))))

(assert (=> b!36038 (= res!30728 (= (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53768))) (currentByte!2565 (_2!1866 lt!53768)) (currentBit!2560 (_2!1866 lt!53768))) (bvadd (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!36039 () Bool)

(declare-fun res!30733 () Bool)

(declare-fun e!23796 () Bool)

(assert (=> b!36039 (=> (not res!30733) (not e!23796))))

(assert (=> b!36039 (= res!30733 (isPrefixOf!0 thiss!1379 (_2!1866 lt!53776)))))

(declare-fun b!36040 () Bool)

(assert (=> b!36040 (= e!23794 (= (bitIndex!0 (size!852 (buf!1180 (_1!1871 lt!53769))) (currentByte!2565 (_1!1871 lt!53769)) (currentBit!2560 (_1!1871 lt!53769))) (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53768))) (currentByte!2565 (_2!1866 lt!53768)) (currentBit!2560 (_2!1866 lt!53768)))))))

(declare-fun d!10516 () Bool)

(assert (=> d!10516 e!23796))

(declare-fun res!30731 () Bool)

(assert (=> d!10516 (=> (not res!30731) (not e!23796))))

(assert (=> d!10516 (= res!30731 (= (size!852 (buf!1180 (_2!1866 lt!53776))) (size!852 (buf!1180 thiss!1379))))))

(declare-fun lt!53774 () (_ BitVec 8))

(declare-fun lt!53772 () array!1911)

(assert (=> d!10516 (= lt!53774 (select (arr!1336 lt!53772) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10516 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!852 lt!53772)))))

(assert (=> d!10516 (= lt!53772 (array!1912 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!53777 () tuple2!3558)

(assert (=> d!10516 (= lt!53776 (tuple2!3559 (_1!1866 lt!53777) (_2!1866 lt!53777)))))

(assert (=> d!10516 (= lt!53777 lt!53768)))

(assert (=> d!10516 e!23793))

(declare-fun res!30732 () Bool)

(assert (=> d!10516 (=> (not res!30732) (not e!23793))))

(assert (=> d!10516 (= res!30732 (= (size!852 (buf!1180 thiss!1379)) (size!852 (buf!1180 (_2!1866 lt!53768)))))))

(declare-fun appendBit!0 (BitStream!1478 Bool) tuple2!3558)

(assert (=> d!10516 (= lt!53768 (appendBit!0 thiss!1379 lt!53779))))

(assert (=> d!10516 (= lt!53779 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10516 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10516 (= (appendBitFromByte!0 thiss!1379 (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!53776)))

(declare-fun b!36041 () Bool)

(declare-fun res!30730 () Bool)

(assert (=> b!36041 (=> (not res!30730) (not e!23796))))

(declare-fun lt!53771 () (_ BitVec 64))

(declare-fun lt!53775 () (_ BitVec 64))

(assert (=> b!36041 (= res!30730 (= (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53776))) (currentByte!2565 (_2!1866 lt!53776)) (currentBit!2560 (_2!1866 lt!53776))) (bvadd lt!53771 lt!53775)))))

(assert (=> b!36041 (or (not (= (bvand lt!53771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53775 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!53771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!53771 lt!53775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36041 (= lt!53775 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!36041 (= lt!53771 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(declare-fun b!36042 () Bool)

(assert (=> b!36042 (= e!23796 e!23795)))

(declare-fun res!30727 () Bool)

(assert (=> b!36042 (=> (not res!30727) (not e!23795))))

(assert (=> b!36042 (= res!30727 (and (= (_2!1871 lt!53778) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!53774)) #b00000000000000000000000000000000))) (= (_1!1871 lt!53778) (_2!1866 lt!53776))))))

(declare-datatypes ((tuple2!3572 0))(
  ( (tuple2!3573 (_1!1873 array!1911) (_2!1873 BitStream!1478)) )
))
(declare-fun lt!53773 () tuple2!3572)

(declare-fun lt!53770 () BitStream!1478)

(declare-fun readBits!0 (BitStream!1478 (_ BitVec 64)) tuple2!3572)

(assert (=> b!36042 (= lt!53773 (readBits!0 lt!53770 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36042 (= lt!53778 (readBitPure!0 lt!53770))))

(assert (=> b!36042 (= lt!53770 (readerFrom!0 (_2!1866 lt!53776) (currentBit!2560 thiss!1379) (currentByte!2565 thiss!1379)))))

(assert (= (and d!10516 res!30732) b!36038))

(assert (= (and b!36038 res!30728) b!36036))

(assert (= (and b!36036 res!30734) b!36035))

(assert (= (and b!36035 res!30729) b!36040))

(assert (= (and d!10516 res!30731) b!36041))

(assert (= (and b!36041 res!30730) b!36039))

(assert (= (and b!36039 res!30733) b!36042))

(assert (= (and b!36042 res!30727) b!36037))

(declare-fun m!54185 () Bool)

(assert (=> b!36039 m!54185))

(declare-fun m!54187 () Bool)

(assert (=> b!36037 m!54187))

(declare-fun m!54189 () Bool)

(assert (=> b!36037 m!54189))

(assert (=> b!36041 m!54189))

(assert (=> b!36041 m!53955))

(declare-fun m!54191 () Bool)

(assert (=> b!36042 m!54191))

(declare-fun m!54193 () Bool)

(assert (=> b!36042 m!54193))

(declare-fun m!54195 () Bool)

(assert (=> b!36042 m!54195))

(declare-fun m!54197 () Bool)

(assert (=> b!36040 m!54197))

(declare-fun m!54199 () Bool)

(assert (=> b!36040 m!54199))

(declare-fun m!54201 () Bool)

(assert (=> d!10516 m!54201))

(declare-fun m!54203 () Bool)

(assert (=> d!10516 m!54203))

(assert (=> d!10516 m!54099))

(declare-fun m!54205 () Bool)

(assert (=> b!36035 m!54205))

(assert (=> b!36035 m!54205))

(declare-fun m!54207 () Bool)

(assert (=> b!36035 m!54207))

(assert (=> b!36038 m!54199))

(assert (=> b!36038 m!53955))

(declare-fun m!54209 () Bool)

(assert (=> b!36036 m!54209))

(assert (=> b!35855 d!10516))

(declare-fun d!10548 () Bool)

(assert (=> d!10548 (= (bitAt!0 (buf!1180 (_1!1867 lt!53504)) lt!53519) (not (= (bvand ((_ sign_extend 24) (select (arr!1336 (buf!1180 (_1!1867 lt!53504))) ((_ extract 31 0) (bvsdiv lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2838 () Bool)

(assert (= bs!2838 d!10548))

(declare-fun m!54211 () Bool)

(assert (=> bs!2838 m!54211))

(declare-fun m!54213 () Bool)

(assert (=> bs!2838 m!54213))

(assert (=> b!35844 d!10548))

(declare-fun d!10550 () Bool)

(assert (=> d!10550 (= (bitAt!0 (buf!1180 (_1!1867 lt!53525)) lt!53519) (not (= (bvand ((_ sign_extend 24) (select (arr!1336 (buf!1180 (_1!1867 lt!53525))) ((_ extract 31 0) (bvsdiv lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2839 () Bool)

(assert (= bs!2839 d!10550))

(declare-fun m!54215 () Bool)

(assert (=> bs!2839 m!54215))

(assert (=> bs!2839 m!54213))

(assert (=> b!35844 d!10550))

(declare-fun d!10552 () Bool)

(assert (=> d!10552 (= (array_inv!792 srcBuffer!2) (bvsge (size!852 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7344 d!10552))

(declare-fun d!10554 () Bool)

(assert (=> d!10554 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2560 thiss!1379) (currentByte!2565 thiss!1379) (size!852 (buf!1180 thiss!1379))))))

(declare-fun bs!2841 () Bool)

(assert (= bs!2841 d!10554))

(declare-fun m!54217 () Bool)

(assert (=> bs!2841 m!54217))

(assert (=> start!7344 d!10554))

(declare-fun d!10556 () Bool)

(assert (=> d!10556 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!53522)))

(declare-fun lt!53785 () Unit!2631)

(declare-fun choose!9 (BitStream!1478 array!1911 (_ BitVec 64) BitStream!1478) Unit!2631)

(assert (=> d!10556 (= lt!53785 (choose!9 (_2!1866 lt!53513) (buf!1180 (_2!1866 lt!53517)) lt!53522 (BitStream!1479 (buf!1180 (_2!1866 lt!53517)) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513)))))))

(assert (=> d!10556 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1866 lt!53513) (buf!1180 (_2!1866 lt!53517)) lt!53522) lt!53785)))

(declare-fun bs!2843 () Bool)

(assert (= bs!2843 d!10556))

(assert (=> bs!2843 m!53923))

(declare-fun m!54223 () Bool)

(assert (=> bs!2843 m!54223))

(assert (=> b!35853 d!10556))

(declare-fun d!10564 () Bool)

(assert (=> d!10564 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!53522) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513)))) lt!53522))))

(declare-fun bs!2844 () Bool)

(assert (= bs!2844 d!10564))

(declare-fun m!54225 () Bool)

(assert (=> bs!2844 m!54225))

(assert (=> b!35853 d!10564))

(declare-fun d!10568 () Bool)

(declare-fun e!23807 () Bool)

(assert (=> d!10568 e!23807))

(declare-fun c!2450 () Bool)

(assert (=> d!10568 (= c!2450 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!53806 () List!440)

(declare-datatypes ((tuple2!3578 0))(
  ( (tuple2!3579 (_1!1876 List!440) (_2!1876 BitStream!1478)) )
))
(declare-fun e!23806 () tuple2!3578)

(assert (=> d!10568 (= lt!53806 (_1!1876 e!23806))))

(declare-fun c!2451 () Bool)

(assert (=> d!10568 (= c!2451 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10568 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10568 (= (bitStreamReadBitsIntoList!0 (_2!1866 lt!53517) (_1!1867 lt!53525) (bvsub to!314 i!635)) lt!53806)))

(declare-datatypes ((tuple2!3580 0))(
  ( (tuple2!3581 (_1!1877 Bool) (_2!1877 BitStream!1478)) )
))
(declare-fun lt!53805 () tuple2!3580)

(declare-fun b!36062 () Bool)

(declare-fun lt!53804 () (_ BitVec 64))

(assert (=> b!36062 (= e!23806 (tuple2!3579 (Cons!436 (_1!1877 lt!53805) (bitStreamReadBitsIntoList!0 (_2!1866 lt!53517) (_2!1877 lt!53805) (bvsub (bvsub to!314 i!635) lt!53804))) (_2!1877 lt!53805)))))

(declare-fun readBit!0 (BitStream!1478) tuple2!3580)

(assert (=> b!36062 (= lt!53805 (readBit!0 (_1!1867 lt!53525)))))

(assert (=> b!36062 (= lt!53804 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!36061 () Bool)

(assert (=> b!36061 (= e!23806 (tuple2!3579 Nil!437 (_1!1867 lt!53525)))))

(declare-fun b!36063 () Bool)

(declare-fun isEmpty!100 (List!440) Bool)

(assert (=> b!36063 (= e!23807 (isEmpty!100 lt!53806))))

(declare-fun b!36064 () Bool)

(assert (=> b!36064 (= e!23807 (> (length!166 lt!53806) 0))))

(assert (= (and d!10568 c!2451) b!36061))

(assert (= (and d!10568 (not c!2451)) b!36062))

(assert (= (and d!10568 c!2450) b!36063))

(assert (= (and d!10568 (not c!2450)) b!36064))

(declare-fun m!54227 () Bool)

(assert (=> b!36062 m!54227))

(declare-fun m!54229 () Bool)

(assert (=> b!36062 m!54229))

(declare-fun m!54231 () Bool)

(assert (=> b!36063 m!54231))

(declare-fun m!54233 () Bool)

(assert (=> b!36064 m!54233))

(assert (=> b!35853 d!10568))

(declare-fun b!36089 () Bool)

(declare-fun e!23819 () Unit!2631)

(declare-fun lt!53903 () Unit!2631)

(assert (=> b!36089 (= e!23819 lt!53903)))

(declare-fun lt!53916 () (_ BitVec 64))

(assert (=> b!36089 (= lt!53916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53909 () (_ BitVec 64))

(assert (=> b!36089 (= lt!53909 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1911 array!1911 (_ BitVec 64) (_ BitVec 64)) Unit!2631)

(assert (=> b!36089 (= lt!53903 (arrayBitRangesEqSymmetric!0 (buf!1180 (_2!1866 lt!53513)) (buf!1180 (_2!1866 lt!53517)) lt!53916 lt!53909))))

(assert (=> b!36089 (arrayBitRangesEq!0 (buf!1180 (_2!1866 lt!53517)) (buf!1180 (_2!1866 lt!53513)) lt!53916 lt!53909)))

(declare-fun d!10570 () Bool)

(declare-fun e!23818 () Bool)

(assert (=> d!10570 e!23818))

(declare-fun res!30755 () Bool)

(assert (=> d!10570 (=> (not res!30755) (not e!23818))))

(declare-fun lt!53908 () tuple2!3560)

(assert (=> d!10570 (= res!30755 (isPrefixOf!0 (_1!1867 lt!53908) (_2!1867 lt!53908)))))

(declare-fun lt!53907 () BitStream!1478)

(assert (=> d!10570 (= lt!53908 (tuple2!3561 lt!53907 (_2!1866 lt!53517)))))

(declare-fun lt!53910 () Unit!2631)

(declare-fun lt!53917 () Unit!2631)

(assert (=> d!10570 (= lt!53910 lt!53917)))

(assert (=> d!10570 (isPrefixOf!0 lt!53907 (_2!1866 lt!53517))))

(assert (=> d!10570 (= lt!53917 (lemmaIsPrefixTransitive!0 lt!53907 (_2!1866 lt!53517) (_2!1866 lt!53517)))))

(declare-fun lt!53905 () Unit!2631)

(declare-fun lt!53900 () Unit!2631)

(assert (=> d!10570 (= lt!53905 lt!53900)))

(assert (=> d!10570 (isPrefixOf!0 lt!53907 (_2!1866 lt!53517))))

(assert (=> d!10570 (= lt!53900 (lemmaIsPrefixTransitive!0 lt!53907 (_2!1866 lt!53513) (_2!1866 lt!53517)))))

(declare-fun lt!53902 () Unit!2631)

(assert (=> d!10570 (= lt!53902 e!23819)))

(declare-fun c!2456 () Bool)

(assert (=> d!10570 (= c!2456 (not (= (size!852 (buf!1180 (_2!1866 lt!53513))) #b00000000000000000000000000000000)))))

(declare-fun lt!53899 () Unit!2631)

(declare-fun lt!53915 () Unit!2631)

(assert (=> d!10570 (= lt!53899 lt!53915)))

(assert (=> d!10570 (isPrefixOf!0 (_2!1866 lt!53517) (_2!1866 lt!53517))))

(assert (=> d!10570 (= lt!53915 (lemmaIsPrefixRefl!0 (_2!1866 lt!53517)))))

(declare-fun lt!53918 () Unit!2631)

(declare-fun lt!53914 () Unit!2631)

(assert (=> d!10570 (= lt!53918 lt!53914)))

(assert (=> d!10570 (= lt!53914 (lemmaIsPrefixRefl!0 (_2!1866 lt!53517)))))

(declare-fun lt!53901 () Unit!2631)

(declare-fun lt!53913 () Unit!2631)

(assert (=> d!10570 (= lt!53901 lt!53913)))

(assert (=> d!10570 (isPrefixOf!0 lt!53907 lt!53907)))

(assert (=> d!10570 (= lt!53913 (lemmaIsPrefixRefl!0 lt!53907))))

(declare-fun lt!53904 () Unit!2631)

(declare-fun lt!53906 () Unit!2631)

(assert (=> d!10570 (= lt!53904 lt!53906)))

(assert (=> d!10570 (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!53513))))

(assert (=> d!10570 (= lt!53906 (lemmaIsPrefixRefl!0 (_2!1866 lt!53513)))))

(assert (=> d!10570 (= lt!53907 (BitStream!1479 (buf!1180 (_2!1866 lt!53517)) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))))))

(assert (=> d!10570 (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!53517))))

(assert (=> d!10570 (= (reader!0 (_2!1866 lt!53513) (_2!1866 lt!53517)) lt!53908)))

(declare-fun b!36090 () Bool)

(declare-fun Unit!2636 () Unit!2631)

(assert (=> b!36090 (= e!23819 Unit!2636)))

(declare-fun b!36091 () Bool)

(declare-fun lt!53911 () (_ BitVec 64))

(declare-fun lt!53912 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1478 (_ BitVec 64)) BitStream!1478)

(assert (=> b!36091 (= e!23818 (= (_1!1867 lt!53908) (withMovedBitIndex!0 (_2!1867 lt!53908) (bvsub lt!53912 lt!53911))))))

(assert (=> b!36091 (or (= (bvand lt!53912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53912 lt!53911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36091 (= lt!53911 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53517))) (currentByte!2565 (_2!1866 lt!53517)) (currentBit!2560 (_2!1866 lt!53517))))))

(assert (=> b!36091 (= lt!53912 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))))))

(declare-fun b!36092 () Bool)

(declare-fun res!30757 () Bool)

(assert (=> b!36092 (=> (not res!30757) (not e!23818))))

(assert (=> b!36092 (= res!30757 (isPrefixOf!0 (_1!1867 lt!53908) (_2!1866 lt!53513)))))

(declare-fun b!36093 () Bool)

(declare-fun res!30756 () Bool)

(assert (=> b!36093 (=> (not res!30756) (not e!23818))))

(assert (=> b!36093 (= res!30756 (isPrefixOf!0 (_2!1867 lt!53908) (_2!1866 lt!53517)))))

(assert (= (and d!10570 c!2456) b!36089))

(assert (= (and d!10570 (not c!2456)) b!36090))

(assert (= (and d!10570 res!30755) b!36092))

(assert (= (and b!36092 res!30757) b!36093))

(assert (= (and b!36093 res!30756) b!36091))

(declare-fun m!54241 () Bool)

(assert (=> d!10570 m!54241))

(declare-fun m!54243 () Bool)

(assert (=> d!10570 m!54243))

(declare-fun m!54245 () Bool)

(assert (=> d!10570 m!54245))

(declare-fun m!54247 () Bool)

(assert (=> d!10570 m!54247))

(declare-fun m!54249 () Bool)

(assert (=> d!10570 m!54249))

(declare-fun m!54251 () Bool)

(assert (=> d!10570 m!54251))

(declare-fun m!54253 () Bool)

(assert (=> d!10570 m!54253))

(assert (=> d!10570 m!53893))

(declare-fun m!54255 () Bool)

(assert (=> d!10570 m!54255))

(declare-fun m!54257 () Bool)

(assert (=> d!10570 m!54257))

(declare-fun m!54259 () Bool)

(assert (=> d!10570 m!54259))

(declare-fun m!54261 () Bool)

(assert (=> b!36093 m!54261))

(declare-fun m!54263 () Bool)

(assert (=> b!36091 m!54263))

(assert (=> b!36091 m!53887))

(assert (=> b!36091 m!53979))

(assert (=> b!36089 m!53979))

(declare-fun m!54265 () Bool)

(assert (=> b!36089 m!54265))

(declare-fun m!54267 () Bool)

(assert (=> b!36089 m!54267))

(declare-fun m!54269 () Bool)

(assert (=> b!36092 m!54269))

(assert (=> b!35853 d!10570))

(declare-fun b!36094 () Bool)

(declare-fun e!23821 () Unit!2631)

(declare-fun lt!53923 () Unit!2631)

(assert (=> b!36094 (= e!23821 lt!53923)))

(declare-fun lt!53936 () (_ BitVec 64))

(assert (=> b!36094 (= lt!53936 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53929 () (_ BitVec 64))

(assert (=> b!36094 (= lt!53929 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(assert (=> b!36094 (= lt!53923 (arrayBitRangesEqSymmetric!0 (buf!1180 thiss!1379) (buf!1180 (_2!1866 lt!53517)) lt!53936 lt!53929))))

(assert (=> b!36094 (arrayBitRangesEq!0 (buf!1180 (_2!1866 lt!53517)) (buf!1180 thiss!1379) lt!53936 lt!53929)))

(declare-fun d!10582 () Bool)

(declare-fun e!23820 () Bool)

(assert (=> d!10582 e!23820))

(declare-fun res!30758 () Bool)

(assert (=> d!10582 (=> (not res!30758) (not e!23820))))

(declare-fun lt!53928 () tuple2!3560)

(assert (=> d!10582 (= res!30758 (isPrefixOf!0 (_1!1867 lt!53928) (_2!1867 lt!53928)))))

(declare-fun lt!53927 () BitStream!1478)

(assert (=> d!10582 (= lt!53928 (tuple2!3561 lt!53927 (_2!1866 lt!53517)))))

(declare-fun lt!53930 () Unit!2631)

(declare-fun lt!53937 () Unit!2631)

(assert (=> d!10582 (= lt!53930 lt!53937)))

(assert (=> d!10582 (isPrefixOf!0 lt!53927 (_2!1866 lt!53517))))

(assert (=> d!10582 (= lt!53937 (lemmaIsPrefixTransitive!0 lt!53927 (_2!1866 lt!53517) (_2!1866 lt!53517)))))

(declare-fun lt!53925 () Unit!2631)

(declare-fun lt!53920 () Unit!2631)

(assert (=> d!10582 (= lt!53925 lt!53920)))

(assert (=> d!10582 (isPrefixOf!0 lt!53927 (_2!1866 lt!53517))))

(assert (=> d!10582 (= lt!53920 (lemmaIsPrefixTransitive!0 lt!53927 thiss!1379 (_2!1866 lt!53517)))))

(declare-fun lt!53922 () Unit!2631)

(assert (=> d!10582 (= lt!53922 e!23821)))

(declare-fun c!2457 () Bool)

(assert (=> d!10582 (= c!2457 (not (= (size!852 (buf!1180 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!53919 () Unit!2631)

(declare-fun lt!53935 () Unit!2631)

(assert (=> d!10582 (= lt!53919 lt!53935)))

(assert (=> d!10582 (isPrefixOf!0 (_2!1866 lt!53517) (_2!1866 lt!53517))))

(assert (=> d!10582 (= lt!53935 (lemmaIsPrefixRefl!0 (_2!1866 lt!53517)))))

(declare-fun lt!53938 () Unit!2631)

(declare-fun lt!53934 () Unit!2631)

(assert (=> d!10582 (= lt!53938 lt!53934)))

(assert (=> d!10582 (= lt!53934 (lemmaIsPrefixRefl!0 (_2!1866 lt!53517)))))

(declare-fun lt!53921 () Unit!2631)

(declare-fun lt!53933 () Unit!2631)

(assert (=> d!10582 (= lt!53921 lt!53933)))

(assert (=> d!10582 (isPrefixOf!0 lt!53927 lt!53927)))

(assert (=> d!10582 (= lt!53933 (lemmaIsPrefixRefl!0 lt!53927))))

(declare-fun lt!53924 () Unit!2631)

(declare-fun lt!53926 () Unit!2631)

(assert (=> d!10582 (= lt!53924 lt!53926)))

(assert (=> d!10582 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10582 (= lt!53926 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10582 (= lt!53927 (BitStream!1479 (buf!1180 (_2!1866 lt!53517)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(assert (=> d!10582 (isPrefixOf!0 thiss!1379 (_2!1866 lt!53517))))

(assert (=> d!10582 (= (reader!0 thiss!1379 (_2!1866 lt!53517)) lt!53928)))

(declare-fun b!36095 () Bool)

(declare-fun Unit!2642 () Unit!2631)

(assert (=> b!36095 (= e!23821 Unit!2642)))

(declare-fun b!36096 () Bool)

(declare-fun lt!53932 () (_ BitVec 64))

(declare-fun lt!53931 () (_ BitVec 64))

(assert (=> b!36096 (= e!23820 (= (_1!1867 lt!53928) (withMovedBitIndex!0 (_2!1867 lt!53928) (bvsub lt!53932 lt!53931))))))

(assert (=> b!36096 (or (= (bvand lt!53932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53932 lt!53931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36096 (= lt!53931 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53517))) (currentByte!2565 (_2!1866 lt!53517)) (currentBit!2560 (_2!1866 lt!53517))))))

(assert (=> b!36096 (= lt!53932 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(declare-fun b!36097 () Bool)

(declare-fun res!30760 () Bool)

(assert (=> b!36097 (=> (not res!30760) (not e!23820))))

(assert (=> b!36097 (= res!30760 (isPrefixOf!0 (_1!1867 lt!53928) thiss!1379))))

(declare-fun b!36098 () Bool)

(declare-fun res!30759 () Bool)

(assert (=> b!36098 (=> (not res!30759) (not e!23820))))

(assert (=> b!36098 (= res!30759 (isPrefixOf!0 (_2!1867 lt!53928) (_2!1866 lt!53517)))))

(assert (= (and d!10582 c!2457) b!36094))

(assert (= (and d!10582 (not c!2457)) b!36095))

(assert (= (and d!10582 res!30758) b!36097))

(assert (= (and b!36097 res!30760) b!36098))

(assert (= (and b!36098 res!30759) b!36096))

(declare-fun m!54271 () Bool)

(assert (=> d!10582 m!54271))

(assert (=> d!10582 m!54243))

(assert (=> d!10582 m!53951))

(assert (=> d!10582 m!54247))

(declare-fun m!54273 () Bool)

(assert (=> d!10582 m!54273))

(declare-fun m!54275 () Bool)

(assert (=> d!10582 m!54275))

(declare-fun m!54277 () Bool)

(assert (=> d!10582 m!54277))

(assert (=> d!10582 m!53891))

(declare-fun m!54279 () Bool)

(assert (=> d!10582 m!54279))

(declare-fun m!54281 () Bool)

(assert (=> d!10582 m!54281))

(assert (=> d!10582 m!53953))

(declare-fun m!54283 () Bool)

(assert (=> b!36098 m!54283))

(declare-fun m!54285 () Bool)

(assert (=> b!36096 m!54285))

(assert (=> b!36096 m!53887))

(assert (=> b!36096 m!53955))

(assert (=> b!36094 m!53955))

(declare-fun m!54287 () Bool)

(assert (=> b!36094 m!54287))

(declare-fun m!54289 () Bool)

(assert (=> b!36094 m!54289))

(declare-fun m!54291 () Bool)

(assert (=> b!36097 m!54291))

(assert (=> b!35853 d!10582))

(declare-fun d!10584 () Bool)

(assert (=> d!10584 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53959 () Unit!2631)

(assert (=> d!10584 (= lt!53959 (choose!9 thiss!1379 (buf!1180 (_2!1866 lt!53517)) (bvsub to!314 i!635) (BitStream!1479 (buf!1180 (_2!1866 lt!53517)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379))))))

(assert (=> d!10584 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1180 (_2!1866 lt!53517)) (bvsub to!314 i!635)) lt!53959)))

(declare-fun bs!2847 () Bool)

(assert (= bs!2847 d!10584))

(assert (=> bs!2847 m!53919))

(declare-fun m!54301 () Bool)

(assert (=> bs!2847 m!54301))

(assert (=> b!35853 d!10584))

(declare-fun d!10586 () Bool)

(declare-fun e!23825 () Bool)

(assert (=> d!10586 e!23825))

(declare-fun c!2459 () Bool)

(assert (=> d!10586 (= c!2459 (= lt!53522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!53962 () List!440)

(declare-fun e!23824 () tuple2!3578)

(assert (=> d!10586 (= lt!53962 (_1!1876 e!23824))))

(declare-fun c!2460 () Bool)

(assert (=> d!10586 (= c!2460 (= lt!53522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10586 (bvsge lt!53522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10586 (= (bitStreamReadBitsIntoList!0 (_2!1866 lt!53517) (_1!1867 lt!53504) lt!53522) lt!53962)))

(declare-fun lt!53961 () tuple2!3580)

(declare-fun b!36105 () Bool)

(declare-fun lt!53960 () (_ BitVec 64))

(assert (=> b!36105 (= e!23824 (tuple2!3579 (Cons!436 (_1!1877 lt!53961) (bitStreamReadBitsIntoList!0 (_2!1866 lt!53517) (_2!1877 lt!53961) (bvsub lt!53522 lt!53960))) (_2!1877 lt!53961)))))

(assert (=> b!36105 (= lt!53961 (readBit!0 (_1!1867 lt!53504)))))

(assert (=> b!36105 (= lt!53960 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!36104 () Bool)

(assert (=> b!36104 (= e!23824 (tuple2!3579 Nil!437 (_1!1867 lt!53504)))))

(declare-fun b!36106 () Bool)

(assert (=> b!36106 (= e!23825 (isEmpty!100 lt!53962))))

(declare-fun b!36107 () Bool)

(assert (=> b!36107 (= e!23825 (> (length!166 lt!53962) 0))))

(assert (= (and d!10586 c!2460) b!36104))

(assert (= (and d!10586 (not c!2460)) b!36105))

(assert (= (and d!10586 c!2459) b!36106))

(assert (= (and d!10586 (not c!2459)) b!36107))

(declare-fun m!54325 () Bool)

(assert (=> b!36105 m!54325))

(declare-fun m!54327 () Bool)

(assert (=> b!36105 m!54327))

(declare-fun m!54329 () Bool)

(assert (=> b!36106 m!54329))

(declare-fun m!54331 () Bool)

(assert (=> b!36107 m!54331))

(assert (=> b!35853 d!10586))

(declare-fun d!10590 () Bool)

(assert (=> d!10590 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2848 () Bool)

(assert (= bs!2848 d!10590))

(declare-fun m!54333 () Bool)

(assert (=> bs!2848 m!54333))

(assert (=> b!35853 d!10590))

(declare-fun d!10592 () Bool)

(assert (=> d!10592 (= (invariant!0 (currentBit!2560 (_2!1866 lt!53513)) (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53517)))) (and (bvsge (currentBit!2560 (_2!1866 lt!53513)) #b00000000000000000000000000000000) (bvslt (currentBit!2560 (_2!1866 lt!53513)) #b00000000000000000000000000001000) (bvsge (currentByte!2565 (_2!1866 lt!53513)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53517)))) (and (= (currentBit!2560 (_2!1866 lt!53513)) #b00000000000000000000000000000000) (= (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53517))))))))))

(assert (=> b!35843 d!10592))

(declare-fun d!10594 () Bool)

(assert (=> d!10594 (= (head!277 lt!53524) (h!555 lt!53524))))

(assert (=> b!35862 d!10594))

(declare-fun d!10596 () Bool)

(assert (=> d!10596 (= (bitAt!0 (buf!1180 (_2!1866 lt!53513)) lt!53519) (not (= (bvand ((_ sign_extend 24) (select (arr!1336 (buf!1180 (_2!1866 lt!53513))) ((_ extract 31 0) (bvsdiv lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2849 () Bool)

(assert (= bs!2849 d!10596))

(declare-fun m!54335 () Bool)

(assert (=> bs!2849 m!54335))

(assert (=> bs!2849 m!54213))

(assert (=> b!35863 d!10596))

(declare-fun d!10598 () Bool)

(declare-fun size!855 (List!440) Int)

(assert (=> d!10598 (= (length!166 lt!53524) (size!855 lt!53524))))

(declare-fun bs!2850 () Bool)

(assert (= bs!2850 d!10598))

(declare-fun m!54337 () Bool)

(assert (=> bs!2850 m!54337))

(assert (=> b!35852 d!10598))

(declare-fun d!10600 () Bool)

(declare-fun e!23836 () Bool)

(assert (=> d!10600 e!23836))

(declare-fun res!30771 () Bool)

(assert (=> d!10600 (=> (not res!30771) (not e!23836))))

(declare-fun lt!54009 () (_ BitVec 64))

(declare-fun lt!54008 () (_ BitVec 64))

(declare-fun lt!54010 () (_ BitVec 64))

(assert (=> d!10600 (= res!30771 (= lt!54010 (bvsub lt!54008 lt!54009)))))

(assert (=> d!10600 (or (= (bvand lt!54008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54009 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54008 lt!54009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10600 (= lt!54009 (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513)))))))

(declare-fun lt!54007 () (_ BitVec 64))

(declare-fun lt!54011 () (_ BitVec 64))

(assert (=> d!10600 (= lt!54008 (bvmul lt!54007 lt!54011))))

(assert (=> d!10600 (or (= lt!54007 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!54011 (bvsdiv (bvmul lt!54007 lt!54011) lt!54007)))))

(assert (=> d!10600 (= lt!54011 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10600 (= lt!54007 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))))))

(assert (=> d!10600 (= lt!54010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513)))))))

(assert (=> d!10600 (invariant!0 (currentBit!2560 (_2!1866 lt!53513)) (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53513))))))

(assert (=> d!10600 (= (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))) lt!54010)))

(declare-fun b!36129 () Bool)

(declare-fun res!30772 () Bool)

(assert (=> b!36129 (=> (not res!30772) (not e!23836))))

(assert (=> b!36129 (= res!30772 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!54010))))

(declare-fun b!36130 () Bool)

(declare-fun lt!54006 () (_ BitVec 64))

(assert (=> b!36130 (= e!23836 (bvsle lt!54010 (bvmul lt!54006 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36130 (or (= lt!54006 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!54006 #b0000000000000000000000000000000000000000000000000000000000001000) lt!54006)))))

(assert (=> b!36130 (= lt!54006 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))))))

(assert (= (and d!10600 res!30771) b!36129))

(assert (= (and b!36129 res!30772) b!36130))

(assert (=> d!10600 m!54105))

(assert (=> d!10600 m!53889))

(assert (=> b!35861 d!10600))

(declare-fun d!10608 () Bool)

(assert (=> d!10608 (= (tail!157 lt!53524) (t!1190 lt!53524))))

(assert (=> b!35850 d!10608))

(declare-fun d!10612 () Bool)

(declare-fun e!23847 () Bool)

(assert (=> d!10612 e!23847))

(declare-fun res!30780 () Bool)

(assert (=> d!10612 (=> (not res!30780) (not e!23847))))

(declare-fun lt!54034 () (_ BitVec 64))

(assert (=> d!10612 (= res!30780 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54034 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!54034) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10612 (= lt!54034 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54033 () Unit!2631)

(declare-fun choose!42 (BitStream!1478 BitStream!1478 BitStream!1478 BitStream!1478 (_ BitVec 64) List!440) Unit!2631)

(assert (=> d!10612 (= lt!54033 (choose!42 (_2!1866 lt!53517) (_2!1866 lt!53517) (_1!1867 lt!53525) (_1!1867 lt!53504) (bvsub to!314 i!635) lt!53524))))

(assert (=> d!10612 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10612 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1866 lt!53517) (_2!1866 lt!53517) (_1!1867 lt!53525) (_1!1867 lt!53504) (bvsub to!314 i!635) lt!53524) lt!54033)))

(declare-fun b!36148 () Bool)

(assert (=> b!36148 (= e!23847 (= (bitStreamReadBitsIntoList!0 (_2!1866 lt!53517) (_1!1867 lt!53504) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!157 lt!53524)))))

(assert (= (and d!10612 res!30780) b!36148))

(declare-fun m!54393 () Bool)

(assert (=> d!10612 m!54393))

(declare-fun m!54395 () Bool)

(assert (=> b!36148 m!54395))

(assert (=> b!36148 m!53981))

(assert (=> b!35850 d!10612))

(declare-fun d!10634 () Bool)

(assert (=> d!10634 (= (array_inv!792 (buf!1180 thiss!1379)) (bvsge (size!852 (buf!1180 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!35851 d!10634))

(declare-fun d!10638 () Bool)

(declare-fun res!30782 () Bool)

(declare-fun e!23849 () Bool)

(assert (=> d!10638 (=> (not res!30782) (not e!23849))))

(assert (=> d!10638 (= res!30782 (= (size!852 (buf!1180 thiss!1379)) (size!852 (buf!1180 thiss!1379))))))

(assert (=> d!10638 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!23849)))

(declare-fun b!36149 () Bool)

(declare-fun res!30783 () Bool)

(assert (=> b!36149 (=> (not res!30783) (not e!23849))))

(assert (=> b!36149 (= res!30783 (bvsle (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)) (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379))))))

(declare-fun b!36150 () Bool)

(declare-fun e!23848 () Bool)

(assert (=> b!36150 (= e!23849 e!23848)))

(declare-fun res!30781 () Bool)

(assert (=> b!36150 (=> res!30781 e!23848)))

(assert (=> b!36150 (= res!30781 (= (size!852 (buf!1180 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36151 () Bool)

(assert (=> b!36151 (= e!23848 (arrayBitRangesEq!0 (buf!1180 thiss!1379) (buf!1180 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379))))))

(assert (= (and d!10638 res!30782) b!36149))

(assert (= (and b!36149 res!30783) b!36150))

(assert (= (and b!36150 (not res!30781)) b!36151))

(assert (=> b!36149 m!53955))

(assert (=> b!36149 m!53955))

(assert (=> b!36151 m!53955))

(assert (=> b!36151 m!53955))

(declare-fun m!54407 () Bool)

(assert (=> b!36151 m!54407))

(assert (=> b!35849 d!10638))

(declare-fun d!10642 () Bool)

(assert (=> d!10642 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54039 () Unit!2631)

(declare-fun choose!11 (BitStream!1478) Unit!2631)

(assert (=> d!10642 (= lt!54039 (choose!11 thiss!1379))))

(assert (=> d!10642 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!54039)))

(declare-fun bs!2859 () Bool)

(assert (= bs!2859 d!10642))

(assert (=> bs!2859 m!53951))

(declare-fun m!54409 () Bool)

(assert (=> bs!2859 m!54409))

(assert (=> b!35849 d!10642))

(declare-fun d!10644 () Bool)

(declare-fun e!23850 () Bool)

(assert (=> d!10644 e!23850))

(declare-fun res!30784 () Bool)

(assert (=> d!10644 (=> (not res!30784) (not e!23850))))

(declare-fun lt!54044 () (_ BitVec 64))

(declare-fun lt!54043 () (_ BitVec 64))

(declare-fun lt!54045 () (_ BitVec 64))

(assert (=> d!10644 (= res!30784 (= lt!54045 (bvsub lt!54043 lt!54044)))))

(assert (=> d!10644 (or (= (bvand lt!54043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54044 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54043 lt!54044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10644 (= lt!54044 (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 thiss!1379))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379))))))

(declare-fun lt!54042 () (_ BitVec 64))

(declare-fun lt!54046 () (_ BitVec 64))

(assert (=> d!10644 (= lt!54043 (bvmul lt!54042 lt!54046))))

(assert (=> d!10644 (or (= lt!54042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!54046 (bvsdiv (bvmul lt!54042 lt!54046) lt!54042)))))

(assert (=> d!10644 (= lt!54046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10644 (= lt!54042 ((_ sign_extend 32) (size!852 (buf!1180 thiss!1379))))))

(assert (=> d!10644 (= lt!54045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2565 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2560 thiss!1379))))))

(assert (=> d!10644 (invariant!0 (currentBit!2560 thiss!1379) (currentByte!2565 thiss!1379) (size!852 (buf!1180 thiss!1379)))))

(assert (=> d!10644 (= (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)) lt!54045)))

(declare-fun b!36152 () Bool)

(declare-fun res!30785 () Bool)

(assert (=> b!36152 (=> (not res!30785) (not e!23850))))

(assert (=> b!36152 (= res!30785 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!54045))))

(declare-fun b!36153 () Bool)

(declare-fun lt!54041 () (_ BitVec 64))

(assert (=> b!36153 (= e!23850 (bvsle lt!54045 (bvmul lt!54041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36153 (or (= lt!54041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!54041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!54041)))))

(assert (=> b!36153 (= lt!54041 ((_ sign_extend 32) (size!852 (buf!1180 thiss!1379))))))

(assert (= (and d!10644 res!30784) b!36152))

(assert (= (and b!36152 res!30785) b!36153))

(declare-fun m!54413 () Bool)

(assert (=> d!10644 m!54413))

(assert (=> d!10644 m!54217))

(assert (=> b!35849 d!10644))

(declare-fun d!10648 () Bool)

(assert (=> d!10648 (= (invariant!0 (currentBit!2560 (_2!1866 lt!53513)) (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53513)))) (and (bvsge (currentBit!2560 (_2!1866 lt!53513)) #b00000000000000000000000000000000) (bvslt (currentBit!2560 (_2!1866 lt!53513)) #b00000000000000000000000000001000) (bvsge (currentByte!2565 (_2!1866 lt!53513)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53513)))) (and (= (currentBit!2560 (_2!1866 lt!53513)) #b00000000000000000000000000000000) (= (currentByte!2565 (_2!1866 lt!53513)) (size!852 (buf!1180 (_2!1866 lt!53513))))))))))

(assert (=> b!35860 d!10648))

(declare-fun b!36159 () Bool)

(declare-fun e!23854 () Unit!2631)

(declare-fun lt!54071 () Unit!2631)

(assert (=> b!36159 (= e!23854 lt!54071)))

(declare-fun lt!54084 () (_ BitVec 64))

(assert (=> b!36159 (= lt!54084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!54077 () (_ BitVec 64))

(assert (=> b!36159 (= lt!54077 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(assert (=> b!36159 (= lt!54071 (arrayBitRangesEqSymmetric!0 (buf!1180 thiss!1379) (buf!1180 (_2!1866 lt!53513)) lt!54084 lt!54077))))

(assert (=> b!36159 (arrayBitRangesEq!0 (buf!1180 (_2!1866 lt!53513)) (buf!1180 thiss!1379) lt!54084 lt!54077)))

(declare-fun d!10650 () Bool)

(declare-fun e!23853 () Bool)

(assert (=> d!10650 e!23853))

(declare-fun res!30789 () Bool)

(assert (=> d!10650 (=> (not res!30789) (not e!23853))))

(declare-fun lt!54076 () tuple2!3560)

(assert (=> d!10650 (= res!30789 (isPrefixOf!0 (_1!1867 lt!54076) (_2!1867 lt!54076)))))

(declare-fun lt!54075 () BitStream!1478)

(assert (=> d!10650 (= lt!54076 (tuple2!3561 lt!54075 (_2!1866 lt!53513)))))

(declare-fun lt!54078 () Unit!2631)

(declare-fun lt!54085 () Unit!2631)

(assert (=> d!10650 (= lt!54078 lt!54085)))

(assert (=> d!10650 (isPrefixOf!0 lt!54075 (_2!1866 lt!53513))))

(assert (=> d!10650 (= lt!54085 (lemmaIsPrefixTransitive!0 lt!54075 (_2!1866 lt!53513) (_2!1866 lt!53513)))))

(declare-fun lt!54073 () Unit!2631)

(declare-fun lt!54068 () Unit!2631)

(assert (=> d!10650 (= lt!54073 lt!54068)))

(assert (=> d!10650 (isPrefixOf!0 lt!54075 (_2!1866 lt!53513))))

(assert (=> d!10650 (= lt!54068 (lemmaIsPrefixTransitive!0 lt!54075 thiss!1379 (_2!1866 lt!53513)))))

(declare-fun lt!54070 () Unit!2631)

(assert (=> d!10650 (= lt!54070 e!23854)))

(declare-fun c!2474 () Bool)

(assert (=> d!10650 (= c!2474 (not (= (size!852 (buf!1180 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!54067 () Unit!2631)

(declare-fun lt!54083 () Unit!2631)

(assert (=> d!10650 (= lt!54067 lt!54083)))

(assert (=> d!10650 (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!53513))))

(assert (=> d!10650 (= lt!54083 (lemmaIsPrefixRefl!0 (_2!1866 lt!53513)))))

(declare-fun lt!54086 () Unit!2631)

(declare-fun lt!54082 () Unit!2631)

(assert (=> d!10650 (= lt!54086 lt!54082)))

(assert (=> d!10650 (= lt!54082 (lemmaIsPrefixRefl!0 (_2!1866 lt!53513)))))

(declare-fun lt!54069 () Unit!2631)

(declare-fun lt!54081 () Unit!2631)

(assert (=> d!10650 (= lt!54069 lt!54081)))

(assert (=> d!10650 (isPrefixOf!0 lt!54075 lt!54075)))

(assert (=> d!10650 (= lt!54081 (lemmaIsPrefixRefl!0 lt!54075))))

(declare-fun lt!54072 () Unit!2631)

(declare-fun lt!54074 () Unit!2631)

(assert (=> d!10650 (= lt!54072 lt!54074)))

(assert (=> d!10650 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10650 (= lt!54074 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10650 (= lt!54075 (BitStream!1479 (buf!1180 (_2!1866 lt!53513)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(assert (=> d!10650 (isPrefixOf!0 thiss!1379 (_2!1866 lt!53513))))

(assert (=> d!10650 (= (reader!0 thiss!1379 (_2!1866 lt!53513)) lt!54076)))

(declare-fun b!36160 () Bool)

(declare-fun Unit!2648 () Unit!2631)

(assert (=> b!36160 (= e!23854 Unit!2648)))

(declare-fun lt!54080 () (_ BitVec 64))

(declare-fun b!36161 () Bool)

(declare-fun lt!54079 () (_ BitVec 64))

(assert (=> b!36161 (= e!23853 (= (_1!1867 lt!54076) (withMovedBitIndex!0 (_2!1867 lt!54076) (bvsub lt!54080 lt!54079))))))

(assert (=> b!36161 (or (= (bvand lt!54080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54080 lt!54079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36161 (= lt!54079 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))))))

(assert (=> b!36161 (= lt!54080 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)))))

(declare-fun b!36162 () Bool)

(declare-fun res!30791 () Bool)

(assert (=> b!36162 (=> (not res!30791) (not e!23853))))

(assert (=> b!36162 (= res!30791 (isPrefixOf!0 (_1!1867 lt!54076) thiss!1379))))

(declare-fun b!36163 () Bool)

(declare-fun res!30790 () Bool)

(assert (=> b!36163 (=> (not res!30790) (not e!23853))))

(assert (=> b!36163 (= res!30790 (isPrefixOf!0 (_2!1867 lt!54076) (_2!1866 lt!53513)))))

(assert (= (and d!10650 c!2474) b!36159))

(assert (= (and d!10650 (not c!2474)) b!36160))

(assert (= (and d!10650 res!30789) b!36162))

(assert (= (and b!36162 res!30791) b!36163))

(assert (= (and b!36163 res!30790) b!36161))

(declare-fun m!54437 () Bool)

(assert (=> d!10650 m!54437))

(assert (=> d!10650 m!54245))

(assert (=> d!10650 m!53951))

(assert (=> d!10650 m!54259))

(declare-fun m!54439 () Bool)

(assert (=> d!10650 m!54439))

(declare-fun m!54441 () Bool)

(assert (=> d!10650 m!54441))

(declare-fun m!54443 () Bool)

(assert (=> d!10650 m!54443))

(assert (=> d!10650 m!53961))

(declare-fun m!54445 () Bool)

(assert (=> d!10650 m!54445))

(declare-fun m!54447 () Bool)

(assert (=> d!10650 m!54447))

(assert (=> d!10650 m!53953))

(declare-fun m!54449 () Bool)

(assert (=> b!36163 m!54449))

(declare-fun m!54451 () Bool)

(assert (=> b!36161 m!54451))

(assert (=> b!36161 m!53979))

(assert (=> b!36161 m!53955))

(assert (=> b!36159 m!53955))

(declare-fun m!54453 () Bool)

(assert (=> b!36159 m!54453))

(declare-fun m!54455 () Bool)

(assert (=> b!36159 m!54455))

(declare-fun m!54459 () Bool)

(assert (=> b!36162 m!54459))

(assert (=> b!35858 d!10650))

(declare-fun d!10656 () Bool)

(assert (=> d!10656 (isPrefixOf!0 thiss!1379 (_2!1866 lt!53517))))

(declare-fun lt!54089 () Unit!2631)

(declare-fun choose!30 (BitStream!1478 BitStream!1478 BitStream!1478) Unit!2631)

(assert (=> d!10656 (= lt!54089 (choose!30 thiss!1379 (_2!1866 lt!53513) (_2!1866 lt!53517)))))

(assert (=> d!10656 (isPrefixOf!0 thiss!1379 (_2!1866 lt!53513))))

(assert (=> d!10656 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1866 lt!53513) (_2!1866 lt!53517)) lt!54089)))

(declare-fun bs!2861 () Bool)

(assert (= bs!2861 d!10656))

(assert (=> bs!2861 m!53891))

(declare-fun m!54461 () Bool)

(assert (=> bs!2861 m!54461))

(assert (=> bs!2861 m!53961))

(assert (=> b!35858 d!10656))

(declare-fun d!10658 () Bool)

(assert (=> d!10658 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54090 () Unit!2631)

(assert (=> d!10658 (= lt!54090 (choose!9 thiss!1379 (buf!1180 (_2!1866 lt!53513)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1479 (buf!1180 (_2!1866 lt!53513)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379))))))

(assert (=> d!10658 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1180 (_2!1866 lt!53513)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!54090)))

(declare-fun bs!2862 () Bool)

(assert (= bs!2862 d!10658))

(assert (=> bs!2862 m!53901))

(declare-fun m!54463 () Bool)

(assert (=> bs!2862 m!54463))

(assert (=> b!35858 d!10658))

(declare-fun b!36247 () Bool)

(declare-fun e!23890 () Bool)

(declare-fun lt!54498 () (_ BitVec 64))

(assert (=> b!36247 (= e!23890 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!54498))))

(declare-fun e!23891 () Bool)

(declare-fun b!36248 () Bool)

(declare-fun lt!54497 () tuple2!3560)

(declare-fun lt!54500 () tuple2!3558)

(assert (=> b!36248 (= e!23891 (= (bitStreamReadBitsIntoList!0 (_2!1866 lt!54500) (_1!1867 lt!54497) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1866 lt!54500) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!36248 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36248 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!54519 () Unit!2631)

(declare-fun lt!54493 () Unit!2631)

(assert (=> b!36248 (= lt!54519 lt!54493)))

(assert (=> b!36248 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!54500)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!54498)))

(assert (=> b!36248 (= lt!54493 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1866 lt!53513) (buf!1180 (_2!1866 lt!54500)) lt!54498))))

(assert (=> b!36248 e!23890))

(declare-fun res!30862 () Bool)

(assert (=> b!36248 (=> (not res!30862) (not e!23890))))

(assert (=> b!36248 (= res!30862 (and (= (size!852 (buf!1180 (_2!1866 lt!53513))) (size!852 (buf!1180 (_2!1866 lt!54500)))) (bvsge lt!54498 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36248 (= lt!54498 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!36248 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36248 (= lt!54497 (reader!0 (_2!1866 lt!53513) (_2!1866 lt!54500)))))

(declare-fun call!454 () tuple2!3560)

(declare-fun c!2484 () Bool)

(declare-fun lt!54507 () tuple2!3558)

(declare-fun bm!451 () Bool)

(assert (=> bm!451 (= call!454 (reader!0 (_2!1866 lt!53513) (ite c!2484 (_2!1866 lt!54507) (_2!1866 lt!53513))))))

(declare-fun b!36249 () Bool)

(declare-fun res!30859 () Bool)

(assert (=> b!36249 (=> (not res!30859) (not e!23891))))

(assert (=> b!36249 (= res!30859 (invariant!0 (currentBit!2560 (_2!1866 lt!54500)) (currentByte!2565 (_2!1866 lt!54500)) (size!852 (buf!1180 (_2!1866 lt!54500)))))))

(declare-fun b!36250 () Bool)

(declare-fun res!30861 () Bool)

(assert (=> b!36250 (=> (not res!30861) (not e!23891))))

(assert (=> b!36250 (= res!30861 (= (size!852 (buf!1180 (_2!1866 lt!53513))) (size!852 (buf!1180 (_2!1866 lt!54500)))))))

(declare-fun b!36251 () Bool)

(declare-fun res!30860 () Bool)

(assert (=> b!36251 (=> (not res!30860) (not e!23891))))

(assert (=> b!36251 (= res!30860 (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!54500)))))

(declare-fun b!36252 () Bool)

(declare-fun e!23892 () tuple2!3558)

(declare-fun Unit!2656 () Unit!2631)

(assert (=> b!36252 (= e!23892 (tuple2!3559 Unit!2656 (_2!1866 lt!53513)))))

(assert (=> b!36252 (= (size!852 (buf!1180 (_2!1866 lt!53513))) (size!852 (buf!1180 (_2!1866 lt!53513))))))

(declare-fun lt!54518 () Unit!2631)

(declare-fun Unit!2657 () Unit!2631)

(assert (=> b!36252 (= lt!54518 Unit!2657)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1478 array!1911 array!1911 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36252 (checkByteArrayBitContent!0 (_2!1866 lt!53513) srcBuffer!2 (_1!1873 (readBits!0 (_1!1867 call!454) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!10660 () Bool)

(assert (=> d!10660 e!23891))

(declare-fun res!30857 () Bool)

(assert (=> d!10660 (=> (not res!30857) (not e!23891))))

(declare-fun lt!54516 () (_ BitVec 64))

(assert (=> d!10660 (= res!30857 (= (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!54500))) (currentByte!2565 (_2!1866 lt!54500)) (currentBit!2560 (_2!1866 lt!54500))) (bvsub lt!54516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10660 (or (= (bvand lt!54516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!54513 () (_ BitVec 64))

(assert (=> d!10660 (= lt!54516 (bvadd lt!54513 to!314))))

(assert (=> d!10660 (or (not (= (bvand lt!54513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!54513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!54513 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10660 (= lt!54513 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))))))

(assert (=> d!10660 (= lt!54500 e!23892)))

(assert (=> d!10660 (= c!2484 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!54501 () Unit!2631)

(declare-fun lt!54488 () Unit!2631)

(assert (=> d!10660 (= lt!54501 lt!54488)))

(assert (=> d!10660 (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!53513))))

(assert (=> d!10660 (= lt!54488 (lemmaIsPrefixRefl!0 (_2!1866 lt!53513)))))

(declare-fun lt!54479 () (_ BitVec 64))

(assert (=> d!10660 (= lt!54479 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))))))

(assert (=> d!10660 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10660 (= (appendBitsMSBFirstLoop!0 (_2!1866 lt!53513) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!54500)))

(declare-fun b!36253 () Bool)

(declare-fun lt!54509 () tuple2!3558)

(declare-fun Unit!2658 () Unit!2631)

(assert (=> b!36253 (= e!23892 (tuple2!3559 Unit!2658 (_2!1866 lt!54509)))))

(assert (=> b!36253 (= lt!54507 (appendBitFromByte!0 (_2!1866 lt!53513) (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!54495 () (_ BitVec 64))

(assert (=> b!36253 (= lt!54495 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54484 () (_ BitVec 64))

(assert (=> b!36253 (= lt!54484 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54503 () Unit!2631)

(assert (=> b!36253 (= lt!54503 (validateOffsetBitsIneqLemma!0 (_2!1866 lt!53513) (_2!1866 lt!54507) lt!54495 lt!54484))))

(assert (=> b!36253 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!54507)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!54507))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!54507))) (bvsub lt!54495 lt!54484))))

(declare-fun lt!54481 () Unit!2631)

(assert (=> b!36253 (= lt!54481 lt!54503)))

(declare-fun lt!54512 () tuple2!3560)

(assert (=> b!36253 (= lt!54512 call!454)))

(declare-fun lt!54515 () (_ BitVec 64))

(assert (=> b!36253 (= lt!54515 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54478 () Unit!2631)

(assert (=> b!36253 (= lt!54478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1866 lt!53513) (buf!1180 (_2!1866 lt!54507)) lt!54515))))

(assert (=> b!36253 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!54507)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!54515)))

(declare-fun lt!54502 () Unit!2631)

(assert (=> b!36253 (= lt!54502 lt!54478)))

(assert (=> b!36253 (= (head!277 (byteArrayBitContentToList!0 (_2!1866 lt!54507) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!277 (bitStreamReadBitsIntoList!0 (_2!1866 lt!54507) (_1!1867 lt!54512) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54480 () Unit!2631)

(declare-fun Unit!2659 () Unit!2631)

(assert (=> b!36253 (= lt!54480 Unit!2659)))

(assert (=> b!36253 (= lt!54509 (appendBitsMSBFirstLoop!0 (_2!1866 lt!54507) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!54506 () Unit!2631)

(assert (=> b!36253 (= lt!54506 (lemmaIsPrefixTransitive!0 (_2!1866 lt!53513) (_2!1866 lt!54507) (_2!1866 lt!54509)))))

(assert (=> b!36253 (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!54509))))

(declare-fun lt!54489 () Unit!2631)

(assert (=> b!36253 (= lt!54489 lt!54506)))

(assert (=> b!36253 (= (size!852 (buf!1180 (_2!1866 lt!54509))) (size!852 (buf!1180 (_2!1866 lt!53513))))))

(declare-fun lt!54485 () Unit!2631)

(declare-fun Unit!2660 () Unit!2631)

(assert (=> b!36253 (= lt!54485 Unit!2660)))

(assert (=> b!36253 (= (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!54509))) (currentByte!2565 (_2!1866 lt!54509)) (currentBit!2560 (_2!1866 lt!54509))) (bvsub (bvadd (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54491 () Unit!2631)

(declare-fun Unit!2661 () Unit!2631)

(assert (=> b!36253 (= lt!54491 Unit!2661)))

(assert (=> b!36253 (= (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!54509))) (currentByte!2565 (_2!1866 lt!54509)) (currentBit!2560 (_2!1866 lt!54509))) (bvsub (bvsub (bvadd (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!54507))) (currentByte!2565 (_2!1866 lt!54507)) (currentBit!2560 (_2!1866 lt!54507))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54508 () Unit!2631)

(declare-fun Unit!2662 () Unit!2631)

(assert (=> b!36253 (= lt!54508 Unit!2662)))

(declare-fun lt!54504 () tuple2!3560)

(assert (=> b!36253 (= lt!54504 (reader!0 (_2!1866 lt!53513) (_2!1866 lt!54509)))))

(declare-fun lt!54487 () (_ BitVec 64))

(assert (=> b!36253 (= lt!54487 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54477 () Unit!2631)

(assert (=> b!36253 (= lt!54477 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1866 lt!53513) (buf!1180 (_2!1866 lt!54509)) lt!54487))))

(assert (=> b!36253 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!54509)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53513))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53513))) lt!54487)))

(declare-fun lt!54510 () Unit!2631)

(assert (=> b!36253 (= lt!54510 lt!54477)))

(declare-fun lt!54499 () tuple2!3560)

(assert (=> b!36253 (= lt!54499 (reader!0 (_2!1866 lt!54507) (_2!1866 lt!54509)))))

(declare-fun lt!54496 () (_ BitVec 64))

(assert (=> b!36253 (= lt!54496 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54517 () Unit!2631)

(assert (=> b!36253 (= lt!54517 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1866 lt!54507) (buf!1180 (_2!1866 lt!54509)) lt!54496))))

(assert (=> b!36253 (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!54509)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!54507))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!54507))) lt!54496)))

(declare-fun lt!54482 () Unit!2631)

(assert (=> b!36253 (= lt!54482 lt!54517)))

(declare-fun lt!54494 () List!440)

(assert (=> b!36253 (= lt!54494 (byteArrayBitContentToList!0 (_2!1866 lt!54509) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!54490 () List!440)

(assert (=> b!36253 (= lt!54490 (byteArrayBitContentToList!0 (_2!1866 lt!54509) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54511 () List!440)

(assert (=> b!36253 (= lt!54511 (bitStreamReadBitsIntoList!0 (_2!1866 lt!54509) (_1!1867 lt!54504) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!54505 () List!440)

(assert (=> b!36253 (= lt!54505 (bitStreamReadBitsIntoList!0 (_2!1866 lt!54509) (_1!1867 lt!54499) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54492 () (_ BitVec 64))

(assert (=> b!36253 (= lt!54492 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54476 () Unit!2631)

(assert (=> b!36253 (= lt!54476 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1866 lt!54509) (_2!1866 lt!54509) (_1!1867 lt!54504) (_1!1867 lt!54499) lt!54492 lt!54511))))

(assert (=> b!36253 (= (bitStreamReadBitsIntoList!0 (_2!1866 lt!54509) (_1!1867 lt!54499) (bvsub lt!54492 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!157 lt!54511))))

(declare-fun lt!54486 () Unit!2631)

(assert (=> b!36253 (= lt!54486 lt!54476)))

(declare-fun lt!54483 () Unit!2631)

(assert (=> b!36253 (= lt!54483 (arrayBitRangesEqImpliesEq!0 (buf!1180 (_2!1866 lt!54507)) (buf!1180 (_2!1866 lt!54509)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54479 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!54507))) (currentByte!2565 (_2!1866 lt!54507)) (currentBit!2560 (_2!1866 lt!54507)))))))

(assert (=> b!36253 (= (bitAt!0 (buf!1180 (_2!1866 lt!54507)) lt!54479) (bitAt!0 (buf!1180 (_2!1866 lt!54509)) lt!54479))))

(declare-fun lt!54514 () Unit!2631)

(assert (=> b!36253 (= lt!54514 lt!54483)))

(declare-fun b!36254 () Bool)

(declare-fun res!30858 () Bool)

(assert (=> b!36254 (=> (not res!30858) (not e!23891))))

(assert (=> b!36254 (= res!30858 (= (size!852 (buf!1180 (_2!1866 lt!54500))) (size!852 (buf!1180 (_2!1866 lt!53513)))))))

(assert (= (and d!10660 c!2484) b!36253))

(assert (= (and d!10660 (not c!2484)) b!36252))

(assert (= (or b!36253 b!36252) bm!451))

(assert (= (and d!10660 res!30857) b!36249))

(assert (= (and b!36249 res!30859) b!36250))

(assert (= (and b!36250 res!30861) b!36251))

(assert (= (and b!36251 res!30860) b!36254))

(assert (= (and b!36254 res!30858) b!36248))

(assert (= (and b!36248 res!30862) b!36247))

(declare-fun m!54601 () Bool)

(assert (=> b!36247 m!54601))

(declare-fun m!54607 () Bool)

(assert (=> b!36248 m!54607))

(declare-fun m!54611 () Bool)

(assert (=> b!36248 m!54611))

(declare-fun m!54615 () Bool)

(assert (=> b!36248 m!54615))

(declare-fun m!54617 () Bool)

(assert (=> b!36248 m!54617))

(declare-fun m!54621 () Bool)

(assert (=> b!36248 m!54621))

(declare-fun m!54623 () Bool)

(assert (=> d!10660 m!54623))

(assert (=> d!10660 m!53979))

(assert (=> d!10660 m!54245))

(assert (=> d!10660 m!54259))

(declare-fun m!54629 () Bool)

(assert (=> b!36251 m!54629))

(declare-fun m!54633 () Bool)

(assert (=> b!36249 m!54633))

(declare-fun m!54637 () Bool)

(assert (=> bm!451 m!54637))

(declare-fun m!54641 () Bool)

(assert (=> b!36253 m!54641))

(declare-fun m!54645 () Bool)

(assert (=> b!36253 m!54645))

(declare-fun m!54649 () Bool)

(assert (=> b!36253 m!54649))

(declare-fun m!54651 () Bool)

(assert (=> b!36253 m!54651))

(assert (=> b!36253 m!53979))

(declare-fun m!54655 () Bool)

(assert (=> b!36253 m!54655))

(declare-fun m!54659 () Bool)

(assert (=> b!36253 m!54659))

(declare-fun m!54663 () Bool)

(assert (=> b!36253 m!54663))

(declare-fun m!54669 () Bool)

(assert (=> b!36253 m!54669))

(declare-fun m!54673 () Bool)

(assert (=> b!36253 m!54673))

(declare-fun m!54677 () Bool)

(assert (=> b!36253 m!54677))

(declare-fun m!54681 () Bool)

(assert (=> b!36253 m!54681))

(declare-fun m!54685 () Bool)

(assert (=> b!36253 m!54685))

(declare-fun m!54687 () Bool)

(assert (=> b!36253 m!54687))

(declare-fun m!54691 () Bool)

(assert (=> b!36253 m!54691))

(declare-fun m!54695 () Bool)

(assert (=> b!36253 m!54695))

(declare-fun m!54699 () Bool)

(assert (=> b!36253 m!54699))

(declare-fun m!54703 () Bool)

(assert (=> b!36253 m!54703))

(declare-fun m!54707 () Bool)

(assert (=> b!36253 m!54707))

(declare-fun m!54711 () Bool)

(assert (=> b!36253 m!54711))

(declare-fun m!54715 () Bool)

(assert (=> b!36253 m!54715))

(assert (=> b!36253 m!54655))

(declare-fun m!54723 () Bool)

(assert (=> b!36253 m!54723))

(declare-fun m!54725 () Bool)

(assert (=> b!36253 m!54725))

(declare-fun m!54729 () Bool)

(assert (=> b!36253 m!54729))

(assert (=> b!36253 m!54673))

(declare-fun m!54735 () Bool)

(assert (=> b!36253 m!54735))

(declare-fun m!54739 () Bool)

(assert (=> b!36253 m!54739))

(declare-fun m!54741 () Bool)

(assert (=> b!36253 m!54741))

(declare-fun m!54745 () Bool)

(assert (=> b!36253 m!54745))

(assert (=> b!36253 m!54685))

(declare-fun m!54749 () Bool)

(assert (=> b!36253 m!54749))

(assert (=> b!36253 m!54711))

(declare-fun m!54755 () Bool)

(assert (=> b!36253 m!54755))

(declare-fun m!54757 () Bool)

(assert (=> b!36253 m!54757))

(declare-fun m!54759 () Bool)

(assert (=> b!36253 m!54759))

(declare-fun m!54761 () Bool)

(assert (=> b!36252 m!54761))

(declare-fun m!54763 () Bool)

(assert (=> b!36252 m!54763))

(assert (=> b!35858 d!10660))

(declare-fun d!10694 () Bool)

(declare-fun res!30864 () Bool)

(declare-fun e!23894 () Bool)

(assert (=> d!10694 (=> (not res!30864) (not e!23894))))

(assert (=> d!10694 (= res!30864 (= (size!852 (buf!1180 (_2!1866 lt!53513))) (size!852 (buf!1180 (_2!1866 lt!53517)))))))

(assert (=> d!10694 (= (isPrefixOf!0 (_2!1866 lt!53513) (_2!1866 lt!53517)) e!23894)))

(declare-fun b!36255 () Bool)

(declare-fun res!30865 () Bool)

(assert (=> b!36255 (=> (not res!30865) (not e!23894))))

(assert (=> b!36255 (= res!30865 (bvsle (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513))) (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53517))) (currentByte!2565 (_2!1866 lt!53517)) (currentBit!2560 (_2!1866 lt!53517)))))))

(declare-fun b!36256 () Bool)

(declare-fun e!23893 () Bool)

(assert (=> b!36256 (= e!23894 e!23893)))

(declare-fun res!30863 () Bool)

(assert (=> b!36256 (=> res!30863 e!23893)))

(assert (=> b!36256 (= res!30863 (= (size!852 (buf!1180 (_2!1866 lt!53513))) #b00000000000000000000000000000000))))

(declare-fun b!36257 () Bool)

(assert (=> b!36257 (= e!23893 (arrayBitRangesEq!0 (buf!1180 (_2!1866 lt!53513)) (buf!1180 (_2!1866 lt!53517)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53513))) (currentByte!2565 (_2!1866 lt!53513)) (currentBit!2560 (_2!1866 lt!53513)))))))

(assert (= (and d!10694 res!30864) b!36255))

(assert (= (and b!36255 res!30865) b!36256))

(assert (= (and b!36256 (not res!30863)) b!36257))

(assert (=> b!36255 m!53979))

(assert (=> b!36255 m!53887))

(assert (=> b!36257 m!53979))

(assert (=> b!36257 m!53979))

(declare-fun m!54767 () Bool)

(assert (=> b!36257 m!54767))

(assert (=> b!35858 d!10694))

(declare-fun d!10698 () Bool)

(assert (=> d!10698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53513)))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2872 () Bool)

(assert (= bs!2872 d!10698))

(declare-fun m!54769 () Bool)

(assert (=> bs!2872 m!54769))

(assert (=> b!35858 d!10698))

(declare-fun d!10700 () Bool)

(declare-fun res!30870 () Bool)

(declare-fun e!23898 () Bool)

(assert (=> d!10700 (=> (not res!30870) (not e!23898))))

(assert (=> d!10700 (= res!30870 (= (size!852 (buf!1180 thiss!1379)) (size!852 (buf!1180 (_2!1866 lt!53517)))))))

(assert (=> d!10700 (= (isPrefixOf!0 thiss!1379 (_2!1866 lt!53517)) e!23898)))

(declare-fun b!36261 () Bool)

(declare-fun res!30871 () Bool)

(assert (=> b!36261 (=> (not res!30871) (not e!23898))))

(assert (=> b!36261 (= res!30871 (bvsle (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379)) (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53517))) (currentByte!2565 (_2!1866 lt!53517)) (currentBit!2560 (_2!1866 lt!53517)))))))

(declare-fun b!36262 () Bool)

(declare-fun e!23897 () Bool)

(assert (=> b!36262 (= e!23898 e!23897)))

(declare-fun res!30869 () Bool)

(assert (=> b!36262 (=> res!30869 e!23897)))

(assert (=> b!36262 (= res!30869 (= (size!852 (buf!1180 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36263 () Bool)

(assert (=> b!36263 (= e!23897 (arrayBitRangesEq!0 (buf!1180 thiss!1379) (buf!1180 (_2!1866 lt!53517)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!852 (buf!1180 thiss!1379)) (currentByte!2565 thiss!1379) (currentBit!2560 thiss!1379))))))

(assert (= (and d!10700 res!30870) b!36261))

(assert (= (and b!36261 res!30871) b!36262))

(assert (= (and b!36262 (not res!30869)) b!36263))

(assert (=> b!36261 m!53955))

(assert (=> b!36261 m!53887))

(assert (=> b!36263 m!53955))

(assert (=> b!36263 m!53955))

(declare-fun m!54773 () Bool)

(assert (=> b!36263 m!54773))

(assert (=> b!35858 d!10700))

(declare-fun d!10708 () Bool)

(assert (=> d!10708 (= (invariant!0 (currentBit!2560 (_2!1866 lt!53517)) (currentByte!2565 (_2!1866 lt!53517)) (size!852 (buf!1180 (_2!1866 lt!53517)))) (and (bvsge (currentBit!2560 (_2!1866 lt!53517)) #b00000000000000000000000000000000) (bvslt (currentBit!2560 (_2!1866 lt!53517)) #b00000000000000000000000000001000) (bvsge (currentByte!2565 (_2!1866 lt!53517)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2565 (_2!1866 lt!53517)) (size!852 (buf!1180 (_2!1866 lt!53517)))) (and (= (currentBit!2560 (_2!1866 lt!53517)) #b00000000000000000000000000000000) (= (currentByte!2565 (_2!1866 lt!53517)) (size!852 (buf!1180 (_2!1866 lt!53517))))))))))

(assert (=> b!35859 d!10708))

(declare-fun d!10712 () Bool)

(assert (=> d!10712 (= (head!277 (byteArrayBitContentToList!0 (_2!1866 lt!53513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!555 (byteArrayBitContentToList!0 (_2!1866 lt!53513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35848 d!10712))

(declare-fun d!10714 () Bool)

(declare-fun c!2485 () Bool)

(assert (=> d!10714 (= c!2485 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23899 () List!440)

(assert (=> d!10714 (= (byteArrayBitContentToList!0 (_2!1866 lt!53513) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23899)))

(declare-fun b!36264 () Bool)

(assert (=> b!36264 (= e!23899 Nil!437)))

(declare-fun b!36265 () Bool)

(assert (=> b!36265 (= e!23899 (Cons!436 (not (= (bvand ((_ sign_extend 24) (select (arr!1336 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1866 lt!53513) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10714 c!2485) b!36264))

(assert (= (and d!10714 (not c!2485)) b!36265))

(assert (=> b!36265 m!53959))

(assert (=> b!36265 m!54099))

(declare-fun m!54779 () Bool)

(assert (=> b!36265 m!54779))

(assert (=> b!35848 d!10714))

(declare-fun d!10718 () Bool)

(assert (=> d!10718 (= (head!277 (bitStreamReadBitsIntoList!0 (_2!1866 lt!53513) (_1!1867 lt!53514) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!555 (bitStreamReadBitsIntoList!0 (_2!1866 lt!53513) (_1!1867 lt!53514) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35848 d!10718))

(declare-fun d!10720 () Bool)

(declare-fun e!23901 () Bool)

(assert (=> d!10720 e!23901))

(declare-fun c!2486 () Bool)

(assert (=> d!10720 (= c!2486 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!54523 () List!440)

(declare-fun e!23900 () tuple2!3578)

(assert (=> d!10720 (= lt!54523 (_1!1876 e!23900))))

(declare-fun c!2487 () Bool)

(assert (=> d!10720 (= c!2487 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10720 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10720 (= (bitStreamReadBitsIntoList!0 (_2!1866 lt!53513) (_1!1867 lt!53514) #b0000000000000000000000000000000000000000000000000000000000000001) lt!54523)))

(declare-fun lt!54521 () (_ BitVec 64))

(declare-fun b!36267 () Bool)

(declare-fun lt!54522 () tuple2!3580)

(assert (=> b!36267 (= e!23900 (tuple2!3579 (Cons!436 (_1!1877 lt!54522) (bitStreamReadBitsIntoList!0 (_2!1866 lt!53513) (_2!1877 lt!54522) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!54521))) (_2!1877 lt!54522)))))

(assert (=> b!36267 (= lt!54522 (readBit!0 (_1!1867 lt!53514)))))

(assert (=> b!36267 (= lt!54521 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!36266 () Bool)

(assert (=> b!36266 (= e!23900 (tuple2!3579 Nil!437 (_1!1867 lt!53514)))))

(declare-fun b!36268 () Bool)

(assert (=> b!36268 (= e!23901 (isEmpty!100 lt!54523))))

(declare-fun b!36269 () Bool)

(assert (=> b!36269 (= e!23901 (> (length!166 lt!54523) 0))))

(assert (= (and d!10720 c!2487) b!36266))

(assert (= (and d!10720 (not c!2487)) b!36267))

(assert (= (and d!10720 c!2486) b!36268))

(assert (= (and d!10720 (not c!2486)) b!36269))

(declare-fun m!54781 () Bool)

(assert (=> b!36267 m!54781))

(declare-fun m!54783 () Bool)

(assert (=> b!36267 m!54783))

(declare-fun m!54785 () Bool)

(assert (=> b!36268 m!54785))

(declare-fun m!54787 () Bool)

(assert (=> b!36269 m!54787))

(assert (=> b!35848 d!10720))

(declare-fun d!10722 () Bool)

(assert (=> d!10722 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!852 (buf!1180 thiss!1379))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 thiss!1379))) ((_ sign_extend 32) (currentByte!2565 thiss!1379)) ((_ sign_extend 32) (currentBit!2560 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2876 () Bool)

(assert (= bs!2876 d!10722))

(assert (=> bs!2876 m!54413))

(assert (=> b!35857 d!10722))

(declare-fun d!10724 () Bool)

(declare-fun e!23902 () Bool)

(assert (=> d!10724 e!23902))

(declare-fun res!30872 () Bool)

(assert (=> d!10724 (=> (not res!30872) (not e!23902))))

(declare-fun lt!54527 () (_ BitVec 64))

(declare-fun lt!54526 () (_ BitVec 64))

(declare-fun lt!54528 () (_ BitVec 64))

(assert (=> d!10724 (= res!30872 (= lt!54528 (bvsub lt!54526 lt!54527)))))

(assert (=> d!10724 (or (= (bvand lt!54526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54527 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54526 lt!54527) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10724 (= lt!54527 (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))) ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53517))) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53517)))))))

(declare-fun lt!54525 () (_ BitVec 64))

(declare-fun lt!54529 () (_ BitVec 64))

(assert (=> d!10724 (= lt!54526 (bvmul lt!54525 lt!54529))))

(assert (=> d!10724 (or (= lt!54525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!54529 (bvsdiv (bvmul lt!54525 lt!54529) lt!54525)))))

(assert (=> d!10724 (= lt!54529 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10724 (= lt!54525 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))))))

(assert (=> d!10724 (= lt!54528 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2565 (_2!1866 lt!53517))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2560 (_2!1866 lt!53517)))))))

(assert (=> d!10724 (invariant!0 (currentBit!2560 (_2!1866 lt!53517)) (currentByte!2565 (_2!1866 lt!53517)) (size!852 (buf!1180 (_2!1866 lt!53517))))))

(assert (=> d!10724 (= (bitIndex!0 (size!852 (buf!1180 (_2!1866 lt!53517))) (currentByte!2565 (_2!1866 lt!53517)) (currentBit!2560 (_2!1866 lt!53517))) lt!54528)))

(declare-fun b!36270 () Bool)

(declare-fun res!30873 () Bool)

(assert (=> b!36270 (=> (not res!30873) (not e!23902))))

(assert (=> b!36270 (= res!30873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!54528))))

(declare-fun b!36271 () Bool)

(declare-fun lt!54524 () (_ BitVec 64))

(assert (=> b!36271 (= e!23902 (bvsle lt!54528 (bvmul lt!54524 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36271 (or (= lt!54524 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!54524 #b0000000000000000000000000000000000000000000000000000000000001000) lt!54524)))))

(assert (=> b!36271 (= lt!54524 ((_ sign_extend 32) (size!852 (buf!1180 (_2!1866 lt!53517)))))))

(assert (= (and d!10724 res!30872) b!36270))

(assert (= (and b!36270 res!30873) b!36271))

(declare-fun m!54789 () Bool)

(assert (=> d!10724 m!54789))

(assert (=> d!10724 m!53915))

(assert (=> b!35846 d!10724))

(declare-fun d!10726 () Bool)

(assert (=> d!10726 (= (bitAt!0 (buf!1180 (_2!1866 lt!53517)) lt!53519) (not (= (bvand ((_ sign_extend 24) (select (arr!1336 (buf!1180 (_2!1866 lt!53517))) ((_ extract 31 0) (bvsdiv lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53519 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2877 () Bool)

(assert (= bs!2877 d!10726))

(declare-fun m!54791 () Bool)

(assert (=> bs!2877 m!54791))

(assert (=> bs!2877 m!54213))

(assert (=> b!35845 d!10726))

(declare-fun d!10728 () Bool)

(assert (=> d!10728 (= (bitAt!0 (buf!1180 (_2!1866 lt!53513)) lt!53519) (bitAt!0 (buf!1180 (_2!1866 lt!53517)) lt!53519))))

(declare-fun lt!54535 () Unit!2631)

(declare-fun choose!31 (array!1911 array!1911 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2631)

(assert (=> d!10728 (= lt!54535 (choose!31 (buf!1180 (_2!1866 lt!53513)) (buf!1180 (_2!1866 lt!53517)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53519 lt!53507))))

(assert (=> d!10728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53507))))

(assert (=> d!10728 (= (arrayBitRangesEqImpliesEq!0 (buf!1180 (_2!1866 lt!53513)) (buf!1180 (_2!1866 lt!53517)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53519 lt!53507) lt!54535)))

(declare-fun bs!2880 () Bool)

(assert (= bs!2880 d!10728))

(assert (=> bs!2880 m!53913))

(assert (=> bs!2880 m!53945))

(declare-fun m!54797 () Bool)

(assert (=> bs!2880 m!54797))

(assert (=> b!35845 d!10728))

(declare-fun d!10734 () Bool)

(assert (=> d!10734 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!852 (buf!1180 (_1!1867 lt!53525)))) ((_ sign_extend 32) (currentByte!2565 (_1!1867 lt!53525))) ((_ sign_extend 32) (currentBit!2560 (_1!1867 lt!53525)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!852 (buf!1180 (_1!1867 lt!53525)))) ((_ sign_extend 32) (currentByte!2565 (_1!1867 lt!53525))) ((_ sign_extend 32) (currentBit!2560 (_1!1867 lt!53525)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2881 () Bool)

(assert (= bs!2881 d!10734))

(declare-fun m!54799 () Bool)

(assert (=> bs!2881 m!54799))

(assert (=> b!35856 d!10734))

(push 1)

(assert (not d!10556))

(assert (not d!10600))

(assert (not b!36106))

(assert (not d!10658))

(assert (not b!36161))

(assert (not b!36263))

(assert (not d!10728))

(assert (not b!36037))

(assert (not b!36097))

(assert (not bm!451))

(assert (not b!36093))

(assert (not d!10734))

(assert (not b!35957))

(assert (not b!36149))

(assert (not d!10656))

(assert (not b!36094))

(assert (not b!35962))

(assert (not b!36163))

(assert (not d!10598))

(assert (not b!36107))

(assert (not d!10698))

(assert (not b!36036))

(assert (not b!36105))

(assert (not b!36064))

(assert (not d!10724))

(assert (not b!36269))

(assert (not b!35959))

(assert (not b!36249))

(assert (not d!10570))

(assert (not b!36255))

(assert (not d!10722))

(assert (not d!10584))

(assert (not b!36092))

(assert (not b!36089))

(assert (not b!36162))

(assert (not b!36151))

(assert (not b!36096))

(assert (not b!36035))

(assert (not b!36062))

(assert (not d!10660))

(assert (not b!36257))

(assert (not d!10590))

(assert (not b!36252))

(assert (not b!36159))

(assert (not d!10644))

(assert (not b!36268))

(assert (not b!36098))

(assert (not b!36091))

(assert (not d!10516))

(assert (not b!36251))

(assert (not b!36265))

(assert (not d!10512))

(assert (not b!36040))

(assert (not d!10554))

(assert (not b!35950))

(assert (not b!36148))

(assert (not b!36042))

(assert (not b!36248))

(assert (not d!10564))

(assert (not d!10582))

(assert (not b!36039))

(assert (not b!36063))

(assert (not b!36261))

(assert (not b!36041))

(assert (not d!10612))

(assert (not b!36253))

(assert (not b!36267))

(assert (not d!10514))

(assert (not b!36038))

(assert (not d!10650))

(assert (not b!36247))

(assert (not d!10642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

