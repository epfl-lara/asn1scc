; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6002 () Bool)

(assert start!6002)

(declare-fun b!27948 () Bool)

(declare-fun res!24228 () Bool)

(declare-fun e!18848 () Bool)

(assert (=> b!27948 (=> res!24228 e!18848)))

(declare-datatypes ((array!1739 0))(
  ( (array!1740 (arr!1214 (Array (_ BitVec 32) (_ BitVec 8))) (size!752 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1336 0))(
  ( (BitStream!1337 (buf!1079 array!1739) (currentByte!2404 (_ BitVec 32)) (currentBit!2399 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3038 0))(
  ( (tuple2!3039 (_1!1606 BitStream!1336) (_2!1606 BitStream!1336)) )
))
(declare-fun lt!39453 () tuple2!3038)

(declare-datatypes ((Unit!2207 0))(
  ( (Unit!2208) )
))
(declare-datatypes ((tuple2!3040 0))(
  ( (tuple2!3041 (_1!1607 Unit!2207) (_2!1607 BitStream!1336)) )
))
(declare-fun lt!39444 () tuple2!3040)

(declare-fun isPrefixOf!0 (BitStream!1336 BitStream!1336) Bool)

(assert (=> b!27948 (= res!24228 (not (isPrefixOf!0 (_1!1606 lt!39453) (_2!1607 lt!39444))))))

(declare-fun b!27950 () Bool)

(assert (=> b!27950 (= e!18848 true)))

(declare-fun lt!39459 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27950 (= lt!39459 (bitIndex!0 (size!752 (buf!1079 (_1!1606 lt!39453))) (currentByte!2404 (_1!1606 lt!39453)) (currentBit!2399 (_1!1606 lt!39453))))))

(declare-fun lt!39445 () (_ BitVec 64))

(declare-fun lt!39460 () tuple2!3038)

(assert (=> b!27950 (= lt!39445 (bitIndex!0 (size!752 (buf!1079 (_1!1606 lt!39460))) (currentByte!2404 (_1!1606 lt!39460)) (currentBit!2399 (_1!1606 lt!39460))))))

(declare-fun b!27951 () Bool)

(declare-fun e!18855 () Bool)

(declare-fun e!18847 () Bool)

(assert (=> b!27951 (= e!18855 e!18847)))

(declare-fun res!24234 () Bool)

(assert (=> b!27951 (=> res!24234 e!18847)))

(declare-fun lt!39448 () tuple2!3040)

(assert (=> b!27951 (= res!24234 (not (isPrefixOf!0 (_2!1607 lt!39448) (_2!1607 lt!39444))))))

(declare-fun thiss!1379 () BitStream!1336)

(assert (=> b!27951 (isPrefixOf!0 thiss!1379 (_2!1607 lt!39444))))

(declare-fun lt!39454 () Unit!2207)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1336 BitStream!1336 BitStream!1336) Unit!2207)

(assert (=> b!27951 (= lt!39454 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1607 lt!39448) (_2!1607 lt!39444)))))

(declare-fun srcBuffer!2 () array!1739)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1336 array!1739 (_ BitVec 64) (_ BitVec 64)) tuple2!3040)

