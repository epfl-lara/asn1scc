; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13646 () Bool)

(assert start!13646)

(declare-fun b!69881 () Bool)

(declare-fun e!45589 () Bool)

(declare-fun e!45583 () Bool)

(assert (=> b!69881 (= e!45589 e!45583)))

(declare-fun res!57700 () Bool)

(assert (=> b!69881 (=> res!57700 e!45583)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!69881 (= res!57700 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!112330 () (_ BitVec 64))

(declare-datatypes ((List!727 0))(
  ( (Nil!724) (Cons!723 (h!842 Bool) (t!1477 List!727)) )
))
(declare-fun lt!112331 () List!727)

(declare-datatypes ((array!2910 0))(
  ( (array!2911 (arr!1935 (Array (_ BitVec 32) (_ BitVec 8))) (size!1353 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2304 0))(
  ( (BitStream!2305 (buf!1734 array!2910) (currentByte!3442 (_ BitVec 32)) (currentBit!3437 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6088 0))(
  ( (tuple2!6089 (_1!3155 BitStream!2304) (_2!3155 BitStream!2304)) )
))
(declare-fun lt!112323 () tuple2!6088)

(declare-datatypes ((Unit!4687 0))(
  ( (Unit!4688) )
))
(declare-datatypes ((tuple2!6090 0))(
  ( (tuple2!6091 (_1!3156 Unit!4687) (_2!3156 BitStream!2304)) )
))
(declare-fun lt!112329 () tuple2!6090)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2304 BitStream!2304 (_ BitVec 64)) List!727)

(assert (=> b!69881 (= lt!112331 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112329) (_1!3155 lt!112323) lt!112330))))

(declare-fun lt!112326 () List!727)

(declare-fun lt!112322 () tuple2!6088)

(assert (=> b!69881 (= lt!112326 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112329) (_1!3155 lt!112322) (bvsub to!314 i!635)))))

(declare-fun lt!112333 () tuple2!6090)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112330)))

(declare-fun lt!112335 () Unit!4687)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2304 array!2910 (_ BitVec 64)) Unit!4687)

(assert (=> b!69881 (= lt!112335 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3156 lt!112333) (buf!1734 (_2!3156 lt!112329)) lt!112330))))

(declare-fun reader!0 (BitStream!2304 BitStream!2304) tuple2!6088)

(assert (=> b!69881 (= lt!112323 (reader!0 (_2!3156 lt!112333) (_2!3156 lt!112329)))))

(declare-fun thiss!1379 () BitStream!2304)

(assert (=> b!69881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!112325 () Unit!4687)

(assert (=> b!69881 (= lt!112325 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1734 (_2!3156 lt!112329)) (bvsub to!314 i!635)))))

(assert (=> b!69881 (= lt!112322 (reader!0 thiss!1379 (_2!3156 lt!112329)))))

(declare-fun srcBuffer!2 () array!2910)

(declare-fun lt!112332 () tuple2!6088)

(declare-fun e!45581 () Bool)

(declare-fun b!69882 () Bool)

(declare-fun head!546 (List!727) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2304 array!2910 (_ BitVec 64) (_ BitVec 64)) List!727)

(assert (=> b!69882 (= e!45581 (= (head!546 (byteArrayBitContentToList!0 (_2!3156 lt!112333) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!546 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112333) (_1!3155 lt!112332) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!69883 () Bool)

(declare-fun e!45587 () Bool)

(declare-fun e!45593 () Bool)

(assert (=> b!69883 (= e!45587 e!45593)))

(declare-fun res!57703 () Bool)

(assert (=> b!69883 (=> res!57703 e!45593)))

(declare-fun lt!112327 () (_ BitVec 64))

(declare-fun lt!112318 () Bool)

(declare-fun bitAt!0 (array!2910 (_ BitVec 64)) Bool)

(assert (=> b!69883 (= res!57703 (not (= lt!112318 (bitAt!0 (buf!1734 (_1!3155 lt!112323)) lt!112327))))))

(assert (=> b!69883 (= lt!112318 (bitAt!0 (buf!1734 (_1!3155 lt!112322)) lt!112327))))

(declare-fun b!69884 () Bool)

(declare-fun e!45588 () Bool)

(declare-fun e!45592 () Bool)

(assert (=> b!69884 (= e!45588 e!45592)))

(declare-fun res!57710 () Bool)

(assert (=> b!69884 (=> res!57710 e!45592)))

(declare-fun isPrefixOf!0 (BitStream!2304 BitStream!2304) Bool)

(assert (=> b!69884 (= res!57710 (not (isPrefixOf!0 thiss!1379 (_2!3156 lt!112333))))))

(assert (=> b!69884 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112330)))

(assert (=> b!69884 (= lt!112330 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112321 () Unit!4687)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2304 BitStream!2304 (_ BitVec 64) (_ BitVec 64)) Unit!4687)

(assert (=> b!69884 (= lt!112321 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3156 lt!112333) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2304 (_ BitVec 8) (_ BitVec 32)) tuple2!6090)

(assert (=> b!69884 (= lt!112333 (appendBitFromByte!0 thiss!1379 (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!69885 () Bool)

(declare-fun res!57715 () Bool)

(assert (=> b!69885 (=> res!57715 e!45583)))

(declare-fun length!355 (List!727) Int)

(assert (=> b!69885 (= res!57715 (<= (length!355 lt!112326) 0))))

(declare-fun b!69886 () Bool)

(declare-fun res!57716 () Bool)

(assert (=> b!69886 (=> res!57716 e!45589)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!69886 (= res!57716 (not (invariant!0 (currentBit!3437 (_2!3156 lt!112333)) (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112329))))))))

(declare-fun res!57699 () Bool)

(declare-fun e!45590 () Bool)

(assert (=> start!13646 (=> (not res!57699) (not e!45590))))

(assert (=> start!13646 (= res!57699 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1353 srcBuffer!2))))))))

(assert (=> start!13646 e!45590))

(assert (=> start!13646 true))

(declare-fun array_inv!1211 (array!2910) Bool)

(assert (=> start!13646 (array_inv!1211 srcBuffer!2)))

(declare-fun e!45586 () Bool)

(declare-fun inv!12 (BitStream!2304) Bool)

(assert (=> start!13646 (and (inv!12 thiss!1379) e!45586)))

(declare-fun b!69887 () Bool)

(declare-fun e!45582 () Bool)

(assert (=> b!69887 (= e!45593 e!45582)))

(declare-fun res!57713 () Bool)

(assert (=> b!69887 (=> res!57713 e!45582)))

(declare-fun lt!112319 () Bool)

