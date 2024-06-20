; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5948 () Bool)

(assert start!5948)

(declare-fun b!26328 () Bool)

(declare-fun res!22697 () Bool)

(declare-fun e!17881 () Bool)

(assert (=> b!26328 (=> res!22697 e!17881)))

(declare-datatypes ((array!1685 0))(
  ( (array!1686 (arr!1187 (Array (_ BitVec 32) (_ BitVec 8))) (size!725 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1282 0))(
  ( (BitStream!1283 (buf!1052 array!1685) (currentByte!2377 (_ BitVec 32)) (currentBit!2372 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2153 0))(
  ( (Unit!2154) )
))
(declare-datatypes ((tuple2!2930 0))(
  ( (tuple2!2931 (_1!1552 Unit!2153) (_2!1552 BitStream!1282)) )
))
(declare-fun lt!37992 () tuple2!2930)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26328 (= res!22697 (not (invariant!0 (currentBit!2372 (_2!1552 lt!37992)) (currentByte!2377 (_2!1552 lt!37992)) (size!725 (buf!1052 (_2!1552 lt!37992))))))))

(declare-fun b!26329 () Bool)

(declare-fun res!22682 () Bool)

(assert (=> b!26329 (=> res!22682 e!17881)))

(declare-fun thiss!1379 () BitStream!1282)

(assert (=> b!26329 (= res!22682 (not (= (size!725 (buf!1052 thiss!1379)) (size!725 (buf!1052 (_2!1552 lt!37992))))))))

(declare-fun b!26330 () Bool)

(declare-fun res!22692 () Bool)

(declare-fun e!17883 () Bool)

(assert (=> b!26330 (=> res!22692 e!17883)))

(declare-fun lt!37997 () tuple2!2930)

(assert (=> b!26330 (= res!22692 (not (invariant!0 (currentBit!2372 (_2!1552 lt!37997)) (currentByte!2377 (_2!1552 lt!37997)) (size!725 (buf!1052 (_2!1552 lt!37997))))))))

(declare-fun b!26331 () Bool)

(declare-fun e!17876 () Bool)

(declare-fun e!17878 () Bool)

(assert (=> b!26331 (= e!17876 e!17878)))

(declare-fun res!22687 () Bool)

(assert (=> b!26331 (=> res!22687 e!17878)))

(declare-fun isPrefixOf!0 (BitStream!1282 BitStream!1282) Bool)

(assert (=> b!26331 (= res!22687 (not (isPrefixOf!0 thiss!1379 (_2!1552 lt!37997))))))

(declare-fun lt!37986 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26331 (validate_offset_bits!1 ((_ sign_extend 32) (size!725 (buf!1052 (_2!1552 lt!37997)))) ((_ sign_extend 32) (currentByte!2377 (_2!1552 lt!37997))) ((_ sign_extend 32) (currentBit!2372 (_2!1552 lt!37997))) lt!37986)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!26331 (= lt!37986 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37988 () Unit!2153)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1282 BitStream!1282 (_ BitVec 64) (_ BitVec 64)) Unit!2153)

(assert (=> b!26331 (= lt!37988 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1552 lt!37997) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1685)

(declare-fun appendBitFromByte!0 (BitStream!1282 (_ BitVec 8) (_ BitVec 32)) tuple2!2930)

(assert (=> b!26331 (= lt!37997 (appendBitFromByte!0 thiss!1379 (select (arr!1187 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26332 () Bool)

(declare-fun e!17884 () Bool)

(assert (=> b!26332 (= e!17884 true)))

(declare-fun lt!37991 () (_ BitVec 64))

(declare-datatypes ((tuple2!2932 0))(
  ( (tuple2!2933 (_1!1553 BitStream!1282) (_2!1553 BitStream!1282)) )
))
(declare-fun lt!38002 () tuple2!2932)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26332 (= lt!37991 (bitIndex!0 (size!725 (buf!1052 (_1!1553 lt!38002))) (currentByte!2377 (_1!1553 lt!38002)) (currentBit!2372 (_1!1553 lt!38002))))))

(declare-fun lt!37987 () (_ BitVec 64))

(declare-fun lt!37994 () tuple2!2932)

(assert (=> b!26332 (= lt!37987 (bitIndex!0 (size!725 (buf!1052 (_1!1553 lt!37994))) (currentByte!2377 (_1!1553 lt!37994)) (currentBit!2372 (_1!1553 lt!37994))))))

(declare-fun b!26333 () Bool)

(declare-fun e!17879 () Bool)

(assert (=> b!26333 (= e!17878 e!17879)))

(declare-fun res!22681 () Bool)

(assert (=> b!26333 (=> res!22681 e!17879)))

(assert (=> b!26333 (= res!22681 (not (isPrefixOf!0 (_2!1552 lt!37997) (_2!1552 lt!37992))))))

(assert (=> b!26333 (isPrefixOf!0 thiss!1379 (_2!1552 lt!37992))))

(declare-fun lt!37989 () Unit!2153)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1282 BitStream!1282 BitStream!1282) Unit!2153)

(assert (=> b!26333 (= lt!37989 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1552 lt!37997) (_2!1552 lt!37992)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1282 array!1685 (_ BitVec 64) (_ BitVec 64)) tuple2!2930)

(assert (=> b!26333 (= lt!37992 (appendBitsMSBFirstLoop!0 (_2!1552 lt!37997) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!17874 () Bool)

(assert (=> b!26333 e!17874))

(declare-fun res!22696 () Bool)

(assert (=> b!26333 (=> (not res!22696) (not e!17874))))

(assert (=> b!26333 (= res!22696 (validate_offset_bits!1 ((_ sign_extend 32) (size!725 (buf!1052 (_2!1552 lt!37997)))) ((_ sign_extend 32) (currentByte!2377 thiss!1379)) ((_ sign_extend 32) (currentBit!2372 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37996 () Unit!2153)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1282 array!1685 (_ BitVec 64)) Unit!2153)

(assert (=> b!26333 (= lt!37996 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1052 (_2!1552 lt!37997)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38001 () tuple2!2932)

(declare-fun reader!0 (BitStream!1282 BitStream!1282) tuple2!2932)

(assert (=> b!26333 (= lt!38001 (reader!0 thiss!1379 (_2!1552 lt!37997)))))

(declare-fun lt!37999 () (_ BitVec 64))

(declare-fun b!26334 () Bool)

(declare-fun e!17882 () Bool)

(assert (=> b!26334 (= e!17882 (= lt!37999 (bvsub (bvsub (bvadd (bitIndex!0 (size!725 (buf!1052 (_2!1552 lt!37997))) (currentByte!2377 (_2!1552 lt!37997)) (currentBit!2372 (_2!1552 lt!37997))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26335 () Bool)

(declare-fun res!22689 () Bool)

(declare-fun e!17877 () Bool)

(assert (=> b!26335 (=> (not res!22689) (not e!17877))))

(assert (=> b!26335 (= res!22689 (validate_offset_bits!1 ((_ sign_extend 32) (size!725 (buf!1052 thiss!1379))) ((_ sign_extend 32) (currentByte!2377 thiss!1379)) ((_ sign_extend 32) (currentBit!2372 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26336 () Bool)

(declare-fun res!22685 () Bool)

(assert (=> b!26336 (=> res!22685 e!17884)))

(declare-datatypes ((List!342 0))(
  ( (Nil!339) (Cons!338 (h!457 Bool) (t!1092 List!342)) )
))
(declare-fun lt!37990 () List!342)

(declare-fun length!68 (List!342) Int)

(assert (=> b!26336 (= res!22685 (<= (length!68 lt!37990) 0))))

(declare-fun res!22686 () Bool)

(assert (=> start!5948 (=> (not res!22686) (not e!17877))))

(assert (=> start!5948 (= res!22686 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!725 srcBuffer!2))))))))

(assert (=> start!5948 e!17877))

(assert (=> start!5948 true))

(declare-fun array_inv!694 (array!1685) Bool)

(assert (=> start!5948 (array_inv!694 srcBuffer!2)))

(declare-fun e!17880 () Bool)

(declare-fun inv!12 (BitStream!1282) Bool)

(assert (=> start!5948 (and (inv!12 thiss!1379) e!17880)))

(declare-fun b!26337 () Bool)

(declare-fun res!22691 () Bool)

(assert (=> b!26337 (=> res!22691 e!17884)))

(assert (=> b!26337 (= res!22691 (not (isPrefixOf!0 (_1!1553 lt!37994) (_2!1552 lt!37992))))))

(declare-fun b!26338 () Bool)

(declare-fun res!22693 () Bool)

(assert (=> b!26338 (=> res!22693 e!17883)))

(assert (=> b!26338 (= res!22693 (not (invariant!0 (currentBit!2372 (_2!1552 lt!37997)) (currentByte!2377 (_2!1552 lt!37997)) (size!725 (buf!1052 (_2!1552 lt!37992))))))))

(declare-fun b!26339 () Bool)

(declare-fun head!179 (List!342) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1282 array!1685 (_ BitVec 64) (_ BitVec 64)) List!342)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1282 BitStream!1282 (_ BitVec 64)) List!342)

(assert (=> b!26339 (= e!17874 (= (head!179 (byteArrayBitContentToList!0 (_2!1552 lt!37997) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!179 (bitStreamReadBitsIntoList!0 (_2!1552 lt!37997) (_1!1553 lt!38001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26340 () Bool)

(assert (=> b!26340 (= e!17881 e!17883)))

(declare-fun res!22688 () Bool)

(assert (=> b!26340 (=> res!22688 e!17883)))

(assert (=> b!26340 (= res!22688 (not (= (size!725 (buf!1052 (_2!1552 lt!37997))) (size!725 (buf!1052 (_2!1552 lt!37992))))))))

(assert (=> b!26340 e!17882))

(declare-fun res!22680 () Bool)

(assert (=> b!26340 (=> (not res!22680) (not e!17882))))

(assert (=> b!26340 (= res!22680 (= (size!725 (buf!1052 (_2!1552 lt!37992))) (size!725 (buf!1052 thiss!1379))))))

(declare-fun b!26341 () Bool)

(assert (=> b!26341 (= e!17879 e!17881)))

(declare-fun res!22690 () Bool)

(assert (=> b!26341 (=> res!22690 e!17881)))

(declare-fun lt!37993 () (_ BitVec 64))

(assert (=> b!26341 (= res!22690 (not (= lt!37999 (bvsub (bvadd lt!37993 to!314) i!635))))))

(assert (=> b!26341 (= lt!37999 (bitIndex!0 (size!725 (buf!1052 (_2!1552 lt!37992))) (currentByte!2377 (_2!1552 lt!37992)) (currentBit!2372 (_2!1552 lt!37992))))))

(declare-fun b!26342 () Bool)

(assert (=> b!26342 (= e!17883 e!17884)))

(declare-fun res!22698 () Bool)

(assert (=> b!26342 (=> res!22698 e!17884)))

(assert (=> b!26342 (= res!22698 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!37995 () List!342)

(assert (=> b!26342 (= lt!37995 (bitStreamReadBitsIntoList!0 (_2!1552 lt!37992) (_1!1553 lt!38002) lt!37986))))

(assert (=> b!26342 (= lt!37990 (bitStreamReadBitsIntoList!0 (_2!1552 lt!37992) (_1!1553 lt!37994) (bvsub to!314 i!635)))))

(assert (=> b!26342 (validate_offset_bits!1 ((_ sign_extend 32) (size!725 (buf!1052 (_2!1552 lt!37992)))) ((_ sign_extend 32) (currentByte!2377 (_2!1552 lt!37997))) ((_ sign_extend 32) (currentBit!2372 (_2!1552 lt!37997))) lt!37986)))

(declare-fun lt!37998 () Unit!2153)

(assert (=> b!26342 (= lt!37998 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1552 lt!37997) (buf!1052 (_2!1552 lt!37992)) lt!37986))))

(assert (=> b!26342 (= lt!38002 (reader!0 (_2!1552 lt!37997) (_2!1552 lt!37992)))))

(assert (=> b!26342 (validate_offset_bits!1 ((_ sign_extend 32) (size!725 (buf!1052 (_2!1552 lt!37992)))) ((_ sign_extend 32) (currentByte!2377 thiss!1379)) ((_ sign_extend 32) (currentBit!2372 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!37985 () Unit!2153)

(assert (=> b!26342 (= lt!37985 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1052 (_2!1552 lt!37992)) (bvsub to!314 i!635)))))

(assert (=> b!26342 (= lt!37994 (reader!0 thiss!1379 (_2!1552 lt!37992)))))

(declare-fun b!26343 () Bool)

(assert (=> b!26343 (= e!17880 (array_inv!694 (buf!1052 thiss!1379)))))

(declare-fun b!26344 () Bool)

(declare-fun res!22694 () Bool)

(assert (=> b!26344 (=> res!22694 e!17884)))

(assert (=> b!26344 (= res!22694 (or (not (= (buf!1052 (_1!1553 lt!37994)) (buf!1052 (_1!1553 lt!38002)))) (not (= (buf!1052 (_1!1553 lt!37994)) (buf!1052 (_2!1552 lt!37992)))) (bvsge lt!37999 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26345 () Bool)

(declare-fun res!22695 () Bool)

(assert (=> b!26345 (=> res!22695 e!17884)))

(assert (=> b!26345 (= res!22695 (not (isPrefixOf!0 (_1!1553 lt!38002) (_2!1552 lt!37992))))))

(declare-fun b!26346 () Bool)

(declare-fun res!22683 () Bool)

(assert (=> b!26346 (=> res!22683 e!17884)))

(assert (=> b!26346 (= res!22683 (not (isPrefixOf!0 (_1!1553 lt!37994) (_1!1553 lt!38002))))))

(declare-fun b!26347 () Bool)

(assert (=> b!26347 (= e!17877 (not e!17876))))

(declare-fun res!22684 () Bool)

(assert (=> b!26347 (=> res!22684 e!17876)))

(assert (=> b!26347 (= res!22684 (bvsge i!635 to!314))))

(assert (=> b!26347 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38000 () Unit!2153)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1282) Unit!2153)

(assert (=> b!26347 (= lt!38000 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!26347 (= lt!37993 (bitIndex!0 (size!725 (buf!1052 thiss!1379)) (currentByte!2377 thiss!1379) (currentBit!2372 thiss!1379)))))

(assert (= (and start!5948 res!22686) b!26335))

(assert (= (and b!26335 res!22689) b!26347))

(assert (= (and b!26347 (not res!22684)) b!26331))

(assert (= (and b!26331 (not res!22687)) b!26333))

(assert (= (and b!26333 res!22696) b!26339))

(assert (= (and b!26333 (not res!22681)) b!26341))

(assert (= (and b!26341 (not res!22690)) b!26328))

(assert (= (and b!26328 (not res!22697)) b!26329))

(assert (= (and b!26329 (not res!22682)) b!26340))

(assert (= (and b!26340 res!22680) b!26334))

(assert (= (and b!26340 (not res!22688)) b!26330))

(assert (= (and b!26330 (not res!22692)) b!26338))

(assert (= (and b!26338 (not res!22693)) b!26342))

(assert (= (and b!26342 (not res!22698)) b!26336))

(assert (= (and b!26336 (not res!22685)) b!26337))

(assert (= (and b!26337 (not res!22691)) b!26345))

(assert (= (and b!26345 (not res!22695)) b!26346))

(assert (= (and b!26346 (not res!22683)) b!26344))

(assert (= (and b!26344 (not res!22694)) b!26332))

(assert (= start!5948 b!26343))

(declare-fun m!37761 () Bool)

(assert (=> b!26347 m!37761))

(declare-fun m!37763 () Bool)

(assert (=> b!26347 m!37763))

(declare-fun m!37765 () Bool)

(assert (=> b!26347 m!37765))

(declare-fun m!37767 () Bool)

(assert (=> b!26345 m!37767))

(declare-fun m!37769 () Bool)

(assert (=> b!26343 m!37769))

(declare-fun m!37771 () Bool)

(assert (=> b!26337 m!37771))

(declare-fun m!37773 () Bool)

(assert (=> b!26346 m!37773))

(declare-fun m!37775 () Bool)

(assert (=> b!26335 m!37775))

(declare-fun m!37777 () Bool)

(assert (=> start!5948 m!37777))

(declare-fun m!37779 () Bool)

(assert (=> start!5948 m!37779))

(declare-fun m!37781 () Bool)

(assert (=> b!26333 m!37781))

(declare-fun m!37783 () Bool)

(assert (=> b!26333 m!37783))

(declare-fun m!37785 () Bool)

(assert (=> b!26333 m!37785))

(declare-fun m!37787 () Bool)

(assert (=> b!26333 m!37787))

(declare-fun m!37789 () Bool)

(assert (=> b!26333 m!37789))

(declare-fun m!37791 () Bool)

(assert (=> b!26333 m!37791))

(declare-fun m!37793 () Bool)

(assert (=> b!26333 m!37793))

(declare-fun m!37795 () Bool)

(assert (=> b!26330 m!37795))

(declare-fun m!37797 () Bool)

(assert (=> b!26336 m!37797))

(declare-fun m!37799 () Bool)

(assert (=> b!26339 m!37799))

(assert (=> b!26339 m!37799))

(declare-fun m!37801 () Bool)

(assert (=> b!26339 m!37801))

(declare-fun m!37803 () Bool)

(assert (=> b!26339 m!37803))

(assert (=> b!26339 m!37803))

(declare-fun m!37805 () Bool)

(assert (=> b!26339 m!37805))

(declare-fun m!37807 () Bool)

(assert (=> b!26338 m!37807))

(declare-fun m!37809 () Bool)

(assert (=> b!26332 m!37809))

(declare-fun m!37811 () Bool)

(assert (=> b!26332 m!37811))

(declare-fun m!37813 () Bool)

(assert (=> b!26341 m!37813))

(declare-fun m!37815 () Bool)

(assert (=> b!26328 m!37815))

(declare-fun m!37817 () Bool)

(assert (=> b!26342 m!37817))

(declare-fun m!37819 () Bool)

(assert (=> b!26342 m!37819))

(declare-fun m!37821 () Bool)

(assert (=> b!26342 m!37821))

(declare-fun m!37823 () Bool)

(assert (=> b!26342 m!37823))

(declare-fun m!37825 () Bool)

(assert (=> b!26342 m!37825))

(declare-fun m!37827 () Bool)

(assert (=> b!26342 m!37827))

(declare-fun m!37829 () Bool)

(assert (=> b!26342 m!37829))

(declare-fun m!37831 () Bool)

(assert (=> b!26342 m!37831))

(declare-fun m!37833 () Bool)

(assert (=> b!26334 m!37833))

(declare-fun m!37835 () Bool)

(assert (=> b!26331 m!37835))

(declare-fun m!37837 () Bool)

(assert (=> b!26331 m!37837))

(declare-fun m!37839 () Bool)

(assert (=> b!26331 m!37839))

(declare-fun m!37841 () Bool)

(assert (=> b!26331 m!37841))

(declare-fun m!37843 () Bool)

(assert (=> b!26331 m!37843))

(assert (=> b!26331 m!37839))

(push 1)