(assert (=> b!27951 (= lt!39444 (appendBitsMSBFirstLoop!0 (_2!1607 lt!39448) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18854 () Bool)

(assert (=> b!27951 e!18854))

(declare-fun res!24225 () Bool)

(assert (=> b!27951 (=> (not res!24225) (not e!18854))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27951 (= res!24225 (validate_offset_bits!1 ((_ sign_extend 32) (size!752 (buf!1079 (_2!1607 lt!39448)))) ((_ sign_extend 32) (currentByte!2404 thiss!1379)) ((_ sign_extend 32) (currentBit!2399 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39456 () Unit!2207)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1336 array!1739 (_ BitVec 64)) Unit!2207)

(assert (=> b!27951 (= lt!39456 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1079 (_2!1607 lt!39448)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39447 () tuple2!3038)

(declare-fun reader!0 (BitStream!1336 BitStream!1336) tuple2!3038)

(assert (=> b!27951 (= lt!39447 (reader!0 thiss!1379 (_2!1607 lt!39448)))))

(declare-fun b!27952 () Bool)

(declare-fun e!18846 () Bool)

(declare-fun e!18849 () Bool)

(assert (=> b!27952 (= e!18846 (not e!18849))))

(declare-fun res!24231 () Bool)

(assert (=> b!27952 (=> res!24231 e!18849)))

(assert (=> b!27952 (= res!24231 (bvsge i!635 to!314))))

(assert (=> b!27952 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39452 () Unit!2207)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1336) Unit!2207)

(assert (=> b!27952 (= lt!39452 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!39449 () (_ BitVec 64))

(assert (=> b!27952 (= lt!39449 (bitIndex!0 (size!752 (buf!1079 thiss!1379)) (currentByte!2404 thiss!1379) (currentBit!2399 thiss!1379)))))

(declare-fun b!27953 () Bool)

(declare-fun e!18851 () Bool)

(declare-fun e!18853 () Bool)

(assert (=> b!27953 (= e!18851 e!18853)))

(declare-fun res!24235 () Bool)

(assert (=> b!27953 (=> res!24235 e!18853)))

(assert (=> b!27953 (= res!24235 (not (= (size!752 (buf!1079 (_2!1607 lt!39448))) (size!752 (buf!1079 (_2!1607 lt!39444))))))))

(declare-fun e!18845 () Bool)

(assert (=> b!27953 e!18845))

(declare-fun res!24222 () Bool)

(assert (=> b!27953 (=> (not res!24222) (not e!18845))))

(assert (=> b!27953 (= res!24222 (= (size!752 (buf!1079 (_2!1607 lt!39444))) (size!752 (buf!1079 thiss!1379))))))

(declare-fun b!27954 () Bool)

(declare-fun res!24227 () Bool)

(assert (=> b!27954 (=> res!24227 e!18848)))

(declare-fun lt!39458 () (_ BitVec 64))

(assert (=> b!27954 (= res!24227 (or (not (= (buf!1079 (_1!1606 lt!39460)) (buf!1079 (_1!1606 lt!39453)))) (not (= (buf!1079 (_1!1606 lt!39460)) (buf!1079 (_2!1607 lt!39444)))) (bvsge lt!39458 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27955 () Bool)

(declare-fun res!24224 () Bool)

(assert (=> b!27955 (=> res!24224 e!18848)))

(assert (=> b!27955 (= res!24224 (not (isPrefixOf!0 (_1!1606 lt!39460) (_2!1607 lt!39444))))))

(declare-fun b!27956 () Bool)

(assert (=> b!27956 (= e!18849 e!18855)))

(declare-fun res!24229 () Bool)

(assert (=> b!27956 (=> res!24229 e!18855)))

(assert (=> b!27956 (= res!24229 (not (isPrefixOf!0 thiss!1379 (_2!1607 lt!39448))))))

(declare-fun lt!39443 () (_ BitVec 64))

(assert (=> b!27956 (validate_offset_bits!1 ((_ sign_extend 32) (size!752 (buf!1079 (_2!1607 lt!39448)))) ((_ sign_extend 32) (currentByte!2404 (_2!1607 lt!39448))) ((_ sign_extend 32) (currentBit!2399 (_2!1607 lt!39448))) lt!39443)))

(assert (=> b!27956 (= lt!39443 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39457 () Unit!2207)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1336 BitStream!1336 (_ BitVec 64) (_ BitVec 64)) Unit!2207)

(assert (=> b!27956 (= lt!39457 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1607 lt!39448) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1336 (_ BitVec 8) (_ BitVec 32)) tuple2!3040)

(assert (=> b!27956 (= lt!39448 (appendBitFromByte!0 thiss!1379 (select (arr!1214 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27957 () Bool)

(declare-fun res!24237 () Bool)

(assert (=> b!27957 (=> res!24237 e!18851)))

(assert (=> b!27957 (= res!24237 (not (= (size!752 (buf!1079 thiss!1379)) (size!752 (buf!1079 (_2!1607 lt!39444))))))))

(declare-fun b!27958 () Bool)

(declare-fun res!24233 () Bool)

(assert (=> b!27958 (=> res!24233 e!18853)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27958 (= res!24233 (not (invariant!0 (currentBit!2399 (_2!1607 lt!39448)) (currentByte!2404 (_2!1607 lt!39448)) (size!752 (buf!1079 (_2!1607 lt!39448))))))))

(declare-fun b!27959 () Bool)

(assert (=> b!27959 (= e!18847 e!18851)))

(declare-fun res!24226 () Bool)

(assert (=> b!27959 (=> res!24226 e!18851)))

(assert (=> b!27959 (= res!24226 (not (= lt!39458 (bvsub (bvadd lt!39449 to!314) i!635))))))

(assert (=> b!27959 (= lt!39458 (bitIndex!0 (size!752 (buf!1079 (_2!1607 lt!39444))) (currentByte!2404 (_2!1607 lt!39444)) (currentBit!2399 (_2!1607 lt!39444))))))

(declare-fun b!27960 () Bool)

(declare-fun res!24219 () Bool)

(assert (=> b!27960 (=> res!24219 e!18848)))

(assert (=> b!27960 (= res!24219 (not (isPrefixOf!0 (_1!1606 lt!39460) (_1!1606 lt!39453))))))

(declare-fun b!27961 () Bool)

(declare-fun res!24220 () Bool)

(assert (=> b!27961 (=> res!24220 e!18853)))

(assert (=> b!27961 (= res!24220 (not (invariant!0 (currentBit!2399 (_2!1607 lt!39448)) (currentByte!2404 (_2!1607 lt!39448)) (size!752 (buf!1079 (_2!1607 lt!39444))))))))

(declare-fun b!27962 () Bool)

(assert (=> b!27962 (= e!18853 e!18848)))

(declare-fun res!24232 () Bool)

(assert (=> b!27962 (=> res!24232 e!18848)))

(assert (=> b!27962 (= res!24232 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!369 0))(
  ( (Nil!366) (Cons!365 (h!484 Bool) (t!1119 List!369)) )
))
(declare-fun lt!39451 () List!369)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1336 BitStream!1336 (_ BitVec 64)) List!369)

(assert (=> b!27962 (= lt!39451 (bitStreamReadBitsIntoList!0 (_2!1607 lt!39444) (_1!1606 lt!39453) lt!39443))))

(declare-fun lt!39446 () List!369)

(assert (=> b!27962 (= lt!39446 (bitStreamReadBitsIntoList!0 (_2!1607 lt!39444) (_1!1606 lt!39460) (bvsub to!314 i!635)))))

(assert (=> b!27962 (validate_offset_bits!1 ((_ sign_extend 32) (size!752 (buf!1079 (_2!1607 lt!39444)))) ((_ sign_extend 32) (currentByte!2404 (_2!1607 lt!39448))) ((_ sign_extend 32) (currentBit!2399 (_2!1607 lt!39448))) lt!39443)))

(declare-fun lt!39450 () Unit!2207)

(assert (=> b!27962 (= lt!39450 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1607 lt!39448) (buf!1079 (_2!1607 lt!39444)) lt!39443))))

(assert (=> b!27962 (= lt!39453 (reader!0 (_2!1607 lt!39448) (_2!1607 lt!39444)))))

(assert (=> b!27962 (validate_offset_bits!1 ((_ sign_extend 32) (size!752 (buf!1079 (_2!1607 lt!39444)))) ((_ sign_extend 32) (currentByte!2404 thiss!1379)) ((_ sign_extend 32) (currentBit!2399 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39455 () Unit!2207)

(assert (=> b!27962 (= lt!39455 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1079 (_2!1607 lt!39444)) (bvsub to!314 i!635)))))

(assert (=> b!27962 (= lt!39460 (reader!0 thiss!1379 (_2!1607 lt!39444)))))

(declare-fun b!27963 () Bool)

(declare-fun e!18856 () Bool)

(declare-fun array_inv!721 (array!1739) Bool)

(assert (=> b!27963 (= e!18856 (array_inv!721 (buf!1079 thiss!1379)))))

(declare-fun b!27949 () Bool)

(declare-fun res!24221 () Bool)

(assert (=> b!27949 (=> res!24221 e!18851)))

(assert (=> b!27949 (= res!24221 (not (invariant!0 (currentBit!2399 (_2!1607 lt!39444)) (currentByte!2404 (_2!1607 lt!39444)) (size!752 (buf!1079 (_2!1607 lt!39444))))))))

(declare-fun res!24223 () Bool)

(assert (=> start!6002 (=> (not res!24223) (not e!18846))))

(assert (=> start!6002 (= res!24223 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!752 srcBuffer!2))))))))

(assert (=> start!6002 e!18846))

(assert (=> start!6002 true))

(assert (=> start!6002 (array_inv!721 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1336) Bool)

(assert (=> start!6002 (and (inv!12 thiss!1379) e!18856)))

(declare-fun b!27964 () Bool)

(declare-fun head!206 (List!369) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1336 array!1739 (_ BitVec 64) (_ BitVec 64)) List!369)

(assert (=> b!27964 (= e!18854 (= (head!206 (byteArrayBitContentToList!0 (_2!1607 lt!39448) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!206 (bitStreamReadBitsIntoList!0 (_2!1607 lt!39448) (_1!1606 lt!39447) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27965 () Bool)

(declare-fun res!24230 () Bool)

(assert (=> b!27965 (=> res!24230 e!18848)))

(declare-fun length!95 (List!369) Int)

(assert (=> b!27965 (= res!24230 (<= (length!95 lt!39446) 0))))

(declare-fun b!27966 () Bool)

(declare-fun res!24236 () Bool)

(assert (=> b!27966 (=> (not res!24236) (not e!18846))))

(assert (=> b!27966 (= res!24236 (validate_offset_bits!1 ((_ sign_extend 32) (size!752 (buf!1079 thiss!1379))) ((_ sign_extend 32) (currentByte!2404 thiss!1379)) ((_ sign_extend 32) (currentBit!2399 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27967 () Bool)

(assert (=> b!27967 (= e!18845 (= lt!39458 (bvsub (bvsub (bvadd (bitIndex!0 (size!752 (buf!1079 (_2!1607 lt!39448))) (currentByte!2404 (_2!1607 lt!39448)) (currentBit!2399 (_2!1607 lt!39448))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!6002 res!24223) b!27966))

(assert (= (and b!27966 res!24236) b!27952))

(assert (= (and b!27952 (not res!24231)) b!27956))

(assert (= (and b!27956 (not res!24229)) b!27951))

(assert (= (and b!27951 res!24225) b!27964))

(assert (= (and b!27951 (not res!24234)) b!27959))

(assert (= (and b!27959 (not res!24226)) b!27949))

(assert (= (and b!27949 (not res!24221)) b!27957))

(assert (= (and b!27957 (not res!24237)) b!27953))

(assert (= (and b!27953 res!24222) b!27967))

(assert (= (and b!27953 (not res!24235)) b!27958))

(assert (= (and b!27958 (not res!24233)) b!27961))

(assert (= (and b!27961 (not res!24220)) b!27962))

(assert (= (and b!27962 (not res!24232)) b!27965))

(assert (= (and b!27965 (not res!24230)) b!27955))

(assert (= (and b!27955 (not res!24224)) b!27948))

(assert (= (and b!27948 (not res!24228)) b!27960))

(assert (= (and b!27960 (not res!24219)) b!27954))

(assert (= (and b!27954 (not res!24227)) b!27950))

(assert (= start!6002 b!27963))

(declare-fun m!40029 () Bool)

(assert (=> b!27961 m!40029))

(declare-fun m!40031 () Bool)

(assert (=> b!27960 m!40031))

(declare-fun m!40033 () Bool)

(assert (=> b!27950 m!40033))

(declare-fun m!40035 () Bool)

(assert (=> b!27950 m!40035))

(declare-fun m!40037 () Bool)

(assert (=> start!6002 m!40037))

(declare-fun m!40039 () Bool)

(assert (=> start!6002 m!40039))

(declare-fun m!40041 () Bool)

(assert (=> b!27965 m!40041))

(declare-fun m!40043 () Bool)

(assert (=> b!27967 m!40043))

(declare-fun m!40045 () Bool)

(assert (=> b!27963 m!40045))

(declare-fun m!40047 () Bool)

(assert (=> b!27948 m!40047))

(declare-fun m!40049 () Bool)

(assert (=> b!27955 m!40049))

(declare-fun m!40051 () Bool)

(assert (=> b!27959 m!40051))

(declare-fun m!40053 () Bool)

(assert (=> b!27956 m!40053))

(declare-fun m!40055 () Bool)

(assert (=> b!27956 m!40055))

(declare-fun m!40057 () Bool)

(assert (=> b!27956 m!40057))

(assert (=> b!27956 m!40053))

(declare-fun m!40059 () Bool)

(assert (=> b!27956 m!40059))

(declare-fun m!40061 () Bool)

(assert (=> b!27956 m!40061))

(declare-fun m!40063 () Bool)

(assert (=> b!27949 m!40063))

(declare-fun m!40065 () Bool)

(assert (=> b!27966 m!40065))

(declare-fun m!40067 () Bool)

(assert (=> b!27952 m!40067))

(declare-fun m!40069 () Bool)

(assert (=> b!27952 m!40069))

(declare-fun m!40071 () Bool)

(assert (=> b!27952 m!40071))

(declare-fun m!40073 () Bool)

(assert (=> b!27951 m!40073))

(declare-fun m!40075 () Bool)

(assert (=> b!27951 m!40075))

(declare-fun m!40077 () Bool)

(assert (=> b!27951 m!40077))

(declare-fun m!40079 () Bool)

(assert (=> b!27951 m!40079))

(declare-fun m!40081 () Bool)

(assert (=> b!27951 m!40081))

(declare-fun m!40083 () Bool)

(assert (=> b!27951 m!40083))

(declare-fun m!40085 () Bool)

(assert (=> b!27951 m!40085))

(declare-fun m!40087 () Bool)

(assert (=> b!27964 m!40087))

(assert (=> b!27964 m!40087))

(declare-fun m!40089 () Bool)

(assert (=> b!27964 m!40089))

(declare-fun m!40091 () Bool)

(assert (=> b!27964 m!40091))

(assert (=> b!27964 m!40091))

(declare-fun m!40093 () Bool)

(assert (=> b!27964 m!40093))

(declare-fun m!40095 () Bool)

(assert (=> b!27962 m!40095))

(declare-fun m!40097 () Bool)

(assert (=> b!27962 m!40097))

(declare-fun m!40099 () Bool)

(assert (=> b!27962 m!40099))

(declare-fun m!40101 () Bool)

(assert (=> b!27962 m!40101))

(declare-fun m!40103 () Bool)

(assert (=> b!27962 m!40103))

(declare-fun m!40105 () Bool)

(assert (=> b!27962 m!40105))

(declare-fun m!40107 () Bool)

(assert (=> b!27962 m!40107))

(declare-fun m!40109 () Bool)

(assert (=> b!27962 m!40109))

(declare-fun m!40111 () Bool)

(assert (=> b!27958 m!40111))

(push 1)