(assert (=> b!69887 (= res!57713 (not (= (head!546 (byteArrayBitContentToList!0 (_2!3156 lt!112329) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!112319)))))

(assert (=> b!69887 (= lt!112319 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!69888 () Bool)

(declare-fun e!45580 () Bool)

(assert (=> b!69888 (= e!45592 e!45580)))

(declare-fun res!57717 () Bool)

(assert (=> b!69888 (=> res!57717 e!45580)))

(assert (=> b!69888 (= res!57717 (not (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112329))))))

(assert (=> b!69888 (isPrefixOf!0 thiss!1379 (_2!3156 lt!112329))))

(declare-fun lt!112317 () Unit!4687)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2304 BitStream!2304 BitStream!2304) Unit!4687)

(assert (=> b!69888 (= lt!112317 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3156 lt!112333) (_2!3156 lt!112329)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2304 array!2910 (_ BitVec 64) (_ BitVec 64)) tuple2!6090)

(assert (=> b!69888 (= lt!112329 (appendBitsMSBFirstLoop!0 (_2!3156 lt!112333) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!69888 e!45581))

(declare-fun res!57708 () Bool)

(assert (=> b!69888 (=> (not res!57708) (not e!45581))))

(assert (=> b!69888 (= res!57708 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112328 () Unit!4687)

(assert (=> b!69888 (= lt!112328 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1734 (_2!3156 lt!112333)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69888 (= lt!112332 (reader!0 thiss!1379 (_2!3156 lt!112333)))))

(declare-fun b!69889 () Bool)

(declare-fun res!57712 () Bool)

(assert (=> b!69889 (=> res!57712 e!45589)))

(assert (=> b!69889 (= res!57712 (not (invariant!0 (currentBit!3437 (_2!3156 lt!112333)) (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112333))))))))

(declare-fun b!69890 () Bool)

(declare-fun res!57704 () Bool)

(declare-fun e!45585 () Bool)

(assert (=> b!69890 (=> res!57704 e!45585)))

(assert (=> b!69890 (= res!57704 (not (= (size!1353 (buf!1734 thiss!1379)) (size!1353 (buf!1734 (_2!3156 lt!112329))))))))

(declare-fun b!69891 () Bool)

(assert (=> b!69891 (= e!45580 e!45585)))

(declare-fun res!57701 () Bool)

(assert (=> b!69891 (=> res!57701 e!45585)))

(declare-fun lt!112336 () (_ BitVec 64))

(assert (=> b!69891 (= res!57701 (not (= lt!112336 (bvsub (bvadd lt!112327 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!69891 (= lt!112336 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112329))) (currentByte!3442 (_2!3156 lt!112329)) (currentBit!3437 (_2!3156 lt!112329))))))

(declare-fun b!69892 () Bool)

(declare-fun res!57714 () Bool)

(assert (=> b!69892 (=> res!57714 e!45585)))

(assert (=> b!69892 (= res!57714 (not (invariant!0 (currentBit!3437 (_2!3156 lt!112329)) (currentByte!3442 (_2!3156 lt!112329)) (size!1353 (buf!1734 (_2!3156 lt!112329))))))))

(declare-fun b!69893 () Bool)

(assert (=> b!69893 (= e!45583 e!45587)))

(declare-fun res!57709 () Bool)

(assert (=> b!69893 (=> res!57709 e!45587)))

(declare-fun lt!112316 () List!727)

(assert (=> b!69893 (= res!57709 (not (= lt!112316 lt!112331)))))

(assert (=> b!69893 (= lt!112331 lt!112316)))

(declare-fun tail!331 (List!727) List!727)

(assert (=> b!69893 (= lt!112316 (tail!331 lt!112326))))

(declare-fun lt!112320 () Unit!4687)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2304 BitStream!2304 BitStream!2304 BitStream!2304 (_ BitVec 64) List!727) Unit!4687)

(assert (=> b!69893 (= lt!112320 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3156 lt!112329) (_2!3156 lt!112329) (_1!3155 lt!112322) (_1!3155 lt!112323) (bvsub to!314 i!635) lt!112326))))

(declare-fun b!69894 () Bool)

(declare-fun res!57707 () Bool)

(assert (=> b!69894 (=> (not res!57707) (not e!45590))))

(assert (=> b!69894 (= res!57707 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 thiss!1379))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!69895 () Bool)

(assert (=> b!69895 (= e!45585 e!45589)))

(declare-fun res!57706 () Bool)

(assert (=> b!69895 (=> res!57706 e!45589)))

(assert (=> b!69895 (= res!57706 (not (= (size!1353 (buf!1734 (_2!3156 lt!112333))) (size!1353 (buf!1734 (_2!3156 lt!112329))))))))

(declare-fun lt!112324 () (_ BitVec 64))

(assert (=> b!69895 (= lt!112336 (bvsub (bvsub (bvadd lt!112324 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69895 (= lt!112324 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))))))

(assert (=> b!69895 (= (size!1353 (buf!1734 (_2!3156 lt!112329))) (size!1353 (buf!1734 thiss!1379)))))

(declare-fun b!69896 () Bool)

(assert (=> b!69896 (= e!45590 (not e!45588))))

(declare-fun res!57711 () Bool)

(assert (=> b!69896 (=> res!57711 e!45588)))

(assert (=> b!69896 (= res!57711 (bvsge i!635 to!314))))

(assert (=> b!69896 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!112334 () Unit!4687)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2304) Unit!4687)

(assert (=> b!69896 (= lt!112334 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!69896 (= lt!112327 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(declare-fun b!69897 () Bool)

(declare-fun res!57702 () Bool)

(assert (=> b!69897 (=> res!57702 e!45593)))

(assert (=> b!69897 (= res!57702 (not (= (head!546 lt!112326) lt!112318)))))

(declare-fun b!69898 () Bool)

(declare-fun res!57698 () Bool)

(assert (=> b!69898 (=> res!57698 e!45582)))

(assert (=> b!69898 (= res!57698 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!112324) (bvsgt lt!112324 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!112327) (bvsge lt!112327 lt!112324)))))

(declare-fun b!69899 () Bool)

(assert (=> b!69899 (= e!45586 (array_inv!1211 (buf!1734 thiss!1379)))))

(declare-fun b!69900 () Bool)

(declare-fun res!57705 () Bool)

(assert (=> b!69900 (=> res!57705 e!45582)))

(assert (=> b!69900 (= res!57705 (not (= (bitAt!0 (buf!1734 (_2!3156 lt!112333)) lt!112327) lt!112319)))))

(declare-fun b!69901 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2910 array!2910 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69901 (= e!45582 (arrayBitRangesEq!0 (buf!1734 (_2!3156 lt!112333)) (buf!1734 (_2!3156 lt!112329)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112324))))

(assert (= (and start!13646 res!57699) b!69894))

(assert (= (and b!69894 res!57707) b!69896))

(assert (= (and b!69896 (not res!57711)) b!69884))

(assert (= (and b!69884 (not res!57710)) b!69888))

(assert (= (and b!69888 res!57708) b!69882))

(assert (= (and b!69888 (not res!57717)) b!69891))

(assert (= (and b!69891 (not res!57701)) b!69892))

(assert (= (and b!69892 (not res!57714)) b!69890))

(assert (= (and b!69890 (not res!57704)) b!69895))

(assert (= (and b!69895 (not res!57706)) b!69889))

(assert (= (and b!69889 (not res!57712)) b!69886))

(assert (= (and b!69886 (not res!57716)) b!69881))

(assert (= (and b!69881 (not res!57700)) b!69885))

(assert (= (and b!69885 (not res!57715)) b!69893))

(assert (= (and b!69893 (not res!57709)) b!69883))

(assert (= (and b!69883 (not res!57703)) b!69897))

(assert (= (and b!69897 (not res!57702)) b!69887))

(assert (= (and b!69887 (not res!57713)) b!69900))

(assert (= (and b!69900 (not res!57705)) b!69898))

(assert (= (and b!69898 (not res!57698)) b!69901))

(assert (= start!13646 b!69899))

(declare-fun m!111845 () Bool)

(assert (=> b!69899 m!111845))

(declare-fun m!111847 () Bool)

(assert (=> start!13646 m!111847))

(declare-fun m!111849 () Bool)

(assert (=> start!13646 m!111849))

(declare-fun m!111851 () Bool)

(assert (=> b!69883 m!111851))

(declare-fun m!111853 () Bool)

(assert (=> b!69883 m!111853))

(declare-fun m!111855 () Bool)

(assert (=> b!69897 m!111855))

(declare-fun m!111857 () Bool)

(assert (=> b!69889 m!111857))

(declare-fun m!111859 () Bool)

(assert (=> b!69881 m!111859))

(declare-fun m!111861 () Bool)

(assert (=> b!69881 m!111861))

(declare-fun m!111863 () Bool)

(assert (=> b!69881 m!111863))

(declare-fun m!111865 () Bool)

(assert (=> b!69881 m!111865))

(declare-fun m!111867 () Bool)

(assert (=> b!69881 m!111867))

(declare-fun m!111869 () Bool)

(assert (=> b!69881 m!111869))

(declare-fun m!111871 () Bool)

(assert (=> b!69881 m!111871))

(declare-fun m!111873 () Bool)

(assert (=> b!69881 m!111873))

(declare-fun m!111875 () Bool)

(assert (=> b!69901 m!111875))

(declare-fun m!111877 () Bool)

(assert (=> b!69892 m!111877))

(declare-fun m!111879 () Bool)

(assert (=> b!69894 m!111879))

(declare-fun m!111881 () Bool)

(assert (=> b!69882 m!111881))

(assert (=> b!69882 m!111881))

(declare-fun m!111883 () Bool)

(assert (=> b!69882 m!111883))

(declare-fun m!111885 () Bool)

(assert (=> b!69882 m!111885))

(assert (=> b!69882 m!111885))

(declare-fun m!111887 () Bool)

(assert (=> b!69882 m!111887))

(declare-fun m!111889 () Bool)

(assert (=> b!69891 m!111889))

(declare-fun m!111891 () Bool)

(assert (=> b!69896 m!111891))

(declare-fun m!111893 () Bool)

(assert (=> b!69896 m!111893))

(declare-fun m!111895 () Bool)

(assert (=> b!69896 m!111895))

(declare-fun m!111897 () Bool)

(assert (=> b!69900 m!111897))

(declare-fun m!111899 () Bool)

(assert (=> b!69895 m!111899))

(declare-fun m!111901 () Bool)

(assert (=> b!69893 m!111901))

(declare-fun m!111903 () Bool)

(assert (=> b!69893 m!111903))

(declare-fun m!111905 () Bool)

(assert (=> b!69888 m!111905))

(declare-fun m!111907 () Bool)

(assert (=> b!69888 m!111907))

(declare-fun m!111909 () Bool)

(assert (=> b!69888 m!111909))

(declare-fun m!111911 () Bool)

(assert (=> b!69888 m!111911))

(declare-fun m!111913 () Bool)

(assert (=> b!69888 m!111913))

(declare-fun m!111915 () Bool)

(assert (=> b!69888 m!111915))

(declare-fun m!111917 () Bool)

(assert (=> b!69888 m!111917))

(declare-fun m!111919 () Bool)

(assert (=> b!69887 m!111919))

(assert (=> b!69887 m!111919))

(declare-fun m!111921 () Bool)

(assert (=> b!69887 m!111921))

(declare-fun m!111923 () Bool)

(assert (=> b!69887 m!111923))

(declare-fun m!111925 () Bool)

(assert (=> b!69884 m!111925))

(declare-fun m!111927 () Bool)

(assert (=> b!69884 m!111927))

(declare-fun m!111929 () Bool)

(assert (=> b!69884 m!111929))

(declare-fun m!111931 () Bool)

(assert (=> b!69884 m!111931))

(assert (=> b!69884 m!111927))

(declare-fun m!111933 () Bool)

(assert (=> b!69884 m!111933))

(declare-fun m!111935 () Bool)

(assert (=> b!69885 m!111935))

(declare-fun m!111937 () Bool)

(assert (=> b!69886 m!111937))

(check-sat (not b!69887) (not b!69885) (not b!69889) (not b!69892) (not b!69894) (not b!69895) (not b!69884) (not b!69891) (not b!69897) (not b!69901) (not b!69893) (not b!69899) (not b!69881) (not b!69900) (not b!69882) (not b!69896) (not b!69888) (not start!13646) (not b!69883) (not b!69886))
(check-sat)
(get-model)

(declare-fun d!22388 () Bool)

(assert (=> d!22388 (= (invariant!0 (currentBit!3437 (_2!3156 lt!112333)) (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112333)))) (and (bvsge (currentBit!3437 (_2!3156 lt!112333)) #b00000000000000000000000000000000) (bvslt (currentBit!3437 (_2!3156 lt!112333)) #b00000000000000000000000000001000) (bvsge (currentByte!3442 (_2!3156 lt!112333)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112333)))) (and (= (currentBit!3437 (_2!3156 lt!112333)) #b00000000000000000000000000000000) (= (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112333))))))))))

(assert (=> b!69889 d!22388))

(declare-fun d!22390 () Bool)

(assert (=> d!22390 (= (bitAt!0 (buf!1734 (_2!3156 lt!112333)) lt!112327) (not (= (bvand ((_ sign_extend 24) (select (arr!1935 (buf!1734 (_2!3156 lt!112333))) ((_ extract 31 0) (bvsdiv lt!112327 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112327 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5382 () Bool)

(assert (= bs!5382 d!22390))

(declare-fun m!112033 () Bool)

(assert (=> bs!5382 m!112033))

(declare-fun m!112035 () Bool)

(assert (=> bs!5382 m!112035))

(assert (=> b!69900 d!22390))

(declare-fun d!22392 () Bool)

(assert (=> d!22392 (= (array_inv!1211 (buf!1734 thiss!1379)) (bvsge (size!1353 (buf!1734 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!69899 d!22392))

(declare-fun b!69975 () Bool)

(declare-fun e!45641 () Bool)

(declare-fun lt!112453 () (_ BitVec 64))

(declare-fun lt!112458 () tuple2!6088)

(declare-fun lt!112447 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2304 (_ BitVec 64)) BitStream!2304)

(assert (=> b!69975 (= e!45641 (= (_1!3155 lt!112458) (withMovedBitIndex!0 (_2!3155 lt!112458) (bvsub lt!112453 lt!112447))))))

(assert (=> b!69975 (or (= (bvand lt!112453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112453 lt!112447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69975 (= lt!112447 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))))))

(assert (=> b!69975 (= lt!112453 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(declare-fun b!69976 () Bool)

(declare-fun res!57786 () Bool)

(assert (=> b!69976 (=> (not res!57786) (not e!45641))))

(assert (=> b!69976 (= res!57786 (isPrefixOf!0 (_1!3155 lt!112458) thiss!1379))))

(declare-fun d!22394 () Bool)

(assert (=> d!22394 e!45641))

(declare-fun res!57785 () Bool)

(assert (=> d!22394 (=> (not res!57785) (not e!45641))))

(assert (=> d!22394 (= res!57785 (isPrefixOf!0 (_1!3155 lt!112458) (_2!3155 lt!112458)))))

(declare-fun lt!112455 () BitStream!2304)

(assert (=> d!22394 (= lt!112458 (tuple2!6089 lt!112455 (_2!3156 lt!112333)))))

(declare-fun lt!112450 () Unit!4687)

(declare-fun lt!112452 () Unit!4687)

(assert (=> d!22394 (= lt!112450 lt!112452)))

(assert (=> d!22394 (isPrefixOf!0 lt!112455 (_2!3156 lt!112333))))

(assert (=> d!22394 (= lt!112452 (lemmaIsPrefixTransitive!0 lt!112455 (_2!3156 lt!112333) (_2!3156 lt!112333)))))

(declare-fun lt!112449 () Unit!4687)

(declare-fun lt!112442 () Unit!4687)

(assert (=> d!22394 (= lt!112449 lt!112442)))

(assert (=> d!22394 (isPrefixOf!0 lt!112455 (_2!3156 lt!112333))))

(assert (=> d!22394 (= lt!112442 (lemmaIsPrefixTransitive!0 lt!112455 thiss!1379 (_2!3156 lt!112333)))))

(declare-fun lt!112444 () Unit!4687)

(declare-fun e!45640 () Unit!4687)

(assert (=> d!22394 (= lt!112444 e!45640)))

(declare-fun c!5193 () Bool)

(assert (=> d!22394 (= c!5193 (not (= (size!1353 (buf!1734 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!112445 () Unit!4687)

(declare-fun lt!112440 () Unit!4687)

(assert (=> d!22394 (= lt!112445 lt!112440)))

(assert (=> d!22394 (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112333))))

(assert (=> d!22394 (= lt!112440 (lemmaIsPrefixRefl!0 (_2!3156 lt!112333)))))

(declare-fun lt!112456 () Unit!4687)

(declare-fun lt!112454 () Unit!4687)

(assert (=> d!22394 (= lt!112456 lt!112454)))

(assert (=> d!22394 (= lt!112454 (lemmaIsPrefixRefl!0 (_2!3156 lt!112333)))))

(declare-fun lt!112457 () Unit!4687)

(declare-fun lt!112441 () Unit!4687)

(assert (=> d!22394 (= lt!112457 lt!112441)))

(assert (=> d!22394 (isPrefixOf!0 lt!112455 lt!112455)))

(assert (=> d!22394 (= lt!112441 (lemmaIsPrefixRefl!0 lt!112455))))

(declare-fun lt!112459 () Unit!4687)

(declare-fun lt!112451 () Unit!4687)

(assert (=> d!22394 (= lt!112459 lt!112451)))

(assert (=> d!22394 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22394 (= lt!112451 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22394 (= lt!112455 (BitStream!2305 (buf!1734 (_2!3156 lt!112333)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(assert (=> d!22394 (isPrefixOf!0 thiss!1379 (_2!3156 lt!112333))))

(assert (=> d!22394 (= (reader!0 thiss!1379 (_2!3156 lt!112333)) lt!112458)))

(declare-fun b!69977 () Bool)

(declare-fun lt!112446 () Unit!4687)

(assert (=> b!69977 (= e!45640 lt!112446)))

(declare-fun lt!112443 () (_ BitVec 64))

(assert (=> b!69977 (= lt!112443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112448 () (_ BitVec 64))

(assert (=> b!69977 (= lt!112448 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2910 array!2910 (_ BitVec 64) (_ BitVec 64)) Unit!4687)

(assert (=> b!69977 (= lt!112446 (arrayBitRangesEqSymmetric!0 (buf!1734 thiss!1379) (buf!1734 (_2!3156 lt!112333)) lt!112443 lt!112448))))

(assert (=> b!69977 (arrayBitRangesEq!0 (buf!1734 (_2!3156 lt!112333)) (buf!1734 thiss!1379) lt!112443 lt!112448)))

(declare-fun b!69978 () Bool)

(declare-fun Unit!4691 () Unit!4687)

(assert (=> b!69978 (= e!45640 Unit!4691)))

(declare-fun b!69979 () Bool)

(declare-fun res!57784 () Bool)

(assert (=> b!69979 (=> (not res!57784) (not e!45641))))

(assert (=> b!69979 (= res!57784 (isPrefixOf!0 (_2!3155 lt!112458) (_2!3156 lt!112333)))))

(assert (= (and d!22394 c!5193) b!69977))

(assert (= (and d!22394 (not c!5193)) b!69978))

(assert (= (and d!22394 res!57785) b!69976))

(assert (= (and b!69976 res!57786) b!69979))

(assert (= (and b!69979 res!57784) b!69975))

(declare-fun m!112037 () Bool)

(assert (=> d!22394 m!112037))

(assert (=> d!22394 m!111893))

(declare-fun m!112039 () Bool)

(assert (=> d!22394 m!112039))

(assert (=> d!22394 m!111931))

(declare-fun m!112041 () Bool)

(assert (=> d!22394 m!112041))

(assert (=> d!22394 m!111891))

(declare-fun m!112043 () Bool)

(assert (=> d!22394 m!112043))

(declare-fun m!112045 () Bool)

(assert (=> d!22394 m!112045))

(declare-fun m!112047 () Bool)

(assert (=> d!22394 m!112047))

(declare-fun m!112049 () Bool)

(assert (=> d!22394 m!112049))

(declare-fun m!112051 () Bool)

(assert (=> d!22394 m!112051))

(declare-fun m!112053 () Bool)

(assert (=> b!69975 m!112053))

(assert (=> b!69975 m!111899))

(assert (=> b!69975 m!111895))

(declare-fun m!112055 () Bool)

(assert (=> b!69979 m!112055))

(declare-fun m!112057 () Bool)

(assert (=> b!69976 m!112057))

(assert (=> b!69977 m!111895))

(declare-fun m!112059 () Bool)

(assert (=> b!69977 m!112059))

(declare-fun m!112061 () Bool)

(assert (=> b!69977 m!112061))

(assert (=> b!69888 d!22394))

(declare-fun d!22396 () Bool)

(declare-fun res!57795 () Bool)

(declare-fun e!45647 () Bool)

(assert (=> d!22396 (=> (not res!57795) (not e!45647))))

(assert (=> d!22396 (= res!57795 (= (size!1353 (buf!1734 thiss!1379)) (size!1353 (buf!1734 (_2!3156 lt!112329)))))))

(assert (=> d!22396 (= (isPrefixOf!0 thiss!1379 (_2!3156 lt!112329)) e!45647)))

(declare-fun b!69986 () Bool)

(declare-fun res!57794 () Bool)

(assert (=> b!69986 (=> (not res!57794) (not e!45647))))

(assert (=> b!69986 (= res!57794 (bvsle (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)) (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112329))) (currentByte!3442 (_2!3156 lt!112329)) (currentBit!3437 (_2!3156 lt!112329)))))))

(declare-fun b!69987 () Bool)

(declare-fun e!45646 () Bool)

(assert (=> b!69987 (= e!45647 e!45646)))

(declare-fun res!57793 () Bool)

(assert (=> b!69987 (=> res!57793 e!45646)))

(assert (=> b!69987 (= res!57793 (= (size!1353 (buf!1734 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69988 () Bool)

(assert (=> b!69988 (= e!45646 (arrayBitRangesEq!0 (buf!1734 thiss!1379) (buf!1734 (_2!3156 lt!112329)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379))))))

(assert (= (and d!22396 res!57795) b!69986))

(assert (= (and b!69986 res!57794) b!69987))

(assert (= (and b!69987 (not res!57793)) b!69988))

(assert (=> b!69986 m!111895))

(assert (=> b!69986 m!111889))

(assert (=> b!69988 m!111895))

(assert (=> b!69988 m!111895))

(declare-fun m!112063 () Bool)

(assert (=> b!69988 m!112063))

(assert (=> b!69888 d!22396))

(declare-fun d!22398 () Bool)

(assert (=> d!22398 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!112462 () Unit!4687)

(declare-fun choose!9 (BitStream!2304 array!2910 (_ BitVec 64) BitStream!2304) Unit!4687)

(assert (=> d!22398 (= lt!112462 (choose!9 thiss!1379 (buf!1734 (_2!3156 lt!112333)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2305 (buf!1734 (_2!3156 lt!112333)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379))))))

(assert (=> d!22398 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1734 (_2!3156 lt!112333)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112462)))

(declare-fun bs!5383 () Bool)

(assert (= bs!5383 d!22398))

(assert (=> bs!5383 m!111905))

(declare-fun m!112065 () Bool)

(assert (=> bs!5383 m!112065))

(assert (=> b!69888 d!22398))

(declare-fun b!70187 () Bool)

(declare-fun lt!112795 () tuple2!6088)

(declare-fun lt!112792 () tuple2!6090)

(declare-fun e!45762 () Bool)

(assert (=> b!70187 (= e!45762 (= (bitStreamReadBitsIntoList!0 (_2!3156 lt!112792) (_1!3155 lt!112795) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3156 lt!112792) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!70187 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70187 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!112818 () Unit!4687)

(declare-fun lt!112805 () Unit!4687)

(assert (=> b!70187 (= lt!112818 lt!112805)))

(declare-fun lt!112811 () (_ BitVec 64))

(assert (=> b!70187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112792)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112811)))

(assert (=> b!70187 (= lt!112805 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3156 lt!112333) (buf!1734 (_2!3156 lt!112792)) lt!112811))))

(declare-fun e!45760 () Bool)

(assert (=> b!70187 e!45760))

(declare-fun res!57931 () Bool)

(assert (=> b!70187 (=> (not res!57931) (not e!45760))))

(assert (=> b!70187 (= res!57931 (and (= (size!1353 (buf!1734 (_2!3156 lt!112333))) (size!1353 (buf!1734 (_2!3156 lt!112792)))) (bvsge lt!112811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70187 (= lt!112811 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!70187 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70187 (= lt!112795 (reader!0 (_2!3156 lt!112333) (_2!3156 lt!112792)))))

(declare-fun b!70188 () Bool)

(declare-fun e!45761 () tuple2!6090)

(declare-fun Unit!4692 () Unit!4687)

(assert (=> b!70188 (= e!45761 (tuple2!6091 Unit!4692 (_2!3156 lt!112333)))))

(assert (=> b!70188 (= (size!1353 (buf!1734 (_2!3156 lt!112333))) (size!1353 (buf!1734 (_2!3156 lt!112333))))))

(declare-fun lt!112802 () Unit!4687)

(declare-fun Unit!4693 () Unit!4687)

(assert (=> b!70188 (= lt!112802 Unit!4693)))

(declare-fun call!904 () tuple2!6088)

(declare-fun checkByteArrayBitContent!0 (BitStream!2304 array!2910 array!2910 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!6096 0))(
  ( (tuple2!6097 (_1!3159 array!2910) (_2!3159 BitStream!2304)) )
))
(declare-fun readBits!0 (BitStream!2304 (_ BitVec 64)) tuple2!6096)

(assert (=> b!70188 (checkByteArrayBitContent!0 (_2!3156 lt!112333) srcBuffer!2 (_1!3159 (readBits!0 (_1!3155 call!904) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!22400 () Bool)

(assert (=> d!22400 e!45762))

(declare-fun res!57932 () Bool)

(assert (=> d!22400 (=> (not res!57932) (not e!45762))))

(declare-fun lt!112791 () (_ BitVec 64))

(assert (=> d!22400 (= res!57932 (= (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112792))) (currentByte!3442 (_2!3156 lt!112792)) (currentBit!3437 (_2!3156 lt!112792))) (bvsub lt!112791 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22400 (or (= (bvand lt!112791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112791 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!112797 () (_ BitVec 64))

(assert (=> d!22400 (= lt!112791 (bvadd lt!112797 to!314))))

(assert (=> d!22400 (or (not (= (bvand lt!112797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!112797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!112797 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22400 (= lt!112797 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))))))

(assert (=> d!22400 (= lt!112792 e!45761)))

(declare-fun c!5226 () Bool)

(assert (=> d!22400 (= c!5226 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!112817 () Unit!4687)

(declare-fun lt!112786 () Unit!4687)

(assert (=> d!22400 (= lt!112817 lt!112786)))

(assert (=> d!22400 (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112333))))

(assert (=> d!22400 (= lt!112786 (lemmaIsPrefixRefl!0 (_2!3156 lt!112333)))))

(declare-fun lt!112785 () (_ BitVec 64))

(assert (=> d!22400 (= lt!112785 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))))))

(assert (=> d!22400 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22400 (= (appendBitsMSBFirstLoop!0 (_2!3156 lt!112333) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!112792)))

(declare-fun b!70189 () Bool)

(declare-fun lt!112800 () tuple2!6090)

(declare-fun Unit!4694 () Unit!4687)

(assert (=> b!70189 (= e!45761 (tuple2!6091 Unit!4694 (_2!3156 lt!112800)))))

(declare-fun lt!112822 () tuple2!6090)

(assert (=> b!70189 (= lt!112822 (appendBitFromByte!0 (_2!3156 lt!112333) (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!112783 () (_ BitVec 64))

(assert (=> b!70189 (= lt!112783 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!112781 () (_ BitVec 64))

(assert (=> b!70189 (= lt!112781 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!112790 () Unit!4687)

(assert (=> b!70189 (= lt!112790 (validateOffsetBitsIneqLemma!0 (_2!3156 lt!112333) (_2!3156 lt!112822) lt!112783 lt!112781))))

(assert (=> b!70189 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112822)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112822))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112822))) (bvsub lt!112783 lt!112781))))

(declare-fun lt!112808 () Unit!4687)

(assert (=> b!70189 (= lt!112808 lt!112790)))

(declare-fun lt!112799 () tuple2!6088)

(assert (=> b!70189 (= lt!112799 (reader!0 (_2!3156 lt!112333) (_2!3156 lt!112822)))))

(declare-fun lt!112807 () (_ BitVec 64))

(assert (=> b!70189 (= lt!112807 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!112806 () Unit!4687)

(assert (=> b!70189 (= lt!112806 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3156 lt!112333) (buf!1734 (_2!3156 lt!112822)) lt!112807))))

(assert (=> b!70189 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112822)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112807)))

(declare-fun lt!112782 () Unit!4687)

(assert (=> b!70189 (= lt!112782 lt!112806)))

(assert (=> b!70189 (= (head!546 (byteArrayBitContentToList!0 (_2!3156 lt!112822) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!546 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112822) (_1!3155 lt!112799) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!112803 () Unit!4687)

(declare-fun Unit!4695 () Unit!4687)

(assert (=> b!70189 (= lt!112803 Unit!4695)))

(assert (=> b!70189 (= lt!112800 (appendBitsMSBFirstLoop!0 (_2!3156 lt!112822) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!112789 () Unit!4687)

(assert (=> b!70189 (= lt!112789 (lemmaIsPrefixTransitive!0 (_2!3156 lt!112333) (_2!3156 lt!112822) (_2!3156 lt!112800)))))

(assert (=> b!70189 (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112800))))

(declare-fun lt!112814 () Unit!4687)

(assert (=> b!70189 (= lt!112814 lt!112789)))

(assert (=> b!70189 (= (size!1353 (buf!1734 (_2!3156 lt!112800))) (size!1353 (buf!1734 (_2!3156 lt!112333))))))

(declare-fun lt!112794 () Unit!4687)

(declare-fun Unit!4696 () Unit!4687)

(assert (=> b!70189 (= lt!112794 Unit!4696)))

(assert (=> b!70189 (= (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112800))) (currentByte!3442 (_2!3156 lt!112800)) (currentBit!3437 (_2!3156 lt!112800))) (bvsub (bvadd (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!112784 () Unit!4687)

(declare-fun Unit!4697 () Unit!4687)

(assert (=> b!70189 (= lt!112784 Unit!4697)))

(assert (=> b!70189 (= (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112800))) (currentByte!3442 (_2!3156 lt!112800)) (currentBit!3437 (_2!3156 lt!112800))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112822))) (currentByte!3442 (_2!3156 lt!112822)) (currentBit!3437 (_2!3156 lt!112822))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112793 () Unit!4687)

(declare-fun Unit!4698 () Unit!4687)

(assert (=> b!70189 (= lt!112793 Unit!4698)))

(declare-fun lt!112798 () tuple2!6088)

(assert (=> b!70189 (= lt!112798 call!904)))

(declare-fun lt!112810 () (_ BitVec 64))

(assert (=> b!70189 (= lt!112810 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!112779 () Unit!4687)

(assert (=> b!70189 (= lt!112779 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3156 lt!112333) (buf!1734 (_2!3156 lt!112800)) lt!112810))))

(assert (=> b!70189 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112800)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112810)))

(declare-fun lt!112815 () Unit!4687)

(assert (=> b!70189 (= lt!112815 lt!112779)))

(declare-fun lt!112796 () tuple2!6088)

(assert (=> b!70189 (= lt!112796 (reader!0 (_2!3156 lt!112822) (_2!3156 lt!112800)))))

(declare-fun lt!112819 () (_ BitVec 64))

(assert (=> b!70189 (= lt!112819 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112809 () Unit!4687)

(assert (=> b!70189 (= lt!112809 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3156 lt!112822) (buf!1734 (_2!3156 lt!112800)) lt!112819))))

(assert (=> b!70189 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112800)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112822))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112822))) lt!112819)))

(declare-fun lt!112820 () Unit!4687)

(assert (=> b!70189 (= lt!112820 lt!112809)))

(declare-fun lt!112780 () List!727)

(assert (=> b!70189 (= lt!112780 (byteArrayBitContentToList!0 (_2!3156 lt!112800) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!112801 () List!727)

(assert (=> b!70189 (= lt!112801 (byteArrayBitContentToList!0 (_2!3156 lt!112800) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!112804 () List!727)

(assert (=> b!70189 (= lt!112804 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112800) (_1!3155 lt!112798) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!112787 () List!727)

(assert (=> b!70189 (= lt!112787 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112800) (_1!3155 lt!112796) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!112788 () (_ BitVec 64))

(assert (=> b!70189 (= lt!112788 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!112816 () Unit!4687)

(assert (=> b!70189 (= lt!112816 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3156 lt!112800) (_2!3156 lt!112800) (_1!3155 lt!112798) (_1!3155 lt!112796) lt!112788 lt!112804))))

(assert (=> b!70189 (= (bitStreamReadBitsIntoList!0 (_2!3156 lt!112800) (_1!3155 lt!112796) (bvsub lt!112788 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!331 lt!112804))))

(declare-fun lt!112813 () Unit!4687)

(assert (=> b!70189 (= lt!112813 lt!112816)))

(declare-fun lt!112821 () Unit!4687)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2910 array!2910 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4687)

(assert (=> b!70189 (= lt!112821 (arrayBitRangesEqImpliesEq!0 (buf!1734 (_2!3156 lt!112822)) (buf!1734 (_2!3156 lt!112800)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112785 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112822))) (currentByte!3442 (_2!3156 lt!112822)) (currentBit!3437 (_2!3156 lt!112822)))))))

(assert (=> b!70189 (= (bitAt!0 (buf!1734 (_2!3156 lt!112822)) lt!112785) (bitAt!0 (buf!1734 (_2!3156 lt!112800)) lt!112785))))

(declare-fun lt!112812 () Unit!4687)

(assert (=> b!70189 (= lt!112812 lt!112821)))

(declare-fun b!70190 () Bool)

(declare-fun res!57930 () Bool)

(assert (=> b!70190 (=> (not res!57930) (not e!45762))))

(assert (=> b!70190 (= res!57930 (= (size!1353 (buf!1734 (_2!3156 lt!112792))) (size!1353 (buf!1734 (_2!3156 lt!112333)))))))

(declare-fun b!70191 () Bool)

(declare-fun res!57933 () Bool)

(assert (=> b!70191 (=> (not res!57933) (not e!45762))))

(assert (=> b!70191 (= res!57933 (invariant!0 (currentBit!3437 (_2!3156 lt!112792)) (currentByte!3442 (_2!3156 lt!112792)) (size!1353 (buf!1734 (_2!3156 lt!112792)))))))

(declare-fun b!70192 () Bool)

(declare-fun res!57928 () Bool)

(assert (=> b!70192 (=> (not res!57928) (not e!45762))))

(assert (=> b!70192 (= res!57928 (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112792)))))

(declare-fun b!70193 () Bool)

(declare-fun res!57929 () Bool)

(assert (=> b!70193 (=> (not res!57929) (not e!45762))))

(assert (=> b!70193 (= res!57929 (= (size!1353 (buf!1734 (_2!3156 lt!112333))) (size!1353 (buf!1734 (_2!3156 lt!112792)))))))

(declare-fun b!70194 () Bool)

(assert (=> b!70194 (= e!45760 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112811))))

(declare-fun bm!901 () Bool)

(assert (=> bm!901 (= call!904 (reader!0 (_2!3156 lt!112333) (ite c!5226 (_2!3156 lt!112800) (_2!3156 lt!112333))))))

(assert (= (and d!22400 c!5226) b!70189))

(assert (= (and d!22400 (not c!5226)) b!70188))

(assert (= (or b!70189 b!70188) bm!901))

(assert (= (and d!22400 res!57932) b!70191))

(assert (= (and b!70191 res!57933) b!70193))

(assert (= (and b!70193 res!57929) b!70192))

(assert (= (and b!70192 res!57928) b!70190))

(assert (= (and b!70190 res!57930) b!70187))

(assert (= (and b!70187 res!57931) b!70194))

(declare-fun m!112287 () Bool)

(assert (=> d!22400 m!112287))

(assert (=> d!22400 m!111899))

(assert (=> d!22400 m!112047))

(assert (=> d!22400 m!112043))

(declare-fun m!112289 () Bool)

(assert (=> b!70192 m!112289))

(declare-fun m!112291 () Bool)

(assert (=> bm!901 m!112291))

(declare-fun m!112293 () Bool)

(assert (=> b!70194 m!112293))

(assert (=> b!70189 m!111899))

(declare-fun m!112295 () Bool)

(assert (=> b!70189 m!112295))

(declare-fun m!112297 () Bool)

(assert (=> b!70189 m!112297))

(declare-fun m!112299 () Bool)

(assert (=> b!70189 m!112299))

(declare-fun m!112301 () Bool)

(assert (=> b!70189 m!112301))

(declare-fun m!112303 () Bool)

(assert (=> b!70189 m!112303))

(declare-fun m!112305 () Bool)

(assert (=> b!70189 m!112305))

(declare-fun m!112307 () Bool)

(assert (=> b!70189 m!112307))

(declare-fun m!112309 () Bool)

(assert (=> b!70189 m!112309))

(declare-fun m!112311 () Bool)

(assert (=> b!70189 m!112311))

(declare-fun m!112313 () Bool)

(assert (=> b!70189 m!112313))

(assert (=> b!70189 m!112305))

(declare-fun m!112315 () Bool)

(assert (=> b!70189 m!112315))

(declare-fun m!112317 () Bool)

(assert (=> b!70189 m!112317))

(declare-fun m!112319 () Bool)

(assert (=> b!70189 m!112319))

(declare-fun m!112321 () Bool)

(assert (=> b!70189 m!112321))

(assert (=> b!70189 m!112317))

(declare-fun m!112323 () Bool)

(assert (=> b!70189 m!112323))

(declare-fun m!112325 () Bool)

(assert (=> b!70189 m!112325))

(declare-fun m!112327 () Bool)

(assert (=> b!70189 m!112327))

(declare-fun m!112329 () Bool)

(assert (=> b!70189 m!112329))

(assert (=> b!70189 m!112295))

(declare-fun m!112331 () Bool)

(assert (=> b!70189 m!112331))

(declare-fun m!112333 () Bool)

(assert (=> b!70189 m!112333))

(declare-fun m!112335 () Bool)

(assert (=> b!70189 m!112335))

(declare-fun m!112337 () Bool)

(assert (=> b!70189 m!112337))

(declare-fun m!112339 () Bool)

(assert (=> b!70189 m!112339))

(declare-fun m!112341 () Bool)

(assert (=> b!70189 m!112341))

(assert (=> b!70189 m!112329))

(declare-fun m!112343 () Bool)

(assert (=> b!70189 m!112343))

(declare-fun m!112345 () Bool)

(assert (=> b!70189 m!112345))

(declare-fun m!112347 () Bool)

(assert (=> b!70189 m!112347))

(declare-fun m!112349 () Bool)

(assert (=> b!70189 m!112349))

(declare-fun m!112351 () Bool)

(assert (=> b!70189 m!112351))

(declare-fun m!112353 () Bool)

(assert (=> b!70189 m!112353))

(declare-fun m!112355 () Bool)

(assert (=> b!70189 m!112355))

(declare-fun m!112357 () Bool)

(assert (=> b!70188 m!112357))

(declare-fun m!112359 () Bool)

(assert (=> b!70188 m!112359))

(declare-fun m!112361 () Bool)

(assert (=> b!70191 m!112361))

(declare-fun m!112363 () Bool)

(assert (=> b!70187 m!112363))

(declare-fun m!112365 () Bool)

(assert (=> b!70187 m!112365))

(declare-fun m!112367 () Bool)

(assert (=> b!70187 m!112367))

(declare-fun m!112369 () Bool)

(assert (=> b!70187 m!112369))

(declare-fun m!112371 () Bool)

(assert (=> b!70187 m!112371))

(assert (=> b!69888 d!22400))

(declare-fun d!22506 () Bool)

(assert (=> d!22506 (isPrefixOf!0 thiss!1379 (_2!3156 lt!112329))))

(declare-fun lt!112825 () Unit!4687)

(declare-fun choose!30 (BitStream!2304 BitStream!2304 BitStream!2304) Unit!4687)

(assert (=> d!22506 (= lt!112825 (choose!30 thiss!1379 (_2!3156 lt!112333) (_2!3156 lt!112329)))))

(assert (=> d!22506 (isPrefixOf!0 thiss!1379 (_2!3156 lt!112333))))

(assert (=> d!22506 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3156 lt!112333) (_2!3156 lt!112329)) lt!112825)))

(declare-fun bs!5399 () Bool)

(assert (= bs!5399 d!22506))

(assert (=> bs!5399 m!111909))

(declare-fun m!112373 () Bool)

(assert (=> bs!5399 m!112373))

(assert (=> bs!5399 m!111931))

(assert (=> b!69888 d!22506))

(declare-fun d!22508 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22508 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5400 () Bool)

(assert (= bs!5400 d!22508))

(declare-fun m!112375 () Bool)

(assert (=> bs!5400 m!112375))

(assert (=> b!69888 d!22508))

(declare-fun d!22510 () Bool)

(declare-fun res!57936 () Bool)

(declare-fun e!45764 () Bool)

(assert (=> d!22510 (=> (not res!57936) (not e!45764))))

(assert (=> d!22510 (= res!57936 (= (size!1353 (buf!1734 (_2!3156 lt!112333))) (size!1353 (buf!1734 (_2!3156 lt!112329)))))))

(assert (=> d!22510 (= (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112329)) e!45764)))

(declare-fun b!70195 () Bool)

(declare-fun res!57935 () Bool)

(assert (=> b!70195 (=> (not res!57935) (not e!45764))))

(assert (=> b!70195 (= res!57935 (bvsle (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))) (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112329))) (currentByte!3442 (_2!3156 lt!112329)) (currentBit!3437 (_2!3156 lt!112329)))))))

(declare-fun b!70196 () Bool)

(declare-fun e!45763 () Bool)

(assert (=> b!70196 (= e!45764 e!45763)))

(declare-fun res!57934 () Bool)

(assert (=> b!70196 (=> res!57934 e!45763)))

(assert (=> b!70196 (= res!57934 (= (size!1353 (buf!1734 (_2!3156 lt!112333))) #b00000000000000000000000000000000))))

(declare-fun b!70197 () Bool)

(assert (=> b!70197 (= e!45763 (arrayBitRangesEq!0 (buf!1734 (_2!3156 lt!112333)) (buf!1734 (_2!3156 lt!112329)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333)))))))

(assert (= (and d!22510 res!57936) b!70195))

(assert (= (and b!70195 res!57935) b!70196))

(assert (= (and b!70196 (not res!57934)) b!70197))

(assert (=> b!70195 m!111899))

(assert (=> b!70195 m!111889))

(assert (=> b!70197 m!111899))

(assert (=> b!70197 m!111899))

(declare-fun m!112377 () Bool)

(assert (=> b!70197 m!112377))

(assert (=> b!69888 d!22510))

(declare-fun d!22512 () Bool)

(assert (=> d!22512 (= (head!546 (byteArrayBitContentToList!0 (_2!3156 lt!112333) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!842 (byteArrayBitContentToList!0 (_2!3156 lt!112333) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69882 d!22512))

(declare-fun d!22514 () Bool)

(declare-fun c!5229 () Bool)

(assert (=> d!22514 (= c!5229 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45767 () List!727)

(assert (=> d!22514 (= (byteArrayBitContentToList!0 (_2!3156 lt!112333) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45767)))

(declare-fun b!70202 () Bool)

(assert (=> b!70202 (= e!45767 Nil!724)))

(declare-fun b!70203 () Bool)

(assert (=> b!70203 (= e!45767 (Cons!723 (not (= (bvand ((_ sign_extend 24) (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3156 lt!112333) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22514 c!5229) b!70202))

(assert (= (and d!22514 (not c!5229)) b!70203))

(assert (=> b!70203 m!111927))

(declare-fun m!112379 () Bool)

(assert (=> b!70203 m!112379))

(declare-fun m!112381 () Bool)

(assert (=> b!70203 m!112381))

(assert (=> b!69882 d!22514))

(declare-fun d!22516 () Bool)

(assert (=> d!22516 (= (head!546 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112333) (_1!3155 lt!112332) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!842 (bitStreamReadBitsIntoList!0 (_2!3156 lt!112333) (_1!3155 lt!112332) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69882 d!22516))

(declare-datatypes ((tuple2!6098 0))(
  ( (tuple2!6099 (_1!3160 Bool) (_2!3160 BitStream!2304)) )
))
(declare-fun lt!112834 () tuple2!6098)

(declare-datatypes ((tuple2!6100 0))(
  ( (tuple2!6101 (_1!3161 List!727) (_2!3161 BitStream!2304)) )
))
(declare-fun e!45773 () tuple2!6100)

(declare-fun lt!112833 () (_ BitVec 64))

(declare-fun b!70213 () Bool)

(assert (=> b!70213 (= e!45773 (tuple2!6101 (Cons!723 (_1!3160 lt!112834) (bitStreamReadBitsIntoList!0 (_2!3156 lt!112333) (_2!3160 lt!112834) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!112833))) (_2!3160 lt!112834)))))

(declare-fun readBit!0 (BitStream!2304) tuple2!6098)

(assert (=> b!70213 (= lt!112834 (readBit!0 (_1!3155 lt!112332)))))

(assert (=> b!70213 (= lt!112833 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70214 () Bool)

(declare-fun e!45772 () Bool)

(declare-fun lt!112832 () List!727)

(declare-fun isEmpty!225 (List!727) Bool)

(assert (=> b!70214 (= e!45772 (isEmpty!225 lt!112832))))

(declare-fun d!22518 () Bool)

(assert (=> d!22518 e!45772))

(declare-fun c!5234 () Bool)

(assert (=> d!22518 (= c!5234 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22518 (= lt!112832 (_1!3161 e!45773))))

(declare-fun c!5235 () Bool)

(assert (=> d!22518 (= c!5235 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22518 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22518 (= (bitStreamReadBitsIntoList!0 (_2!3156 lt!112333) (_1!3155 lt!112332) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112832)))

(declare-fun b!70215 () Bool)

(assert (=> b!70215 (= e!45772 (> (length!355 lt!112832) 0))))

(declare-fun b!70212 () Bool)

(assert (=> b!70212 (= e!45773 (tuple2!6101 Nil!724 (_1!3155 lt!112332)))))

(assert (= (and d!22518 c!5235) b!70212))

(assert (= (and d!22518 (not c!5235)) b!70213))

(assert (= (and d!22518 c!5234) b!70214))

(assert (= (and d!22518 (not c!5234)) b!70215))

(declare-fun m!112383 () Bool)

(assert (=> b!70213 m!112383))

(declare-fun m!112385 () Bool)

(assert (=> b!70213 m!112385))

(declare-fun m!112387 () Bool)

(assert (=> b!70214 m!112387))

(declare-fun m!112389 () Bool)

(assert (=> b!70215 m!112389))

(assert (=> b!69882 d!22518))

(declare-fun d!22520 () Bool)

(assert (=> d!22520 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112330)))

(declare-fun lt!112835 () Unit!4687)

(assert (=> d!22520 (= lt!112835 (choose!9 (_2!3156 lt!112333) (buf!1734 (_2!3156 lt!112329)) lt!112330 (BitStream!2305 (buf!1734 (_2!3156 lt!112329)) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333)))))))

(assert (=> d!22520 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3156 lt!112333) (buf!1734 (_2!3156 lt!112329)) lt!112330) lt!112835)))

(declare-fun bs!5401 () Bool)

(assert (= bs!5401 d!22520))

(assert (=> bs!5401 m!111865))

(declare-fun m!112391 () Bool)

(assert (=> bs!5401 m!112391))

(assert (=> b!69881 d!22520))

(declare-fun lt!112849 () (_ BitVec 64))

(declare-fun lt!112843 () (_ BitVec 64))

(declare-fun lt!112854 () tuple2!6088)

(declare-fun e!45775 () Bool)

(declare-fun b!70216 () Bool)

(assert (=> b!70216 (= e!45775 (= (_1!3155 lt!112854) (withMovedBitIndex!0 (_2!3155 lt!112854) (bvsub lt!112849 lt!112843))))))

(assert (=> b!70216 (or (= (bvand lt!112849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112843 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112849 lt!112843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70216 (= lt!112843 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112329))) (currentByte!3442 (_2!3156 lt!112329)) (currentBit!3437 (_2!3156 lt!112329))))))

(assert (=> b!70216 (= lt!112849 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(declare-fun b!70217 () Bool)

(declare-fun res!57939 () Bool)

(assert (=> b!70217 (=> (not res!57939) (not e!45775))))

(assert (=> b!70217 (= res!57939 (isPrefixOf!0 (_1!3155 lt!112854) thiss!1379))))

(declare-fun d!22522 () Bool)

(assert (=> d!22522 e!45775))

(declare-fun res!57938 () Bool)

(assert (=> d!22522 (=> (not res!57938) (not e!45775))))

(assert (=> d!22522 (= res!57938 (isPrefixOf!0 (_1!3155 lt!112854) (_2!3155 lt!112854)))))

(declare-fun lt!112851 () BitStream!2304)

(assert (=> d!22522 (= lt!112854 (tuple2!6089 lt!112851 (_2!3156 lt!112329)))))

(declare-fun lt!112846 () Unit!4687)

(declare-fun lt!112848 () Unit!4687)

(assert (=> d!22522 (= lt!112846 lt!112848)))

(assert (=> d!22522 (isPrefixOf!0 lt!112851 (_2!3156 lt!112329))))

(assert (=> d!22522 (= lt!112848 (lemmaIsPrefixTransitive!0 lt!112851 (_2!3156 lt!112329) (_2!3156 lt!112329)))))

(declare-fun lt!112845 () Unit!4687)

(declare-fun lt!112838 () Unit!4687)

(assert (=> d!22522 (= lt!112845 lt!112838)))

(assert (=> d!22522 (isPrefixOf!0 lt!112851 (_2!3156 lt!112329))))

(assert (=> d!22522 (= lt!112838 (lemmaIsPrefixTransitive!0 lt!112851 thiss!1379 (_2!3156 lt!112329)))))

(declare-fun lt!112840 () Unit!4687)

(declare-fun e!45774 () Unit!4687)

(assert (=> d!22522 (= lt!112840 e!45774)))

(declare-fun c!5236 () Bool)

(assert (=> d!22522 (= c!5236 (not (= (size!1353 (buf!1734 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!112841 () Unit!4687)

(declare-fun lt!112836 () Unit!4687)

(assert (=> d!22522 (= lt!112841 lt!112836)))

(assert (=> d!22522 (isPrefixOf!0 (_2!3156 lt!112329) (_2!3156 lt!112329))))

(assert (=> d!22522 (= lt!112836 (lemmaIsPrefixRefl!0 (_2!3156 lt!112329)))))

(declare-fun lt!112852 () Unit!4687)

(declare-fun lt!112850 () Unit!4687)

(assert (=> d!22522 (= lt!112852 lt!112850)))

(assert (=> d!22522 (= lt!112850 (lemmaIsPrefixRefl!0 (_2!3156 lt!112329)))))

(declare-fun lt!112853 () Unit!4687)

(declare-fun lt!112837 () Unit!4687)

(assert (=> d!22522 (= lt!112853 lt!112837)))

(assert (=> d!22522 (isPrefixOf!0 lt!112851 lt!112851)))

(assert (=> d!22522 (= lt!112837 (lemmaIsPrefixRefl!0 lt!112851))))

(declare-fun lt!112855 () Unit!4687)

(declare-fun lt!112847 () Unit!4687)

(assert (=> d!22522 (= lt!112855 lt!112847)))

(assert (=> d!22522 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22522 (= lt!112847 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22522 (= lt!112851 (BitStream!2305 (buf!1734 (_2!3156 lt!112329)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(assert (=> d!22522 (isPrefixOf!0 thiss!1379 (_2!3156 lt!112329))))

(assert (=> d!22522 (= (reader!0 thiss!1379 (_2!3156 lt!112329)) lt!112854)))

(declare-fun b!70218 () Bool)

(declare-fun lt!112842 () Unit!4687)

(assert (=> b!70218 (= e!45774 lt!112842)))

(declare-fun lt!112839 () (_ BitVec 64))

(assert (=> b!70218 (= lt!112839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112844 () (_ BitVec 64))

(assert (=> b!70218 (= lt!112844 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(assert (=> b!70218 (= lt!112842 (arrayBitRangesEqSymmetric!0 (buf!1734 thiss!1379) (buf!1734 (_2!3156 lt!112329)) lt!112839 lt!112844))))

(assert (=> b!70218 (arrayBitRangesEq!0 (buf!1734 (_2!3156 lt!112329)) (buf!1734 thiss!1379) lt!112839 lt!112844)))

(declare-fun b!70219 () Bool)

(declare-fun Unit!4699 () Unit!4687)

(assert (=> b!70219 (= e!45774 Unit!4699)))

(declare-fun b!70220 () Bool)

(declare-fun res!57937 () Bool)

(assert (=> b!70220 (=> (not res!57937) (not e!45775))))

(assert (=> b!70220 (= res!57937 (isPrefixOf!0 (_2!3155 lt!112854) (_2!3156 lt!112329)))))

(assert (= (and d!22522 c!5236) b!70218))

(assert (= (and d!22522 (not c!5236)) b!70219))

(assert (= (and d!22522 res!57938) b!70217))

(assert (= (and b!70217 res!57939) b!70220))

(assert (= (and b!70220 res!57937) b!70216))

(declare-fun m!112393 () Bool)

(assert (=> d!22522 m!112393))

(assert (=> d!22522 m!111893))

(declare-fun m!112395 () Bool)

(assert (=> d!22522 m!112395))

(assert (=> d!22522 m!111909))

(declare-fun m!112397 () Bool)

(assert (=> d!22522 m!112397))

(assert (=> d!22522 m!111891))

(declare-fun m!112399 () Bool)

(assert (=> d!22522 m!112399))

(declare-fun m!112401 () Bool)

(assert (=> d!22522 m!112401))

(declare-fun m!112403 () Bool)

(assert (=> d!22522 m!112403))

(declare-fun m!112405 () Bool)

(assert (=> d!22522 m!112405))

(declare-fun m!112407 () Bool)

(assert (=> d!22522 m!112407))

(declare-fun m!112409 () Bool)

(assert (=> b!70216 m!112409))

(assert (=> b!70216 m!111889))

(assert (=> b!70216 m!111895))

(declare-fun m!112411 () Bool)

(assert (=> b!70220 m!112411))

(declare-fun m!112413 () Bool)

(assert (=> b!70217 m!112413))

(assert (=> b!70218 m!111895))

(declare-fun m!112415 () Bool)

(assert (=> b!70218 m!112415))

(declare-fun m!112417 () Bool)

(assert (=> b!70218 m!112417))

(assert (=> b!69881 d!22522))

(declare-fun d!22524 () Bool)

(assert (=> d!22524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!112856 () Unit!4687)

(assert (=> d!22524 (= lt!112856 (choose!9 thiss!1379 (buf!1734 (_2!3156 lt!112329)) (bvsub to!314 i!635) (BitStream!2305 (buf!1734 (_2!3156 lt!112329)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379))))))

(assert (=> d!22524 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1734 (_2!3156 lt!112329)) (bvsub to!314 i!635)) lt!112856)))

(declare-fun bs!5402 () Bool)

(assert (= bs!5402 d!22524))

(assert (=> bs!5402 m!111873))

(declare-fun m!112419 () Bool)

(assert (=> bs!5402 m!112419))

(assert (=> b!69881 d!22524))

(declare-fun lt!112858 () (_ BitVec 64))

(declare-fun e!45777 () tuple2!6100)

(declare-fun lt!112859 () tuple2!6098)

(declare-fun b!70222 () Bool)

(assert (=> b!70222 (= e!45777 (tuple2!6101 (Cons!723 (_1!3160 lt!112859) (bitStreamReadBitsIntoList!0 (_2!3156 lt!112329) (_2!3160 lt!112859) (bvsub (bvsub to!314 i!635) lt!112858))) (_2!3160 lt!112859)))))

(assert (=> b!70222 (= lt!112859 (readBit!0 (_1!3155 lt!112322)))))

(assert (=> b!70222 (= lt!112858 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70223 () Bool)

(declare-fun e!45776 () Bool)

(declare-fun lt!112857 () List!727)

(assert (=> b!70223 (= e!45776 (isEmpty!225 lt!112857))))

(declare-fun d!22526 () Bool)

(assert (=> d!22526 e!45776))

(declare-fun c!5237 () Bool)

(assert (=> d!22526 (= c!5237 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22526 (= lt!112857 (_1!3161 e!45777))))

(declare-fun c!5238 () Bool)

(assert (=> d!22526 (= c!5238 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22526 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22526 (= (bitStreamReadBitsIntoList!0 (_2!3156 lt!112329) (_1!3155 lt!112322) (bvsub to!314 i!635)) lt!112857)))

(declare-fun b!70224 () Bool)

(assert (=> b!70224 (= e!45776 (> (length!355 lt!112857) 0))))

(declare-fun b!70221 () Bool)

(assert (=> b!70221 (= e!45777 (tuple2!6101 Nil!724 (_1!3155 lt!112322)))))

(assert (= (and d!22526 c!5238) b!70221))

(assert (= (and d!22526 (not c!5238)) b!70222))

(assert (= (and d!22526 c!5237) b!70223))

(assert (= (and d!22526 (not c!5237)) b!70224))

(declare-fun m!112421 () Bool)

(assert (=> b!70222 m!112421))

(declare-fun m!112423 () Bool)

(assert (=> b!70222 m!112423))

(declare-fun m!112425 () Bool)

(assert (=> b!70223 m!112425))

(declare-fun m!112427 () Bool)

(assert (=> b!70224 m!112427))

(assert (=> b!69881 d!22526))

(declare-fun d!22528 () Bool)

(assert (=> d!22528 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112330) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333)))) lt!112330))))

(declare-fun bs!5403 () Bool)

(assert (= bs!5403 d!22528))

(declare-fun m!112429 () Bool)

(assert (=> bs!5403 m!112429))

(assert (=> b!69881 d!22528))

(declare-fun d!22530 () Bool)

(assert (=> d!22530 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5404 () Bool)

(assert (= bs!5404 d!22530))

(declare-fun m!112431 () Bool)

(assert (=> bs!5404 m!112431))

(assert (=> b!69881 d!22530))

(declare-fun lt!112873 () (_ BitVec 64))

(declare-fun lt!112878 () tuple2!6088)

(declare-fun e!45779 () Bool)

(declare-fun lt!112867 () (_ BitVec 64))

(declare-fun b!70225 () Bool)

(assert (=> b!70225 (= e!45779 (= (_1!3155 lt!112878) (withMovedBitIndex!0 (_2!3155 lt!112878) (bvsub lt!112873 lt!112867))))))

(assert (=> b!70225 (or (= (bvand lt!112873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112873 lt!112867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70225 (= lt!112867 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112329))) (currentByte!3442 (_2!3156 lt!112329)) (currentBit!3437 (_2!3156 lt!112329))))))

(assert (=> b!70225 (= lt!112873 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))))))

(declare-fun b!70226 () Bool)

(declare-fun res!57942 () Bool)

(assert (=> b!70226 (=> (not res!57942) (not e!45779))))

(assert (=> b!70226 (= res!57942 (isPrefixOf!0 (_1!3155 lt!112878) (_2!3156 lt!112333)))))

(declare-fun d!22532 () Bool)

(assert (=> d!22532 e!45779))

(declare-fun res!57941 () Bool)

(assert (=> d!22532 (=> (not res!57941) (not e!45779))))

(assert (=> d!22532 (= res!57941 (isPrefixOf!0 (_1!3155 lt!112878) (_2!3155 lt!112878)))))

(declare-fun lt!112875 () BitStream!2304)

(assert (=> d!22532 (= lt!112878 (tuple2!6089 lt!112875 (_2!3156 lt!112329)))))

(declare-fun lt!112870 () Unit!4687)

(declare-fun lt!112872 () Unit!4687)

(assert (=> d!22532 (= lt!112870 lt!112872)))

(assert (=> d!22532 (isPrefixOf!0 lt!112875 (_2!3156 lt!112329))))

(assert (=> d!22532 (= lt!112872 (lemmaIsPrefixTransitive!0 lt!112875 (_2!3156 lt!112329) (_2!3156 lt!112329)))))

(declare-fun lt!112869 () Unit!4687)

(declare-fun lt!112862 () Unit!4687)

(assert (=> d!22532 (= lt!112869 lt!112862)))

(assert (=> d!22532 (isPrefixOf!0 lt!112875 (_2!3156 lt!112329))))

(assert (=> d!22532 (= lt!112862 (lemmaIsPrefixTransitive!0 lt!112875 (_2!3156 lt!112333) (_2!3156 lt!112329)))))

(declare-fun lt!112864 () Unit!4687)

(declare-fun e!45778 () Unit!4687)

(assert (=> d!22532 (= lt!112864 e!45778)))

(declare-fun c!5239 () Bool)

(assert (=> d!22532 (= c!5239 (not (= (size!1353 (buf!1734 (_2!3156 lt!112333))) #b00000000000000000000000000000000)))))

(declare-fun lt!112865 () Unit!4687)

(declare-fun lt!112860 () Unit!4687)

(assert (=> d!22532 (= lt!112865 lt!112860)))

(assert (=> d!22532 (isPrefixOf!0 (_2!3156 lt!112329) (_2!3156 lt!112329))))

(assert (=> d!22532 (= lt!112860 (lemmaIsPrefixRefl!0 (_2!3156 lt!112329)))))

(declare-fun lt!112876 () Unit!4687)

(declare-fun lt!112874 () Unit!4687)

(assert (=> d!22532 (= lt!112876 lt!112874)))

(assert (=> d!22532 (= lt!112874 (lemmaIsPrefixRefl!0 (_2!3156 lt!112329)))))

(declare-fun lt!112877 () Unit!4687)

(declare-fun lt!112861 () Unit!4687)

(assert (=> d!22532 (= lt!112877 lt!112861)))

(assert (=> d!22532 (isPrefixOf!0 lt!112875 lt!112875)))

(assert (=> d!22532 (= lt!112861 (lemmaIsPrefixRefl!0 lt!112875))))

(declare-fun lt!112879 () Unit!4687)

(declare-fun lt!112871 () Unit!4687)

(assert (=> d!22532 (= lt!112879 lt!112871)))

(assert (=> d!22532 (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112333))))

(assert (=> d!22532 (= lt!112871 (lemmaIsPrefixRefl!0 (_2!3156 lt!112333)))))

(assert (=> d!22532 (= lt!112875 (BitStream!2305 (buf!1734 (_2!3156 lt!112329)) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))))))

(assert (=> d!22532 (isPrefixOf!0 (_2!3156 lt!112333) (_2!3156 lt!112329))))

(assert (=> d!22532 (= (reader!0 (_2!3156 lt!112333) (_2!3156 lt!112329)) lt!112878)))

(declare-fun b!70227 () Bool)

(declare-fun lt!112866 () Unit!4687)

(assert (=> b!70227 (= e!45778 lt!112866)))

(declare-fun lt!112863 () (_ BitVec 64))

(assert (=> b!70227 (= lt!112863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112868 () (_ BitVec 64))

(assert (=> b!70227 (= lt!112868 (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))))))

(assert (=> b!70227 (= lt!112866 (arrayBitRangesEqSymmetric!0 (buf!1734 (_2!3156 lt!112333)) (buf!1734 (_2!3156 lt!112329)) lt!112863 lt!112868))))

(assert (=> b!70227 (arrayBitRangesEq!0 (buf!1734 (_2!3156 lt!112329)) (buf!1734 (_2!3156 lt!112333)) lt!112863 lt!112868)))

(declare-fun b!70228 () Bool)

(declare-fun Unit!4700 () Unit!4687)

(assert (=> b!70228 (= e!45778 Unit!4700)))

(declare-fun b!70229 () Bool)

(declare-fun res!57940 () Bool)

(assert (=> b!70229 (=> (not res!57940) (not e!45779))))

(assert (=> b!70229 (= res!57940 (isPrefixOf!0 (_2!3155 lt!112878) (_2!3156 lt!112329)))))

(assert (= (and d!22532 c!5239) b!70227))

(assert (= (and d!22532 (not c!5239)) b!70228))

(assert (= (and d!22532 res!57941) b!70226))

(assert (= (and b!70226 res!57942) b!70229))

(assert (= (and b!70229 res!57940) b!70225))

(declare-fun m!112433 () Bool)

(assert (=> d!22532 m!112433))

(assert (=> d!22532 m!112043))

(declare-fun m!112435 () Bool)

(assert (=> d!22532 m!112435))

(assert (=> d!22532 m!111915))

(declare-fun m!112437 () Bool)

(assert (=> d!22532 m!112437))

(assert (=> d!22532 m!112047))

(assert (=> d!22532 m!112399))

(declare-fun m!112439 () Bool)

(assert (=> d!22532 m!112439))

(assert (=> d!22532 m!112403))

(declare-fun m!112441 () Bool)

(assert (=> d!22532 m!112441))

(declare-fun m!112443 () Bool)

(assert (=> d!22532 m!112443))

(declare-fun m!112445 () Bool)

(assert (=> b!70225 m!112445))

(assert (=> b!70225 m!111889))

(assert (=> b!70225 m!111899))

(declare-fun m!112447 () Bool)

(assert (=> b!70229 m!112447))

(declare-fun m!112449 () Bool)

(assert (=> b!70226 m!112449))

(assert (=> b!70227 m!111899))

(declare-fun m!112451 () Bool)

(assert (=> b!70227 m!112451))

(declare-fun m!112453 () Bool)

(assert (=> b!70227 m!112453))

(assert (=> b!69881 d!22532))

(declare-fun b!70231 () Bool)

(declare-fun lt!112881 () (_ BitVec 64))

(declare-fun e!45781 () tuple2!6100)

(declare-fun lt!112882 () tuple2!6098)

(assert (=> b!70231 (= e!45781 (tuple2!6101 (Cons!723 (_1!3160 lt!112882) (bitStreamReadBitsIntoList!0 (_2!3156 lt!112329) (_2!3160 lt!112882) (bvsub lt!112330 lt!112881))) (_2!3160 lt!112882)))))

(assert (=> b!70231 (= lt!112882 (readBit!0 (_1!3155 lt!112323)))))

(assert (=> b!70231 (= lt!112881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70232 () Bool)

(declare-fun e!45780 () Bool)

(declare-fun lt!112880 () List!727)

(assert (=> b!70232 (= e!45780 (isEmpty!225 lt!112880))))

(declare-fun d!22534 () Bool)

(assert (=> d!22534 e!45780))

(declare-fun c!5240 () Bool)

(assert (=> d!22534 (= c!5240 (= lt!112330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22534 (= lt!112880 (_1!3161 e!45781))))

(declare-fun c!5241 () Bool)

(assert (=> d!22534 (= c!5241 (= lt!112330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22534 (bvsge lt!112330 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22534 (= (bitStreamReadBitsIntoList!0 (_2!3156 lt!112329) (_1!3155 lt!112323) lt!112330) lt!112880)))

(declare-fun b!70233 () Bool)

(assert (=> b!70233 (= e!45780 (> (length!355 lt!112880) 0))))

(declare-fun b!70230 () Bool)

(assert (=> b!70230 (= e!45781 (tuple2!6101 Nil!724 (_1!3155 lt!112323)))))

(assert (= (and d!22534 c!5241) b!70230))

(assert (= (and d!22534 (not c!5241)) b!70231))

(assert (= (and d!22534 c!5240) b!70232))

(assert (= (and d!22534 (not c!5240)) b!70233))

(declare-fun m!112455 () Bool)

(assert (=> b!70231 m!112455))

(declare-fun m!112457 () Bool)

(assert (=> b!70231 m!112457))

(declare-fun m!112459 () Bool)

(assert (=> b!70232 m!112459))

(declare-fun m!112461 () Bool)

(assert (=> b!70233 m!112461))

(assert (=> b!69881 d!22534))

(declare-fun d!22536 () Bool)

(assert (=> d!22536 (= (invariant!0 (currentBit!3437 (_2!3156 lt!112329)) (currentByte!3442 (_2!3156 lt!112329)) (size!1353 (buf!1734 (_2!3156 lt!112329)))) (and (bvsge (currentBit!3437 (_2!3156 lt!112329)) #b00000000000000000000000000000000) (bvslt (currentBit!3437 (_2!3156 lt!112329)) #b00000000000000000000000000001000) (bvsge (currentByte!3442 (_2!3156 lt!112329)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3442 (_2!3156 lt!112329)) (size!1353 (buf!1734 (_2!3156 lt!112329)))) (and (= (currentBit!3437 (_2!3156 lt!112329)) #b00000000000000000000000000000000) (= (currentByte!3442 (_2!3156 lt!112329)) (size!1353 (buf!1734 (_2!3156 lt!112329))))))))))

(assert (=> b!69892 d!22536))

(declare-fun d!22538 () Bool)

(declare-fun e!45784 () Bool)

(assert (=> d!22538 e!45784))

(declare-fun res!57947 () Bool)

(assert (=> d!22538 (=> (not res!57947) (not e!45784))))

(declare-fun lt!112895 () (_ BitVec 64))

(declare-fun lt!112899 () (_ BitVec 64))

(declare-fun lt!112896 () (_ BitVec 64))

(assert (=> d!22538 (= res!57947 (= lt!112895 (bvsub lt!112899 lt!112896)))))

(assert (=> d!22538 (or (= (bvand lt!112899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112896 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112899 lt!112896) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22538 (= lt!112896 (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112329))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112329)))))))

(declare-fun lt!112900 () (_ BitVec 64))

(declare-fun lt!112898 () (_ BitVec 64))

(assert (=> d!22538 (= lt!112899 (bvmul lt!112900 lt!112898))))

(assert (=> d!22538 (or (= lt!112900 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!112898 (bvsdiv (bvmul lt!112900 lt!112898) lt!112900)))))

(assert (=> d!22538 (= lt!112898 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22538 (= lt!112900 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))))))

(assert (=> d!22538 (= lt!112895 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112329))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112329)))))))

(assert (=> d!22538 (invariant!0 (currentBit!3437 (_2!3156 lt!112329)) (currentByte!3442 (_2!3156 lt!112329)) (size!1353 (buf!1734 (_2!3156 lt!112329))))))

(assert (=> d!22538 (= (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112329))) (currentByte!3442 (_2!3156 lt!112329)) (currentBit!3437 (_2!3156 lt!112329))) lt!112895)))

(declare-fun b!70238 () Bool)

(declare-fun res!57948 () Bool)

(assert (=> b!70238 (=> (not res!57948) (not e!45784))))

(assert (=> b!70238 (= res!57948 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!112895))))

(declare-fun b!70239 () Bool)

(declare-fun lt!112897 () (_ BitVec 64))

(assert (=> b!70239 (= e!45784 (bvsle lt!112895 (bvmul lt!112897 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70239 (or (= lt!112897 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!112897 #b0000000000000000000000000000000000000000000000000000000000001000) lt!112897)))))

(assert (=> b!70239 (= lt!112897 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112329)))))))

(assert (= (and d!22538 res!57947) b!70238))

(assert (= (and b!70238 res!57948) b!70239))

(declare-fun m!112463 () Bool)

(assert (=> d!22538 m!112463))

(assert (=> d!22538 m!111877))

(assert (=> b!69891 d!22538))

(declare-fun b!70254 () Bool)

(declare-fun e!45797 () Bool)

(declare-fun e!45798 () Bool)

(assert (=> b!70254 (= e!45797 e!45798)))

(declare-fun c!5244 () Bool)

(declare-datatypes ((tuple4!32 0))(
  ( (tuple4!33 (_1!3162 (_ BitVec 32)) (_2!3162 (_ BitVec 32)) (_3!111 (_ BitVec 32)) (_4!16 (_ BitVec 32))) )
))
(declare-fun lt!112907 () tuple4!32)

(assert (=> b!70254 (= c!5244 (= (_3!111 lt!112907) (_4!16 lt!112907)))))

(declare-fun b!70255 () Bool)

(declare-fun e!45799 () Bool)

(declare-fun call!907 () Bool)

(assert (=> b!70255 (= e!45799 call!907)))

(declare-fun b!70256 () Bool)

(assert (=> b!70256 (= e!45798 call!907)))

(declare-fun e!45802 () Bool)

(declare-fun b!70257 () Bool)

(declare-fun arrayRangesEq!17 (array!2910 array!2910 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70257 (= e!45802 (arrayRangesEq!17 (buf!1734 (_2!3156 lt!112333)) (buf!1734 (_2!3156 lt!112329)) (_1!3162 lt!112907) (_2!3162 lt!112907)))))

(declare-fun d!22540 () Bool)

(declare-fun res!57960 () Bool)

(declare-fun e!45801 () Bool)

(assert (=> d!22540 (=> res!57960 e!45801)))

(assert (=> d!22540 (= res!57960 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!112324))))

(assert (=> d!22540 (= (arrayBitRangesEq!0 (buf!1734 (_2!3156 lt!112333)) (buf!1734 (_2!3156 lt!112329)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112324) e!45801)))

(declare-fun b!70258 () Bool)

(declare-fun e!45800 () Bool)

(assert (=> b!70258 (= e!45798 e!45800)))

(declare-fun res!57961 () Bool)

(declare-fun lt!112909 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70258 (= res!57961 (byteRangesEq!0 (select (arr!1935 (buf!1734 (_2!3156 lt!112333))) (_3!111 lt!112907)) (select (arr!1935 (buf!1734 (_2!3156 lt!112329))) (_3!111 lt!112907)) lt!112909 #b00000000000000000000000000001000))))

(assert (=> b!70258 (=> (not res!57961) (not e!45800))))

(declare-fun lt!112908 () (_ BitVec 32))

(declare-fun bm!904 () Bool)

(assert (=> bm!904 (= call!907 (byteRangesEq!0 (ite c!5244 (select (arr!1935 (buf!1734 (_2!3156 lt!112333))) (_3!111 lt!112907)) (select (arr!1935 (buf!1734 (_2!3156 lt!112333))) (_4!16 lt!112907))) (ite c!5244 (select (arr!1935 (buf!1734 (_2!3156 lt!112329))) (_3!111 lt!112907)) (select (arr!1935 (buf!1734 (_2!3156 lt!112329))) (_4!16 lt!112907))) (ite c!5244 lt!112909 #b00000000000000000000000000000000) lt!112908))))

(declare-fun b!70259 () Bool)

(declare-fun res!57963 () Bool)

(assert (=> b!70259 (= res!57963 (= lt!112908 #b00000000000000000000000000000000))))

(assert (=> b!70259 (=> res!57963 e!45799)))

(assert (=> b!70259 (= e!45800 e!45799)))

(declare-fun b!70260 () Bool)

(assert (=> b!70260 (= e!45801 e!45797)))

(declare-fun res!57959 () Bool)

(assert (=> b!70260 (=> (not res!57959) (not e!45797))))

(assert (=> b!70260 (= res!57959 e!45802)))

(declare-fun res!57962 () Bool)

(assert (=> b!70260 (=> res!57962 e!45802)))

(assert (=> b!70260 (= res!57962 (bvsge (_1!3162 lt!112907) (_2!3162 lt!112907)))))

(assert (=> b!70260 (= lt!112908 ((_ extract 31 0) (bvsrem lt!112324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70260 (= lt!112909 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!32)

(assert (=> b!70260 (= lt!112907 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!112324))))

(assert (= (and d!22540 (not res!57960)) b!70260))

(assert (= (and b!70260 (not res!57962)) b!70257))

(assert (= (and b!70260 res!57959) b!70254))

(assert (= (and b!70254 c!5244) b!70256))

(assert (= (and b!70254 (not c!5244)) b!70258))

(assert (= (and b!70258 res!57961) b!70259))

(assert (= (and b!70259 (not res!57963)) b!70255))

(assert (= (or b!70256 b!70255) bm!904))

(declare-fun m!112465 () Bool)

(assert (=> b!70257 m!112465))

(declare-fun m!112467 () Bool)

(assert (=> b!70258 m!112467))

(declare-fun m!112469 () Bool)

(assert (=> b!70258 m!112469))

(assert (=> b!70258 m!112467))

(assert (=> b!70258 m!112469))

(declare-fun m!112471 () Bool)

(assert (=> b!70258 m!112471))

(declare-fun m!112473 () Bool)

(assert (=> bm!904 m!112473))

(declare-fun m!112475 () Bool)

(assert (=> bm!904 m!112475))

(assert (=> bm!904 m!112469))

(assert (=> bm!904 m!112467))

(declare-fun m!112477 () Bool)

(assert (=> bm!904 m!112477))

(declare-fun m!112479 () Bool)

(assert (=> b!70260 m!112479))

(assert (=> b!69901 d!22540))

(declare-fun d!22542 () Bool)

(declare-fun e!45803 () Bool)

(assert (=> d!22542 e!45803))

(declare-fun res!57964 () Bool)

(assert (=> d!22542 (=> (not res!57964) (not e!45803))))

(declare-fun lt!112914 () (_ BitVec 64))

(declare-fun lt!112910 () (_ BitVec 64))

(declare-fun lt!112911 () (_ BitVec 64))

(assert (=> d!22542 (= res!57964 (= lt!112910 (bvsub lt!112914 lt!112911)))))

(assert (=> d!22542 (or (= (bvand lt!112914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112914 lt!112911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22542 (= lt!112911 (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333)))))))

(declare-fun lt!112915 () (_ BitVec 64))

(declare-fun lt!112913 () (_ BitVec 64))

(assert (=> d!22542 (= lt!112914 (bvmul lt!112915 lt!112913))))

(assert (=> d!22542 (or (= lt!112915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!112913 (bvsdiv (bvmul lt!112915 lt!112913) lt!112915)))))

(assert (=> d!22542 (= lt!112913 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22542 (= lt!112915 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))))))

(assert (=> d!22542 (= lt!112910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333)))))))

(assert (=> d!22542 (invariant!0 (currentBit!3437 (_2!3156 lt!112333)) (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112333))))))

(assert (=> d!22542 (= (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333))) lt!112910)))

(declare-fun b!70261 () Bool)

(declare-fun res!57965 () Bool)

(assert (=> b!70261 (=> (not res!57965) (not e!45803))))

(assert (=> b!70261 (= res!57965 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!112910))))

(declare-fun b!70262 () Bool)

(declare-fun lt!112912 () (_ BitVec 64))

(assert (=> b!70262 (= e!45803 (bvsle lt!112910 (bvmul lt!112912 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70262 (or (= lt!112912 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!112912 #b0000000000000000000000000000000000000000000000000000000000001000) lt!112912)))))

(assert (=> b!70262 (= lt!112912 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))))))

(assert (= (and d!22542 res!57964) b!70261))

(assert (= (and b!70261 res!57965) b!70262))

(declare-fun m!112481 () Bool)

(assert (=> d!22542 m!112481))

(assert (=> d!22542 m!111857))

(assert (=> b!69895 d!22542))

(declare-fun d!22544 () Bool)

(declare-fun res!57968 () Bool)

(declare-fun e!45805 () Bool)

(assert (=> d!22544 (=> (not res!57968) (not e!45805))))

(assert (=> d!22544 (= res!57968 (= (size!1353 (buf!1734 thiss!1379)) (size!1353 (buf!1734 (_2!3156 lt!112333)))))))

(assert (=> d!22544 (= (isPrefixOf!0 thiss!1379 (_2!3156 lt!112333)) e!45805)))

(declare-fun b!70263 () Bool)

(declare-fun res!57967 () Bool)

(assert (=> b!70263 (=> (not res!57967) (not e!45805))))

(assert (=> b!70263 (= res!57967 (bvsle (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)) (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112333))) (currentByte!3442 (_2!3156 lt!112333)) (currentBit!3437 (_2!3156 lt!112333)))))))

(declare-fun b!70264 () Bool)

(declare-fun e!45804 () Bool)

(assert (=> b!70264 (= e!45805 e!45804)))

(declare-fun res!57966 () Bool)

(assert (=> b!70264 (=> res!57966 e!45804)))

(assert (=> b!70264 (= res!57966 (= (size!1353 (buf!1734 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70265 () Bool)

(assert (=> b!70265 (= e!45804 (arrayBitRangesEq!0 (buf!1734 thiss!1379) (buf!1734 (_2!3156 lt!112333)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379))))))

(assert (= (and d!22544 res!57968) b!70263))

(assert (= (and b!70263 res!57967) b!70264))

(assert (= (and b!70264 (not res!57966)) b!70265))

(assert (=> b!70263 m!111895))

(assert (=> b!70263 m!111899))

(assert (=> b!70265 m!111895))

(assert (=> b!70265 m!111895))

(declare-fun m!112483 () Bool)

(assert (=> b!70265 m!112483))

(assert (=> b!69884 d!22544))

(declare-fun d!22546 () Bool)

(assert (=> d!22546 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) lt!112330) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333)))) lt!112330))))

(declare-fun bs!5405 () Bool)

(assert (= bs!5405 d!22546))

(assert (=> bs!5405 m!112481))

(assert (=> b!69884 d!22546))

(declare-fun d!22548 () Bool)

(declare-fun e!45808 () Bool)

(assert (=> d!22548 e!45808))

(declare-fun res!57971 () Bool)

(assert (=> d!22548 (=> (not res!57971) (not e!45808))))

(assert (=> d!22548 (= res!57971 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!112918 () Unit!4687)

(declare-fun choose!27 (BitStream!2304 BitStream!2304 (_ BitVec 64) (_ BitVec 64)) Unit!4687)

(assert (=> d!22548 (= lt!112918 (choose!27 thiss!1379 (_2!3156 lt!112333) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22548 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22548 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3156 lt!112333) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112918)))

(declare-fun b!70268 () Bool)

(assert (=> b!70268 (= e!45808 (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 (_2!3156 lt!112333)))) ((_ sign_extend 32) (currentByte!3442 (_2!3156 lt!112333))) ((_ sign_extend 32) (currentBit!3437 (_2!3156 lt!112333))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22548 res!57971) b!70268))

(declare-fun m!112485 () Bool)

(assert (=> d!22548 m!112485))

(declare-fun m!112487 () Bool)

(assert (=> b!70268 m!112487))

(assert (=> b!69884 d!22548))

(declare-fun b!70286 () Bool)

(declare-fun e!45818 () Bool)

(declare-fun e!45819 () Bool)

(assert (=> b!70286 (= e!45818 e!45819)))

(declare-fun res!57995 () Bool)

(assert (=> b!70286 (=> (not res!57995) (not e!45819))))

(declare-datatypes ((tuple2!6104 0))(
  ( (tuple2!6105 (_1!3165 BitStream!2304) (_2!3165 Bool)) )
))
(declare-fun lt!112949 () tuple2!6104)

(declare-fun lt!112944 () tuple2!6090)

(declare-fun lt!112951 () Bool)

(assert (=> b!70286 (= res!57995 (and (= (_2!3165 lt!112949) lt!112951) (= (_1!3165 lt!112949) (_2!3156 lt!112944))))))

(declare-fun readBitPure!0 (BitStream!2304) tuple2!6104)

(declare-fun readerFrom!0 (BitStream!2304 (_ BitVec 32) (_ BitVec 32)) BitStream!2304)

(assert (=> b!70286 (= lt!112949 (readBitPure!0 (readerFrom!0 (_2!3156 lt!112944) (currentBit!3437 thiss!1379) (currentByte!3442 thiss!1379))))))

(declare-fun b!70287 () Bool)

(declare-fun e!45820 () Bool)

(declare-fun lt!112946 () tuple2!6104)

(declare-fun lt!112952 () tuple2!6090)

(assert (=> b!70287 (= e!45820 (= (bitIndex!0 (size!1353 (buf!1734 (_1!3165 lt!112946))) (currentByte!3442 (_1!3165 lt!112946)) (currentBit!3437 (_1!3165 lt!112946))) (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112952))) (currentByte!3442 (_2!3156 lt!112952)) (currentBit!3437 (_2!3156 lt!112952)))))))

(declare-fun b!70288 () Bool)

(declare-fun res!57988 () Bool)

(assert (=> b!70288 (=> (not res!57988) (not e!45818))))

(assert (=> b!70288 (= res!57988 (= (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112944))) (currentByte!3442 (_2!3156 lt!112944)) (currentBit!3437 (_2!3156 lt!112944))) (bvadd (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!70289 () Bool)

(declare-fun res!57989 () Bool)

(declare-fun e!45817 () Bool)

(assert (=> b!70289 (=> (not res!57989) (not e!45817))))

(assert (=> b!70289 (= res!57989 (isPrefixOf!0 thiss!1379 (_2!3156 lt!112952)))))

(declare-fun b!70290 () Bool)

(declare-fun res!57992 () Bool)

(assert (=> b!70290 (=> (not res!57992) (not e!45817))))

(declare-fun lt!112953 () (_ BitVec 64))

(declare-fun lt!112954 () (_ BitVec 64))

(assert (=> b!70290 (= res!57992 (= (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112952))) (currentByte!3442 (_2!3156 lt!112952)) (currentBit!3437 (_2!3156 lt!112952))) (bvadd lt!112953 lt!112954)))))

(assert (=> b!70290 (or (not (= (bvand lt!112953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112954 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!112953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!112953 lt!112954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70290 (= lt!112954 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!70290 (= lt!112953 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)))))

(declare-fun b!70291 () Bool)

(assert (=> b!70291 (= e!45819 (= (bitIndex!0 (size!1353 (buf!1734 (_1!3165 lt!112949))) (currentByte!3442 (_1!3165 lt!112949)) (currentBit!3437 (_1!3165 lt!112949))) (bitIndex!0 (size!1353 (buf!1734 (_2!3156 lt!112944))) (currentByte!3442 (_2!3156 lt!112944)) (currentBit!3437 (_2!3156 lt!112944)))))))

(declare-fun b!70292 () Bool)

(declare-fun res!57991 () Bool)

(assert (=> b!70292 (=> (not res!57991) (not e!45818))))

(assert (=> b!70292 (= res!57991 (isPrefixOf!0 thiss!1379 (_2!3156 lt!112944)))))

(declare-fun b!70293 () Bool)

(assert (=> b!70293 (= e!45817 e!45820)))

(declare-fun res!57994 () Bool)

(assert (=> b!70293 (=> (not res!57994) (not e!45820))))

(declare-fun lt!112945 () (_ BitVec 8))

(assert (=> b!70293 (= res!57994 (and (= (_2!3165 lt!112946) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!112945)) #b00000000000000000000000000000000))) (= (_1!3165 lt!112946) (_2!3156 lt!112952))))))

(declare-fun lt!112950 () tuple2!6096)

(declare-fun lt!112948 () BitStream!2304)

(assert (=> b!70293 (= lt!112950 (readBits!0 lt!112948 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!70293 (= lt!112946 (readBitPure!0 lt!112948))))

(assert (=> b!70293 (= lt!112948 (readerFrom!0 (_2!3156 lt!112952) (currentBit!3437 thiss!1379) (currentByte!3442 thiss!1379)))))

(declare-fun d!22550 () Bool)

(assert (=> d!22550 e!45817))

(declare-fun res!57993 () Bool)

(assert (=> d!22550 (=> (not res!57993) (not e!45817))))

(assert (=> d!22550 (= res!57993 (= (size!1353 (buf!1734 (_2!3156 lt!112952))) (size!1353 (buf!1734 thiss!1379))))))

(declare-fun lt!112943 () array!2910)

(assert (=> d!22550 (= lt!112945 (select (arr!1935 lt!112943) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22550 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1353 lt!112943)))))

(assert (=> d!22550 (= lt!112943 (array!2911 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!112947 () tuple2!6090)

(assert (=> d!22550 (= lt!112952 (tuple2!6091 (_1!3156 lt!112947) (_2!3156 lt!112947)))))

(assert (=> d!22550 (= lt!112947 lt!112944)))

(assert (=> d!22550 e!45818))

(declare-fun res!57990 () Bool)

(assert (=> d!22550 (=> (not res!57990) (not e!45818))))

(assert (=> d!22550 (= res!57990 (= (size!1353 (buf!1734 thiss!1379)) (size!1353 (buf!1734 (_2!3156 lt!112944)))))))

(declare-fun appendBit!0 (BitStream!2304 Bool) tuple2!6090)

(assert (=> d!22550 (= lt!112944 (appendBit!0 thiss!1379 lt!112951))))

(assert (=> d!22550 (= lt!112951 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22550 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22550 (= (appendBitFromByte!0 thiss!1379 (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!112952)))

(assert (= (and d!22550 res!57990) b!70288))

(assert (= (and b!70288 res!57988) b!70292))

(assert (= (and b!70292 res!57991) b!70286))

(assert (= (and b!70286 res!57995) b!70291))

(assert (= (and d!22550 res!57993) b!70290))

(assert (= (and b!70290 res!57992) b!70289))

(assert (= (and b!70289 res!57989) b!70293))

(assert (= (and b!70293 res!57994) b!70287))

(declare-fun m!112489 () Bool)

(assert (=> b!70291 m!112489))

(declare-fun m!112491 () Bool)

(assert (=> b!70291 m!112491))

(declare-fun m!112493 () Bool)

(assert (=> b!70286 m!112493))

(assert (=> b!70286 m!112493))

(declare-fun m!112495 () Bool)

(assert (=> b!70286 m!112495))

(declare-fun m!112497 () Bool)

(assert (=> b!70290 m!112497))

(assert (=> b!70290 m!111895))

(assert (=> b!70288 m!112491))

(assert (=> b!70288 m!111895))

(declare-fun m!112499 () Bool)

(assert (=> d!22550 m!112499))

(declare-fun m!112501 () Bool)

(assert (=> d!22550 m!112501))

(assert (=> d!22550 m!112379))

(declare-fun m!112503 () Bool)

(assert (=> b!70293 m!112503))

(declare-fun m!112505 () Bool)

(assert (=> b!70293 m!112505))

(declare-fun m!112507 () Bool)

(assert (=> b!70293 m!112507))

(declare-fun m!112509 () Bool)

(assert (=> b!70287 m!112509))

(assert (=> b!70287 m!112497))

(declare-fun m!112511 () Bool)

(assert (=> b!70292 m!112511))

(declare-fun m!112513 () Bool)

(assert (=> b!70289 m!112513))

(assert (=> b!69884 d!22550))

(declare-fun d!22552 () Bool)

(assert (=> d!22552 (= (bitAt!0 (buf!1734 (_1!3155 lt!112323)) lt!112327) (not (= (bvand ((_ sign_extend 24) (select (arr!1935 (buf!1734 (_1!3155 lt!112323))) ((_ extract 31 0) (bvsdiv lt!112327 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112327 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5406 () Bool)

(assert (= bs!5406 d!22552))

(declare-fun m!112515 () Bool)

(assert (=> bs!5406 m!112515))

(assert (=> bs!5406 m!112035))

(assert (=> b!69883 d!22552))

(declare-fun d!22554 () Bool)

(assert (=> d!22554 (= (bitAt!0 (buf!1734 (_1!3155 lt!112322)) lt!112327) (not (= (bvand ((_ sign_extend 24) (select (arr!1935 (buf!1734 (_1!3155 lt!112322))) ((_ extract 31 0) (bvsdiv lt!112327 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112327 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5407 () Bool)

(assert (= bs!5407 d!22554))

(declare-fun m!112517 () Bool)

(assert (=> bs!5407 m!112517))

(assert (=> bs!5407 m!112035))

(assert (=> b!69883 d!22554))

(declare-fun d!22556 () Bool)

(assert (=> d!22556 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1353 (buf!1734 thiss!1379))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 thiss!1379))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5408 () Bool)

(assert (= bs!5408 d!22556))

(declare-fun m!112519 () Bool)

(assert (=> bs!5408 m!112519))

(assert (=> b!69894 d!22556))

(declare-fun d!22558 () Bool)

(assert (=> d!22558 (= (tail!331 lt!112326) (t!1477 lt!112326))))

(assert (=> b!69893 d!22558))

(declare-fun d!22560 () Bool)

(declare-fun e!45825 () Bool)

(assert (=> d!22560 e!45825))

(declare-fun res!57998 () Bool)

(assert (=> d!22560 (=> (not res!57998) (not e!45825))))

(declare-fun lt!112970 () (_ BitVec 64))

(assert (=> d!22560 (= res!57998 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112970 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!112970) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22560 (= lt!112970 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!112969 () Unit!4687)

(declare-fun choose!42 (BitStream!2304 BitStream!2304 BitStream!2304 BitStream!2304 (_ BitVec 64) List!727) Unit!4687)

(assert (=> d!22560 (= lt!112969 (choose!42 (_2!3156 lt!112329) (_2!3156 lt!112329) (_1!3155 lt!112322) (_1!3155 lt!112323) (bvsub to!314 i!635) lt!112326))))

(assert (=> d!22560 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22560 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3156 lt!112329) (_2!3156 lt!112329) (_1!3155 lt!112322) (_1!3155 lt!112323) (bvsub to!314 i!635) lt!112326) lt!112969)))

(declare-fun b!70300 () Bool)

(assert (=> b!70300 (= e!45825 (= (bitStreamReadBitsIntoList!0 (_2!3156 lt!112329) (_1!3155 lt!112323) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!331 lt!112326)))))

(assert (= (and d!22560 res!57998) b!70300))

(declare-fun m!112521 () Bool)

(assert (=> d!22560 m!112521))

(declare-fun m!112523 () Bool)

(assert (=> b!70300 m!112523))

(assert (=> b!70300 m!111901))

(assert (=> b!69893 d!22560))

(declare-fun d!22562 () Bool)

(assert (=> d!22562 (= (head!546 (byteArrayBitContentToList!0 (_2!3156 lt!112329) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!842 (byteArrayBitContentToList!0 (_2!3156 lt!112329) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!69887 d!22562))

(declare-fun d!22564 () Bool)

(declare-fun c!5247 () Bool)

(assert (=> d!22564 (= c!5247 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45826 () List!727)

(assert (=> d!22564 (= (byteArrayBitContentToList!0 (_2!3156 lt!112329) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45826)))

(declare-fun b!70301 () Bool)

(assert (=> b!70301 (= e!45826 Nil!724)))

(declare-fun b!70302 () Bool)

(assert (=> b!70302 (= e!45826 (Cons!723 (not (= (bvand ((_ sign_extend 24) (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3156 lt!112329) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22564 c!5247) b!70301))

(assert (= (and d!22564 (not c!5247)) b!70302))

(assert (=> b!70302 m!111927))

(assert (=> b!70302 m!112379))

(declare-fun m!112525 () Bool)

(assert (=> b!70302 m!112525))

(assert (=> b!69887 d!22564))

(declare-fun d!22566 () Bool)

(assert (=> d!22566 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1935 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5409 () Bool)

(assert (= bs!5409 d!22566))

(assert (=> bs!5409 m!111927))

(assert (=> bs!5409 m!112379))

(assert (=> b!69887 d!22566))

(declare-fun d!22568 () Bool)

(assert (=> d!22568 (= (head!546 lt!112326) (h!842 lt!112326))))

(assert (=> b!69897 d!22568))

(declare-fun d!22570 () Bool)

(assert (=> d!22570 (= (array_inv!1211 srcBuffer!2) (bvsge (size!1353 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13646 d!22570))

(declare-fun d!22572 () Bool)

(assert (=> d!22572 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3437 thiss!1379) (currentByte!3442 thiss!1379) (size!1353 (buf!1734 thiss!1379))))))

(declare-fun bs!5410 () Bool)

(assert (= bs!5410 d!22572))

(declare-fun m!112527 () Bool)

(assert (=> bs!5410 m!112527))

(assert (=> start!13646 d!22572))

(declare-fun d!22574 () Bool)

(assert (=> d!22574 (= (invariant!0 (currentBit!3437 (_2!3156 lt!112333)) (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112329)))) (and (bvsge (currentBit!3437 (_2!3156 lt!112333)) #b00000000000000000000000000000000) (bvslt (currentBit!3437 (_2!3156 lt!112333)) #b00000000000000000000000000001000) (bvsge (currentByte!3442 (_2!3156 lt!112333)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112329)))) (and (= (currentBit!3437 (_2!3156 lt!112333)) #b00000000000000000000000000000000) (= (currentByte!3442 (_2!3156 lt!112333)) (size!1353 (buf!1734 (_2!3156 lt!112329))))))))))

(assert (=> b!69886 d!22574))

(declare-fun d!22576 () Bool)

(declare-fun size!1356 (List!727) Int)

(assert (=> d!22576 (= (length!355 lt!112326) (size!1356 lt!112326))))

(declare-fun bs!5411 () Bool)

(assert (= bs!5411 d!22576))

(declare-fun m!112529 () Bool)

(assert (=> bs!5411 m!112529))

(assert (=> b!69885 d!22576))

(declare-fun d!22578 () Bool)

(declare-fun res!58001 () Bool)

(declare-fun e!45828 () Bool)

(assert (=> d!22578 (=> (not res!58001) (not e!45828))))

(assert (=> d!22578 (= res!58001 (= (size!1353 (buf!1734 thiss!1379)) (size!1353 (buf!1734 thiss!1379))))))

(assert (=> d!22578 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45828)))

(declare-fun b!70303 () Bool)

(declare-fun res!58000 () Bool)

(assert (=> b!70303 (=> (not res!58000) (not e!45828))))

(assert (=> b!70303 (= res!58000 (bvsle (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)) (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379))))))

(declare-fun b!70304 () Bool)

(declare-fun e!45827 () Bool)

(assert (=> b!70304 (= e!45828 e!45827)))

(declare-fun res!57999 () Bool)

(assert (=> b!70304 (=> res!57999 e!45827)))

(assert (=> b!70304 (= res!57999 (= (size!1353 (buf!1734 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70305 () Bool)

(assert (=> b!70305 (= e!45827 (arrayBitRangesEq!0 (buf!1734 thiss!1379) (buf!1734 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379))))))

(assert (= (and d!22578 res!58001) b!70303))

(assert (= (and b!70303 res!58000) b!70304))

(assert (= (and b!70304 (not res!57999)) b!70305))

(assert (=> b!70303 m!111895))

(assert (=> b!70303 m!111895))

(assert (=> b!70305 m!111895))

(assert (=> b!70305 m!111895))

(declare-fun m!112531 () Bool)

(assert (=> b!70305 m!112531))

(assert (=> b!69896 d!22578))

(declare-fun d!22580 () Bool)

(assert (=> d!22580 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!113039 () Unit!4687)

(declare-fun choose!11 (BitStream!2304) Unit!4687)

(assert (=> d!22580 (= lt!113039 (choose!11 thiss!1379))))

(assert (=> d!22580 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!113039)))

(declare-fun bs!5413 () Bool)

(assert (= bs!5413 d!22580))

(assert (=> bs!5413 m!111891))

(declare-fun m!112533 () Bool)

(assert (=> bs!5413 m!112533))

(assert (=> b!69896 d!22580))

(declare-fun d!22582 () Bool)

(declare-fun e!45829 () Bool)

(assert (=> d!22582 e!45829))

(declare-fun res!58002 () Bool)

(assert (=> d!22582 (=> (not res!58002) (not e!45829))))

(declare-fun lt!113040 () (_ BitVec 64))

(declare-fun lt!113044 () (_ BitVec 64))

(declare-fun lt!113041 () (_ BitVec 64))

(assert (=> d!22582 (= res!58002 (= lt!113040 (bvsub lt!113044 lt!113041)))))

(assert (=> d!22582 (or (= (bvand lt!113044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113041 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113044 lt!113041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22582 (= lt!113041 (remainingBits!0 ((_ sign_extend 32) (size!1353 (buf!1734 thiss!1379))) ((_ sign_extend 32) (currentByte!3442 thiss!1379)) ((_ sign_extend 32) (currentBit!3437 thiss!1379))))))

(declare-fun lt!113045 () (_ BitVec 64))

(declare-fun lt!113043 () (_ BitVec 64))

(assert (=> d!22582 (= lt!113044 (bvmul lt!113045 lt!113043))))

(assert (=> d!22582 (or (= lt!113045 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!113043 (bvsdiv (bvmul lt!113045 lt!113043) lt!113045)))))

(assert (=> d!22582 (= lt!113043 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22582 (= lt!113045 ((_ sign_extend 32) (size!1353 (buf!1734 thiss!1379))))))

(assert (=> d!22582 (= lt!113040 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3442 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3437 thiss!1379))))))

(assert (=> d!22582 (invariant!0 (currentBit!3437 thiss!1379) (currentByte!3442 thiss!1379) (size!1353 (buf!1734 thiss!1379)))))

(assert (=> d!22582 (= (bitIndex!0 (size!1353 (buf!1734 thiss!1379)) (currentByte!3442 thiss!1379) (currentBit!3437 thiss!1379)) lt!113040)))

(declare-fun b!70306 () Bool)

(declare-fun res!58003 () Bool)

(assert (=> b!70306 (=> (not res!58003) (not e!45829))))

(assert (=> b!70306 (= res!58003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113040))))

(declare-fun b!70307 () Bool)

(declare-fun lt!113042 () (_ BitVec 64))

(assert (=> b!70307 (= e!45829 (bvsle lt!113040 (bvmul lt!113042 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70307 (or (= lt!113042 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!113042 #b0000000000000000000000000000000000000000000000000000000000001000) lt!113042)))))

(assert (=> b!70307 (= lt!113042 ((_ sign_extend 32) (size!1353 (buf!1734 thiss!1379))))))

(assert (= (and d!22582 res!58002) b!70306))

(assert (= (and b!70306 res!58003) b!70307))

(assert (=> d!22582 m!112519))

(assert (=> d!22582 m!112527))

(assert (=> b!69896 d!22582))

(check-sat (not d!22556) (not b!69976) (not b!70293) (not d!22394) (not d!22398) (not b!70195) (not d!22548) (not b!70189) (not b!70192) (not bm!901) (not b!70215) (not d!22508) (not b!70226) (not b!69988) (not d!22532) (not b!70223) (not b!70231) (not b!70288) (not b!70268) (not d!22560) (not bm!904) (not d!22524) (not d!22576) (not d!22506) (not b!70227) (not b!70213) (not b!70216) (not b!70263) (not b!70197) (not b!69979) (not b!70203) (not d!22520) (not b!70187) (not b!70229) (not b!70218) (not b!70214) (not b!70289) (not d!22542) (not d!22572) (not d!22582) (not b!70225) (not b!70191) (not b!70287) (not b!70258) (not b!70292) (not b!70291) (not b!69975) (not b!69986) (not b!69977) (not b!70265) (not b!70305) (not b!70303) (not d!22580) (not b!70300) (not d!22400) (not b!70286) (not b!70257) (not b!70233) (not b!70188) (not b!70290) (not b!70220) (not d!22530) (not d!22528) (not b!70217) (not b!70260) (not b!70232) (not d!22538) (not b!70302) (not d!22522) (not d!22550) (not d!22546) (not b!70224) (not b!70222) (not b!70194))
