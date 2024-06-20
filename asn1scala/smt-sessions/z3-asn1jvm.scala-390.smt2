; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10024 () Bool)

(assert start!10024)

(declare-fun b!50879 () Bool)

(declare-fun res!42646 () Bool)

(declare-fun e!33642 () Bool)

(assert (=> b!50879 (=> res!42646 e!33642)))

(declare-datatypes ((array!2346 0))(
  ( (array!2347 (arr!1596 (Array (_ BitVec 32) (_ BitVec 8))) (size!1067 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1848 0))(
  ( (BitStream!1849 (buf!1422 array!2346) (currentByte!2945 (_ BitVec 32)) (currentBit!2940 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1848)

(declare-datatypes ((Unit!3509 0))(
  ( (Unit!3510) )
))
(declare-datatypes ((tuple2!4686 0))(
  ( (tuple2!4687 (_1!2448 Unit!3509) (_2!2448 BitStream!1848)) )
))
(declare-fun lt!78762 () tuple2!4686)

(assert (=> b!50879 (= res!42646 (not (= (size!1067 (buf!1422 thiss!1379)) (size!1067 (buf!1422 (_2!2448 lt!78762))))))))

(declare-fun b!50880 () Bool)

(declare-fun e!33648 () Bool)

(declare-fun e!33646 () Bool)

(assert (=> b!50880 (= e!33648 e!33646)))

(declare-fun res!42629 () Bool)

(assert (=> b!50880 (=> res!42629 e!33646)))

(declare-fun lt!78757 () Bool)

(declare-fun lt!78770 () Bool)

(assert (=> b!50880 (= res!42629 (not (= lt!78757 lt!78770)))))

(declare-fun lt!78755 () Bool)

(assert (=> b!50880 (= lt!78755 lt!78757)))

(declare-fun lt!78771 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2346 (_ BitVec 64)) Bool)

(assert (=> b!50880 (= lt!78757 (bitAt!0 (buf!1422 (_2!2448 lt!78762)) lt!78771))))

(declare-fun lt!78769 () (_ BitVec 64))

(declare-fun lt!78750 () Unit!3509)

(declare-fun lt!78752 () tuple2!4686)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2346 array!2346 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3509)

(assert (=> b!50880 (= lt!78750 (arrayBitRangesEqImpliesEq!0 (buf!1422 (_2!2448 lt!78752)) (buf!1422 (_2!2448 lt!78762)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78771 lt!78769))))

(declare-fun b!50881 () Bool)

(declare-fun e!33645 () Bool)

(assert (=> b!50881 (= e!33645 e!33642)))

(declare-fun res!42648 () Bool)

(assert (=> b!50881 (=> res!42648 e!33642)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!78763 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!50881 (= res!42648 (not (= lt!78763 (bvsub (bvadd lt!78771 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50881 (= lt!78763 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78762))) (currentByte!2945 (_2!2448 lt!78762)) (currentBit!2940 (_2!2448 lt!78762))))))

(declare-fun b!50882 () Bool)

(declare-fun e!33644 () Bool)

(declare-fun e!33651 () Bool)

(assert (=> b!50882 (= e!33644 e!33651)))

(declare-fun res!42643 () Bool)

(assert (=> b!50882 (=> res!42643 e!33651)))

(declare-fun isPrefixOf!0 (BitStream!1848 BitStream!1848) Bool)

(assert (=> b!50882 (= res!42643 (not (isPrefixOf!0 thiss!1379 (_2!2448 lt!78752))))))

(declare-fun lt!78759 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50882 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!78759)))

(assert (=> b!50882 (= lt!78759 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78764 () Unit!3509)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1848 BitStream!1848 (_ BitVec 64) (_ BitVec 64)) Unit!3509)

(assert (=> b!50882 (= lt!78764 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2448 lt!78752) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2346)

(declare-fun appendBitFromByte!0 (BitStream!1848 (_ BitVec 8) (_ BitVec 32)) tuple2!4686)

(assert (=> b!50882 (= lt!78752 (appendBitFromByte!0 thiss!1379 (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50883 () Bool)

(declare-datatypes ((tuple2!4688 0))(
  ( (tuple2!4689 (_1!2449 BitStream!1848) (_2!2449 BitStream!1848)) )
))
(declare-fun lt!78765 () tuple2!4688)

(declare-datatypes ((tuple2!4690 0))(
  ( (tuple2!4691 (_1!2450 BitStream!1848) (_2!2450 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1848) tuple2!4690)

(assert (=> b!50883 (= e!33646 (= (_2!2450 (readBitPure!0 (_1!2449 lt!78765))) lt!78770))))

(declare-fun b!50884 () Bool)

(declare-fun res!42639 () Bool)

(assert (=> b!50884 (=> res!42639 e!33642)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50884 (= res!42639 (not (invariant!0 (currentBit!2940 (_2!2448 lt!78762)) (currentByte!2945 (_2!2448 lt!78762)) (size!1067 (buf!1422 (_2!2448 lt!78762))))))))

(declare-fun b!50885 () Bool)

(declare-fun res!42631 () Bool)

(declare-fun e!33639 () Bool)

(assert (=> b!50885 (=> res!42631 e!33639)))

(declare-datatypes ((List!565 0))(
  ( (Nil!562) (Cons!561 (h!680 Bool) (t!1315 List!565)) )
))
(declare-fun lt!78753 () List!565)

(declare-fun length!260 (List!565) Int)

(assert (=> b!50885 (= res!42631 (<= (length!260 lt!78753) 0))))

(declare-fun b!50886 () Bool)

(declare-fun e!33641 () Bool)

(assert (=> b!50886 (= e!33639 e!33641)))

(declare-fun res!42641 () Bool)

(assert (=> b!50886 (=> res!42641 e!33641)))

(declare-fun lt!78766 () List!565)

(declare-fun lt!78767 () List!565)

(assert (=> b!50886 (= res!42641 (not (= lt!78766 lt!78767)))))

(assert (=> b!50886 (= lt!78767 lt!78766)))

(declare-fun tail!251 (List!565) List!565)

(assert (=> b!50886 (= lt!78766 (tail!251 lt!78753))))

(declare-fun lt!78760 () Unit!3509)

(declare-fun lt!78768 () tuple2!4688)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1848 BitStream!1848 BitStream!1848 BitStream!1848 (_ BitVec 64) List!565) Unit!3509)

(assert (=> b!50886 (= lt!78760 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2448 lt!78762) (_2!2448 lt!78762) (_1!2449 lt!78765) (_1!2449 lt!78768) (bvsub to!314 i!635) lt!78753))))

(declare-fun res!42647 () Bool)

(declare-fun e!33650 () Bool)

(assert (=> start!10024 (=> (not res!42647) (not e!33650))))

(assert (=> start!10024 (= res!42647 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1067 srcBuffer!2))))))))

(assert (=> start!10024 e!33650))

(assert (=> start!10024 true))

(declare-fun array_inv!977 (array!2346) Bool)

(assert (=> start!10024 (array_inv!977 srcBuffer!2)))

(declare-fun e!33647 () Bool)

(declare-fun inv!12 (BitStream!1848) Bool)

(assert (=> start!10024 (and (inv!12 thiss!1379) e!33647)))

(declare-fun b!50887 () Bool)

(assert (=> b!50887 (= e!33650 (not e!33644))))

(declare-fun res!42640 () Bool)

(assert (=> b!50887 (=> res!42640 e!33644)))

(assert (=> b!50887 (= res!42640 (bvsge i!635 to!314))))

(assert (=> b!50887 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78751 () Unit!3509)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1848) Unit!3509)

(assert (=> b!50887 (= lt!78751 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50887 (= lt!78771 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(declare-fun b!50888 () Bool)

(assert (=> b!50888 (= e!33647 (array_inv!977 (buf!1422 thiss!1379)))))

(declare-fun b!50889 () Bool)

(declare-fun res!42633 () Bool)

(declare-fun e!33640 () Bool)

(assert (=> b!50889 (=> res!42633 e!33640)))

(assert (=> b!50889 (= res!42633 (not (invariant!0 (currentBit!2940 (_2!2448 lt!78752)) (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78752))))))))

(declare-fun b!50890 () Bool)

(declare-fun e!33649 () Bool)

(assert (=> b!50890 (= e!33641 e!33649)))

(declare-fun res!42644 () Bool)

(assert (=> b!50890 (=> res!42644 e!33649)))

(declare-fun lt!78754 () Bool)

(assert (=> b!50890 (= res!42644 (not (= lt!78754 (bitAt!0 (buf!1422 (_1!2449 lt!78768)) lt!78771))))))

(assert (=> b!50890 (= lt!78754 (bitAt!0 (buf!1422 (_1!2449 lt!78765)) lt!78771))))

(declare-fun b!50891 () Bool)

(declare-fun e!33653 () Bool)

(assert (=> b!50891 (= e!33649 e!33653)))

(declare-fun res!42638 () Bool)

(assert (=> b!50891 (=> res!42638 e!33653)))

(declare-fun head!384 (List!565) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1848 array!2346 (_ BitVec 64) (_ BitVec 64)) List!565)

(assert (=> b!50891 (= res!42638 (not (= (head!384 (byteArrayBitContentToList!0 (_2!2448 lt!78762) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78770)))))

(assert (=> b!50891 (= lt!78770 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50892 () Bool)

(declare-fun res!42642 () Bool)

(assert (=> b!50892 (=> res!42642 e!33649)))

(assert (=> b!50892 (= res!42642 (not (= (head!384 lt!78753) lt!78754)))))

(declare-fun b!50893 () Bool)

(assert (=> b!50893 (= e!33640 e!33639)))

(declare-fun res!42632 () Bool)

(assert (=> b!50893 (=> res!42632 e!33639)))

(assert (=> b!50893 (= res!42632 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1848 BitStream!1848 (_ BitVec 64)) List!565)

(assert (=> b!50893 (= lt!78767 (bitStreamReadBitsIntoList!0 (_2!2448 lt!78762) (_1!2449 lt!78768) lt!78759))))

(assert (=> b!50893 (= lt!78753 (bitStreamReadBitsIntoList!0 (_2!2448 lt!78762) (_1!2449 lt!78765) (bvsub to!314 i!635)))))

(assert (=> b!50893 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!78759)))

(declare-fun lt!78756 () Unit!3509)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1848 array!2346 (_ BitVec 64)) Unit!3509)

(assert (=> b!50893 (= lt!78756 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2448 lt!78752) (buf!1422 (_2!2448 lt!78762)) lt!78759))))

(declare-fun reader!0 (BitStream!1848 BitStream!1848) tuple2!4688)

(assert (=> b!50893 (= lt!78768 (reader!0 (_2!2448 lt!78752) (_2!2448 lt!78762)))))

(assert (=> b!50893 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78758 () Unit!3509)

(assert (=> b!50893 (= lt!78758 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1422 (_2!2448 lt!78762)) (bvsub to!314 i!635)))))

(assert (=> b!50893 (= lt!78765 (reader!0 thiss!1379 (_2!2448 lt!78762)))))

(declare-fun b!50894 () Bool)

(assert (=> b!50894 (= e!33642 e!33640)))

(declare-fun res!42645 () Bool)

(assert (=> b!50894 (=> res!42645 e!33640)))

(assert (=> b!50894 (= res!42645 (not (= (size!1067 (buf!1422 (_2!2448 lt!78752))) (size!1067 (buf!1422 (_2!2448 lt!78762))))))))

(assert (=> b!50894 (= lt!78763 (bvsub (bvsub (bvadd lt!78769 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50894 (= lt!78769 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))))))

(assert (=> b!50894 (= (size!1067 (buf!1422 (_2!2448 lt!78762))) (size!1067 (buf!1422 thiss!1379)))))

(declare-fun b!50895 () Bool)

(assert (=> b!50895 (= e!33651 e!33645)))

(declare-fun res!42634 () Bool)

(assert (=> b!50895 (=> res!42634 e!33645)))

(assert (=> b!50895 (= res!42634 (not (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!78762))))))

(assert (=> b!50895 (isPrefixOf!0 thiss!1379 (_2!2448 lt!78762))))

(declare-fun lt!78749 () Unit!3509)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1848 BitStream!1848 BitStream!1848) Unit!3509)

(assert (=> b!50895 (= lt!78749 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2448 lt!78752) (_2!2448 lt!78762)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1848 array!2346 (_ BitVec 64) (_ BitVec 64)) tuple2!4686)

