; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5954 () Bool)

(assert start!5954)

(declare-fun b!26508 () Bool)

(declare-fun res!22865 () Bool)

(declare-fun e!17986 () Bool)

(assert (=> b!26508 (=> res!22865 e!17986)))

(declare-datatypes ((array!1691 0))(
  ( (array!1692 (arr!1190 (Array (_ BitVec 32) (_ BitVec 8))) (size!728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1288 0))(
  ( (BitStream!1289 (buf!1055 array!1691) (currentByte!2380 (_ BitVec 32)) (currentBit!2375 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1288)

(declare-datatypes ((Unit!2159 0))(
  ( (Unit!2160) )
))
(declare-datatypes ((tuple2!2942 0))(
  ( (tuple2!2943 (_1!1558 Unit!2159) (_2!1558 BitStream!1288)) )
))
(declare-fun lt!38163 () tuple2!2942)

(assert (=> b!26508 (= res!22865 (not (= (size!728 (buf!1055 thiss!1379)) (size!728 (buf!1055 (_2!1558 lt!38163))))))))

(declare-fun b!26509 () Bool)

(declare-fun e!17989 () Bool)

(assert (=> b!26509 (= e!17986 e!17989)))

(declare-fun res!22853 () Bool)

(assert (=> b!26509 (=> res!22853 e!17989)))

(declare-fun lt!38153 () tuple2!2942)

(assert (=> b!26509 (= res!22853 (not (= (size!728 (buf!1055 (_2!1558 lt!38153))) (size!728 (buf!1055 (_2!1558 lt!38163))))))))

(declare-fun e!17981 () Bool)

(assert (=> b!26509 e!17981))

(declare-fun res!22863 () Bool)

(assert (=> b!26509 (=> (not res!22863) (not e!17981))))

(assert (=> b!26509 (= res!22863 (= (size!728 (buf!1055 (_2!1558 lt!38163))) (size!728 (buf!1055 thiss!1379))))))

(declare-fun b!26510 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!38159 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26510 (= e!17981 (= lt!38159 (bvsub (bvsub (bvadd (bitIndex!0 (size!728 (buf!1055 (_2!1558 lt!38153))) (currentByte!2380 (_2!1558 lt!38153)) (currentBit!2375 (_2!1558 lt!38153))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26511 () Bool)

(declare-fun res!22866 () Bool)

(declare-fun e!17988 () Bool)

(assert (=> b!26511 (=> res!22866 e!17988)))

(declare-datatypes ((tuple2!2944 0))(
  ( (tuple2!2945 (_1!1559 BitStream!1288) (_2!1559 BitStream!1288)) )
))
(declare-fun lt!38162 () tuple2!2944)

(declare-fun lt!38164 () tuple2!2944)

(declare-fun isPrefixOf!0 (BitStream!1288 BitStream!1288) Bool)

(assert (=> b!26511 (= res!22866 (not (isPrefixOf!0 (_1!1559 lt!38162) (_1!1559 lt!38164))))))

(declare-fun b!26512 () Bool)

(declare-fun res!22851 () Bool)

(assert (=> b!26512 (=> res!22851 e!17988)))

(assert (=> b!26512 (= res!22851 (not (isPrefixOf!0 (_1!1559 lt!38164) (_2!1558 lt!38163))))))

(declare-fun srcBuffer!2 () array!1691)

(declare-fun e!17984 () Bool)

(declare-fun lt!38161 () tuple2!2944)

(declare-fun b!26513 () Bool)

(declare-datatypes ((List!345 0))(
  ( (Nil!342) (Cons!341 (h!460 Bool) (t!1095 List!345)) )
))
(declare-fun head!182 (List!345) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1288 array!1691 (_ BitVec 64) (_ BitVec 64)) List!345)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1288 BitStream!1288 (_ BitVec 64)) List!345)

(assert (=> b!26513 (= e!17984 (= (head!182 (byteArrayBitContentToList!0 (_2!1558 lt!38153) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!182 (bitStreamReadBitsIntoList!0 (_2!1558 lt!38153) (_1!1559 lt!38161) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26514 () Bool)

(declare-fun e!17992 () Bool)

(declare-fun e!17987 () Bool)

(assert (=> b!26514 (= e!17992 e!17987)))

(declare-fun res!22858 () Bool)

(assert (=> b!26514 (=> res!22858 e!17987)))

(assert (=> b!26514 (= res!22858 (not (isPrefixOf!0 (_2!1558 lt!38153) (_2!1558 lt!38163))))))

(assert (=> b!26514 (isPrefixOf!0 thiss!1379 (_2!1558 lt!38163))))

(declare-fun lt!38158 () Unit!2159)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1288 BitStream!1288 BitStream!1288) Unit!2159)

(assert (=> b!26514 (= lt!38158 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1558 lt!38153) (_2!1558 lt!38163)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1288 array!1691 (_ BitVec 64) (_ BitVec 64)) tuple2!2942)

(assert (=> b!26514 (= lt!38163 (appendBitsMSBFirstLoop!0 (_2!1558 lt!38153) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26514 e!17984))

(declare-fun res!22852 () Bool)

(assert (=> b!26514 (=> (not res!22852) (not e!17984))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26514 (= res!22852 (validate_offset_bits!1 ((_ sign_extend 32) (size!728 (buf!1055 (_2!1558 lt!38153)))) ((_ sign_extend 32) (currentByte!2380 thiss!1379)) ((_ sign_extend 32) (currentBit!2375 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38154 () Unit!2159)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1288 array!1691 (_ BitVec 64)) Unit!2159)

(assert (=> b!26514 (= lt!38154 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1055 (_2!1558 lt!38153)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1288 BitStream!1288) tuple2!2944)

(assert (=> b!26514 (= lt!38161 (reader!0 thiss!1379 (_2!1558 lt!38153)))))

(declare-fun b!26515 () Bool)

(declare-fun e!17985 () Bool)

(declare-fun array_inv!697 (array!1691) Bool)

(assert (=> b!26515 (= e!17985 (array_inv!697 (buf!1055 thiss!1379)))))

(declare-fun res!22854 () Bool)

(declare-fun e!17983 () Bool)

(assert (=> start!5954 (=> (not res!22854) (not e!17983))))

(assert (=> start!5954 (= res!22854 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!728 srcBuffer!2))))))))

(assert (=> start!5954 e!17983))

(assert (=> start!5954 true))

(assert (=> start!5954 (array_inv!697 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1288) Bool)

(assert (=> start!5954 (and (inv!12 thiss!1379) e!17985)))

(declare-fun b!26516 () Bool)

(declare-fun res!22860 () Bool)

(assert (=> b!26516 (=> res!22860 e!17989)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26516 (= res!22860 (not (invariant!0 (currentBit!2375 (_2!1558 lt!38153)) (currentByte!2380 (_2!1558 lt!38153)) (size!728 (buf!1055 (_2!1558 lt!38163))))))))

(declare-fun b!26517 () Bool)

(declare-fun e!17990 () Bool)

(assert (=> b!26517 (= e!17990 e!17992)))

(declare-fun res!22868 () Bool)

(assert (=> b!26517 (=> res!22868 e!17992)))

(assert (=> b!26517 (= res!22868 (not (isPrefixOf!0 thiss!1379 (_2!1558 lt!38153))))))

(declare-fun lt!38156 () (_ BitVec 64))

(assert (=> b!26517 (validate_offset_bits!1 ((_ sign_extend 32) (size!728 (buf!1055 (_2!1558 lt!38153)))) ((_ sign_extend 32) (currentByte!2380 (_2!1558 lt!38153))) ((_ sign_extend 32) (currentBit!2375 (_2!1558 lt!38153))) lt!38156)))

(assert (=> b!26517 (= lt!38156 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38155 () Unit!2159)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1288 BitStream!1288 (_ BitVec 64) (_ BitVec 64)) Unit!2159)

(assert (=> b!26517 (= lt!38155 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1558 lt!38153) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1288 (_ BitVec 8) (_ BitVec 32)) tuple2!2942)

(assert (=> b!26517 (= lt!38153 (appendBitFromByte!0 thiss!1379 (select (arr!1190 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26518 () Bool)

(declare-fun res!22861 () Bool)

(assert (=> b!26518 (=> res!22861 e!17988)))

(assert (=> b!26518 (= res!22861 (not (isPrefixOf!0 (_1!1559 lt!38162) (_2!1558 lt!38163))))))

(declare-fun b!26519 () Bool)

(assert (=> b!26519 (= e!17988 true)))

(declare-fun lt!38148 () (_ BitVec 64))

(assert (=> b!26519 (= lt!38148 (bitIndex!0 (size!728 (buf!1055 (_1!1559 lt!38164))) (currentByte!2380 (_1!1559 lt!38164)) (currentBit!2375 (_1!1559 lt!38164))))))

(declare-fun lt!38157 () (_ BitVec 64))

(assert (=> b!26519 (= lt!38157 (bitIndex!0 (size!728 (buf!1055 (_1!1559 lt!38162))) (currentByte!2380 (_1!1559 lt!38162)) (currentBit!2375 (_1!1559 lt!38162))))))

(declare-fun b!26520 () Bool)

(assert (=> b!26520 (= e!17989 e!17988)))

(declare-fun res!22862 () Bool)

(assert (=> b!26520 (=> res!22862 e!17988)))

(assert (=> b!26520 (= res!22862 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38151 () List!345)

(assert (=> b!26520 (= lt!38151 (bitStreamReadBitsIntoList!0 (_2!1558 lt!38163) (_1!1559 lt!38164) lt!38156))))

(declare-fun lt!38160 () List!345)

(assert (=> b!26520 (= lt!38160 (bitStreamReadBitsIntoList!0 (_2!1558 lt!38163) (_1!1559 lt!38162) (bvsub to!314 i!635)))))

(assert (=> b!26520 (validate_offset_bits!1 ((_ sign_extend 32) (size!728 (buf!1055 (_2!1558 lt!38163)))) ((_ sign_extend 32) (currentByte!2380 (_2!1558 lt!38153))) ((_ sign_extend 32) (currentBit!2375 (_2!1558 lt!38153))) lt!38156)))

(declare-fun lt!38150 () Unit!2159)

(assert (=> b!26520 (= lt!38150 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1558 lt!38153) (buf!1055 (_2!1558 lt!38163)) lt!38156))))

(assert (=> b!26520 (= lt!38164 (reader!0 (_2!1558 lt!38153) (_2!1558 lt!38163)))))

(assert (=> b!26520 (validate_offset_bits!1 ((_ sign_extend 32) (size!728 (buf!1055 (_2!1558 lt!38163)))) ((_ sign_extend 32) (currentByte!2380 thiss!1379)) ((_ sign_extend 32) (currentBit!2375 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38147 () Unit!2159)

(assert (=> b!26520 (= lt!38147 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1055 (_2!1558 lt!38163)) (bvsub to!314 i!635)))))

(assert (=> b!26520 (= lt!38162 (reader!0 thiss!1379 (_2!1558 lt!38163)))))

(declare-fun b!26521 () Bool)

(declare-fun res!22855 () Bool)

(assert (=> b!26521 (=> res!22855 e!17988)))

(declare-fun length!71 (List!345) Int)

(assert (=> b!26521 (= res!22855 (<= (length!71 lt!38160) 0))))

(declare-fun b!26522 () Bool)

(assert (=> b!26522 (= e!17983 (not e!17990))))

(declare-fun res!22867 () Bool)

(assert (=> b!26522 (=> res!22867 e!17990)))

(assert (=> b!26522 (= res!22867 (bvsge i!635 to!314))))

(assert (=> b!26522 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38152 () Unit!2159)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1288) Unit!2159)

(assert (=> b!26522 (= lt!38152 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38149 () (_ BitVec 64))

(assert (=> b!26522 (= lt!38149 (bitIndex!0 (size!728 (buf!1055 thiss!1379)) (currentByte!2380 thiss!1379) (currentBit!2375 thiss!1379)))))

(declare-fun b!26523 () Bool)

(declare-fun res!22856 () Bool)

(assert (=> b!26523 (=> (not res!22856) (not e!17983))))

(assert (=> b!26523 (= res!22856 (validate_offset_bits!1 ((_ sign_extend 32) (size!728 (buf!1055 thiss!1379))) ((_ sign_extend 32) (currentByte!2380 thiss!1379)) ((_ sign_extend 32) (currentBit!2375 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26524 () Bool)

(declare-fun res!22859 () Bool)

(assert (=> b!26524 (=> res!22859 e!17986)))

(assert (=> b!26524 (= res!22859 (not (invariant!0 (currentBit!2375 (_2!1558 lt!38163)) (currentByte!2380 (_2!1558 lt!38163)) (size!728 (buf!1055 (_2!1558 lt!38163))))))))

(declare-fun b!26525 () Bool)

(declare-fun res!22857 () Bool)

(assert (=> b!26525 (=> res!22857 e!17989)))

(assert (=> b!26525 (= res!22857 (not (invariant!0 (currentBit!2375 (_2!1558 lt!38153)) (currentByte!2380 (_2!1558 lt!38153)) (size!728 (buf!1055 (_2!1558 lt!38153))))))))

(declare-fun b!26526 () Bool)

(declare-fun res!22864 () Bool)

(assert (=> b!26526 (=> res!22864 e!17988)))

(assert (=> b!26526 (= res!22864 (or (not (= (buf!1055 (_1!1559 lt!38162)) (buf!1055 (_1!1559 lt!38164)))) (not (= (buf!1055 (_1!1559 lt!38162)) (buf!1055 (_2!1558 lt!38163)))) (bvsge lt!38159 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26527 () Bool)

(assert (=> b!26527 (= e!17987 e!17986)))

(declare-fun res!22869 () Bool)

(assert (=> b!26527 (=> res!22869 e!17986)))

(assert (=> b!26527 (= res!22869 (not (= lt!38159 (bvsub (bvadd lt!38149 to!314) i!635))))))

(assert (=> b!26527 (= lt!38159 (bitIndex!0 (size!728 (buf!1055 (_2!1558 lt!38163))) (currentByte!2380 (_2!1558 lt!38163)) (currentBit!2375 (_2!1558 lt!38163))))))

(assert (= (and start!5954 res!22854) b!26523))

(assert (= (and b!26523 res!22856) b!26522))

(assert (= (and b!26522 (not res!22867)) b!26517))

(assert (= (and b!26517 (not res!22868)) b!26514))

(assert (= (and b!26514 res!22852) b!26513))

(assert (= (and b!26514 (not res!22858)) b!26527))

(assert (= (and b!26527 (not res!22869)) b!26524))

(assert (= (and b!26524 (not res!22859)) b!26508))

(assert (= (and b!26508 (not res!22865)) b!26509))

(assert (= (and b!26509 res!22863) b!26510))

(assert (= (and b!26509 (not res!22853)) b!26525))

(assert (= (and b!26525 (not res!22857)) b!26516))

(assert (= (and b!26516 (not res!22860)) b!26520))

(assert (= (and b!26520 (not res!22862)) b!26521))

(assert (= (and b!26521 (not res!22855)) b!26518))

(assert (= (and b!26518 (not res!22861)) b!26512))

(assert (= (and b!26512 (not res!22851)) b!26511))

(assert (= (and b!26511 (not res!22866)) b!26526))

(assert (= (and b!26526 (not res!22864)) b!26519))

(assert (= start!5954 b!26515))

(declare-fun m!38013 () Bool)

(assert (=> b!26515 m!38013))

(declare-fun m!38015 () Bool)

(assert (=> b!26527 m!38015))

(declare-fun m!38017 () Bool)

(assert (=> b!26516 m!38017))

(declare-fun m!38019 () Bool)

(assert (=> b!26510 m!38019))

(declare-fun m!38021 () Bool)

(assert (=> b!26512 m!38021))

(declare-fun m!38023 () Bool)

(assert (=> start!5954 m!38023))

(declare-fun m!38025 () Bool)

(assert (=> start!5954 m!38025))

(declare-fun m!38027 () Bool)

(assert (=> b!26514 m!38027))

(declare-fun m!38029 () Bool)

(assert (=> b!26514 m!38029))

(declare-fun m!38031 () Bool)

(assert (=> b!26514 m!38031))

(declare-fun m!38033 () Bool)

(assert (=> b!26514 m!38033))

(declare-fun m!38035 () Bool)

(assert (=> b!26514 m!38035))

(declare-fun m!38037 () Bool)

(assert (=> b!26514 m!38037))

(declare-fun m!38039 () Bool)

(assert (=> b!26514 m!38039))

(declare-fun m!38041 () Bool)

(assert (=> b!26524 m!38041))

(declare-fun m!38043 () Bool)

(assert (=> b!26518 m!38043))

(declare-fun m!38045 () Bool)

(assert (=> b!26519 m!38045))

(declare-fun m!38047 () Bool)

(assert (=> b!26519 m!38047))

(declare-fun m!38049 () Bool)

(assert (=> b!26517 m!38049))

(declare-fun m!38051 () Bool)

(assert (=> b!26517 m!38051))

(declare-fun m!38053 () Bool)

(assert (=> b!26517 m!38053))

(assert (=> b!26517 m!38053))

(declare-fun m!38055 () Bool)

(assert (=> b!26517 m!38055))

(declare-fun m!38057 () Bool)

(assert (=> b!26517 m!38057))

(declare-fun m!38059 () Bool)

(assert (=> b!26513 m!38059))

(assert (=> b!26513 m!38059))

(declare-fun m!38061 () Bool)

(assert (=> b!26513 m!38061))

(declare-fun m!38063 () Bool)

(assert (=> b!26513 m!38063))

(assert (=> b!26513 m!38063))

(declare-fun m!38065 () Bool)

(assert (=> b!26513 m!38065))

(declare-fun m!38067 () Bool)

(assert (=> b!26525 m!38067))

(declare-fun m!38069 () Bool)

(assert (=> b!26521 m!38069))

(declare-fun m!38071 () Bool)

(assert (=> b!26520 m!38071))

(declare-fun m!38073 () Bool)

(assert (=> b!26520 m!38073))

(declare-fun m!38075 () Bool)

(assert (=> b!26520 m!38075))

(declare-fun m!38077 () Bool)

(assert (=> b!26520 m!38077))

(declare-fun m!38079 () Bool)

(assert (=> b!26520 m!38079))

(declare-fun m!38081 () Bool)

(assert (=> b!26520 m!38081))

(declare-fun m!38083 () Bool)

(assert (=> b!26520 m!38083))

(declare-fun m!38085 () Bool)

(assert (=> b!26520 m!38085))

(declare-fun m!38087 () Bool)

(assert (=> b!26523 m!38087))

(declare-fun m!38089 () Bool)

(assert (=> b!26522 m!38089))

(declare-fun m!38091 () Bool)

(assert (=> b!26522 m!38091))

(declare-fun m!38093 () Bool)

(assert (=> b!26522 m!38093))

(declare-fun m!38095 () Bool)

(assert (=> b!26511 m!38095))

(push 1)

