; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7906 () Bool)

(assert start!7906)

(declare-fun b!38582 () Bool)

(declare-fun res!32730 () Bool)

(declare-fun e!25328 () Bool)

(assert (=> b!38582 (=> res!32730 e!25328)))

(declare-datatypes ((List!457 0))(
  ( (Nil!454) (Cons!453 (h!572 Bool) (t!1207 List!457)) )
))
(declare-fun lt!58847 () List!457)

(declare-fun lt!58858 () Bool)

(declare-fun head!294 (List!457) Bool)

(assert (=> b!38582 (= res!32730 (not (= (head!294 lt!58847) lt!58858)))))

(declare-fun b!38584 () Bool)

(declare-fun e!25326 () Bool)

(declare-fun e!25327 () Bool)

(assert (=> b!38584 (= e!25326 e!25327)))

(declare-fun res!32737 () Bool)

(assert (=> b!38584 (=> res!32737 e!25327)))

(declare-datatypes ((array!1957 0))(
  ( (array!1958 (arr!1377 (Array (_ BitVec 32) (_ BitVec 8))) (size!881 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1512 0))(
  ( (BitStream!1513 (buf!1209 array!1957) (currentByte!2621 (_ BitVec 32)) (currentBit!2616 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2783 0))(
  ( (Unit!2784) )
))
(declare-datatypes ((tuple2!3730 0))(
  ( (tuple2!3731 (_1!1952 Unit!2783) (_2!1952 BitStream!1512)) )
))
(declare-fun lt!58861 () tuple2!3730)

(declare-fun lt!58859 () tuple2!3730)

(assert (=> b!38584 (= res!32737 (not (= (size!881 (buf!1209 (_2!1952 lt!58861))) (size!881 (buf!1209 (_2!1952 lt!58859))))))))

(declare-fun lt!58840 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!58838 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!38584 (= lt!58840 (bvsub (bvsub (bvadd lt!58838 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38584 (= lt!58838 (bitIndex!0 (size!881 (buf!1209 (_2!1952 lt!58861))) (currentByte!2621 (_2!1952 lt!58861)) (currentBit!2616 (_2!1952 lt!58861))))))

(declare-fun thiss!1379 () BitStream!1512)

(assert (=> b!38584 (= (size!881 (buf!1209 (_2!1952 lt!58859))) (size!881 (buf!1209 thiss!1379)))))

(declare-fun b!38585 () Bool)

(declare-fun e!25336 () Bool)

(declare-fun e!25324 () Bool)

(assert (=> b!38585 (= e!25336 e!25324)))

(declare-fun res!32729 () Bool)

(assert (=> b!38585 (=> res!32729 e!25324)))

(declare-fun lt!58845 () Bool)

(declare-fun lt!58855 () Bool)

(assert (=> b!38585 (= res!32729 (not (= lt!58845 lt!58855)))))

(declare-fun lt!58853 () Bool)

(assert (=> b!38585 (= lt!58853 lt!58845)))

(declare-fun lt!58843 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1957 (_ BitVec 64)) Bool)

(assert (=> b!38585 (= lt!58845 (bitAt!0 (buf!1209 (_2!1952 lt!58859)) lt!58843))))

(declare-fun lt!58839 () Unit!2783)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1957 array!1957 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2783)

(assert (=> b!38585 (= lt!58839 (arrayBitRangesEqImpliesEq!0 (buf!1209 (_2!1952 lt!58861)) (buf!1209 (_2!1952 lt!58859)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!58843 lt!58838))))

(declare-fun b!38586 () Bool)

(declare-fun e!25331 () Bool)

(assert (=> b!38586 (= e!25331 e!25328)))

(declare-fun res!32734 () Bool)

(assert (=> b!38586 (=> res!32734 e!25328)))

(declare-datatypes ((tuple2!3732 0))(
  ( (tuple2!3733 (_1!1953 BitStream!1512) (_2!1953 BitStream!1512)) )
))
(declare-fun lt!58841 () tuple2!3732)

(assert (=> b!38586 (= res!32734 (not (= lt!58858 (bitAt!0 (buf!1209 (_1!1953 lt!58841)) lt!58843))))))

(declare-fun lt!58848 () tuple2!3732)

(assert (=> b!38586 (= lt!58858 (bitAt!0 (buf!1209 (_1!1953 lt!58848)) lt!58843))))

(declare-fun srcBuffer!2 () array!1957)

(declare-fun e!25335 () Bool)

(declare-fun b!38587 () Bool)

(declare-fun lt!58851 () tuple2!3732)

(declare-fun byteArrayBitContentToList!0 (BitStream!1512 array!1957 (_ BitVec 64) (_ BitVec 64)) List!457)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1512 BitStream!1512 (_ BitVec 64)) List!457)

(assert (=> b!38587 (= e!25335 (= (head!294 (byteArrayBitContentToList!0 (_2!1952 lt!58861) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!294 (bitStreamReadBitsIntoList!0 (_2!1952 lt!58861) (_1!1953 lt!58851) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38588 () Bool)

(declare-fun e!25332 () Bool)

(declare-fun e!25330 () Bool)

(assert (=> b!38588 (= e!25332 (not e!25330))))

(declare-fun res!32740 () Bool)

(assert (=> b!38588 (=> res!32740 e!25330)))

(assert (=> b!38588 (= res!32740 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1512 BitStream!1512) Bool)

(assert (=> b!38588 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!58844 () Unit!2783)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1512) Unit!2783)

(assert (=> b!38588 (= lt!58844 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!38588 (= lt!58843 (bitIndex!0 (size!881 (buf!1209 thiss!1379)) (currentByte!2621 thiss!1379) (currentBit!2616 thiss!1379)))))

(declare-fun b!38589 () Bool)

(assert (=> b!38589 (= e!25324 true)))

(declare-datatypes ((tuple2!3734 0))(
  ( (tuple2!3735 (_1!1954 BitStream!1512) (_2!1954 Bool)) )
))
(declare-fun lt!58852 () tuple2!3734)

(declare-fun readBitPure!0 (BitStream!1512) tuple2!3734)

(assert (=> b!38589 (= lt!58852 (readBitPure!0 (_1!1953 lt!58848)))))

(declare-fun b!38590 () Bool)

(declare-fun e!25325 () Bool)

(assert (=> b!38590 (= e!25328 e!25325)))

(declare-fun res!32742 () Bool)

(assert (=> b!38590 (=> res!32742 e!25325)))

(assert (=> b!38590 (= res!32742 (not (= (head!294 (byteArrayBitContentToList!0 (_2!1952 lt!58859) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!58855)))))

(assert (=> b!38590 (= lt!58855 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!38591 () Bool)

(declare-fun res!32747 () Bool)

(assert (=> b!38591 (=> res!32747 e!25327)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38591 (= res!32747 (not (invariant!0 (currentBit!2616 (_2!1952 lt!58861)) (currentByte!2621 (_2!1952 lt!58861)) (size!881 (buf!1209 (_2!1952 lt!58861))))))))

(declare-fun b!38592 () Bool)

(declare-fun e!25338 () Bool)

(declare-fun e!25334 () Bool)

(assert (=> b!38592 (= e!25338 e!25334)))

(declare-fun res!32748 () Bool)

(assert (=> b!38592 (=> res!32748 e!25334)))

(assert (=> b!38592 (= res!32748 (not (isPrefixOf!0 (_2!1952 lt!58861) (_2!1952 lt!58859))))))

(assert (=> b!38592 (isPrefixOf!0 thiss!1379 (_2!1952 lt!58859))))

(declare-fun lt!58849 () Unit!2783)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1512 BitStream!1512 BitStream!1512) Unit!2783)

(assert (=> b!38592 (= lt!58849 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1952 lt!58861) (_2!1952 lt!58859)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1512 array!1957 (_ BitVec 64) (_ BitVec 64)) tuple2!3730)

(assert (=> b!38592 (= lt!58859 (appendBitsMSBFirstLoop!0 (_2!1952 lt!58861) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!38592 e!25335))

(declare-fun res!32746 () Bool)

(assert (=> b!38592 (=> (not res!32746) (not e!25335))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38592 (= res!32746 (validate_offset_bits!1 ((_ sign_extend 32) (size!881 (buf!1209 (_2!1952 lt!58861)))) ((_ sign_extend 32) (currentByte!2621 thiss!1379)) ((_ sign_extend 32) (currentBit!2616 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58850 () Unit!2783)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1512 array!1957 (_ BitVec 64)) Unit!2783)

(assert (=> b!38592 (= lt!58850 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1209 (_2!1952 lt!58861)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1512 BitStream!1512) tuple2!3732)

(assert (=> b!38592 (= lt!58851 (reader!0 thiss!1379 (_2!1952 lt!58861)))))

(declare-fun b!38593 () Bool)

(declare-fun e!25333 () Bool)

(assert (=> b!38593 (= e!25327 e!25333)))

(declare-fun res!32743 () Bool)

(assert (=> b!38593 (=> res!32743 e!25333)))

(assert (=> b!38593 (= res!32743 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!58857 () List!457)

(declare-fun lt!58846 () (_ BitVec 64))

(assert (=> b!38593 (= lt!58857 (bitStreamReadBitsIntoList!0 (_2!1952 lt!58859) (_1!1953 lt!58841) lt!58846))))

(assert (=> b!38593 (= lt!58847 (bitStreamReadBitsIntoList!0 (_2!1952 lt!58859) (_1!1953 lt!58848) (bvsub to!314 i!635)))))

(assert (=> b!38593 (validate_offset_bits!1 ((_ sign_extend 32) (size!881 (buf!1209 (_2!1952 lt!58859)))) ((_ sign_extend 32) (currentByte!2621 (_2!1952 lt!58861))) ((_ sign_extend 32) (currentBit!2616 (_2!1952 lt!58861))) lt!58846)))

(declare-fun lt!58856 () Unit!2783)

(assert (=> b!38593 (= lt!58856 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1952 lt!58861) (buf!1209 (_2!1952 lt!58859)) lt!58846))))

(assert (=> b!38593 (= lt!58841 (reader!0 (_2!1952 lt!58861) (_2!1952 lt!58859)))))

(assert (=> b!38593 (validate_offset_bits!1 ((_ sign_extend 32) (size!881 (buf!1209 (_2!1952 lt!58859)))) ((_ sign_extend 32) (currentByte!2621 thiss!1379)) ((_ sign_extend 32) (currentBit!2616 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!58860 () Unit!2783)

(assert (=> b!38593 (= lt!58860 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1209 (_2!1952 lt!58859)) (bvsub to!314 i!635)))))

(assert (=> b!38593 (= lt!58848 (reader!0 thiss!1379 (_2!1952 lt!58859)))))

(declare-fun b!38594 () Bool)

(declare-fun e!25337 () Bool)

(declare-fun array_inv!809 (array!1957) Bool)

(assert (=> b!38594 (= e!25337 (array_inv!809 (buf!1209 thiss!1379)))))

(declare-fun res!32739 () Bool)

(assert (=> start!7906 (=> (not res!32739) (not e!25332))))

(assert (=> start!7906 (= res!32739 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!881 srcBuffer!2))))))))

(assert (=> start!7906 e!25332))

(assert (=> start!7906 true))

(assert (=> start!7906 (array_inv!809 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1512) Bool)

(assert (=> start!7906 (and (inv!12 thiss!1379) e!25337)))

(declare-fun b!38583 () Bool)

(assert (=> b!38583 (= e!25325 e!25336)))

(declare-fun res!32738 () Bool)

(assert (=> b!38583 (=> res!32738 e!25336)))

(assert (=> b!38583 (= res!32738 (not (= lt!58853 lt!58855)))))

(assert (=> b!38583 (= lt!58853 (bitAt!0 (buf!1209 (_2!1952 lt!58861)) lt!58843))))

(declare-fun b!38595 () Bool)

(assert (=> b!38595 (= e!25334 e!25326)))

(declare-fun res!32733 () Bool)

(assert (=> b!38595 (=> res!32733 e!25326)))

(assert (=> b!38595 (= res!32733 (not (= lt!58840 (bvsub (bvadd lt!58843 to!314) i!635))))))

(assert (=> b!38595 (= lt!58840 (bitIndex!0 (size!881 (buf!1209 (_2!1952 lt!58859))) (currentByte!2621 (_2!1952 lt!58859)) (currentBit!2616 (_2!1952 lt!58859))))))

(declare-fun b!38596 () Bool)

(assert (=> b!38596 (= e!25333 e!25331)))

(declare-fun res!32745 () Bool)

(assert (=> b!38596 (=> res!32745 e!25331)))

(declare-fun lt!58842 () List!457)

(assert (=> b!38596 (= res!32745 (not (= lt!58842 lt!58857)))))

(assert (=> b!38596 (= lt!58857 lt!58842)))

(declare-fun tail!174 (List!457) List!457)

(assert (=> b!38596 (= lt!58842 (tail!174 lt!58847))))

(declare-fun lt!58854 () Unit!2783)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1512 BitStream!1512 BitStream!1512 BitStream!1512 (_ BitVec 64) List!457) Unit!2783)

(assert (=> b!38596 (= lt!58854 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1952 lt!58859) (_2!1952 lt!58859) (_1!1953 lt!58848) (_1!1953 lt!58841) (bvsub to!314 i!635) lt!58847))))

(declare-fun b!38597 () Bool)

(declare-fun res!32744 () Bool)

(assert (=> b!38597 (=> res!32744 e!25327)))

(assert (=> b!38597 (= res!32744 (not (invariant!0 (currentBit!2616 (_2!1952 lt!58861)) (currentByte!2621 (_2!1952 lt!58861)) (size!881 (buf!1209 (_2!1952 lt!58859))))))))

(declare-fun b!38598 () Bool)

(declare-fun res!32736 () Bool)

(assert (=> b!38598 (=> res!32736 e!25326)))

(assert (=> b!38598 (= res!32736 (not (= (size!881 (buf!1209 thiss!1379)) (size!881 (buf!1209 (_2!1952 lt!58859))))))))

(declare-fun b!38599 () Bool)

(assert (=> b!38599 (= e!25330 e!25338)))

(declare-fun res!32741 () Bool)

(assert (=> b!38599 (=> res!32741 e!25338)))

(assert (=> b!38599 (= res!32741 (not (isPrefixOf!0 thiss!1379 (_2!1952 lt!58861))))))

(assert (=> b!38599 (validate_offset_bits!1 ((_ sign_extend 32) (size!881 (buf!1209 (_2!1952 lt!58861)))) ((_ sign_extend 32) (currentByte!2621 (_2!1952 lt!58861))) ((_ sign_extend 32) (currentBit!2616 (_2!1952 lt!58861))) lt!58846)))

(assert (=> b!38599 (= lt!58846 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58837 () Unit!2783)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1512 BitStream!1512 (_ BitVec 64) (_ BitVec 64)) Unit!2783)

(assert (=> b!38599 (= lt!58837 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1952 lt!58861) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1512 (_ BitVec 8) (_ BitVec 32)) tuple2!3730)

(assert (=> b!38599 (= lt!58861 (appendBitFromByte!0 thiss!1379 (select (arr!1377 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38600 () Bool)

(declare-fun res!32735 () Bool)

(assert (=> b!38600 (=> (not res!32735) (not e!25332))))

(assert (=> b!38600 (= res!32735 (validate_offset_bits!1 ((_ sign_extend 32) (size!881 (buf!1209 thiss!1379))) ((_ sign_extend 32) (currentByte!2621 thiss!1379)) ((_ sign_extend 32) (currentBit!2616 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!38601 () Bool)

(declare-fun res!32732 () Bool)

(assert (=> b!38601 (=> res!32732 e!25333)))

(declare-fun length!183 (List!457) Int)

(assert (=> b!38601 (= res!32732 (<= (length!183 lt!58847) 0))))

(declare-fun b!38602 () Bool)

(declare-fun res!32731 () Bool)

(assert (=> b!38602 (=> res!32731 e!25326)))

(assert (=> b!38602 (= res!32731 (not (invariant!0 (currentBit!2616 (_2!1952 lt!58859)) (currentByte!2621 (_2!1952 lt!58859)) (size!881 (buf!1209 (_2!1952 lt!58859))))))))

(assert (= (and start!7906 res!32739) b!38600))

(assert (= (and b!38600 res!32735) b!38588))

(assert (= (and b!38588 (not res!32740)) b!38599))

(assert (= (and b!38599 (not res!32741)) b!38592))

(assert (= (and b!38592 res!32746) b!38587))

(assert (= (and b!38592 (not res!32748)) b!38595))

(assert (= (and b!38595 (not res!32733)) b!38602))

(assert (= (and b!38602 (not res!32731)) b!38598))

(assert (= (and b!38598 (not res!32736)) b!38584))

(assert (= (and b!38584 (not res!32737)) b!38591))

(assert (= (and b!38591 (not res!32747)) b!38597))

(assert (= (and b!38597 (not res!32744)) b!38593))

(assert (= (and b!38593 (not res!32743)) b!38601))

(assert (= (and b!38601 (not res!32732)) b!38596))

(assert (= (and b!38596 (not res!32745)) b!38586))

(assert (= (and b!38586 (not res!32734)) b!38582))

(assert (= (and b!38582 (not res!32730)) b!38590))

(assert (= (and b!38590 (not res!32742)) b!38583))

(assert (= (and b!38583 (not res!32738)) b!38585))

(assert (= (and b!38585 (not res!32729)) b!38589))

(assert (= start!7906 b!38594))

(declare-fun m!58793 () Bool)

(assert (=> b!38584 m!58793))

(declare-fun m!58795 () Bool)

(assert (=> b!38592 m!58795))

(declare-fun m!58797 () Bool)

(assert (=> b!38592 m!58797))

(declare-fun m!58799 () Bool)

(assert (=> b!38592 m!58799))

(declare-fun m!58801 () Bool)

(assert (=> b!38592 m!58801))

(declare-fun m!58803 () Bool)

(assert (=> b!38592 m!58803))

(declare-fun m!58805 () Bool)

(assert (=> b!38592 m!58805))

(declare-fun m!58807 () Bool)

(assert (=> b!38592 m!58807))

(declare-fun m!58809 () Bool)

(assert (=> b!38596 m!58809))

(declare-fun m!58811 () Bool)

(assert (=> b!38596 m!58811))

(declare-fun m!58813 () Bool)

(assert (=> b!38585 m!58813))

(declare-fun m!58815 () Bool)

(assert (=> b!38585 m!58815))

(declare-fun m!58817 () Bool)

(assert (=> b!38599 m!58817))

(declare-fun m!58819 () Bool)

(assert (=> b!38599 m!58819))

(declare-fun m!58821 () Bool)

(assert (=> b!38599 m!58821))

(declare-fun m!58823 () Bool)

(assert (=> b!38599 m!58823))

(declare-fun m!58825 () Bool)

(assert (=> b!38599 m!58825))

(assert (=> b!38599 m!58821))

(declare-fun m!58827 () Bool)

(assert (=> b!38587 m!58827))

(assert (=> b!38587 m!58827))

(declare-fun m!58829 () Bool)

(assert (=> b!38587 m!58829))

(declare-fun m!58831 () Bool)

(assert (=> b!38587 m!58831))

(assert (=> b!38587 m!58831))

(declare-fun m!58833 () Bool)

(assert (=> b!38587 m!58833))

(declare-fun m!58835 () Bool)

(assert (=> b!38595 m!58835))

(declare-fun m!58837 () Bool)

(assert (=> b!38590 m!58837))

(assert (=> b!38590 m!58837))

(declare-fun m!58839 () Bool)

(assert (=> b!38590 m!58839))

(declare-fun m!58841 () Bool)

(assert (=> b!38590 m!58841))

(declare-fun m!58843 () Bool)

(assert (=> b!38586 m!58843))

(declare-fun m!58845 () Bool)

(assert (=> b!38586 m!58845))

(declare-fun m!58847 () Bool)

(assert (=> b!38597 m!58847))

(declare-fun m!58849 () Bool)

(assert (=> b!38602 m!58849))

(declare-fun m!58851 () Bool)

(assert (=> b!38588 m!58851))

(declare-fun m!58853 () Bool)

(assert (=> b!38588 m!58853))

(declare-fun m!58855 () Bool)

(assert (=> b!38588 m!58855))

(declare-fun m!58857 () Bool)

(assert (=> b!38594 m!58857))

(declare-fun m!58859 () Bool)

(assert (=> b!38593 m!58859))

(declare-fun m!58861 () Bool)

(assert (=> b!38593 m!58861))

(declare-fun m!58863 () Bool)

(assert (=> b!38593 m!58863))

(declare-fun m!58865 () Bool)

(assert (=> b!38593 m!58865))

(declare-fun m!58867 () Bool)

(assert (=> b!38593 m!58867))

(declare-fun m!58869 () Bool)

(assert (=> b!38593 m!58869))

(declare-fun m!58871 () Bool)

(assert (=> b!38593 m!58871))

(declare-fun m!58873 () Bool)

(assert (=> b!38593 m!58873))

(declare-fun m!58875 () Bool)

(assert (=> start!7906 m!58875))

(declare-fun m!58877 () Bool)

(assert (=> start!7906 m!58877))

(declare-fun m!58879 () Bool)

(assert (=> b!38583 m!58879))

(declare-fun m!58881 () Bool)

(assert (=> b!38600 m!58881))

(declare-fun m!58883 () Bool)

(assert (=> b!38582 m!58883))

(declare-fun m!58885 () Bool)

(assert (=> b!38589 m!58885))

(declare-fun m!58887 () Bool)

(assert (=> b!38601 m!58887))

(declare-fun m!58889 () Bool)

(assert (=> b!38591 m!58889))

(check-sat (not b!38589) (not b!38590) (not b!38591) (not b!38582) (not b!38597) (not b!38586) (not start!7906) (not b!38585) (not b!38593) (not b!38601) (not b!38595) (not b!38584) (not b!38600) (not b!38596) (not b!38602) (not b!38599) (not b!38594) (not b!38592) (not b!38583) (not b!38588) (not b!38587))