(assert (=> b!50895 (= lt!78762 (appendBitsMSBFirstLoop!0 (_2!2448 lt!78752) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33638 () Bool)

(assert (=> b!50895 e!33638))

(declare-fun res!42635 () Bool)

(assert (=> b!50895 (=> (not res!42635) (not e!33638))))

(assert (=> b!50895 (= res!42635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78772 () Unit!3509)

(assert (=> b!50895 (= lt!78772 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1422 (_2!2448 lt!78752)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78761 () tuple2!4688)

(assert (=> b!50895 (= lt!78761 (reader!0 thiss!1379 (_2!2448 lt!78752)))))

(declare-fun b!50896 () Bool)

(assert (=> b!50896 (= e!33638 (= (head!384 (byteArrayBitContentToList!0 (_2!2448 lt!78752) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!384 (bitStreamReadBitsIntoList!0 (_2!2448 lt!78752) (_1!2449 lt!78761) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50897 () Bool)

(declare-fun res!42630 () Bool)

(assert (=> b!50897 (=> res!42630 e!33640)))

(assert (=> b!50897 (= res!42630 (not (invariant!0 (currentBit!2940 (_2!2448 lt!78752)) (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78762))))))))

(declare-fun b!50898 () Bool)

(assert (=> b!50898 (= e!33653 e!33648)))

(declare-fun res!42637 () Bool)

(assert (=> b!50898 (=> res!42637 e!33648)))

(assert (=> b!50898 (= res!42637 (not (= lt!78755 lt!78770)))))

(assert (=> b!50898 (= lt!78755 (bitAt!0 (buf!1422 (_2!2448 lt!78752)) lt!78771))))

(declare-fun b!50899 () Bool)

(declare-fun res!42636 () Bool)

(assert (=> b!50899 (=> (not res!42636) (not e!33650))))

(assert (=> b!50899 (= res!42636 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 thiss!1379))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10024 res!42647) b!50899))

(assert (= (and b!50899 res!42636) b!50887))

(assert (= (and b!50887 (not res!42640)) b!50882))

(assert (= (and b!50882 (not res!42643)) b!50895))

(assert (= (and b!50895 res!42635) b!50896))

(assert (= (and b!50895 (not res!42634)) b!50881))

(assert (= (and b!50881 (not res!42648)) b!50884))

(assert (= (and b!50884 (not res!42639)) b!50879))

(assert (= (and b!50879 (not res!42646)) b!50894))

(assert (= (and b!50894 (not res!42645)) b!50889))

(assert (= (and b!50889 (not res!42633)) b!50897))

(assert (= (and b!50897 (not res!42630)) b!50893))

(assert (= (and b!50893 (not res!42632)) b!50885))

(assert (= (and b!50885 (not res!42631)) b!50886))

(assert (= (and b!50886 (not res!42641)) b!50890))

(assert (= (and b!50890 (not res!42644)) b!50892))

(assert (= (and b!50892 (not res!42642)) b!50891))

(assert (= (and b!50891 (not res!42638)) b!50898))

(assert (= (and b!50898 (not res!42637)) b!50880))

(assert (= (and b!50880 (not res!42629)) b!50883))

(assert (= start!10024 b!50888))

(declare-fun m!80045 () Bool)

(assert (=> b!50896 m!80045))

(assert (=> b!50896 m!80045))

(declare-fun m!80047 () Bool)

(assert (=> b!50896 m!80047))

(declare-fun m!80049 () Bool)

(assert (=> b!50896 m!80049))

(assert (=> b!50896 m!80049))

(declare-fun m!80051 () Bool)

(assert (=> b!50896 m!80051))

(declare-fun m!80053 () Bool)

(assert (=> b!50893 m!80053))

(declare-fun m!80055 () Bool)

(assert (=> b!50893 m!80055))

(declare-fun m!80057 () Bool)

(assert (=> b!50893 m!80057))

(declare-fun m!80059 () Bool)

(assert (=> b!50893 m!80059))

(declare-fun m!80061 () Bool)

(assert (=> b!50893 m!80061))

(declare-fun m!80063 () Bool)

(assert (=> b!50893 m!80063))

(declare-fun m!80065 () Bool)

(assert (=> b!50893 m!80065))

(declare-fun m!80067 () Bool)

(assert (=> b!50893 m!80067))

(declare-fun m!80069 () Bool)

(assert (=> b!50895 m!80069))

(declare-fun m!80071 () Bool)

(assert (=> b!50895 m!80071))

(declare-fun m!80073 () Bool)

(assert (=> b!50895 m!80073))

(declare-fun m!80075 () Bool)

(assert (=> b!50895 m!80075))

(declare-fun m!80077 () Bool)

(assert (=> b!50895 m!80077))

(declare-fun m!80079 () Bool)

(assert (=> b!50895 m!80079))

(declare-fun m!80081 () Bool)

(assert (=> b!50895 m!80081))

(declare-fun m!80083 () Bool)

(assert (=> b!50898 m!80083))

(declare-fun m!80085 () Bool)

(assert (=> b!50883 m!80085))

(declare-fun m!80087 () Bool)

(assert (=> b!50886 m!80087))

(declare-fun m!80089 () Bool)

(assert (=> b!50886 m!80089))

(declare-fun m!80091 () Bool)

(assert (=> b!50882 m!80091))

(declare-fun m!80093 () Bool)

(assert (=> b!50882 m!80093))

(declare-fun m!80095 () Bool)

(assert (=> b!50882 m!80095))

(assert (=> b!50882 m!80093))

(declare-fun m!80097 () Bool)

(assert (=> b!50882 m!80097))

(declare-fun m!80099 () Bool)

(assert (=> b!50882 m!80099))

(declare-fun m!80101 () Bool)

(assert (=> b!50888 m!80101))

(declare-fun m!80103 () Bool)

(assert (=> b!50881 m!80103))

(declare-fun m!80105 () Bool)

(assert (=> b!50884 m!80105))

(declare-fun m!80107 () Bool)

(assert (=> b!50894 m!80107))

(declare-fun m!80109 () Bool)

(assert (=> b!50892 m!80109))

(declare-fun m!80111 () Bool)

(assert (=> b!50899 m!80111))

(declare-fun m!80113 () Bool)

(assert (=> b!50897 m!80113))

(declare-fun m!80115 () Bool)

(assert (=> b!50885 m!80115))

(declare-fun m!80117 () Bool)

(assert (=> b!50880 m!80117))

(declare-fun m!80119 () Bool)

(assert (=> b!50880 m!80119))

(declare-fun m!80121 () Bool)

(assert (=> b!50890 m!80121))

(declare-fun m!80123 () Bool)

(assert (=> b!50890 m!80123))

(declare-fun m!80125 () Bool)

(assert (=> b!50889 m!80125))

(declare-fun m!80127 () Bool)

(assert (=> b!50891 m!80127))

(assert (=> b!50891 m!80127))

(declare-fun m!80129 () Bool)

(assert (=> b!50891 m!80129))

(declare-fun m!80131 () Bool)

(assert (=> b!50891 m!80131))

(declare-fun m!80133 () Bool)

(assert (=> b!50887 m!80133))

(declare-fun m!80135 () Bool)

(assert (=> b!50887 m!80135))

(declare-fun m!80137 () Bool)

(assert (=> b!50887 m!80137))

(declare-fun m!80139 () Bool)

(assert (=> start!10024 m!80139))

(declare-fun m!80141 () Bool)

(assert (=> start!10024 m!80141))

(check-sat (not start!10024) (not b!50890) (not b!50897) (not b!50893) (not b!50885) (not b!50884) (not b!50891) (not b!50892) (not b!50882) (not b!50896) (not b!50888) (not b!50887) (not b!50883) (not b!50881) (not b!50889) (not b!50895) (not b!50898) (not b!50894) (not b!50880) (not b!50886) (not b!50899))
(check-sat)
(get-model)

(declare-fun d!15974 () Bool)

(declare-fun res!42717 () Bool)

(declare-fun e!33706 () Bool)

(assert (=> d!15974 (=> (not res!42717) (not e!33706))))

(assert (=> d!15974 (= res!42717 (= (size!1067 (buf!1422 (_2!2448 lt!78752))) (size!1067 (buf!1422 (_2!2448 lt!78762)))))))

(assert (=> d!15974 (= (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!78762)) e!33706)))

(declare-fun b!50969 () Bool)

(declare-fun res!42716 () Bool)

(assert (=> b!50969 (=> (not res!42716) (not e!33706))))

(assert (=> b!50969 (= res!42716 (bvsle (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))) (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78762))) (currentByte!2945 (_2!2448 lt!78762)) (currentBit!2940 (_2!2448 lt!78762)))))))

(declare-fun b!50970 () Bool)

(declare-fun e!33707 () Bool)

(assert (=> b!50970 (= e!33706 e!33707)))

(declare-fun res!42715 () Bool)

(assert (=> b!50970 (=> res!42715 e!33707)))

(assert (=> b!50970 (= res!42715 (= (size!1067 (buf!1422 (_2!2448 lt!78752))) #b00000000000000000000000000000000))))

(declare-fun b!50971 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2346 array!2346 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50971 (= e!33707 (arrayBitRangesEq!0 (buf!1422 (_2!2448 lt!78752)) (buf!1422 (_2!2448 lt!78762)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752)))))))

(assert (= (and d!15974 res!42717) b!50969))

(assert (= (and b!50969 res!42716) b!50970))

(assert (= (and b!50970 (not res!42715)) b!50971))

(assert (=> b!50969 m!80107))

(assert (=> b!50969 m!80103))

(assert (=> b!50971 m!80107))

(assert (=> b!50971 m!80107))

(declare-fun m!80241 () Bool)

(assert (=> b!50971 m!80241))

(assert (=> b!50895 d!15974))

(declare-fun d!15976 () Bool)

(assert (=> d!15976 (isPrefixOf!0 thiss!1379 (_2!2448 lt!78762))))

(declare-fun lt!78847 () Unit!3509)

(declare-fun choose!30 (BitStream!1848 BitStream!1848 BitStream!1848) Unit!3509)

(assert (=> d!15976 (= lt!78847 (choose!30 thiss!1379 (_2!2448 lt!78752) (_2!2448 lt!78762)))))

(assert (=> d!15976 (isPrefixOf!0 thiss!1379 (_2!2448 lt!78752))))

(assert (=> d!15976 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2448 lt!78752) (_2!2448 lt!78762)) lt!78847)))

(declare-fun bs!4015 () Bool)

(assert (= bs!4015 d!15976))

(assert (=> bs!4015 m!80079))

(declare-fun m!80243 () Bool)

(assert (=> bs!4015 m!80243))

(assert (=> bs!4015 m!80095))

(assert (=> b!50895 d!15976))

(declare-fun d!15978 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!15978 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4016 () Bool)

(assert (= bs!4016 d!15978))

(declare-fun m!80245 () Bool)

(assert (=> bs!4016 m!80245))

(assert (=> b!50895 d!15978))

(declare-fun b!50982 () Bool)

(declare-fun res!42724 () Bool)

(declare-fun e!33713 () Bool)

(assert (=> b!50982 (=> (not res!42724) (not e!33713))))

(declare-fun lt!78893 () tuple2!4688)

(assert (=> b!50982 (= res!42724 (isPrefixOf!0 (_1!2449 lt!78893) thiss!1379))))

(declare-fun d!15980 () Bool)

(assert (=> d!15980 e!33713))

(declare-fun res!42726 () Bool)

(assert (=> d!15980 (=> (not res!42726) (not e!33713))))

(assert (=> d!15980 (= res!42726 (isPrefixOf!0 (_1!2449 lt!78893) (_2!2449 lt!78893)))))

(declare-fun lt!78906 () BitStream!1848)

(assert (=> d!15980 (= lt!78893 (tuple2!4689 lt!78906 (_2!2448 lt!78752)))))

(declare-fun lt!78898 () Unit!3509)

(declare-fun lt!78900 () Unit!3509)

(assert (=> d!15980 (= lt!78898 lt!78900)))

(assert (=> d!15980 (isPrefixOf!0 lt!78906 (_2!2448 lt!78752))))

(assert (=> d!15980 (= lt!78900 (lemmaIsPrefixTransitive!0 lt!78906 (_2!2448 lt!78752) (_2!2448 lt!78752)))))

(declare-fun lt!78903 () Unit!3509)

(declare-fun lt!78890 () Unit!3509)

(assert (=> d!15980 (= lt!78903 lt!78890)))

(assert (=> d!15980 (isPrefixOf!0 lt!78906 (_2!2448 lt!78752))))

(assert (=> d!15980 (= lt!78890 (lemmaIsPrefixTransitive!0 lt!78906 thiss!1379 (_2!2448 lt!78752)))))

(declare-fun lt!78895 () Unit!3509)

(declare-fun e!33712 () Unit!3509)

(assert (=> d!15980 (= lt!78895 e!33712)))

(declare-fun c!3615 () Bool)

(assert (=> d!15980 (= c!3615 (not (= (size!1067 (buf!1422 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!78892 () Unit!3509)

(declare-fun lt!78899 () Unit!3509)

(assert (=> d!15980 (= lt!78892 lt!78899)))

(assert (=> d!15980 (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!78752))))

(assert (=> d!15980 (= lt!78899 (lemmaIsPrefixRefl!0 (_2!2448 lt!78752)))))

(declare-fun lt!78901 () Unit!3509)

(declare-fun lt!78904 () Unit!3509)

(assert (=> d!15980 (= lt!78901 lt!78904)))

(assert (=> d!15980 (= lt!78904 (lemmaIsPrefixRefl!0 (_2!2448 lt!78752)))))

(declare-fun lt!78889 () Unit!3509)

(declare-fun lt!78907 () Unit!3509)

(assert (=> d!15980 (= lt!78889 lt!78907)))

(assert (=> d!15980 (isPrefixOf!0 lt!78906 lt!78906)))

(assert (=> d!15980 (= lt!78907 (lemmaIsPrefixRefl!0 lt!78906))))

(declare-fun lt!78902 () Unit!3509)

(declare-fun lt!78891 () Unit!3509)

(assert (=> d!15980 (= lt!78902 lt!78891)))

(assert (=> d!15980 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15980 (= lt!78891 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!15980 (= lt!78906 (BitStream!1849 (buf!1422 (_2!2448 lt!78752)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(assert (=> d!15980 (isPrefixOf!0 thiss!1379 (_2!2448 lt!78752))))

(assert (=> d!15980 (= (reader!0 thiss!1379 (_2!2448 lt!78752)) lt!78893)))

(declare-fun b!50983 () Bool)

(declare-fun Unit!3513 () Unit!3509)

(assert (=> b!50983 (= e!33712 Unit!3513)))

(declare-fun b!50984 () Bool)

(declare-fun res!42725 () Bool)

(assert (=> b!50984 (=> (not res!42725) (not e!33713))))

(assert (=> b!50984 (= res!42725 (isPrefixOf!0 (_2!2449 lt!78893) (_2!2448 lt!78752)))))

(declare-fun b!50985 () Bool)

(declare-fun lt!78896 () Unit!3509)

(assert (=> b!50985 (= e!33712 lt!78896)))

(declare-fun lt!78888 () (_ BitVec 64))

(assert (=> b!50985 (= lt!78888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!78905 () (_ BitVec 64))

(assert (=> b!50985 (= lt!78905 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2346 array!2346 (_ BitVec 64) (_ BitVec 64)) Unit!3509)

(assert (=> b!50985 (= lt!78896 (arrayBitRangesEqSymmetric!0 (buf!1422 thiss!1379) (buf!1422 (_2!2448 lt!78752)) lt!78888 lt!78905))))

(assert (=> b!50985 (arrayBitRangesEq!0 (buf!1422 (_2!2448 lt!78752)) (buf!1422 thiss!1379) lt!78888 lt!78905)))

(declare-fun b!50986 () Bool)

(declare-fun lt!78894 () (_ BitVec 64))

(declare-fun lt!78897 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1848 (_ BitVec 64)) BitStream!1848)

(assert (=> b!50986 (= e!33713 (= (_1!2449 lt!78893) (withMovedBitIndex!0 (_2!2449 lt!78893) (bvsub lt!78897 lt!78894))))))

(assert (=> b!50986 (or (= (bvand lt!78897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!78894 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!78897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!78897 lt!78894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!50986 (= lt!78894 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))))))

(assert (=> b!50986 (= lt!78897 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(assert (= (and d!15980 c!3615) b!50985))

(assert (= (and d!15980 (not c!3615)) b!50983))

(assert (= (and d!15980 res!42726) b!50982))

(assert (= (and b!50982 res!42724) b!50984))

(assert (= (and b!50984 res!42725) b!50986))

(declare-fun m!80247 () Bool)

(assert (=> b!50984 m!80247))

(declare-fun m!80249 () Bool)

(assert (=> b!50982 m!80249))

(assert (=> b!50985 m!80137))

(declare-fun m!80251 () Bool)

(assert (=> b!50985 m!80251))

(declare-fun m!80253 () Bool)

(assert (=> b!50985 m!80253))

(declare-fun m!80255 () Bool)

(assert (=> b!50986 m!80255))

(assert (=> b!50986 m!80107))

(assert (=> b!50986 m!80137))

(declare-fun m!80257 () Bool)

(assert (=> d!15980 m!80257))

(assert (=> d!15980 m!80095))

(declare-fun m!80259 () Bool)

(assert (=> d!15980 m!80259))

(declare-fun m!80261 () Bool)

(assert (=> d!15980 m!80261))

(declare-fun m!80263 () Bool)

(assert (=> d!15980 m!80263))

(declare-fun m!80265 () Bool)

(assert (=> d!15980 m!80265))

(declare-fun m!80267 () Bool)

(assert (=> d!15980 m!80267))

(assert (=> d!15980 m!80135))

(assert (=> d!15980 m!80133))

(declare-fun m!80269 () Bool)

(assert (=> d!15980 m!80269))

(declare-fun m!80271 () Bool)

(assert (=> d!15980 m!80271))

(assert (=> b!50895 d!15980))

(declare-fun d!15982 () Bool)

(assert (=> d!15982 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!78910 () Unit!3509)

(declare-fun choose!9 (BitStream!1848 array!2346 (_ BitVec 64) BitStream!1848) Unit!3509)

(assert (=> d!15982 (= lt!78910 (choose!9 thiss!1379 (buf!1422 (_2!2448 lt!78752)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1849 (buf!1422 (_2!2448 lt!78752)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379))))))

(assert (=> d!15982 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1422 (_2!2448 lt!78752)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!78910)))

(declare-fun bs!4017 () Bool)

(assert (= bs!4017 d!15982))

(assert (=> bs!4017 m!80073))

(declare-fun m!80273 () Bool)

(assert (=> bs!4017 m!80273))

(assert (=> b!50895 d!15982))

(declare-fun b!51033 () Bool)

(declare-fun e!33738 () tuple2!4686)

(declare-fun Unit!3514 () Unit!3509)

(assert (=> b!51033 (= e!33738 (tuple2!4687 Unit!3514 (_2!2448 lt!78752)))))

(assert (=> b!51033 (= (size!1067 (buf!1422 (_2!2448 lt!78752))) (size!1067 (buf!1422 (_2!2448 lt!78752))))))

(declare-fun lt!79040 () Unit!3509)

(declare-fun Unit!3515 () Unit!3509)

(assert (=> b!51033 (= lt!79040 Unit!3515)))

(declare-fun call!652 () tuple2!4688)

(declare-fun checkByteArrayBitContent!0 (BitStream!1848 array!2346 array!2346 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4698 0))(
  ( (tuple2!4699 (_1!2454 array!2346) (_2!2454 BitStream!1848)) )
))
(declare-fun readBits!0 (BitStream!1848 (_ BitVec 64)) tuple2!4698)

(assert (=> b!51033 (checkByteArrayBitContent!0 (_2!2448 lt!78752) srcBuffer!2 (_1!2454 (readBits!0 (_1!2449 call!652) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!51034 () Bool)

(declare-fun res!42766 () Bool)

(declare-fun e!33739 () Bool)

(assert (=> b!51034 (=> (not res!42766) (not e!33739))))

(declare-fun lt!79025 () tuple2!4686)

(assert (=> b!51034 (= res!42766 (= (size!1067 (buf!1422 (_2!2448 lt!79025))) (size!1067 (buf!1422 (_2!2448 lt!78752)))))))

(declare-fun d!15984 () Bool)

(assert (=> d!15984 e!33739))

(declare-fun res!42763 () Bool)

(assert (=> d!15984 (=> (not res!42763) (not e!33739))))

(declare-fun lt!79051 () (_ BitVec 64))

(assert (=> d!15984 (= res!42763 (= (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79025))) (currentByte!2945 (_2!2448 lt!79025)) (currentBit!2940 (_2!2448 lt!79025))) (bvsub lt!79051 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!15984 (or (= (bvand lt!79051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79051 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!79062 () (_ BitVec 64))

(assert (=> d!15984 (= lt!79051 (bvadd lt!79062 to!314))))

(assert (=> d!15984 (or (not (= (bvand lt!79062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!79062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!79062 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15984 (= lt!79062 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))))))

(assert (=> d!15984 (= lt!79025 e!33738)))

(declare-fun c!3621 () Bool)

(assert (=> d!15984 (= c!3621 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!79042 () Unit!3509)

(declare-fun lt!79058 () Unit!3509)

(assert (=> d!15984 (= lt!79042 lt!79058)))

(assert (=> d!15984 (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!78752))))

(assert (=> d!15984 (= lt!79058 (lemmaIsPrefixRefl!0 (_2!2448 lt!78752)))))

(declare-fun lt!79041 () (_ BitVec 64))

(assert (=> d!15984 (= lt!79041 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))))))

(assert (=> d!15984 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15984 (= (appendBitsMSBFirstLoop!0 (_2!2448 lt!78752) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!79025)))

(declare-fun b!51035 () Bool)

(declare-fun e!33740 () Bool)

(declare-fun lt!79055 () (_ BitVec 64))

(assert (=> b!51035 (= e!33740 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!79055))))

(declare-fun lt!79031 () tuple2!4686)

(declare-fun lt!79060 () tuple2!4686)

(declare-fun bm!649 () Bool)

(assert (=> bm!649 (= call!652 (reader!0 (ite c!3621 (_2!2448 lt!79031) (_2!2448 lt!78752)) (ite c!3621 (_2!2448 lt!79060) (_2!2448 lt!78752))))))

(declare-fun b!51036 () Bool)

(declare-fun res!42765 () Bool)

(assert (=> b!51036 (=> (not res!42765) (not e!33739))))

(assert (=> b!51036 (= res!42765 (invariant!0 (currentBit!2940 (_2!2448 lt!79025)) (currentByte!2945 (_2!2448 lt!79025)) (size!1067 (buf!1422 (_2!2448 lt!79025)))))))

(declare-fun b!51037 () Bool)

(declare-fun res!42768 () Bool)

(assert (=> b!51037 (=> (not res!42768) (not e!33739))))

(assert (=> b!51037 (= res!42768 (= (size!1067 (buf!1422 (_2!2448 lt!78752))) (size!1067 (buf!1422 (_2!2448 lt!79025)))))))

(declare-fun b!51038 () Bool)

(declare-fun res!42764 () Bool)

(assert (=> b!51038 (=> (not res!42764) (not e!33739))))

(assert (=> b!51038 (= res!42764 (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!79025)))))

(declare-fun b!51039 () Bool)

(declare-fun Unit!3516 () Unit!3509)

(assert (=> b!51039 (= e!33738 (tuple2!4687 Unit!3516 (_2!2448 lt!79060)))))

(assert (=> b!51039 (= lt!79031 (appendBitFromByte!0 (_2!2448 lt!78752) (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!79049 () (_ BitVec 64))

(assert (=> b!51039 (= lt!79049 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79033 () (_ BitVec 64))

(assert (=> b!51039 (= lt!79033 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79024 () Unit!3509)

(assert (=> b!51039 (= lt!79024 (validateOffsetBitsIneqLemma!0 (_2!2448 lt!78752) (_2!2448 lt!79031) lt!79049 lt!79033))))

(assert (=> b!51039 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!79031)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!79031))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!79031))) (bvsub lt!79049 lt!79033))))

(declare-fun lt!79052 () Unit!3509)

(assert (=> b!51039 (= lt!79052 lt!79024)))

(declare-fun lt!79054 () tuple2!4688)

(assert (=> b!51039 (= lt!79054 (reader!0 (_2!2448 lt!78752) (_2!2448 lt!79031)))))

(declare-fun lt!79022 () (_ BitVec 64))

(assert (=> b!51039 (= lt!79022 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79023 () Unit!3509)

(assert (=> b!51039 (= lt!79023 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2448 lt!78752) (buf!1422 (_2!2448 lt!79031)) lt!79022))))

(assert (=> b!51039 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!79031)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!79022)))

(declare-fun lt!79048 () Unit!3509)

(assert (=> b!51039 (= lt!79048 lt!79023)))

(assert (=> b!51039 (= (head!384 (byteArrayBitContentToList!0 (_2!2448 lt!79031) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!384 (bitStreamReadBitsIntoList!0 (_2!2448 lt!79031) (_1!2449 lt!79054) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79045 () Unit!3509)

(declare-fun Unit!3517 () Unit!3509)

(assert (=> b!51039 (= lt!79045 Unit!3517)))

(assert (=> b!51039 (= lt!79060 (appendBitsMSBFirstLoop!0 (_2!2448 lt!79031) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!79032 () Unit!3509)

(assert (=> b!51039 (= lt!79032 (lemmaIsPrefixTransitive!0 (_2!2448 lt!78752) (_2!2448 lt!79031) (_2!2448 lt!79060)))))

(assert (=> b!51039 (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!79060))))

(declare-fun lt!79030 () Unit!3509)

(assert (=> b!51039 (= lt!79030 lt!79032)))

(assert (=> b!51039 (= (size!1067 (buf!1422 (_2!2448 lt!79060))) (size!1067 (buf!1422 (_2!2448 lt!78752))))))

(declare-fun lt!79027 () Unit!3509)

(declare-fun Unit!3518 () Unit!3509)

(assert (=> b!51039 (= lt!79027 Unit!3518)))

(assert (=> b!51039 (= (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79060))) (currentByte!2945 (_2!2448 lt!79060)) (currentBit!2940 (_2!2448 lt!79060))) (bvsub (bvadd (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79020 () Unit!3509)

(declare-fun Unit!3519 () Unit!3509)

(assert (=> b!51039 (= lt!79020 Unit!3519)))

(assert (=> b!51039 (= (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79060))) (currentByte!2945 (_2!2448 lt!79060)) (currentBit!2940 (_2!2448 lt!79060))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79031))) (currentByte!2945 (_2!2448 lt!79031)) (currentBit!2940 (_2!2448 lt!79031))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79036 () Unit!3509)

(declare-fun Unit!3520 () Unit!3509)

(assert (=> b!51039 (= lt!79036 Unit!3520)))

(declare-fun lt!79026 () tuple2!4688)

(assert (=> b!51039 (= lt!79026 (reader!0 (_2!2448 lt!78752) (_2!2448 lt!79060)))))

(declare-fun lt!79059 () (_ BitVec 64))

(assert (=> b!51039 (= lt!79059 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79034 () Unit!3509)

(assert (=> b!51039 (= lt!79034 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2448 lt!78752) (buf!1422 (_2!2448 lt!79060)) lt!79059))))

(assert (=> b!51039 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!79060)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!79059)))

(declare-fun lt!79047 () Unit!3509)

(assert (=> b!51039 (= lt!79047 lt!79034)))

(declare-fun lt!79050 () tuple2!4688)

(assert (=> b!51039 (= lt!79050 call!652)))

(declare-fun lt!79061 () (_ BitVec 64))

(assert (=> b!51039 (= lt!79061 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79039 () Unit!3509)

(assert (=> b!51039 (= lt!79039 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2448 lt!79031) (buf!1422 (_2!2448 lt!79060)) lt!79061))))

(assert (=> b!51039 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!79060)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!79031))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!79031))) lt!79061)))

(declare-fun lt!79035 () Unit!3509)

(assert (=> b!51039 (= lt!79035 lt!79039)))

(declare-fun lt!79046 () List!565)

(assert (=> b!51039 (= lt!79046 (byteArrayBitContentToList!0 (_2!2448 lt!79060) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!79038 () List!565)

(assert (=> b!51039 (= lt!79038 (byteArrayBitContentToList!0 (_2!2448 lt!79060) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79053 () List!565)

(assert (=> b!51039 (= lt!79053 (bitStreamReadBitsIntoList!0 (_2!2448 lt!79060) (_1!2449 lt!79026) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!79021 () List!565)

(assert (=> b!51039 (= lt!79021 (bitStreamReadBitsIntoList!0 (_2!2448 lt!79060) (_1!2449 lt!79050) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79043 () (_ BitVec 64))

(assert (=> b!51039 (= lt!79043 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79037 () Unit!3509)

(assert (=> b!51039 (= lt!79037 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2448 lt!79060) (_2!2448 lt!79060) (_1!2449 lt!79026) (_1!2449 lt!79050) lt!79043 lt!79053))))

(assert (=> b!51039 (= (bitStreamReadBitsIntoList!0 (_2!2448 lt!79060) (_1!2449 lt!79050) (bvsub lt!79043 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!251 lt!79053))))

(declare-fun lt!79029 () Unit!3509)

(assert (=> b!51039 (= lt!79029 lt!79037)))

(declare-fun lt!79063 () Unit!3509)

(assert (=> b!51039 (= lt!79063 (arrayBitRangesEqImpliesEq!0 (buf!1422 (_2!2448 lt!79031)) (buf!1422 (_2!2448 lt!79060)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!79041 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79031))) (currentByte!2945 (_2!2448 lt!79031)) (currentBit!2940 (_2!2448 lt!79031)))))))

(assert (=> b!51039 (= (bitAt!0 (buf!1422 (_2!2448 lt!79031)) lt!79041) (bitAt!0 (buf!1422 (_2!2448 lt!79060)) lt!79041))))

(declare-fun lt!79044 () Unit!3509)

(assert (=> b!51039 (= lt!79044 lt!79063)))

(declare-fun b!51040 () Bool)

(declare-fun lt!79056 () tuple2!4688)

(assert (=> b!51040 (= e!33739 (= (bitStreamReadBitsIntoList!0 (_2!2448 lt!79025) (_1!2449 lt!79056) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2448 lt!79025) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!51040 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51040 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!79028 () Unit!3509)

(declare-fun lt!79057 () Unit!3509)

(assert (=> b!51040 (= lt!79028 lt!79057)))

(assert (=> b!51040 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!79025)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!79055)))

(assert (=> b!51040 (= lt!79057 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2448 lt!78752) (buf!1422 (_2!2448 lt!79025)) lt!79055))))

(assert (=> b!51040 e!33740))

(declare-fun res!42767 () Bool)

(assert (=> b!51040 (=> (not res!42767) (not e!33740))))

(assert (=> b!51040 (= res!42767 (and (= (size!1067 (buf!1422 (_2!2448 lt!78752))) (size!1067 (buf!1422 (_2!2448 lt!79025)))) (bvsge lt!79055 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51040 (= lt!79055 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!51040 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51040 (= lt!79056 (reader!0 (_2!2448 lt!78752) (_2!2448 lt!79025)))))

(assert (= (and d!15984 c!3621) b!51039))

(assert (= (and d!15984 (not c!3621)) b!51033))

(assert (= (or b!51039 b!51033) bm!649))

(assert (= (and d!15984 res!42763) b!51036))

(assert (= (and b!51036 res!42765) b!51037))

(assert (= (and b!51037 res!42768) b!51038))

(assert (= (and b!51038 res!42764) b!51034))

(assert (= (and b!51034 res!42766) b!51040))

(assert (= (and b!51040 res!42767) b!51035))

(declare-fun m!80299 () Bool)

(assert (=> b!51038 m!80299))

(declare-fun m!80301 () Bool)

(assert (=> b!51039 m!80301))

(declare-fun m!80303 () Bool)

(assert (=> b!51039 m!80303))

(declare-fun m!80305 () Bool)

(assert (=> b!51039 m!80305))

(declare-fun m!80307 () Bool)

(assert (=> b!51039 m!80307))

(declare-fun m!80309 () Bool)

(assert (=> b!51039 m!80309))

(declare-fun m!80311 () Bool)

(assert (=> b!51039 m!80311))

(declare-fun m!80313 () Bool)

(assert (=> b!51039 m!80313))

(declare-fun m!80315 () Bool)

(assert (=> b!51039 m!80315))

(declare-fun m!80317 () Bool)

(assert (=> b!51039 m!80317))

(declare-fun m!80319 () Bool)

(assert (=> b!51039 m!80319))

(declare-fun m!80321 () Bool)

(assert (=> b!51039 m!80321))

(declare-fun m!80323 () Bool)

(assert (=> b!51039 m!80323))

(declare-fun m!80325 () Bool)

(assert (=> b!51039 m!80325))

(declare-fun m!80327 () Bool)

(assert (=> b!51039 m!80327))

(declare-fun m!80329 () Bool)

(assert (=> b!51039 m!80329))

(declare-fun m!80331 () Bool)

(assert (=> b!51039 m!80331))

(declare-fun m!80333 () Bool)

(assert (=> b!51039 m!80333))

(declare-fun m!80335 () Bool)

(assert (=> b!51039 m!80335))

(declare-fun m!80337 () Bool)

(assert (=> b!51039 m!80337))

(declare-fun m!80339 () Bool)

(assert (=> b!51039 m!80339))

(assert (=> b!51039 m!80329))

(assert (=> b!51039 m!80107))

(declare-fun m!80341 () Bool)

(assert (=> b!51039 m!80341))

(declare-fun m!80343 () Bool)

(assert (=> b!51039 m!80343))

(declare-fun m!80345 () Bool)

(assert (=> b!51039 m!80345))

(declare-fun m!80347 () Bool)

(assert (=> b!51039 m!80347))

(assert (=> b!51039 m!80311))

(declare-fun m!80349 () Bool)

(assert (=> b!51039 m!80349))

(declare-fun m!80351 () Bool)

(assert (=> b!51039 m!80351))

(declare-fun m!80353 () Bool)

(assert (=> b!51039 m!80353))

(declare-fun m!80355 () Bool)

(assert (=> b!51039 m!80355))

(assert (=> b!51039 m!80347))

(declare-fun m!80357 () Bool)

(assert (=> b!51039 m!80357))

(declare-fun m!80359 () Bool)

(assert (=> b!51039 m!80359))

(assert (=> b!51039 m!80351))

(declare-fun m!80361 () Bool)

(assert (=> b!51039 m!80361))

(declare-fun m!80363 () Bool)

(assert (=> b!51033 m!80363))

(declare-fun m!80365 () Bool)

(assert (=> b!51033 m!80365))

(declare-fun m!80367 () Bool)

(assert (=> d!15984 m!80367))

(assert (=> d!15984 m!80107))

(assert (=> d!15984 m!80257))

(assert (=> d!15984 m!80265))

(declare-fun m!80369 () Bool)

(assert (=> b!51036 m!80369))

(declare-fun m!80371 () Bool)

(assert (=> b!51035 m!80371))

(declare-fun m!80373 () Bool)

(assert (=> bm!649 m!80373))

(declare-fun m!80375 () Bool)

(assert (=> b!51040 m!80375))

(declare-fun m!80377 () Bool)

(assert (=> b!51040 m!80377))

(declare-fun m!80379 () Bool)

(assert (=> b!51040 m!80379))

(declare-fun m!80381 () Bool)

(assert (=> b!51040 m!80381))

(declare-fun m!80383 () Bool)

(assert (=> b!51040 m!80383))

(assert (=> b!50895 d!15984))

(declare-fun d!16024 () Bool)

(declare-fun res!42771 () Bool)

(declare-fun e!33741 () Bool)

(assert (=> d!16024 (=> (not res!42771) (not e!33741))))

(assert (=> d!16024 (= res!42771 (= (size!1067 (buf!1422 thiss!1379)) (size!1067 (buf!1422 (_2!2448 lt!78762)))))))

(assert (=> d!16024 (= (isPrefixOf!0 thiss!1379 (_2!2448 lt!78762)) e!33741)))

(declare-fun b!51041 () Bool)

(declare-fun res!42770 () Bool)

(assert (=> b!51041 (=> (not res!42770) (not e!33741))))

(assert (=> b!51041 (= res!42770 (bvsle (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)) (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78762))) (currentByte!2945 (_2!2448 lt!78762)) (currentBit!2940 (_2!2448 lt!78762)))))))

(declare-fun b!51042 () Bool)

(declare-fun e!33742 () Bool)

(assert (=> b!51042 (= e!33741 e!33742)))

(declare-fun res!42769 () Bool)

(assert (=> b!51042 (=> res!42769 e!33742)))

(assert (=> b!51042 (= res!42769 (= (size!1067 (buf!1422 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51043 () Bool)

(assert (=> b!51043 (= e!33742 (arrayBitRangesEq!0 (buf!1422 thiss!1379) (buf!1422 (_2!2448 lt!78762)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379))))))

(assert (= (and d!16024 res!42771) b!51041))

(assert (= (and b!51041 res!42770) b!51042))

(assert (= (and b!51042 (not res!42769)) b!51043))

(assert (=> b!51041 m!80137))

(assert (=> b!51041 m!80103))

(assert (=> b!51043 m!80137))

(assert (=> b!51043 m!80137))

(declare-fun m!80385 () Bool)

(assert (=> b!51043 m!80385))

(assert (=> b!50895 d!16024))

(declare-fun d!16026 () Bool)

(declare-fun size!1069 (List!565) Int)

(assert (=> d!16026 (= (length!260 lt!78753) (size!1069 lt!78753))))

(declare-fun bs!4026 () Bool)

(assert (= bs!4026 d!16026))

(declare-fun m!80387 () Bool)

(assert (=> bs!4026 m!80387))

(assert (=> b!50885 d!16026))

(declare-fun d!16028 () Bool)

(assert (=> d!16028 (= (head!384 (byteArrayBitContentToList!0 (_2!2448 lt!78752) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!680 (byteArrayBitContentToList!0 (_2!2448 lt!78752) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!50896 d!16028))

(declare-fun d!16030 () Bool)

(declare-fun c!3624 () Bool)

(assert (=> d!16030 (= c!3624 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33745 () List!565)

(assert (=> d!16030 (= (byteArrayBitContentToList!0 (_2!2448 lt!78752) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!33745)))

(declare-fun b!51048 () Bool)

(assert (=> b!51048 (= e!33745 Nil!562)))

(declare-fun b!51049 () Bool)

(assert (=> b!51049 (= e!33745 (Cons!561 (not (= (bvand ((_ sign_extend 24) (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2448 lt!78752) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16030 c!3624) b!51048))

(assert (= (and d!16030 (not c!3624)) b!51049))

(assert (=> b!51049 m!80093))

(declare-fun m!80389 () Bool)

(assert (=> b!51049 m!80389))

(declare-fun m!80391 () Bool)

(assert (=> b!51049 m!80391))

(assert (=> b!50896 d!16030))

(declare-fun d!16032 () Bool)

(assert (=> d!16032 (= (head!384 (bitStreamReadBitsIntoList!0 (_2!2448 lt!78752) (_1!2449 lt!78761) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!680 (bitStreamReadBitsIntoList!0 (_2!2448 lt!78752) (_1!2449 lt!78761) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!50896 d!16032))

(declare-fun b!51058 () Bool)

(declare-datatypes ((tuple2!4700 0))(
  ( (tuple2!4701 (_1!2455 List!565) (_2!2455 BitStream!1848)) )
))
(declare-fun e!33751 () tuple2!4700)

(assert (=> b!51058 (= e!33751 (tuple2!4701 Nil!562 (_1!2449 lt!78761)))))

(declare-fun d!16034 () Bool)

(declare-fun e!33750 () Bool)

(assert (=> d!16034 e!33750))

(declare-fun c!3630 () Bool)

(assert (=> d!16034 (= c!3630 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!79070 () List!565)

(assert (=> d!16034 (= lt!79070 (_1!2455 e!33751))))

(declare-fun c!3629 () Bool)

(assert (=> d!16034 (= c!3629 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16034 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16034 (= (bitStreamReadBitsIntoList!0 (_2!2448 lt!78752) (_1!2449 lt!78761) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79070)))

(declare-fun b!51061 () Bool)

(assert (=> b!51061 (= e!33750 (> (length!260 lt!79070) 0))))

(declare-fun b!51060 () Bool)

(declare-fun isEmpty!146 (List!565) Bool)

(assert (=> b!51060 (= e!33750 (isEmpty!146 lt!79070))))

(declare-fun lt!79072 () (_ BitVec 64))

(declare-datatypes ((tuple2!4702 0))(
  ( (tuple2!4703 (_1!2456 Bool) (_2!2456 BitStream!1848)) )
))
(declare-fun lt!79071 () tuple2!4702)

(declare-fun b!51059 () Bool)

(assert (=> b!51059 (= e!33751 (tuple2!4701 (Cons!561 (_1!2456 lt!79071) (bitStreamReadBitsIntoList!0 (_2!2448 lt!78752) (_2!2456 lt!79071) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!79072))) (_2!2456 lt!79071)))))

(declare-fun readBit!0 (BitStream!1848) tuple2!4702)

(assert (=> b!51059 (= lt!79071 (readBit!0 (_1!2449 lt!78761)))))

(assert (=> b!51059 (= lt!79072 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!16034 c!3629) b!51058))

(assert (= (and d!16034 (not c!3629)) b!51059))

(assert (= (and d!16034 c!3630) b!51060))

(assert (= (and d!16034 (not c!3630)) b!51061))

(declare-fun m!80393 () Bool)

(assert (=> b!51061 m!80393))

(declare-fun m!80395 () Bool)

(assert (=> b!51060 m!80395))

(declare-fun m!80397 () Bool)

(assert (=> b!51059 m!80397))

(declare-fun m!80399 () Bool)

(assert (=> b!51059 m!80399))

(assert (=> b!50896 d!16034))

(declare-fun d!16036 () Bool)

(assert (=> d!16036 (= (tail!251 lt!78753) (t!1315 lt!78753))))

(assert (=> b!50886 d!16036))

(declare-fun d!16038 () Bool)

(declare-fun e!33754 () Bool)

(assert (=> d!16038 e!33754))

(declare-fun res!42774 () Bool)

(assert (=> d!16038 (=> (not res!42774) (not e!33754))))

(declare-fun lt!79078 () (_ BitVec 64))

(assert (=> d!16038 (= res!42774 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!79078) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!16038 (= lt!79078 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79077 () Unit!3509)

(declare-fun choose!42 (BitStream!1848 BitStream!1848 BitStream!1848 BitStream!1848 (_ BitVec 64) List!565) Unit!3509)

(assert (=> d!16038 (= lt!79077 (choose!42 (_2!2448 lt!78762) (_2!2448 lt!78762) (_1!2449 lt!78765) (_1!2449 lt!78768) (bvsub to!314 i!635) lt!78753))))

(assert (=> d!16038 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16038 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2448 lt!78762) (_2!2448 lt!78762) (_1!2449 lt!78765) (_1!2449 lt!78768) (bvsub to!314 i!635) lt!78753) lt!79077)))

(declare-fun b!51064 () Bool)

(assert (=> b!51064 (= e!33754 (= (bitStreamReadBitsIntoList!0 (_2!2448 lt!78762) (_1!2449 lt!78768) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!251 lt!78753)))))

(assert (= (and d!16038 res!42774) b!51064))

(declare-fun m!80401 () Bool)

(assert (=> d!16038 m!80401))

(declare-fun m!80403 () Bool)

(assert (=> b!51064 m!80403))

(assert (=> b!51064 m!80087))

(assert (=> b!50886 d!16038))

(declare-fun d!16040 () Bool)

(assert (=> d!16040 (= (invariant!0 (currentBit!2940 (_2!2448 lt!78752)) (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78762)))) (and (bvsge (currentBit!2940 (_2!2448 lt!78752)) #b00000000000000000000000000000000) (bvslt (currentBit!2940 (_2!2448 lt!78752)) #b00000000000000000000000000001000) (bvsge (currentByte!2945 (_2!2448 lt!78752)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78762)))) (and (= (currentBit!2940 (_2!2448 lt!78752)) #b00000000000000000000000000000000) (= (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78762))))))))))

(assert (=> b!50897 d!16040))

(declare-fun d!16042 () Bool)

(declare-fun res!42777 () Bool)

(declare-fun e!33755 () Bool)

(assert (=> d!16042 (=> (not res!42777) (not e!33755))))

(assert (=> d!16042 (= res!42777 (= (size!1067 (buf!1422 thiss!1379)) (size!1067 (buf!1422 thiss!1379))))))

(assert (=> d!16042 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!33755)))

(declare-fun b!51065 () Bool)

(declare-fun res!42776 () Bool)

(assert (=> b!51065 (=> (not res!42776) (not e!33755))))

(assert (=> b!51065 (= res!42776 (bvsle (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)) (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379))))))

(declare-fun b!51066 () Bool)

(declare-fun e!33756 () Bool)

(assert (=> b!51066 (= e!33755 e!33756)))

(declare-fun res!42775 () Bool)

(assert (=> b!51066 (=> res!42775 e!33756)))

(assert (=> b!51066 (= res!42775 (= (size!1067 (buf!1422 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51067 () Bool)

(assert (=> b!51067 (= e!33756 (arrayBitRangesEq!0 (buf!1422 thiss!1379) (buf!1422 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379))))))

(assert (= (and d!16042 res!42777) b!51065))

(assert (= (and b!51065 res!42776) b!51066))

(assert (= (and b!51066 (not res!42775)) b!51067))

(assert (=> b!51065 m!80137))

(assert (=> b!51065 m!80137))

(assert (=> b!51067 m!80137))

(assert (=> b!51067 m!80137))

(declare-fun m!80405 () Bool)

(assert (=> b!51067 m!80405))

(assert (=> b!50887 d!16042))

(declare-fun d!16044 () Bool)

(assert (=> d!16044 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!79081 () Unit!3509)

(declare-fun choose!11 (BitStream!1848) Unit!3509)

(assert (=> d!16044 (= lt!79081 (choose!11 thiss!1379))))

(assert (=> d!16044 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!79081)))

(declare-fun bs!4028 () Bool)

(assert (= bs!4028 d!16044))

(assert (=> bs!4028 m!80133))

(declare-fun m!80407 () Bool)

(assert (=> bs!4028 m!80407))

(assert (=> b!50887 d!16044))

(declare-fun d!16046 () Bool)

(declare-fun e!33759 () Bool)

(assert (=> d!16046 e!33759))

(declare-fun res!42783 () Bool)

(assert (=> d!16046 (=> (not res!42783) (not e!33759))))

(declare-fun lt!79098 () (_ BitVec 64))

(declare-fun lt!79097 () (_ BitVec 64))

(declare-fun lt!79094 () (_ BitVec 64))

(assert (=> d!16046 (= res!42783 (= lt!79094 (bvsub lt!79097 lt!79098)))))

(assert (=> d!16046 (or (= (bvand lt!79097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79098 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79097 lt!79098) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16046 (= lt!79098 (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 thiss!1379))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379))))))

(declare-fun lt!79095 () (_ BitVec 64))

(declare-fun lt!79096 () (_ BitVec 64))

(assert (=> d!16046 (= lt!79097 (bvmul lt!79095 lt!79096))))

(assert (=> d!16046 (or (= lt!79095 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79096 (bvsdiv (bvmul lt!79095 lt!79096) lt!79095)))))

(assert (=> d!16046 (= lt!79096 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16046 (= lt!79095 ((_ sign_extend 32) (size!1067 (buf!1422 thiss!1379))))))

(assert (=> d!16046 (= lt!79094 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2945 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2940 thiss!1379))))))

(assert (=> d!16046 (invariant!0 (currentBit!2940 thiss!1379) (currentByte!2945 thiss!1379) (size!1067 (buf!1422 thiss!1379)))))

(assert (=> d!16046 (= (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)) lt!79094)))

(declare-fun b!51072 () Bool)

(declare-fun res!42782 () Bool)

(assert (=> b!51072 (=> (not res!42782) (not e!33759))))

(assert (=> b!51072 (= res!42782 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79094))))

(declare-fun b!51073 () Bool)

(declare-fun lt!79099 () (_ BitVec 64))

(assert (=> b!51073 (= e!33759 (bvsle lt!79094 (bvmul lt!79099 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51073 (or (= lt!79099 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79099 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79099)))))

(assert (=> b!51073 (= lt!79099 ((_ sign_extend 32) (size!1067 (buf!1422 thiss!1379))))))

(assert (= (and d!16046 res!42783) b!51072))

(assert (= (and b!51072 res!42782) b!51073))

(declare-fun m!80409 () Bool)

(assert (=> d!16046 m!80409))

(declare-fun m!80411 () Bool)

(assert (=> d!16046 m!80411))

(assert (=> b!50887 d!16046))

(declare-fun d!16048 () Bool)

(assert (=> d!16048 (= (bitAt!0 (buf!1422 (_2!2448 lt!78752)) lt!78771) (not (= (bvand ((_ sign_extend 24) (select (arr!1596 (buf!1422 (_2!2448 lt!78752))) ((_ extract 31 0) (bvsdiv lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4029 () Bool)

(assert (= bs!4029 d!16048))

(declare-fun m!80413 () Bool)

(assert (=> bs!4029 m!80413))

(declare-fun m!80415 () Bool)

(assert (=> bs!4029 m!80415))

(assert (=> b!50898 d!16048))

(declare-fun d!16050 () Bool)

(assert (=> d!16050 (= (array_inv!977 (buf!1422 thiss!1379)) (bvsge (size!1067 (buf!1422 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!50888 d!16050))

(declare-fun d!16052 () Bool)

(assert (=> d!16052 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 thiss!1379))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 thiss!1379))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4030 () Bool)

(assert (= bs!4030 d!16052))

(assert (=> bs!4030 m!80409))

(assert (=> b!50899 d!16052))

(declare-fun d!16054 () Bool)

(assert (=> d!16054 (= (invariant!0 (currentBit!2940 (_2!2448 lt!78752)) (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78752)))) (and (bvsge (currentBit!2940 (_2!2448 lt!78752)) #b00000000000000000000000000000000) (bvslt (currentBit!2940 (_2!2448 lt!78752)) #b00000000000000000000000000001000) (bvsge (currentByte!2945 (_2!2448 lt!78752)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78752)))) (and (= (currentBit!2940 (_2!2448 lt!78752)) #b00000000000000000000000000000000) (= (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78752))))))))))

(assert (=> b!50889 d!16054))

(declare-fun d!16056 () Bool)

(assert (=> d!16056 (= (bitAt!0 (buf!1422 (_1!2449 lt!78768)) lt!78771) (not (= (bvand ((_ sign_extend 24) (select (arr!1596 (buf!1422 (_1!2449 lt!78768))) ((_ extract 31 0) (bvsdiv lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4031 () Bool)

(assert (= bs!4031 d!16056))

(declare-fun m!80417 () Bool)

(assert (=> bs!4031 m!80417))

(assert (=> bs!4031 m!80415))

(assert (=> b!50890 d!16056))

(declare-fun d!16058 () Bool)

(assert (=> d!16058 (= (bitAt!0 (buf!1422 (_1!2449 lt!78765)) lt!78771) (not (= (bvand ((_ sign_extend 24) (select (arr!1596 (buf!1422 (_1!2449 lt!78765))) ((_ extract 31 0) (bvsdiv lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4032 () Bool)

(assert (= bs!4032 d!16058))

(declare-fun m!80419 () Bool)

(assert (=> bs!4032 m!80419))

(assert (=> bs!4032 m!80415))

(assert (=> b!50890 d!16058))

(declare-fun d!16060 () Bool)

(assert (=> d!16060 (= (bitAt!0 (buf!1422 (_2!2448 lt!78762)) lt!78771) (not (= (bvand ((_ sign_extend 24) (select (arr!1596 (buf!1422 (_2!2448 lt!78762))) ((_ extract 31 0) (bvsdiv lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78771 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4033 () Bool)

(assert (= bs!4033 d!16060))

(declare-fun m!80421 () Bool)

(assert (=> bs!4033 m!80421))

(assert (=> bs!4033 m!80415))

(assert (=> b!50880 d!16060))

(declare-fun d!16062 () Bool)

(assert (=> d!16062 (= (bitAt!0 (buf!1422 (_2!2448 lt!78752)) lt!78771) (bitAt!0 (buf!1422 (_2!2448 lt!78762)) lt!78771))))

(declare-fun lt!79102 () Unit!3509)

(declare-fun choose!31 (array!2346 array!2346 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3509)

(assert (=> d!16062 (= lt!79102 (choose!31 (buf!1422 (_2!2448 lt!78752)) (buf!1422 (_2!2448 lt!78762)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78771 lt!78769))))

(assert (=> d!16062 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!78769))))

(assert (=> d!16062 (= (arrayBitRangesEqImpliesEq!0 (buf!1422 (_2!2448 lt!78752)) (buf!1422 (_2!2448 lt!78762)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78771 lt!78769) lt!79102)))

(declare-fun bs!4034 () Bool)

(assert (= bs!4034 d!16062))

(assert (=> bs!4034 m!80083))

(assert (=> bs!4034 m!80117))

(declare-fun m!80423 () Bool)

(assert (=> bs!4034 m!80423))

(assert (=> b!50880 d!16062))

(declare-fun d!16064 () Bool)

(assert (=> d!16064 (= (array_inv!977 srcBuffer!2) (bvsge (size!1067 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10024 d!16064))

(declare-fun d!16066 () Bool)

(assert (=> d!16066 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2940 thiss!1379) (currentByte!2945 thiss!1379) (size!1067 (buf!1422 thiss!1379))))))

(declare-fun bs!4035 () Bool)

(assert (= bs!4035 d!16066))

(assert (=> bs!4035 m!80411))

(assert (=> start!10024 d!16066))

(declare-fun d!16068 () Bool)

(assert (=> d!16068 (= (head!384 (byteArrayBitContentToList!0 (_2!2448 lt!78762) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!680 (byteArrayBitContentToList!0 (_2!2448 lt!78762) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!50891 d!16068))

(declare-fun d!16070 () Bool)

(declare-fun c!3631 () Bool)

(assert (=> d!16070 (= c!3631 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33760 () List!565)

(assert (=> d!16070 (= (byteArrayBitContentToList!0 (_2!2448 lt!78762) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!33760)))

(declare-fun b!51074 () Bool)

(assert (=> b!51074 (= e!33760 Nil!562)))

(declare-fun b!51075 () Bool)

(assert (=> b!51075 (= e!33760 (Cons!561 (not (= (bvand ((_ sign_extend 24) (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2448 lt!78762) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16070 c!3631) b!51074))

(assert (= (and d!16070 (not c!3631)) b!51075))

(assert (=> b!51075 m!80093))

(assert (=> b!51075 m!80389))

(declare-fun m!80425 () Bool)

(assert (=> b!51075 m!80425))

(assert (=> b!50891 d!16070))

(declare-fun d!16072 () Bool)

(assert (=> d!16072 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4036 () Bool)

(assert (= bs!4036 d!16072))

(assert (=> bs!4036 m!80093))

(assert (=> bs!4036 m!80389))

(assert (=> b!50891 d!16072))

(declare-fun d!16074 () Bool)

(declare-fun e!33761 () Bool)

(assert (=> d!16074 e!33761))

(declare-fun res!42785 () Bool)

(assert (=> d!16074 (=> (not res!42785) (not e!33761))))

(declare-fun lt!79107 () (_ BitVec 64))

(declare-fun lt!79106 () (_ BitVec 64))

(declare-fun lt!79103 () (_ BitVec 64))

(assert (=> d!16074 (= res!42785 (= lt!79103 (bvsub lt!79106 lt!79107)))))

(assert (=> d!16074 (or (= (bvand lt!79106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79107 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79106 lt!79107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16074 (= lt!79107 (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78762))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78762)))))))

(declare-fun lt!79104 () (_ BitVec 64))

(declare-fun lt!79105 () (_ BitVec 64))

(assert (=> d!16074 (= lt!79106 (bvmul lt!79104 lt!79105))))

(assert (=> d!16074 (or (= lt!79104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79105 (bvsdiv (bvmul lt!79104 lt!79105) lt!79104)))))

(assert (=> d!16074 (= lt!79105 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16074 (= lt!79104 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))))))

(assert (=> d!16074 (= lt!79103 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78762))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78762)))))))

(assert (=> d!16074 (invariant!0 (currentBit!2940 (_2!2448 lt!78762)) (currentByte!2945 (_2!2448 lt!78762)) (size!1067 (buf!1422 (_2!2448 lt!78762))))))

(assert (=> d!16074 (= (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78762))) (currentByte!2945 (_2!2448 lt!78762)) (currentBit!2940 (_2!2448 lt!78762))) lt!79103)))

(declare-fun b!51076 () Bool)

(declare-fun res!42784 () Bool)

(assert (=> b!51076 (=> (not res!42784) (not e!33761))))

(assert (=> b!51076 (= res!42784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79103))))

(declare-fun b!51077 () Bool)

(declare-fun lt!79108 () (_ BitVec 64))

(assert (=> b!51077 (= e!33761 (bvsle lt!79103 (bvmul lt!79108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51077 (or (= lt!79108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79108)))))

(assert (=> b!51077 (= lt!79108 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))))))

(assert (= (and d!16074 res!42785) b!51076))

(assert (= (and b!51076 res!42784) b!51077))

(declare-fun m!80427 () Bool)

(assert (=> d!16074 m!80427))

(assert (=> d!16074 m!80105))

(assert (=> b!50881 d!16074))

(declare-fun d!16076 () Bool)

(assert (=> d!16076 (= (head!384 lt!78753) (h!680 lt!78753))))

(assert (=> b!50892 d!16076))

(declare-fun d!16078 () Bool)

(declare-fun res!42788 () Bool)

(declare-fun e!33762 () Bool)

(assert (=> d!16078 (=> (not res!42788) (not e!33762))))

(assert (=> d!16078 (= res!42788 (= (size!1067 (buf!1422 thiss!1379)) (size!1067 (buf!1422 (_2!2448 lt!78752)))))))

(assert (=> d!16078 (= (isPrefixOf!0 thiss!1379 (_2!2448 lt!78752)) e!33762)))

(declare-fun b!51078 () Bool)

(declare-fun res!42787 () Bool)

(assert (=> b!51078 (=> (not res!42787) (not e!33762))))

(assert (=> b!51078 (= res!42787 (bvsle (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)) (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752)))))))

(declare-fun b!51079 () Bool)

(declare-fun e!33763 () Bool)

(assert (=> b!51079 (= e!33762 e!33763)))

(declare-fun res!42786 () Bool)

(assert (=> b!51079 (=> res!42786 e!33763)))

(assert (=> b!51079 (= res!42786 (= (size!1067 (buf!1422 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51080 () Bool)

(assert (=> b!51080 (= e!33763 (arrayBitRangesEq!0 (buf!1422 thiss!1379) (buf!1422 (_2!2448 lt!78752)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379))))))

(assert (= (and d!16078 res!42788) b!51078))

(assert (= (and b!51078 res!42787) b!51079))

(assert (= (and b!51079 (not res!42786)) b!51080))

(assert (=> b!51078 m!80137))

(assert (=> b!51078 m!80107))

(assert (=> b!51080 m!80137))

(assert (=> b!51080 m!80137))

(declare-fun m!80429 () Bool)

(assert (=> b!51080 m!80429))

(assert (=> b!50882 d!16078))

(declare-fun d!16080 () Bool)

(assert (=> d!16080 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!78759) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752)))) lt!78759))))

(declare-fun bs!4037 () Bool)

(assert (= bs!4037 d!16080))

(declare-fun m!80431 () Bool)

(assert (=> bs!4037 m!80431))

(assert (=> b!50882 d!16080))

(declare-fun d!16082 () Bool)

(declare-fun e!33766 () Bool)

(assert (=> d!16082 e!33766))

(declare-fun res!42791 () Bool)

(assert (=> d!16082 (=> (not res!42791) (not e!33766))))

(assert (=> d!16082 (= res!42791 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!79111 () Unit!3509)

(declare-fun choose!27 (BitStream!1848 BitStream!1848 (_ BitVec 64) (_ BitVec 64)) Unit!3509)

(assert (=> d!16082 (= lt!79111 (choose!27 thiss!1379 (_2!2448 lt!78752) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16082 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16082 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2448 lt!78752) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79111)))

(declare-fun b!51083 () Bool)

(assert (=> b!51083 (= e!33766 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16082 res!42791) b!51083))

(declare-fun m!80433 () Bool)

(assert (=> d!16082 m!80433))

(declare-fun m!80435 () Bool)

(assert (=> b!51083 m!80435))

(assert (=> b!50882 d!16082))

(declare-fun b!51101 () Bool)

(declare-fun e!33778 () Bool)

(declare-fun e!33776 () Bool)

(assert (=> b!51101 (= e!33778 e!33776)))

(declare-fun res!42812 () Bool)

(assert (=> b!51101 (=> (not res!42812) (not e!33776))))

(declare-fun lt!79142 () (_ BitVec 8))

(declare-fun lt!79145 () tuple2!4686)

(declare-fun lt!79136 () tuple2!4690)

(assert (=> b!51101 (= res!42812 (and (= (_2!2450 lt!79136) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!79142)) #b00000000000000000000000000000000))) (= (_1!2450 lt!79136) (_2!2448 lt!79145))))))

(declare-fun lt!79144 () tuple2!4698)

(declare-fun lt!79141 () BitStream!1848)

(assert (=> b!51101 (= lt!79144 (readBits!0 lt!79141 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51101 (= lt!79136 (readBitPure!0 lt!79141))))

(declare-fun readerFrom!0 (BitStream!1848 (_ BitVec 32) (_ BitVec 32)) BitStream!1848)

(assert (=> b!51101 (= lt!79141 (readerFrom!0 (_2!2448 lt!79145) (currentBit!2940 thiss!1379) (currentByte!2945 thiss!1379)))))

(declare-fun b!51102 () Bool)

(declare-fun e!33775 () Bool)

(declare-fun e!33777 () Bool)

(assert (=> b!51102 (= e!33775 e!33777)))

(declare-fun res!42811 () Bool)

(assert (=> b!51102 (=> (not res!42811) (not e!33777))))

(declare-fun lt!79137 () tuple2!4690)

(declare-fun lt!79140 () tuple2!4686)

(declare-fun lt!79143 () Bool)

(assert (=> b!51102 (= res!42811 (and (= (_2!2450 lt!79137) lt!79143) (= (_1!2450 lt!79137) (_2!2448 lt!79140))))))

(assert (=> b!51102 (= lt!79137 (readBitPure!0 (readerFrom!0 (_2!2448 lt!79140) (currentBit!2940 thiss!1379) (currentByte!2945 thiss!1379))))))

(declare-fun d!16084 () Bool)

(assert (=> d!16084 e!33778))

(declare-fun res!42815 () Bool)

(assert (=> d!16084 (=> (not res!42815) (not e!33778))))

(assert (=> d!16084 (= res!42815 (= (size!1067 (buf!1422 (_2!2448 lt!79145))) (size!1067 (buf!1422 thiss!1379))))))

(declare-fun lt!79139 () array!2346)

(assert (=> d!16084 (= lt!79142 (select (arr!1596 lt!79139) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16084 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1067 lt!79139)))))

(assert (=> d!16084 (= lt!79139 (array!2347 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!79147 () tuple2!4686)

(assert (=> d!16084 (= lt!79145 (tuple2!4687 (_1!2448 lt!79147) (_2!2448 lt!79147)))))

(assert (=> d!16084 (= lt!79147 lt!79140)))

(assert (=> d!16084 e!33775))

(declare-fun res!42810 () Bool)

(assert (=> d!16084 (=> (not res!42810) (not e!33775))))

(assert (=> d!16084 (= res!42810 (= (size!1067 (buf!1422 thiss!1379)) (size!1067 (buf!1422 (_2!2448 lt!79140)))))))

(declare-fun appendBit!0 (BitStream!1848 Bool) tuple2!4686)

(assert (=> d!16084 (= lt!79140 (appendBit!0 thiss!1379 lt!79143))))

(assert (=> d!16084 (= lt!79143 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16084 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16084 (= (appendBitFromByte!0 thiss!1379 (select (arr!1596 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!79145)))

(declare-fun b!51103 () Bool)

(declare-fun res!42813 () Bool)

(assert (=> b!51103 (=> (not res!42813) (not e!33778))))

(declare-fun lt!79138 () (_ BitVec 64))

(declare-fun lt!79146 () (_ BitVec 64))

(assert (=> b!51103 (= res!42813 (= (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79145))) (currentByte!2945 (_2!2448 lt!79145)) (currentBit!2940 (_2!2448 lt!79145))) (bvadd lt!79138 lt!79146)))))

(assert (=> b!51103 (or (not (= (bvand lt!79138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79146 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!79138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!79138 lt!79146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51103 (= lt!79146 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!51103 (= lt!79138 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(declare-fun b!51104 () Bool)

(declare-fun res!42814 () Bool)

(assert (=> b!51104 (=> (not res!42814) (not e!33775))))

(assert (=> b!51104 (= res!42814 (= (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79140))) (currentByte!2945 (_2!2448 lt!79140)) (currentBit!2940 (_2!2448 lt!79140))) (bvadd (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!51105 () Bool)

(declare-fun res!42809 () Bool)

(assert (=> b!51105 (=> (not res!42809) (not e!33778))))

(assert (=> b!51105 (= res!42809 (isPrefixOf!0 thiss!1379 (_2!2448 lt!79145)))))

(declare-fun b!51106 () Bool)

(assert (=> b!51106 (= e!33777 (= (bitIndex!0 (size!1067 (buf!1422 (_1!2450 lt!79137))) (currentByte!2945 (_1!2450 lt!79137)) (currentBit!2940 (_1!2450 lt!79137))) (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79140))) (currentByte!2945 (_2!2448 lt!79140)) (currentBit!2940 (_2!2448 lt!79140)))))))

(declare-fun b!51107 () Bool)

(declare-fun res!42808 () Bool)

(assert (=> b!51107 (=> (not res!42808) (not e!33775))))

(assert (=> b!51107 (= res!42808 (isPrefixOf!0 thiss!1379 (_2!2448 lt!79140)))))

(declare-fun b!51108 () Bool)

(assert (=> b!51108 (= e!33776 (= (bitIndex!0 (size!1067 (buf!1422 (_1!2450 lt!79136))) (currentByte!2945 (_1!2450 lt!79136)) (currentBit!2940 (_1!2450 lt!79136))) (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!79145))) (currentByte!2945 (_2!2448 lt!79145)) (currentBit!2940 (_2!2448 lt!79145)))))))

(assert (= (and d!16084 res!42810) b!51104))

(assert (= (and b!51104 res!42814) b!51107))

(assert (= (and b!51107 res!42808) b!51102))

(assert (= (and b!51102 res!42811) b!51106))

(assert (= (and d!16084 res!42815) b!51103))

(assert (= (and b!51103 res!42813) b!51105))

(assert (= (and b!51105 res!42809) b!51101))

(assert (= (and b!51101 res!42812) b!51108))

(declare-fun m!80437 () Bool)

(assert (=> b!51107 m!80437))

(declare-fun m!80439 () Bool)

(assert (=> b!51102 m!80439))

(assert (=> b!51102 m!80439))

(declare-fun m!80441 () Bool)

(assert (=> b!51102 m!80441))

(declare-fun m!80443 () Bool)

(assert (=> b!51101 m!80443))

(declare-fun m!80445 () Bool)

(assert (=> b!51101 m!80445))

(declare-fun m!80447 () Bool)

(assert (=> b!51101 m!80447))

(declare-fun m!80449 () Bool)

(assert (=> d!16084 m!80449))

(declare-fun m!80451 () Bool)

(assert (=> d!16084 m!80451))

(assert (=> d!16084 m!80389))

(declare-fun m!80453 () Bool)

(assert (=> b!51104 m!80453))

(assert (=> b!51104 m!80137))

(declare-fun m!80455 () Bool)

(assert (=> b!51108 m!80455))

(declare-fun m!80457 () Bool)

(assert (=> b!51108 m!80457))

(declare-fun m!80459 () Bool)

(assert (=> b!51105 m!80459))

(assert (=> b!51103 m!80457))

(assert (=> b!51103 m!80137))

(declare-fun m!80461 () Bool)

(assert (=> b!51106 m!80461))

(assert (=> b!51106 m!80453))

(assert (=> b!50882 d!16084))

(declare-fun b!51109 () Bool)

(declare-fun res!42816 () Bool)

(declare-fun e!33780 () Bool)

(assert (=> b!51109 (=> (not res!42816) (not e!33780))))

(declare-fun lt!79153 () tuple2!4688)

(assert (=> b!51109 (= res!42816 (isPrefixOf!0 (_1!2449 lt!79153) thiss!1379))))

(declare-fun d!16086 () Bool)

(assert (=> d!16086 e!33780))

(declare-fun res!42818 () Bool)

(assert (=> d!16086 (=> (not res!42818) (not e!33780))))

(assert (=> d!16086 (= res!42818 (isPrefixOf!0 (_1!2449 lt!79153) (_2!2449 lt!79153)))))

(declare-fun lt!79166 () BitStream!1848)

(assert (=> d!16086 (= lt!79153 (tuple2!4689 lt!79166 (_2!2448 lt!78762)))))

(declare-fun lt!79158 () Unit!3509)

(declare-fun lt!79160 () Unit!3509)

(assert (=> d!16086 (= lt!79158 lt!79160)))

(assert (=> d!16086 (isPrefixOf!0 lt!79166 (_2!2448 lt!78762))))

(assert (=> d!16086 (= lt!79160 (lemmaIsPrefixTransitive!0 lt!79166 (_2!2448 lt!78762) (_2!2448 lt!78762)))))

(declare-fun lt!79163 () Unit!3509)

(declare-fun lt!79150 () Unit!3509)

(assert (=> d!16086 (= lt!79163 lt!79150)))

(assert (=> d!16086 (isPrefixOf!0 lt!79166 (_2!2448 lt!78762))))

(assert (=> d!16086 (= lt!79150 (lemmaIsPrefixTransitive!0 lt!79166 thiss!1379 (_2!2448 lt!78762)))))

(declare-fun lt!79155 () Unit!3509)

(declare-fun e!33779 () Unit!3509)

(assert (=> d!16086 (= lt!79155 e!33779)))

(declare-fun c!3632 () Bool)

(assert (=> d!16086 (= c!3632 (not (= (size!1067 (buf!1422 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!79152 () Unit!3509)

(declare-fun lt!79159 () Unit!3509)

(assert (=> d!16086 (= lt!79152 lt!79159)))

(assert (=> d!16086 (isPrefixOf!0 (_2!2448 lt!78762) (_2!2448 lt!78762))))

(assert (=> d!16086 (= lt!79159 (lemmaIsPrefixRefl!0 (_2!2448 lt!78762)))))

(declare-fun lt!79161 () Unit!3509)

(declare-fun lt!79164 () Unit!3509)

(assert (=> d!16086 (= lt!79161 lt!79164)))

(assert (=> d!16086 (= lt!79164 (lemmaIsPrefixRefl!0 (_2!2448 lt!78762)))))

(declare-fun lt!79149 () Unit!3509)

(declare-fun lt!79167 () Unit!3509)

(assert (=> d!16086 (= lt!79149 lt!79167)))

(assert (=> d!16086 (isPrefixOf!0 lt!79166 lt!79166)))

(assert (=> d!16086 (= lt!79167 (lemmaIsPrefixRefl!0 lt!79166))))

(declare-fun lt!79162 () Unit!3509)

(declare-fun lt!79151 () Unit!3509)

(assert (=> d!16086 (= lt!79162 lt!79151)))

(assert (=> d!16086 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16086 (= lt!79151 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16086 (= lt!79166 (BitStream!1849 (buf!1422 (_2!2448 lt!78762)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(assert (=> d!16086 (isPrefixOf!0 thiss!1379 (_2!2448 lt!78762))))

(assert (=> d!16086 (= (reader!0 thiss!1379 (_2!2448 lt!78762)) lt!79153)))

(declare-fun b!51110 () Bool)

(declare-fun Unit!3521 () Unit!3509)

(assert (=> b!51110 (= e!33779 Unit!3521)))

(declare-fun b!51111 () Bool)

(declare-fun res!42817 () Bool)

(assert (=> b!51111 (=> (not res!42817) (not e!33780))))

(assert (=> b!51111 (= res!42817 (isPrefixOf!0 (_2!2449 lt!79153) (_2!2448 lt!78762)))))

(declare-fun b!51112 () Bool)

(declare-fun lt!79156 () Unit!3509)

(assert (=> b!51112 (= e!33779 lt!79156)))

(declare-fun lt!79148 () (_ BitVec 64))

(assert (=> b!51112 (= lt!79148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79165 () (_ BitVec 64))

(assert (=> b!51112 (= lt!79165 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(assert (=> b!51112 (= lt!79156 (arrayBitRangesEqSymmetric!0 (buf!1422 thiss!1379) (buf!1422 (_2!2448 lt!78762)) lt!79148 lt!79165))))

(assert (=> b!51112 (arrayBitRangesEq!0 (buf!1422 (_2!2448 lt!78762)) (buf!1422 thiss!1379) lt!79148 lt!79165)))

(declare-fun lt!79157 () (_ BitVec 64))

(declare-fun b!51113 () Bool)

(declare-fun lt!79154 () (_ BitVec 64))

(assert (=> b!51113 (= e!33780 (= (_1!2449 lt!79153) (withMovedBitIndex!0 (_2!2449 lt!79153) (bvsub lt!79157 lt!79154))))))

(assert (=> b!51113 (or (= (bvand lt!79157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79157 lt!79154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51113 (= lt!79154 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78762))) (currentByte!2945 (_2!2448 lt!78762)) (currentBit!2940 (_2!2448 lt!78762))))))

(assert (=> b!51113 (= lt!79157 (bitIndex!0 (size!1067 (buf!1422 thiss!1379)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379)))))

(assert (= (and d!16086 c!3632) b!51112))

(assert (= (and d!16086 (not c!3632)) b!51110))

(assert (= (and d!16086 res!42818) b!51109))

(assert (= (and b!51109 res!42816) b!51111))

(assert (= (and b!51111 res!42817) b!51113))

(declare-fun m!80463 () Bool)

(assert (=> b!51111 m!80463))

(declare-fun m!80465 () Bool)

(assert (=> b!51109 m!80465))

(assert (=> b!51112 m!80137))

(declare-fun m!80467 () Bool)

(assert (=> b!51112 m!80467))

(declare-fun m!80469 () Bool)

(assert (=> b!51112 m!80469))

(declare-fun m!80471 () Bool)

(assert (=> b!51113 m!80471))

(assert (=> b!51113 m!80103))

(assert (=> b!51113 m!80137))

(declare-fun m!80473 () Bool)

(assert (=> d!16086 m!80473))

(assert (=> d!16086 m!80079))

(declare-fun m!80475 () Bool)

(assert (=> d!16086 m!80475))

(declare-fun m!80477 () Bool)

(assert (=> d!16086 m!80477))

(declare-fun m!80479 () Bool)

(assert (=> d!16086 m!80479))

(declare-fun m!80481 () Bool)

(assert (=> d!16086 m!80481))

(declare-fun m!80483 () Bool)

(assert (=> d!16086 m!80483))

(assert (=> d!16086 m!80135))

(assert (=> d!16086 m!80133))

(declare-fun m!80485 () Bool)

(assert (=> d!16086 m!80485))

(declare-fun m!80487 () Bool)

(assert (=> d!16086 m!80487))

(assert (=> b!50893 d!16086))

(declare-fun b!51114 () Bool)

(declare-fun e!33782 () tuple2!4700)

(assert (=> b!51114 (= e!33782 (tuple2!4701 Nil!562 (_1!2449 lt!78765)))))

(declare-fun d!16088 () Bool)

(declare-fun e!33781 () Bool)

(assert (=> d!16088 e!33781))

(declare-fun c!3634 () Bool)

(assert (=> d!16088 (= c!3634 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!79168 () List!565)

(assert (=> d!16088 (= lt!79168 (_1!2455 e!33782))))

(declare-fun c!3633 () Bool)

(assert (=> d!16088 (= c!3633 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16088 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16088 (= (bitStreamReadBitsIntoList!0 (_2!2448 lt!78762) (_1!2449 lt!78765) (bvsub to!314 i!635)) lt!79168)))

(declare-fun b!51117 () Bool)

(assert (=> b!51117 (= e!33781 (> (length!260 lt!79168) 0))))

(declare-fun b!51116 () Bool)

(assert (=> b!51116 (= e!33781 (isEmpty!146 lt!79168))))

(declare-fun lt!79169 () tuple2!4702)

(declare-fun lt!79170 () (_ BitVec 64))

(declare-fun b!51115 () Bool)

(assert (=> b!51115 (= e!33782 (tuple2!4701 (Cons!561 (_1!2456 lt!79169) (bitStreamReadBitsIntoList!0 (_2!2448 lt!78762) (_2!2456 lt!79169) (bvsub (bvsub to!314 i!635) lt!79170))) (_2!2456 lt!79169)))))

(assert (=> b!51115 (= lt!79169 (readBit!0 (_1!2449 lt!78765)))))

(assert (=> b!51115 (= lt!79170 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!16088 c!3633) b!51114))

(assert (= (and d!16088 (not c!3633)) b!51115))

(assert (= (and d!16088 c!3634) b!51116))

(assert (= (and d!16088 (not c!3634)) b!51117))

(declare-fun m!80489 () Bool)

(assert (=> b!51117 m!80489))

(declare-fun m!80491 () Bool)

(assert (=> b!51116 m!80491))

(declare-fun m!80493 () Bool)

(assert (=> b!51115 m!80493))

(declare-fun m!80495 () Bool)

(assert (=> b!51115 m!80495))

(assert (=> b!50893 d!16088))

(declare-fun d!16090 () Bool)

(assert (=> d!16090 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4038 () Bool)

(assert (= bs!4038 d!16090))

(declare-fun m!80497 () Bool)

(assert (=> bs!4038 m!80497))

(assert (=> b!50893 d!16090))

(declare-fun d!16092 () Bool)

(assert (=> d!16092 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!78759)))

(declare-fun lt!79171 () Unit!3509)

(assert (=> d!16092 (= lt!79171 (choose!9 (_2!2448 lt!78752) (buf!1422 (_2!2448 lt!78762)) lt!78759 (BitStream!1849 (buf!1422 (_2!2448 lt!78762)) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752)))))))

(assert (=> d!16092 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2448 lt!78752) (buf!1422 (_2!2448 lt!78762)) lt!78759) lt!79171)))

(declare-fun bs!4039 () Bool)

(assert (= bs!4039 d!16092))

(assert (=> bs!4039 m!80057))

(declare-fun m!80499 () Bool)

(assert (=> bs!4039 m!80499))

(assert (=> b!50893 d!16092))

(declare-fun b!51118 () Bool)

(declare-fun res!42819 () Bool)

(declare-fun e!33784 () Bool)

(assert (=> b!51118 (=> (not res!42819) (not e!33784))))

(declare-fun lt!79177 () tuple2!4688)

(assert (=> b!51118 (= res!42819 (isPrefixOf!0 (_1!2449 lt!79177) (_2!2448 lt!78752)))))

(declare-fun d!16094 () Bool)

(assert (=> d!16094 e!33784))

(declare-fun res!42821 () Bool)

(assert (=> d!16094 (=> (not res!42821) (not e!33784))))

(assert (=> d!16094 (= res!42821 (isPrefixOf!0 (_1!2449 lt!79177) (_2!2449 lt!79177)))))

(declare-fun lt!79190 () BitStream!1848)

(assert (=> d!16094 (= lt!79177 (tuple2!4689 lt!79190 (_2!2448 lt!78762)))))

(declare-fun lt!79182 () Unit!3509)

(declare-fun lt!79184 () Unit!3509)

(assert (=> d!16094 (= lt!79182 lt!79184)))

(assert (=> d!16094 (isPrefixOf!0 lt!79190 (_2!2448 lt!78762))))

(assert (=> d!16094 (= lt!79184 (lemmaIsPrefixTransitive!0 lt!79190 (_2!2448 lt!78762) (_2!2448 lt!78762)))))

(declare-fun lt!79187 () Unit!3509)

(declare-fun lt!79174 () Unit!3509)

(assert (=> d!16094 (= lt!79187 lt!79174)))

(assert (=> d!16094 (isPrefixOf!0 lt!79190 (_2!2448 lt!78762))))

(assert (=> d!16094 (= lt!79174 (lemmaIsPrefixTransitive!0 lt!79190 (_2!2448 lt!78752) (_2!2448 lt!78762)))))

(declare-fun lt!79179 () Unit!3509)

(declare-fun e!33783 () Unit!3509)

(assert (=> d!16094 (= lt!79179 e!33783)))

(declare-fun c!3635 () Bool)

(assert (=> d!16094 (= c!3635 (not (= (size!1067 (buf!1422 (_2!2448 lt!78752))) #b00000000000000000000000000000000)))))

(declare-fun lt!79176 () Unit!3509)

(declare-fun lt!79183 () Unit!3509)

(assert (=> d!16094 (= lt!79176 lt!79183)))

(assert (=> d!16094 (isPrefixOf!0 (_2!2448 lt!78762) (_2!2448 lt!78762))))

(assert (=> d!16094 (= lt!79183 (lemmaIsPrefixRefl!0 (_2!2448 lt!78762)))))

(declare-fun lt!79185 () Unit!3509)

(declare-fun lt!79188 () Unit!3509)

(assert (=> d!16094 (= lt!79185 lt!79188)))

(assert (=> d!16094 (= lt!79188 (lemmaIsPrefixRefl!0 (_2!2448 lt!78762)))))

(declare-fun lt!79173 () Unit!3509)

(declare-fun lt!79191 () Unit!3509)

(assert (=> d!16094 (= lt!79173 lt!79191)))

(assert (=> d!16094 (isPrefixOf!0 lt!79190 lt!79190)))

(assert (=> d!16094 (= lt!79191 (lemmaIsPrefixRefl!0 lt!79190))))

(declare-fun lt!79186 () Unit!3509)

(declare-fun lt!79175 () Unit!3509)

(assert (=> d!16094 (= lt!79186 lt!79175)))

(assert (=> d!16094 (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!78752))))

(assert (=> d!16094 (= lt!79175 (lemmaIsPrefixRefl!0 (_2!2448 lt!78752)))))

(assert (=> d!16094 (= lt!79190 (BitStream!1849 (buf!1422 (_2!2448 lt!78762)) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))))))

(assert (=> d!16094 (isPrefixOf!0 (_2!2448 lt!78752) (_2!2448 lt!78762))))

(assert (=> d!16094 (= (reader!0 (_2!2448 lt!78752) (_2!2448 lt!78762)) lt!79177)))

(declare-fun b!51119 () Bool)

(declare-fun Unit!3522 () Unit!3509)

(assert (=> b!51119 (= e!33783 Unit!3522)))

(declare-fun b!51120 () Bool)

(declare-fun res!42820 () Bool)

(assert (=> b!51120 (=> (not res!42820) (not e!33784))))

(assert (=> b!51120 (= res!42820 (isPrefixOf!0 (_2!2449 lt!79177) (_2!2448 lt!78762)))))

(declare-fun b!51121 () Bool)

(declare-fun lt!79180 () Unit!3509)

(assert (=> b!51121 (= e!33783 lt!79180)))

(declare-fun lt!79172 () (_ BitVec 64))

(assert (=> b!51121 (= lt!79172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79189 () (_ BitVec 64))

(assert (=> b!51121 (= lt!79189 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))))))

(assert (=> b!51121 (= lt!79180 (arrayBitRangesEqSymmetric!0 (buf!1422 (_2!2448 lt!78752)) (buf!1422 (_2!2448 lt!78762)) lt!79172 lt!79189))))

(assert (=> b!51121 (arrayBitRangesEq!0 (buf!1422 (_2!2448 lt!78762)) (buf!1422 (_2!2448 lt!78752)) lt!79172 lt!79189)))

(declare-fun lt!79181 () (_ BitVec 64))

(declare-fun lt!79178 () (_ BitVec 64))

(declare-fun b!51122 () Bool)

(assert (=> b!51122 (= e!33784 (= (_1!2449 lt!79177) (withMovedBitIndex!0 (_2!2449 lt!79177) (bvsub lt!79181 lt!79178))))))

(assert (=> b!51122 (or (= (bvand lt!79181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79178 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79181 lt!79178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51122 (= lt!79178 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78762))) (currentByte!2945 (_2!2448 lt!78762)) (currentBit!2940 (_2!2448 lt!78762))))))

(assert (=> b!51122 (= lt!79181 (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))))))

(assert (= (and d!16094 c!3635) b!51121))

(assert (= (and d!16094 (not c!3635)) b!51119))

(assert (= (and d!16094 res!42821) b!51118))

(assert (= (and b!51118 res!42819) b!51120))

(assert (= (and b!51120 res!42820) b!51122))

(declare-fun m!80501 () Bool)

(assert (=> b!51120 m!80501))

(declare-fun m!80503 () Bool)

(assert (=> b!51118 m!80503))

(assert (=> b!51121 m!80107))

(declare-fun m!80505 () Bool)

(assert (=> b!51121 m!80505))

(declare-fun m!80507 () Bool)

(assert (=> b!51121 m!80507))

(declare-fun m!80509 () Bool)

(assert (=> b!51122 m!80509))

(assert (=> b!51122 m!80103))

(assert (=> b!51122 m!80107))

(assert (=> d!16094 m!80473))

(assert (=> d!16094 m!80069))

(declare-fun m!80511 () Bool)

(assert (=> d!16094 m!80511))

(declare-fun m!80513 () Bool)

(assert (=> d!16094 m!80513))

(declare-fun m!80515 () Bool)

(assert (=> d!16094 m!80515))

(assert (=> d!16094 m!80481))

(declare-fun m!80517 () Bool)

(assert (=> d!16094 m!80517))

(assert (=> d!16094 m!80265))

(assert (=> d!16094 m!80257))

(declare-fun m!80519 () Bool)

(assert (=> d!16094 m!80519))

(declare-fun m!80521 () Bool)

(assert (=> d!16094 m!80521))

(assert (=> b!50893 d!16094))

(declare-fun b!51123 () Bool)

(declare-fun e!33786 () tuple2!4700)

(assert (=> b!51123 (= e!33786 (tuple2!4701 Nil!562 (_1!2449 lt!78768)))))

(declare-fun d!16096 () Bool)

(declare-fun e!33785 () Bool)

(assert (=> d!16096 e!33785))

(declare-fun c!3637 () Bool)

(assert (=> d!16096 (= c!3637 (= lt!78759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!79192 () List!565)

(assert (=> d!16096 (= lt!79192 (_1!2455 e!33786))))

(declare-fun c!3636 () Bool)

(assert (=> d!16096 (= c!3636 (= lt!78759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16096 (bvsge lt!78759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16096 (= (bitStreamReadBitsIntoList!0 (_2!2448 lt!78762) (_1!2449 lt!78768) lt!78759) lt!79192)))

(declare-fun b!51126 () Bool)

(assert (=> b!51126 (= e!33785 (> (length!260 lt!79192) 0))))

(declare-fun b!51125 () Bool)

(assert (=> b!51125 (= e!33785 (isEmpty!146 lt!79192))))

(declare-fun lt!79193 () tuple2!4702)

(declare-fun lt!79194 () (_ BitVec 64))

(declare-fun b!51124 () Bool)

(assert (=> b!51124 (= e!33786 (tuple2!4701 (Cons!561 (_1!2456 lt!79193) (bitStreamReadBitsIntoList!0 (_2!2448 lt!78762) (_2!2456 lt!79193) (bvsub lt!78759 lt!79194))) (_2!2456 lt!79193)))))

(assert (=> b!51124 (= lt!79193 (readBit!0 (_1!2449 lt!78768)))))

(assert (=> b!51124 (= lt!79194 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!16096 c!3636) b!51123))

(assert (= (and d!16096 (not c!3636)) b!51124))

(assert (= (and d!16096 c!3637) b!51125))

(assert (= (and d!16096 (not c!3637)) b!51126))

(declare-fun m!80523 () Bool)

(assert (=> b!51126 m!80523))

(declare-fun m!80525 () Bool)

(assert (=> b!51125 m!80525))

(declare-fun m!80527 () Bool)

(assert (=> b!51124 m!80527))

(declare-fun m!80529 () Bool)

(assert (=> b!51124 m!80529))

(assert (=> b!50893 d!16096))

(declare-fun d!16098 () Bool)

(assert (=> d!16098 (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 thiss!1379)) ((_ sign_extend 32) (currentBit!2940 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!79195 () Unit!3509)

(assert (=> d!16098 (= lt!79195 (choose!9 thiss!1379 (buf!1422 (_2!2448 lt!78762)) (bvsub to!314 i!635) (BitStream!1849 (buf!1422 (_2!2448 lt!78762)) (currentByte!2945 thiss!1379) (currentBit!2940 thiss!1379))))))

(assert (=> d!16098 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1422 (_2!2448 lt!78762)) (bvsub to!314 i!635)) lt!79195)))

(declare-fun bs!4040 () Bool)

(assert (= bs!4040 d!16098))

(assert (=> bs!4040 m!80059))

(declare-fun m!80531 () Bool)

(assert (=> bs!4040 m!80531))

(assert (=> b!50893 d!16098))

(declare-fun d!16100 () Bool)

(assert (=> d!16100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752))) lt!78759) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78762)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752)))) lt!78759))))

(declare-fun bs!4041 () Bool)

(assert (= bs!4041 d!16100))

(declare-fun m!80533 () Bool)

(assert (=> bs!4041 m!80533))

(assert (=> b!50893 d!16100))

(declare-fun d!16102 () Bool)

(declare-fun lt!79198 () tuple2!4702)

(assert (=> d!16102 (= lt!79198 (readBit!0 (_1!2449 lt!78765)))))

(assert (=> d!16102 (= (readBitPure!0 (_1!2449 lt!78765)) (tuple2!4691 (_2!2456 lt!79198) (_1!2456 lt!79198)))))

(declare-fun bs!4042 () Bool)

(assert (= bs!4042 d!16102))

(assert (=> bs!4042 m!80495))

(assert (=> b!50883 d!16102))

(declare-fun d!16104 () Bool)

(declare-fun e!33787 () Bool)

(assert (=> d!16104 e!33787))

(declare-fun res!42823 () Bool)

(assert (=> d!16104 (=> (not res!42823) (not e!33787))))

(declare-fun lt!79199 () (_ BitVec 64))

(declare-fun lt!79202 () (_ BitVec 64))

(declare-fun lt!79203 () (_ BitVec 64))

(assert (=> d!16104 (= res!42823 (= lt!79199 (bvsub lt!79202 lt!79203)))))

(assert (=> d!16104 (or (= (bvand lt!79202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79202 lt!79203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16104 (= lt!79203 (remainingBits!0 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))) ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752)))))))

(declare-fun lt!79200 () (_ BitVec 64))

(declare-fun lt!79201 () (_ BitVec 64))

(assert (=> d!16104 (= lt!79202 (bvmul lt!79200 lt!79201))))

(assert (=> d!16104 (or (= lt!79200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79201 (bvsdiv (bvmul lt!79200 lt!79201) lt!79200)))))

(assert (=> d!16104 (= lt!79201 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16104 (= lt!79200 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))))))

(assert (=> d!16104 (= lt!79199 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2945 (_2!2448 lt!78752))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2940 (_2!2448 lt!78752)))))))

(assert (=> d!16104 (invariant!0 (currentBit!2940 (_2!2448 lt!78752)) (currentByte!2945 (_2!2448 lt!78752)) (size!1067 (buf!1422 (_2!2448 lt!78752))))))

(assert (=> d!16104 (= (bitIndex!0 (size!1067 (buf!1422 (_2!2448 lt!78752))) (currentByte!2945 (_2!2448 lt!78752)) (currentBit!2940 (_2!2448 lt!78752))) lt!79199)))

(declare-fun b!51127 () Bool)

(declare-fun res!42822 () Bool)

(assert (=> b!51127 (=> (not res!42822) (not e!33787))))

(assert (=> b!51127 (= res!42822 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79199))))

(declare-fun b!51128 () Bool)

(declare-fun lt!79204 () (_ BitVec 64))

(assert (=> b!51128 (= e!33787 (bvsle lt!79199 (bvmul lt!79204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51128 (or (= lt!79204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79204)))))

(assert (=> b!51128 (= lt!79204 ((_ sign_extend 32) (size!1067 (buf!1422 (_2!2448 lt!78752)))))))

(assert (= (and d!16104 res!42823) b!51127))

(assert (= (and b!51127 res!42822) b!51128))

(assert (=> d!16104 m!80431))

(assert (=> d!16104 m!80125))

(assert (=> b!50894 d!16104))

(declare-fun d!16106 () Bool)

(assert (=> d!16106 (= (invariant!0 (currentBit!2940 (_2!2448 lt!78762)) (currentByte!2945 (_2!2448 lt!78762)) (size!1067 (buf!1422 (_2!2448 lt!78762)))) (and (bvsge (currentBit!2940 (_2!2448 lt!78762)) #b00000000000000000000000000000000) (bvslt (currentBit!2940 (_2!2448 lt!78762)) #b00000000000000000000000000001000) (bvsge (currentByte!2945 (_2!2448 lt!78762)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2945 (_2!2448 lt!78762)) (size!1067 (buf!1422 (_2!2448 lt!78762)))) (and (= (currentBit!2940 (_2!2448 lt!78762)) #b00000000000000000000000000000000) (= (currentByte!2945 (_2!2448 lt!78762)) (size!1067 (buf!1422 (_2!2448 lt!78762))))))))))

(assert (=> b!50884 d!16106))

(check-sat (not b!51075) (not b!51103) (not b!51115) (not b!51067) (not b!51040) (not b!50986) (not b!51102) (not b!51060) (not b!51125) (not b!51065) (not b!51124) (not d!16066) (not b!50985) (not d!16044) (not b!51111) (not d!16094) (not b!51059) (not b!51118) (not b!51122) (not b!51041) (not d!16086) (not d!16104) (not b!51120) (not b!51036) (not d!16102) (not b!51043) (not b!51116) (not b!51064) (not d!16074) (not b!51121) (not d!15984) (not b!51117) (not b!50982) (not d!16026) (not d!16092) (not d!16082) (not b!51105) (not b!51126) (not d!16090) (not b!50984) (not d!16084) (not d!16098) (not b!51080) (not b!51033) (not d!15980) (not b!51107) (not b!51104) (not b!51113) (not b!51039) (not d!16046) (not d!15982) (not d!16038) (not d!16062) (not b!51101) (not b!50971) (not d!16100) (not b!51106) (not b!51083) (not d!16052) (not b!51078) (not b!51108) (not d!15976) (not b!51049) (not b!51061) (not b!50969) (not bm!649) (not b!51035) (not b!51109) (not d!15978) (not d!16080) (not b!51038) (not b!51112))
