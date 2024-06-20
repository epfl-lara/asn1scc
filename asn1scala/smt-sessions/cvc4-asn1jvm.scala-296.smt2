; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5952 () Bool)

(assert start!5952)

(declare-fun res!22810 () Bool)

(declare-fun e!17946 () Bool)

(assert (=> start!5952 (=> (not res!22810) (not e!17946))))

(declare-datatypes ((array!1689 0))(
  ( (array!1690 (arr!1189 (Array (_ BitVec 32) (_ BitVec 8))) (size!727 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1689)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5952 (= res!22810 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!727 srcBuffer!2))))))))

(assert (=> start!5952 e!17946))

(assert (=> start!5952 true))

(declare-fun array_inv!696 (array!1689) Bool)

(assert (=> start!5952 (array_inv!696 srcBuffer!2)))

(declare-datatypes ((BitStream!1286 0))(
  ( (BitStream!1287 (buf!1054 array!1689) (currentByte!2379 (_ BitVec 32)) (currentBit!2374 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1286)

(declare-fun e!17954 () Bool)

(declare-fun inv!12 (BitStream!1286) Bool)

(assert (=> start!5952 (and (inv!12 thiss!1379) e!17954)))

(declare-fun b!26448 () Bool)

(assert (=> b!26448 (= e!17954 (array_inv!696 (buf!1054 thiss!1379)))))

(declare-fun b!26449 () Bool)

(declare-fun e!17950 () Bool)

(declare-fun e!17945 () Bool)

(assert (=> b!26449 (= e!17950 e!17945)))

(declare-fun res!22800 () Bool)

(assert (=> b!26449 (=> res!22800 e!17945)))

(declare-datatypes ((Unit!2157 0))(
  ( (Unit!2158) )
))
(declare-datatypes ((tuple2!2938 0))(
  ( (tuple2!2939 (_1!1556 Unit!2157) (_2!1556 BitStream!1286)) )
))
(declare-fun lt!38096 () tuple2!2938)

(declare-fun lt!38109 () tuple2!2938)

(assert (=> b!26449 (= res!22800 (not (= (size!727 (buf!1054 (_2!1556 lt!38096))) (size!727 (buf!1054 (_2!1556 lt!38109))))))))

(declare-fun e!17956 () Bool)

(assert (=> b!26449 e!17956))

(declare-fun res!22802 () Bool)

(assert (=> b!26449 (=> (not res!22802) (not e!17956))))

(assert (=> b!26449 (= res!22802 (= (size!727 (buf!1054 (_2!1556 lt!38109))) (size!727 (buf!1054 thiss!1379))))))

(declare-fun b!26450 () Bool)

(declare-fun res!22801 () Bool)

(assert (=> b!26450 (=> (not res!22801) (not e!17946))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26450 (= res!22801 (validate_offset_bits!1 ((_ sign_extend 32) (size!727 (buf!1054 thiss!1379))) ((_ sign_extend 32) (currentByte!2379 thiss!1379)) ((_ sign_extend 32) (currentBit!2374 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26451 () Bool)

(declare-fun e!17947 () Bool)

(assert (=> b!26451 (= e!17945 e!17947)))

(declare-fun res!22796 () Bool)

(assert (=> b!26451 (=> res!22796 e!17947)))

(assert (=> b!26451 (= res!22796 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!2940 0))(
  ( (tuple2!2941 (_1!1557 BitStream!1286) (_2!1557 BitStream!1286)) )
))
(declare-fun lt!38106 () tuple2!2940)

(declare-fun lt!38099 () (_ BitVec 64))

(declare-datatypes ((List!344 0))(
  ( (Nil!341) (Cons!340 (h!459 Bool) (t!1094 List!344)) )
))
(declare-fun lt!38108 () List!344)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1286 BitStream!1286 (_ BitVec 64)) List!344)

(assert (=> b!26451 (= lt!38108 (bitStreamReadBitsIntoList!0 (_2!1556 lt!38109) (_1!1557 lt!38106) lt!38099))))

(declare-fun lt!38093 () tuple2!2940)

(declare-fun lt!38101 () List!344)

(assert (=> b!26451 (= lt!38101 (bitStreamReadBitsIntoList!0 (_2!1556 lt!38109) (_1!1557 lt!38093) (bvsub to!314 i!635)))))

(assert (=> b!26451 (validate_offset_bits!1 ((_ sign_extend 32) (size!727 (buf!1054 (_2!1556 lt!38109)))) ((_ sign_extend 32) (currentByte!2379 (_2!1556 lt!38096))) ((_ sign_extend 32) (currentBit!2374 (_2!1556 lt!38096))) lt!38099)))

(declare-fun lt!38103 () Unit!2157)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1286 array!1689 (_ BitVec 64)) Unit!2157)

(assert (=> b!26451 (= lt!38103 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1556 lt!38096) (buf!1054 (_2!1556 lt!38109)) lt!38099))))

(declare-fun reader!0 (BitStream!1286 BitStream!1286) tuple2!2940)

(assert (=> b!26451 (= lt!38106 (reader!0 (_2!1556 lt!38096) (_2!1556 lt!38109)))))

(assert (=> b!26451 (validate_offset_bits!1 ((_ sign_extend 32) (size!727 (buf!1054 (_2!1556 lt!38109)))) ((_ sign_extend 32) (currentByte!2379 thiss!1379)) ((_ sign_extend 32) (currentBit!2374 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38107 () Unit!2157)

(assert (=> b!26451 (= lt!38107 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1054 (_2!1556 lt!38109)) (bvsub to!314 i!635)))))

(assert (=> b!26451 (= lt!38093 (reader!0 thiss!1379 (_2!1556 lt!38109)))))

(declare-fun b!26452 () Bool)

(declare-fun e!17953 () Bool)

(declare-fun e!17955 () Bool)

(assert (=> b!26452 (= e!17953 e!17955)))

(declare-fun res!22804 () Bool)

(assert (=> b!26452 (=> res!22804 e!17955)))

(declare-fun isPrefixOf!0 (BitStream!1286 BitStream!1286) Bool)

(assert (=> b!26452 (= res!22804 (not (isPrefixOf!0 thiss!1379 (_2!1556 lt!38096))))))

(assert (=> b!26452 (validate_offset_bits!1 ((_ sign_extend 32) (size!727 (buf!1054 (_2!1556 lt!38096)))) ((_ sign_extend 32) (currentByte!2379 (_2!1556 lt!38096))) ((_ sign_extend 32) (currentBit!2374 (_2!1556 lt!38096))) lt!38099)))

(assert (=> b!26452 (= lt!38099 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38098 () Unit!2157)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1286 BitStream!1286 (_ BitVec 64) (_ BitVec 64)) Unit!2157)

(assert (=> b!26452 (= lt!38098 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1556 lt!38096) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1286 (_ BitVec 8) (_ BitVec 32)) tuple2!2938)

(assert (=> b!26452 (= lt!38096 (appendBitFromByte!0 thiss!1379 (select (arr!1189 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26453 () Bool)

(declare-fun res!22794 () Bool)

(assert (=> b!26453 (=> res!22794 e!17947)))

(assert (=> b!26453 (= res!22794 (not (isPrefixOf!0 (_1!1557 lt!38106) (_2!1556 lt!38109))))))

(declare-fun b!26454 () Bool)

(declare-fun res!22811 () Bool)

(assert (=> b!26454 (=> res!22811 e!17947)))

(declare-fun lt!38100 () (_ BitVec 64))

(assert (=> b!26454 (= res!22811 (or (not (= (buf!1054 (_1!1557 lt!38093)) (buf!1054 (_1!1557 lt!38106)))) (not (= (buf!1054 (_1!1557 lt!38093)) (buf!1054 (_2!1556 lt!38109)))) (bvsge lt!38100 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26455 () Bool)

(assert (=> b!26455 (= e!17947 true)))

(declare-fun lt!38110 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26455 (= lt!38110 (bitIndex!0 (size!727 (buf!1054 (_1!1557 lt!38106))) (currentByte!2379 (_1!1557 lt!38106)) (currentBit!2374 (_1!1557 lt!38106))))))

(declare-fun lt!38102 () (_ BitVec 64))

(assert (=> b!26455 (= lt!38102 (bitIndex!0 (size!727 (buf!1054 (_1!1557 lt!38093))) (currentByte!2379 (_1!1557 lt!38093)) (currentBit!2374 (_1!1557 lt!38093))))))

(declare-fun b!26456 () Bool)

(declare-fun e!17949 () Bool)

(assert (=> b!26456 (= e!17949 e!17950)))

(declare-fun res!22795 () Bool)

(assert (=> b!26456 (=> res!22795 e!17950)))

(declare-fun lt!38105 () (_ BitVec 64))

(assert (=> b!26456 (= res!22795 (not (= lt!38100 (bvsub (bvadd lt!38105 to!314) i!635))))))

(assert (=> b!26456 (= lt!38100 (bitIndex!0 (size!727 (buf!1054 (_2!1556 lt!38109))) (currentByte!2379 (_2!1556 lt!38109)) (currentBit!2374 (_2!1556 lt!38109))))))

(declare-fun b!26457 () Bool)

(declare-fun res!22808 () Bool)

(assert (=> b!26457 (=> res!22808 e!17947)))

(assert (=> b!26457 (= res!22808 (not (isPrefixOf!0 (_1!1557 lt!38093) (_2!1556 lt!38109))))))

(declare-fun b!26458 () Bool)

(declare-fun res!22803 () Bool)

(assert (=> b!26458 (=> res!22803 e!17950)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26458 (= res!22803 (not (invariant!0 (currentBit!2374 (_2!1556 lt!38109)) (currentByte!2379 (_2!1556 lt!38109)) (size!727 (buf!1054 (_2!1556 lt!38109))))))))

(declare-fun e!17952 () Bool)

(declare-fun b!26459 () Bool)

(declare-fun lt!38104 () tuple2!2940)

(declare-fun head!181 (List!344) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1286 array!1689 (_ BitVec 64) (_ BitVec 64)) List!344)

(assert (=> b!26459 (= e!17952 (= (head!181 (byteArrayBitContentToList!0 (_2!1556 lt!38096) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!181 (bitStreamReadBitsIntoList!0 (_2!1556 lt!38096) (_1!1557 lt!38104) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26460 () Bool)

(declare-fun res!22806 () Bool)

(assert (=> b!26460 (=> res!22806 e!17945)))

(assert (=> b!26460 (= res!22806 (not (invariant!0 (currentBit!2374 (_2!1556 lt!38096)) (currentByte!2379 (_2!1556 lt!38096)) (size!727 (buf!1054 (_2!1556 lt!38109))))))))

(declare-fun b!26461 () Bool)

(declare-fun res!22805 () Bool)

(assert (=> b!26461 (=> res!22805 e!17947)))

(assert (=> b!26461 (= res!22805 (not (isPrefixOf!0 (_1!1557 lt!38093) (_1!1557 lt!38106))))))

(declare-fun b!26462 () Bool)

(declare-fun res!22799 () Bool)

(assert (=> b!26462 (=> res!22799 e!17950)))

(assert (=> b!26462 (= res!22799 (not (= (size!727 (buf!1054 thiss!1379)) (size!727 (buf!1054 (_2!1556 lt!38109))))))))

(declare-fun b!26463 () Bool)

(assert (=> b!26463 (= e!17946 (not e!17953))))

(declare-fun res!22807 () Bool)

(assert (=> b!26463 (=> res!22807 e!17953)))

(assert (=> b!26463 (= res!22807 (bvsge i!635 to!314))))

(assert (=> b!26463 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38094 () Unit!2157)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1286) Unit!2157)

(assert (=> b!26463 (= lt!38094 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!26463 (= lt!38105 (bitIndex!0 (size!727 (buf!1054 thiss!1379)) (currentByte!2379 thiss!1379) (currentBit!2374 thiss!1379)))))

(declare-fun b!26464 () Bool)

(assert (=> b!26464 (= e!17955 e!17949)))

(declare-fun res!22797 () Bool)

(assert (=> b!26464 (=> res!22797 e!17949)))

(assert (=> b!26464 (= res!22797 (not (isPrefixOf!0 (_2!1556 lt!38096) (_2!1556 lt!38109))))))

(assert (=> b!26464 (isPrefixOf!0 thiss!1379 (_2!1556 lt!38109))))

(declare-fun lt!38097 () Unit!2157)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1286 BitStream!1286 BitStream!1286) Unit!2157)

(assert (=> b!26464 (= lt!38097 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1556 lt!38096) (_2!1556 lt!38109)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1286 array!1689 (_ BitVec 64) (_ BitVec 64)) tuple2!2938)

(assert (=> b!26464 (= lt!38109 (appendBitsMSBFirstLoop!0 (_2!1556 lt!38096) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26464 e!17952))

(declare-fun res!22812 () Bool)

(assert (=> b!26464 (=> (not res!22812) (not e!17952))))

(assert (=> b!26464 (= res!22812 (validate_offset_bits!1 ((_ sign_extend 32) (size!727 (buf!1054 (_2!1556 lt!38096)))) ((_ sign_extend 32) (currentByte!2379 thiss!1379)) ((_ sign_extend 32) (currentBit!2374 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38095 () Unit!2157)

(assert (=> b!26464 (= lt!38095 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1054 (_2!1556 lt!38096)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!26464 (= lt!38104 (reader!0 thiss!1379 (_2!1556 lt!38096)))))

(declare-fun b!26465 () Bool)

(assert (=> b!26465 (= e!17956 (= lt!38100 (bvsub (bvsub (bvadd (bitIndex!0 (size!727 (buf!1054 (_2!1556 lt!38096))) (currentByte!2379 (_2!1556 lt!38096)) (currentBit!2374 (_2!1556 lt!38096))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26466 () Bool)

(declare-fun res!22809 () Bool)

(assert (=> b!26466 (=> res!22809 e!17945)))

(assert (=> b!26466 (= res!22809 (not (invariant!0 (currentBit!2374 (_2!1556 lt!38096)) (currentByte!2379 (_2!1556 lt!38096)) (size!727 (buf!1054 (_2!1556 lt!38096))))))))

(declare-fun b!26467 () Bool)

(declare-fun res!22798 () Bool)

(assert (=> b!26467 (=> res!22798 e!17947)))

(declare-fun length!70 (List!344) Int)

(assert (=> b!26467 (= res!22798 (<= (length!70 lt!38101) 0))))

(assert (= (and start!5952 res!22810) b!26450))

(assert (= (and b!26450 res!22801) b!26463))

(assert (= (and b!26463 (not res!22807)) b!26452))

(assert (= (and b!26452 (not res!22804)) b!26464))

(assert (= (and b!26464 res!22812) b!26459))

(assert (= (and b!26464 (not res!22797)) b!26456))

(assert (= (and b!26456 (not res!22795)) b!26458))

(assert (= (and b!26458 (not res!22803)) b!26462))

(assert (= (and b!26462 (not res!22799)) b!26449))

(assert (= (and b!26449 res!22802) b!26465))

(assert (= (and b!26449 (not res!22800)) b!26466))

(assert (= (and b!26466 (not res!22809)) b!26460))

(assert (= (and b!26460 (not res!22806)) b!26451))

(assert (= (and b!26451 (not res!22796)) b!26467))

(assert (= (and b!26467 (not res!22798)) b!26457))

(assert (= (and b!26457 (not res!22808)) b!26453))

(assert (= (and b!26453 (not res!22794)) b!26461))

(assert (= (and b!26461 (not res!22805)) b!26454))

(assert (= (and b!26454 (not res!22811)) b!26455))

(assert (= start!5952 b!26448))

(declare-fun m!37929 () Bool)

(assert (=> b!26463 m!37929))

(declare-fun m!37931 () Bool)

(assert (=> b!26463 m!37931))

(declare-fun m!37933 () Bool)

(assert (=> b!26463 m!37933))

(declare-fun m!37935 () Bool)

(assert (=> b!26467 m!37935))

(declare-fun m!37937 () Bool)

(assert (=> b!26453 m!37937))

(declare-fun m!37939 () Bool)

(assert (=> b!26459 m!37939))

(assert (=> b!26459 m!37939))

(declare-fun m!37941 () Bool)

(assert (=> b!26459 m!37941))

(declare-fun m!37943 () Bool)

(assert (=> b!26459 m!37943))

(assert (=> b!26459 m!37943))

(declare-fun m!37945 () Bool)

(assert (=> b!26459 m!37945))

(declare-fun m!37947 () Bool)

(assert (=> b!26458 m!37947))

(declare-fun m!37949 () Bool)

(assert (=> start!5952 m!37949))

(declare-fun m!37951 () Bool)

(assert (=> start!5952 m!37951))

(declare-fun m!37953 () Bool)

(assert (=> b!26464 m!37953))

(declare-fun m!37955 () Bool)

(assert (=> b!26464 m!37955))

(declare-fun m!37957 () Bool)

(assert (=> b!26464 m!37957))

(declare-fun m!37959 () Bool)

(assert (=> b!26464 m!37959))

(declare-fun m!37961 () Bool)

(assert (=> b!26464 m!37961))

(declare-fun m!37963 () Bool)

(assert (=> b!26464 m!37963))

(declare-fun m!37965 () Bool)

(assert (=> b!26464 m!37965))

(declare-fun m!37967 () Bool)

(assert (=> b!26451 m!37967))

(declare-fun m!37969 () Bool)

(assert (=> b!26451 m!37969))

(declare-fun m!37971 () Bool)

(assert (=> b!26451 m!37971))

(declare-fun m!37973 () Bool)

(assert (=> b!26451 m!37973))

(declare-fun m!37975 () Bool)

(assert (=> b!26451 m!37975))

(declare-fun m!37977 () Bool)

(assert (=> b!26451 m!37977))

(declare-fun m!37979 () Bool)

(assert (=> b!26451 m!37979))

(declare-fun m!37981 () Bool)

(assert (=> b!26451 m!37981))

(declare-fun m!37983 () Bool)

(assert (=> b!26466 m!37983))

(declare-fun m!37985 () Bool)

(assert (=> b!26452 m!37985))

(declare-fun m!37987 () Bool)

(assert (=> b!26452 m!37987))

(declare-fun m!37989 () Bool)

(assert (=> b!26452 m!37989))

(declare-fun m!37991 () Bool)

(assert (=> b!26452 m!37991))

(assert (=> b!26452 m!37987))

(declare-fun m!37993 () Bool)

(assert (=> b!26452 m!37993))

(declare-fun m!37995 () Bool)

(assert (=> b!26450 m!37995))

(declare-fun m!37997 () Bool)

(assert (=> b!26448 m!37997))

(declare-fun m!37999 () Bool)

(assert (=> b!26457 m!37999))

(declare-fun m!38001 () Bool)

(assert (=> b!26465 m!38001))

(declare-fun m!38003 () Bool)

(assert (=> b!26461 m!38003))

(declare-fun m!38005 () Bool)

(assert (=> b!26460 m!38005))

(declare-fun m!38007 () Bool)

(assert (=> b!26456 m!38007))

(declare-fun m!38009 () Bool)

(assert (=> b!26455 m!38009))

(declare-fun m!38011 () Bool)

(assert (=> b!26455 m!38011))

(push 1)

(assert (not b!26456))

(assert (not b!26457))

(assert (not b!26467))

(assert (not b!26466))

(assert (not b!26461))

(assert (not b!26452))

(assert (not b!26453))

(assert (not b!26458))

(assert (not b!26465))

(assert (not b!26450))

(assert (not b!26451))

(assert (not b!26455))

(assert (not b!26459))

(assert (not b!26463))

(assert (not b!26448))

(assert (not b!26460))

(assert (not start!5952))

(assert (not b!26464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

