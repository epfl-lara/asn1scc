; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5978 () Bool)

(assert start!5978)

(declare-datatypes ((array!1715 0))(
  ( (array!1716 (arr!1202 (Array (_ BitVec 32) (_ BitVec 8))) (size!740 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1715)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!27228 () Bool)

(declare-fun e!18413 () Bool)

(declare-datatypes ((BitStream!1312 0))(
  ( (BitStream!1313 (buf!1067 array!1715) (currentByte!2392 (_ BitVec 32)) (currentBit!2387 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2990 0))(
  ( (tuple2!2991 (_1!1582 BitStream!1312) (_2!1582 BitStream!1312)) )
))
(declare-fun lt!38807 () tuple2!2990)

(declare-datatypes ((Unit!2183 0))(
  ( (Unit!2184) )
))
(declare-datatypes ((tuple2!2992 0))(
  ( (tuple2!2993 (_1!1583 Unit!2183) (_2!1583 BitStream!1312)) )
))
(declare-fun lt!38798 () tuple2!2992)

(declare-datatypes ((List!357 0))(
  ( (Nil!354) (Cons!353 (h!472 Bool) (t!1107 List!357)) )
))
(declare-fun head!194 (List!357) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1312 array!1715 (_ BitVec 64) (_ BitVec 64)) List!357)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1312 BitStream!1312 (_ BitVec 64)) List!357)

(assert (=> b!27228 (= e!18413 (= (head!194 (byteArrayBitContentToList!0 (_2!1583 lt!38798) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!194 (bitStreamReadBitsIntoList!0 (_2!1583 lt!38798) (_1!1582 lt!38807) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!38808 () (_ BitVec 64))

(declare-fun e!18421 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!27229 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27229 (= e!18421 (= lt!38808 (bvsub (bvsub (bvadd (bitIndex!0 (size!740 (buf!1067 (_2!1583 lt!38798))) (currentByte!2392 (_2!1583 lt!38798)) (currentBit!2387 (_2!1583 lt!38798))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27230 () Bool)

(declare-fun res!23537 () Bool)

(declare-fun e!18416 () Bool)

(assert (=> b!27230 (=> res!23537 e!18416)))

(declare-fun lt!38796 () List!357)

(declare-fun length!83 (List!357) Int)

(assert (=> b!27230 (= res!23537 (<= (length!83 lt!38796) 0))))

(declare-fun b!27231 () Bool)

(declare-fun res!23536 () Bool)

(declare-fun e!18424 () Bool)

(assert (=> b!27231 (=> res!23536 e!18424)))

(declare-fun lt!38804 () tuple2!2992)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27231 (= res!23536 (not (invariant!0 (currentBit!2387 (_2!1583 lt!38804)) (currentByte!2392 (_2!1583 lt!38804)) (size!740 (buf!1067 (_2!1583 lt!38804))))))))

(declare-fun b!27232 () Bool)

(declare-fun res!23550 () Bool)

(declare-fun e!18419 () Bool)

(assert (=> b!27232 (=> res!23550 e!18419)))

(assert (=> b!27232 (= res!23550 (not (invariant!0 (currentBit!2387 (_2!1583 lt!38798)) (currentByte!2392 (_2!1583 lt!38798)) (size!740 (buf!1067 (_2!1583 lt!38798))))))))

(declare-fun b!27233 () Bool)

(assert (=> b!27233 (= e!18416 true)))

(declare-fun lt!38809 () (_ BitVec 64))

(declare-fun lt!38802 () tuple2!2990)

(assert (=> b!27233 (= lt!38809 (bitIndex!0 (size!740 (buf!1067 (_1!1582 lt!38802))) (currentByte!2392 (_1!1582 lt!38802)) (currentBit!2387 (_1!1582 lt!38802))))))

(declare-fun lt!38810 () (_ BitVec 64))

(declare-fun lt!38797 () tuple2!2990)

(assert (=> b!27233 (= lt!38810 (bitIndex!0 (size!740 (buf!1067 (_1!1582 lt!38797))) (currentByte!2392 (_1!1582 lt!38797)) (currentBit!2387 (_1!1582 lt!38797))))))

(declare-fun res!23543 () Bool)

(declare-fun e!18415 () Bool)

(assert (=> start!5978 (=> (not res!23543) (not e!18415))))

(assert (=> start!5978 (= res!23543 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!740 srcBuffer!2))))))))

(assert (=> start!5978 e!18415))

(assert (=> start!5978 true))

(declare-fun array_inv!709 (array!1715) Bool)

(assert (=> start!5978 (array_inv!709 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1312)

(declare-fun e!18417 () Bool)

(declare-fun inv!12 (BitStream!1312) Bool)

(assert (=> start!5978 (and (inv!12 thiss!1379) e!18417)))

(declare-fun b!27234 () Bool)

(declare-fun res!23545 () Bool)

(assert (=> b!27234 (=> res!23545 e!18416)))

(declare-fun isPrefixOf!0 (BitStream!1312 BitStream!1312) Bool)

(assert (=> b!27234 (= res!23545 (not (isPrefixOf!0 (_1!1582 lt!38797) (_1!1582 lt!38802))))))

(declare-fun b!27235 () Bool)

(declare-fun e!18418 () Bool)

(declare-fun e!18420 () Bool)

(assert (=> b!27235 (= e!18418 e!18420)))

(declare-fun res!23548 () Bool)

(assert (=> b!27235 (=> res!23548 e!18420)))

(assert (=> b!27235 (= res!23548 (not (isPrefixOf!0 (_2!1583 lt!38798) (_2!1583 lt!38804))))))

(assert (=> b!27235 (isPrefixOf!0 thiss!1379 (_2!1583 lt!38804))))

(declare-fun lt!38811 () Unit!2183)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1312 BitStream!1312 BitStream!1312) Unit!2183)

(assert (=> b!27235 (= lt!38811 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1583 lt!38798) (_2!1583 lt!38804)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1312 array!1715 (_ BitVec 64) (_ BitVec 64)) tuple2!2992)

(assert (=> b!27235 (= lt!38804 (appendBitsMSBFirstLoop!0 (_2!1583 lt!38798) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27235 e!18413))

(declare-fun res!23546 () Bool)

(assert (=> b!27235 (=> (not res!23546) (not e!18413))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27235 (= res!23546 (validate_offset_bits!1 ((_ sign_extend 32) (size!740 (buf!1067 (_2!1583 lt!38798)))) ((_ sign_extend 32) (currentByte!2392 thiss!1379)) ((_ sign_extend 32) (currentBit!2387 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38801 () Unit!2183)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1312 array!1715 (_ BitVec 64)) Unit!2183)

(assert (=> b!27235 (= lt!38801 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1067 (_2!1583 lt!38798)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1312 BitStream!1312) tuple2!2990)

(assert (=> b!27235 (= lt!38807 (reader!0 thiss!1379 (_2!1583 lt!38798)))))

(declare-fun b!27236 () Bool)

(declare-fun res!23540 () Bool)

(assert (=> b!27236 (=> res!23540 e!18424)))

(assert (=> b!27236 (= res!23540 (not (= (size!740 (buf!1067 thiss!1379)) (size!740 (buf!1067 (_2!1583 lt!38804))))))))

(declare-fun b!27237 () Bool)

(assert (=> b!27237 (= e!18420 e!18424)))

(declare-fun res!23538 () Bool)

(assert (=> b!27237 (=> res!23538 e!18424)))

(declare-fun lt!38799 () (_ BitVec 64))

(assert (=> b!27237 (= res!23538 (not (= lt!38808 (bvsub (bvadd lt!38799 to!314) i!635))))))

(assert (=> b!27237 (= lt!38808 (bitIndex!0 (size!740 (buf!1067 (_2!1583 lt!38804))) (currentByte!2392 (_2!1583 lt!38804)) (currentBit!2387 (_2!1583 lt!38804))))))

(declare-fun b!27238 () Bool)

(declare-fun res!23552 () Bool)

(assert (=> b!27238 (=> res!23552 e!18419)))

(assert (=> b!27238 (= res!23552 (not (invariant!0 (currentBit!2387 (_2!1583 lt!38798)) (currentByte!2392 (_2!1583 lt!38798)) (size!740 (buf!1067 (_2!1583 lt!38804))))))))

(declare-fun b!27239 () Bool)

(declare-fun res!23542 () Bool)

(assert (=> b!27239 (=> res!23542 e!18416)))

(assert (=> b!27239 (= res!23542 (not (isPrefixOf!0 (_1!1582 lt!38802) (_2!1583 lt!38804))))))

(declare-fun b!27240 () Bool)

(assert (=> b!27240 (= e!18417 (array_inv!709 (buf!1067 thiss!1379)))))

(declare-fun b!27241 () Bool)

(declare-fun res!23553 () Bool)

(assert (=> b!27241 (=> res!23553 e!18416)))

(assert (=> b!27241 (= res!23553 (not (isPrefixOf!0 (_1!1582 lt!38797) (_2!1583 lt!38804))))))

(declare-fun b!27242 () Bool)

(assert (=> b!27242 (= e!18424 e!18419)))

(declare-fun res!23535 () Bool)

(assert (=> b!27242 (=> res!23535 e!18419)))

(assert (=> b!27242 (= res!23535 (not (= (size!740 (buf!1067 (_2!1583 lt!38798))) (size!740 (buf!1067 (_2!1583 lt!38804))))))))

(assert (=> b!27242 e!18421))

(declare-fun res!23549 () Bool)

(assert (=> b!27242 (=> (not res!23549) (not e!18421))))

(assert (=> b!27242 (= res!23549 (= (size!740 (buf!1067 (_2!1583 lt!38804))) (size!740 (buf!1067 thiss!1379))))))

(declare-fun b!27243 () Bool)

(declare-fun e!18422 () Bool)

(assert (=> b!27243 (= e!18415 (not e!18422))))

(declare-fun res!23551 () Bool)

(assert (=> b!27243 (=> res!23551 e!18422)))

(assert (=> b!27243 (= res!23551 (bvsge i!635 to!314))))

(assert (=> b!27243 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38806 () Unit!2183)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1312) Unit!2183)

(assert (=> b!27243 (= lt!38806 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!27243 (= lt!38799 (bitIndex!0 (size!740 (buf!1067 thiss!1379)) (currentByte!2392 thiss!1379) (currentBit!2387 thiss!1379)))))

(declare-fun b!27244 () Bool)

(assert (=> b!27244 (= e!18419 e!18416)))

(declare-fun res!23541 () Bool)

(assert (=> b!27244 (=> res!23541 e!18416)))

(assert (=> b!27244 (= res!23541 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38803 () (_ BitVec 64))

(declare-fun lt!38812 () List!357)

(assert (=> b!27244 (= lt!38812 (bitStreamReadBitsIntoList!0 (_2!1583 lt!38804) (_1!1582 lt!38802) lt!38803))))

(assert (=> b!27244 (= lt!38796 (bitStreamReadBitsIntoList!0 (_2!1583 lt!38804) (_1!1582 lt!38797) (bvsub to!314 i!635)))))

(assert (=> b!27244 (validate_offset_bits!1 ((_ sign_extend 32) (size!740 (buf!1067 (_2!1583 lt!38804)))) ((_ sign_extend 32) (currentByte!2392 (_2!1583 lt!38798))) ((_ sign_extend 32) (currentBit!2387 (_2!1583 lt!38798))) lt!38803)))

(declare-fun lt!38800 () Unit!2183)

(assert (=> b!27244 (= lt!38800 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1583 lt!38798) (buf!1067 (_2!1583 lt!38804)) lt!38803))))

(assert (=> b!27244 (= lt!38802 (reader!0 (_2!1583 lt!38798) (_2!1583 lt!38804)))))

(assert (=> b!27244 (validate_offset_bits!1 ((_ sign_extend 32) (size!740 (buf!1067 (_2!1583 lt!38804)))) ((_ sign_extend 32) (currentByte!2392 thiss!1379)) ((_ sign_extend 32) (currentBit!2387 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38795 () Unit!2183)

(assert (=> b!27244 (= lt!38795 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1067 (_2!1583 lt!38804)) (bvsub to!314 i!635)))))

(assert (=> b!27244 (= lt!38797 (reader!0 thiss!1379 (_2!1583 lt!38804)))))

(declare-fun b!27245 () Bool)

(declare-fun res!23539 () Bool)

(assert (=> b!27245 (=> res!23539 e!18416)))

(assert (=> b!27245 (= res!23539 (or (not (= (buf!1067 (_1!1582 lt!38797)) (buf!1067 (_1!1582 lt!38802)))) (not (= (buf!1067 (_1!1582 lt!38797)) (buf!1067 (_2!1583 lt!38804)))) (bvsge lt!38808 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27246 () Bool)

(assert (=> b!27246 (= e!18422 e!18418)))

(declare-fun res!23544 () Bool)

(assert (=> b!27246 (=> res!23544 e!18418)))

(assert (=> b!27246 (= res!23544 (not (isPrefixOf!0 thiss!1379 (_2!1583 lt!38798))))))

(assert (=> b!27246 (validate_offset_bits!1 ((_ sign_extend 32) (size!740 (buf!1067 (_2!1583 lt!38798)))) ((_ sign_extend 32) (currentByte!2392 (_2!1583 lt!38798))) ((_ sign_extend 32) (currentBit!2387 (_2!1583 lt!38798))) lt!38803)))

(assert (=> b!27246 (= lt!38803 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38805 () Unit!2183)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1312 BitStream!1312 (_ BitVec 64) (_ BitVec 64)) Unit!2183)

(assert (=> b!27246 (= lt!38805 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1583 lt!38798) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1312 (_ BitVec 8) (_ BitVec 32)) tuple2!2992)

(assert (=> b!27246 (= lt!38798 (appendBitFromByte!0 thiss!1379 (select (arr!1202 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27247 () Bool)

(declare-fun res!23547 () Bool)

(assert (=> b!27247 (=> (not res!23547) (not e!18415))))

(assert (=> b!27247 (= res!23547 (validate_offset_bits!1 ((_ sign_extend 32) (size!740 (buf!1067 thiss!1379))) ((_ sign_extend 32) (currentByte!2392 thiss!1379)) ((_ sign_extend 32) (currentBit!2387 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5978 res!23543) b!27247))

(assert (= (and b!27247 res!23547) b!27243))

(assert (= (and b!27243 (not res!23551)) b!27246))

(assert (= (and b!27246 (not res!23544)) b!27235))

(assert (= (and b!27235 res!23546) b!27228))

(assert (= (and b!27235 (not res!23548)) b!27237))

(assert (= (and b!27237 (not res!23538)) b!27231))

(assert (= (and b!27231 (not res!23536)) b!27236))

(assert (= (and b!27236 (not res!23540)) b!27242))

(assert (= (and b!27242 res!23549) b!27229))

(assert (= (and b!27242 (not res!23535)) b!27232))

(assert (= (and b!27232 (not res!23550)) b!27238))

(assert (= (and b!27238 (not res!23552)) b!27244))

(assert (= (and b!27244 (not res!23541)) b!27230))

(assert (= (and b!27230 (not res!23537)) b!27241))

(assert (= (and b!27241 (not res!23553)) b!27239))

(assert (= (and b!27239 (not res!23542)) b!27234))

(assert (= (and b!27234 (not res!23545)) b!27245))

(assert (= (and b!27245 (not res!23539)) b!27233))

(assert (= start!5978 b!27240))

(declare-fun m!39021 () Bool)

(assert (=> b!27231 m!39021))

(declare-fun m!39023 () Bool)

(assert (=> b!27241 m!39023))

(declare-fun m!39025 () Bool)

(assert (=> b!27233 m!39025))

(declare-fun m!39027 () Bool)

(assert (=> b!27233 m!39027))

(declare-fun m!39029 () Bool)

(assert (=> b!27243 m!39029))

(declare-fun m!39031 () Bool)

(assert (=> b!27243 m!39031))

(declare-fun m!39033 () Bool)

(assert (=> b!27243 m!39033))

(declare-fun m!39035 () Bool)

(assert (=> b!27240 m!39035))

(declare-fun m!39037 () Bool)

(assert (=> b!27228 m!39037))

(assert (=> b!27228 m!39037))

(declare-fun m!39039 () Bool)

(assert (=> b!27228 m!39039))

(declare-fun m!39041 () Bool)

(assert (=> b!27228 m!39041))

(assert (=> b!27228 m!39041))

(declare-fun m!39043 () Bool)

(assert (=> b!27228 m!39043))

(declare-fun m!39045 () Bool)

(assert (=> b!27230 m!39045))

(declare-fun m!39047 () Bool)

(assert (=> b!27235 m!39047))

(declare-fun m!39049 () Bool)

(assert (=> b!27235 m!39049))

(declare-fun m!39051 () Bool)

(assert (=> b!27235 m!39051))

(declare-fun m!39053 () Bool)

(assert (=> b!27235 m!39053))

(declare-fun m!39055 () Bool)

(assert (=> b!27235 m!39055))

(declare-fun m!39057 () Bool)

(assert (=> b!27235 m!39057))

(declare-fun m!39059 () Bool)

(assert (=> b!27235 m!39059))

(declare-fun m!39061 () Bool)

(assert (=> b!27246 m!39061))

(declare-fun m!39063 () Bool)

(assert (=> b!27246 m!39063))

(assert (=> b!27246 m!39061))

(declare-fun m!39065 () Bool)

(assert (=> b!27246 m!39065))

(declare-fun m!39067 () Bool)

(assert (=> b!27246 m!39067))

(declare-fun m!39069 () Bool)

(assert (=> b!27246 m!39069))

(declare-fun m!39071 () Bool)

(assert (=> b!27232 m!39071))

(declare-fun m!39073 () Bool)

(assert (=> b!27237 m!39073))

(declare-fun m!39075 () Bool)

(assert (=> b!27229 m!39075))

(declare-fun m!39077 () Bool)

(assert (=> b!27244 m!39077))

(declare-fun m!39079 () Bool)

(assert (=> b!27244 m!39079))

(declare-fun m!39081 () Bool)

(assert (=> b!27244 m!39081))

(declare-fun m!39083 () Bool)

(assert (=> b!27244 m!39083))

(declare-fun m!39085 () Bool)

(assert (=> b!27244 m!39085))

(declare-fun m!39087 () Bool)

(assert (=> b!27244 m!39087))

(declare-fun m!39089 () Bool)

(assert (=> b!27244 m!39089))

(declare-fun m!39091 () Bool)

(assert (=> b!27244 m!39091))

(declare-fun m!39093 () Bool)

(assert (=> b!27239 m!39093))

(declare-fun m!39095 () Bool)

(assert (=> start!5978 m!39095))

(declare-fun m!39097 () Bool)

(assert (=> start!5978 m!39097))

(declare-fun m!39099 () Bool)

(assert (=> b!27234 m!39099))

(declare-fun m!39101 () Bool)

(assert (=> b!27238 m!39101))

(declare-fun m!39103 () Bool)

(assert (=> b!27247 m!39103))

(push 1)

