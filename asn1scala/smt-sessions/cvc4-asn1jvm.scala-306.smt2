; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6012 () Bool)

(assert start!6012)

(declare-fun b!28248 () Bool)

(declare-fun res!24514 () Bool)

(declare-fun e!19029 () Bool)

(assert (=> b!28248 (=> res!24514 e!19029)))

(declare-datatypes ((array!1749 0))(
  ( (array!1750 (arr!1219 (Array (_ BitVec 32) (_ BitVec 8))) (size!757 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1346 0))(
  ( (BitStream!1347 (buf!1084 array!1749) (currentByte!2409 (_ BitVec 32)) (currentBit!2404 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2217 0))(
  ( (Unit!2218) )
))
(declare-datatypes ((tuple2!3058 0))(
  ( (tuple2!3059 (_1!1616 Unit!2217) (_2!1616 BitStream!1346)) )
))
(declare-fun lt!39715 () tuple2!3058)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!3060 0))(
  ( (tuple2!3061 (_1!1617 BitStream!1346) (_2!1617 BitStream!1346)) )
))
(declare-fun lt!39720 () tuple2!3060)

(declare-fun lt!39730 () tuple2!3060)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!39718 () (_ BitVec 64))

(assert (=> b!28248 (= res!24514 (or (not (= (buf!1084 (_1!1617 lt!39730)) (buf!1084 (_1!1617 lt!39720)))) (not (= (buf!1084 (_1!1617 lt!39730)) (buf!1084 (_2!1616 lt!39715)))) (bvsge lt!39718 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!28249 () Bool)

(declare-fun res!24516 () Bool)

(declare-fun e!19028 () Bool)

(assert (=> b!28249 (=> res!24516 e!19028)))

(declare-fun thiss!1379 () BitStream!1346)

(assert (=> b!28249 (= res!24516 (not (= (size!757 (buf!1084 thiss!1379)) (size!757 (buf!1084 (_2!1616 lt!39715))))))))

(declare-fun b!28250 () Bool)

(declare-fun e!19030 () Bool)

(assert (=> b!28250 (= e!19030 e!19029)))

(declare-fun res!24522 () Bool)

(assert (=> b!28250 (=> res!24522 e!19029)))

(assert (=> b!28250 (= res!24522 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!374 0))(
  ( (Nil!371) (Cons!370 (h!489 Bool) (t!1124 List!374)) )
))
(declare-fun lt!39724 () List!374)

(declare-fun lt!39719 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1346 BitStream!1346 (_ BitVec 64)) List!374)

(assert (=> b!28250 (= lt!39724 (bitStreamReadBitsIntoList!0 (_2!1616 lt!39715) (_1!1617 lt!39720) lt!39719))))

(declare-fun lt!39717 () List!374)

(assert (=> b!28250 (= lt!39717 (bitStreamReadBitsIntoList!0 (_2!1616 lt!39715) (_1!1617 lt!39730) (bvsub to!314 i!635)))))

(declare-fun lt!39723 () tuple2!3058)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28250 (validate_offset_bits!1 ((_ sign_extend 32) (size!757 (buf!1084 (_2!1616 lt!39715)))) ((_ sign_extend 32) (currentByte!2409 (_2!1616 lt!39723))) ((_ sign_extend 32) (currentBit!2404 (_2!1616 lt!39723))) lt!39719)))

(declare-fun lt!39713 () Unit!2217)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1346 array!1749 (_ BitVec 64)) Unit!2217)

(assert (=> b!28250 (= lt!39713 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1616 lt!39723) (buf!1084 (_2!1616 lt!39715)) lt!39719))))

(declare-fun reader!0 (BitStream!1346 BitStream!1346) tuple2!3060)

(assert (=> b!28250 (= lt!39720 (reader!0 (_2!1616 lt!39723) (_2!1616 lt!39715)))))

(assert (=> b!28250 (validate_offset_bits!1 ((_ sign_extend 32) (size!757 (buf!1084 (_2!1616 lt!39715)))) ((_ sign_extend 32) (currentByte!2409 thiss!1379)) ((_ sign_extend 32) (currentBit!2404 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39728 () Unit!2217)

(assert (=> b!28250 (= lt!39728 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1084 (_2!1616 lt!39715)) (bvsub to!314 i!635)))))

(assert (=> b!28250 (= lt!39730 (reader!0 thiss!1379 (_2!1616 lt!39715)))))

(declare-fun b!28251 () Bool)

(declare-fun res!24513 () Bool)

(assert (=> b!28251 (=> res!24513 e!19029)))

(declare-fun isPrefixOf!0 (BitStream!1346 BitStream!1346) Bool)

(assert (=> b!28251 (= res!24513 (not (isPrefixOf!0 (_1!1617 lt!39730) (_2!1616 lt!39715))))))

(declare-fun b!28252 () Bool)

(assert (=> b!28252 (= e!19029 true)))

(declare-fun lt!39725 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28252 (= lt!39725 (bitIndex!0 (size!757 (buf!1084 (_1!1617 lt!39720))) (currentByte!2409 (_1!1617 lt!39720)) (currentBit!2404 (_1!1617 lt!39720))))))

(declare-fun lt!39727 () (_ BitVec 64))

(assert (=> b!28252 (= lt!39727 (bitIndex!0 (size!757 (buf!1084 (_1!1617 lt!39730))) (currentByte!2409 (_1!1617 lt!39730)) (currentBit!2404 (_1!1617 lt!39730))))))

(declare-fun b!28253 () Bool)

(declare-fun e!19032 () Bool)

(assert (=> b!28253 (= e!19032 e!19028)))

(declare-fun res!24517 () Bool)

(assert (=> b!28253 (=> res!24517 e!19028)))

(declare-fun lt!39714 () (_ BitVec 64))

(assert (=> b!28253 (= res!24517 (not (= lt!39718 (bvsub (bvadd lt!39714 to!314) i!635))))))

(assert (=> b!28253 (= lt!39718 (bitIndex!0 (size!757 (buf!1084 (_2!1616 lt!39715))) (currentByte!2409 (_2!1616 lt!39715)) (currentBit!2404 (_2!1616 lt!39715))))))

(declare-fun res!24508 () Bool)

(declare-fun e!19025 () Bool)

(assert (=> start!6012 (=> (not res!24508) (not e!19025))))

(declare-fun srcBuffer!2 () array!1749)

(assert (=> start!6012 (= res!24508 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!757 srcBuffer!2))))))))

(assert (=> start!6012 e!19025))

(assert (=> start!6012 true))

(declare-fun array_inv!726 (array!1749) Bool)

(assert (=> start!6012 (array_inv!726 srcBuffer!2)))

(declare-fun e!19031 () Bool)

(declare-fun inv!12 (BitStream!1346) Bool)

(assert (=> start!6012 (and (inv!12 thiss!1379) e!19031)))

(declare-fun b!28254 () Bool)

(declare-fun res!24506 () Bool)

(assert (=> b!28254 (=> res!24506 e!19029)))

(assert (=> b!28254 (= res!24506 (not (isPrefixOf!0 (_1!1617 lt!39720) (_2!1616 lt!39715))))))

(declare-fun b!28255 () Bool)

(declare-fun res!24510 () Bool)

(assert (=> b!28255 (=> (not res!24510) (not e!19025))))

(assert (=> b!28255 (= res!24510 (validate_offset_bits!1 ((_ sign_extend 32) (size!757 (buf!1084 thiss!1379))) ((_ sign_extend 32) (currentByte!2409 thiss!1379)) ((_ sign_extend 32) (currentBit!2404 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28256 () Bool)

(assert (=> b!28256 (= e!19031 (array_inv!726 (buf!1084 thiss!1379)))))

(declare-fun b!28257 () Bool)

(declare-fun e!19027 () Bool)

(assert (=> b!28257 (= e!19027 (= lt!39718 (bvsub (bvsub (bvadd (bitIndex!0 (size!757 (buf!1084 (_2!1616 lt!39723))) (currentByte!2409 (_2!1616 lt!39723)) (currentBit!2404 (_2!1616 lt!39723))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28258 () Bool)

(declare-fun e!19036 () Bool)

(assert (=> b!28258 (= e!19036 e!19032)))

(declare-fun res!24521 () Bool)

(assert (=> b!28258 (=> res!24521 e!19032)))

(assert (=> b!28258 (= res!24521 (not (isPrefixOf!0 (_2!1616 lt!39723) (_2!1616 lt!39715))))))

(assert (=> b!28258 (isPrefixOf!0 thiss!1379 (_2!1616 lt!39715))))

(declare-fun lt!39729 () Unit!2217)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1346 BitStream!1346 BitStream!1346) Unit!2217)

(assert (=> b!28258 (= lt!39729 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1616 lt!39723) (_2!1616 lt!39715)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1346 array!1749 (_ BitVec 64) (_ BitVec 64)) tuple2!3058)

(assert (=> b!28258 (= lt!39715 (appendBitsMSBFirstLoop!0 (_2!1616 lt!39723) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!19033 () Bool)

(assert (=> b!28258 e!19033))

(declare-fun res!24504 () Bool)

(assert (=> b!28258 (=> (not res!24504) (not e!19033))))

(assert (=> b!28258 (= res!24504 (validate_offset_bits!1 ((_ sign_extend 32) (size!757 (buf!1084 (_2!1616 lt!39723)))) ((_ sign_extend 32) (currentByte!2409 thiss!1379)) ((_ sign_extend 32) (currentBit!2404 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39721 () Unit!2217)

(assert (=> b!28258 (= lt!39721 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1084 (_2!1616 lt!39723)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39716 () tuple2!3060)

(assert (=> b!28258 (= lt!39716 (reader!0 thiss!1379 (_2!1616 lt!39723)))))

(declare-fun b!28259 () Bool)

(declare-fun res!24507 () Bool)

(assert (=> b!28259 (=> res!24507 e!19029)))

(assert (=> b!28259 (= res!24507 (not (isPrefixOf!0 (_1!1617 lt!39730) (_1!1617 lt!39720))))))

(declare-fun b!28260 () Bool)

(declare-fun e!19035 () Bool)

(assert (=> b!28260 (= e!19035 e!19036)))

(declare-fun res!24512 () Bool)

(assert (=> b!28260 (=> res!24512 e!19036)))

(assert (=> b!28260 (= res!24512 (not (isPrefixOf!0 thiss!1379 (_2!1616 lt!39723))))))

(assert (=> b!28260 (validate_offset_bits!1 ((_ sign_extend 32) (size!757 (buf!1084 (_2!1616 lt!39723)))) ((_ sign_extend 32) (currentByte!2409 (_2!1616 lt!39723))) ((_ sign_extend 32) (currentBit!2404 (_2!1616 lt!39723))) lt!39719)))

(assert (=> b!28260 (= lt!39719 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39722 () Unit!2217)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1346 BitStream!1346 (_ BitVec 64) (_ BitVec 64)) Unit!2217)

(assert (=> b!28260 (= lt!39722 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1616 lt!39723) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1346 (_ BitVec 8) (_ BitVec 32)) tuple2!3058)

(assert (=> b!28260 (= lt!39723 (appendBitFromByte!0 thiss!1379 (select (arr!1219 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28261 () Bool)

(declare-fun res!24520 () Bool)

(assert (=> b!28261 (=> res!24520 e!19030)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28261 (= res!24520 (not (invariant!0 (currentBit!2404 (_2!1616 lt!39723)) (currentByte!2409 (_2!1616 lt!39723)) (size!757 (buf!1084 (_2!1616 lt!39723))))))))

(declare-fun b!28262 () Bool)

(assert (=> b!28262 (= e!19028 e!19030)))

(declare-fun res!24515 () Bool)

(assert (=> b!28262 (=> res!24515 e!19030)))

(assert (=> b!28262 (= res!24515 (not (= (size!757 (buf!1084 (_2!1616 lt!39723))) (size!757 (buf!1084 (_2!1616 lt!39715))))))))

(assert (=> b!28262 e!19027))

(declare-fun res!24518 () Bool)

(assert (=> b!28262 (=> (not res!24518) (not e!19027))))

(assert (=> b!28262 (= res!24518 (= (size!757 (buf!1084 (_2!1616 lt!39715))) (size!757 (buf!1084 thiss!1379))))))

(declare-fun b!28263 () Bool)

(declare-fun res!24519 () Bool)

(assert (=> b!28263 (=> res!24519 e!19030)))

(assert (=> b!28263 (= res!24519 (not (invariant!0 (currentBit!2404 (_2!1616 lt!39723)) (currentByte!2409 (_2!1616 lt!39723)) (size!757 (buf!1084 (_2!1616 lt!39715))))))))

(declare-fun b!28264 () Bool)

(assert (=> b!28264 (= e!19025 (not e!19035))))

(declare-fun res!24511 () Bool)

(assert (=> b!28264 (=> res!24511 e!19035)))

(assert (=> b!28264 (= res!24511 (bvsge i!635 to!314))))

(assert (=> b!28264 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39726 () Unit!2217)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1346) Unit!2217)

(assert (=> b!28264 (= lt!39726 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28264 (= lt!39714 (bitIndex!0 (size!757 (buf!1084 thiss!1379)) (currentByte!2409 thiss!1379) (currentBit!2404 thiss!1379)))))

(declare-fun b!28265 () Bool)

(declare-fun res!24505 () Bool)

(assert (=> b!28265 (=> res!24505 e!19029)))

(declare-fun length!100 (List!374) Int)

(assert (=> b!28265 (= res!24505 (<= (length!100 lt!39717) 0))))

(declare-fun b!28266 () Bool)

(declare-fun head!211 (List!374) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1346 array!1749 (_ BitVec 64) (_ BitVec 64)) List!374)

(assert (=> b!28266 (= e!19033 (= (head!211 (byteArrayBitContentToList!0 (_2!1616 lt!39723) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!211 (bitStreamReadBitsIntoList!0 (_2!1616 lt!39723) (_1!1617 lt!39716) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!28267 () Bool)

(declare-fun res!24509 () Bool)

(assert (=> b!28267 (=> res!24509 e!19028)))

(assert (=> b!28267 (= res!24509 (not (invariant!0 (currentBit!2404 (_2!1616 lt!39715)) (currentByte!2409 (_2!1616 lt!39715)) (size!757 (buf!1084 (_2!1616 lt!39715))))))))

(assert (= (and start!6012 res!24508) b!28255))

(assert (= (and b!28255 res!24510) b!28264))

(assert (= (and b!28264 (not res!24511)) b!28260))

(assert (= (and b!28260 (not res!24512)) b!28258))

(assert (= (and b!28258 res!24504) b!28266))

(assert (= (and b!28258 (not res!24521)) b!28253))

(assert (= (and b!28253 (not res!24517)) b!28267))

(assert (= (and b!28267 (not res!24509)) b!28249))

(assert (= (and b!28249 (not res!24516)) b!28262))

(assert (= (and b!28262 res!24518) b!28257))

(assert (= (and b!28262 (not res!24515)) b!28261))

(assert (= (and b!28261 (not res!24520)) b!28263))

(assert (= (and b!28263 (not res!24519)) b!28250))

(assert (= (and b!28250 (not res!24522)) b!28265))

(assert (= (and b!28265 (not res!24505)) b!28251))

(assert (= (and b!28251 (not res!24513)) b!28254))

(assert (= (and b!28254 (not res!24506)) b!28259))

(assert (= (and b!28259 (not res!24507)) b!28248))

(assert (= (and b!28248 (not res!24514)) b!28252))

(assert (= start!6012 b!28256))

(declare-fun m!40449 () Bool)

(assert (=> b!28253 m!40449))

(declare-fun m!40451 () Bool)

(assert (=> b!28258 m!40451))

(declare-fun m!40453 () Bool)

(assert (=> b!28258 m!40453))

(declare-fun m!40455 () Bool)

(assert (=> b!28258 m!40455))

(declare-fun m!40457 () Bool)

(assert (=> b!28258 m!40457))

(declare-fun m!40459 () Bool)

(assert (=> b!28258 m!40459))

(declare-fun m!40461 () Bool)

(assert (=> b!28258 m!40461))

(declare-fun m!40463 () Bool)

(assert (=> b!28258 m!40463))

(declare-fun m!40465 () Bool)

(assert (=> start!6012 m!40465))

(declare-fun m!40467 () Bool)

(assert (=> start!6012 m!40467))

(declare-fun m!40469 () Bool)

(assert (=> b!28261 m!40469))

(declare-fun m!40471 () Bool)

(assert (=> b!28260 m!40471))

(declare-fun m!40473 () Bool)

(assert (=> b!28260 m!40473))

(declare-fun m!40475 () Bool)

(assert (=> b!28260 m!40475))

(declare-fun m!40477 () Bool)

(assert (=> b!28260 m!40477))

(assert (=> b!28260 m!40475))

(declare-fun m!40479 () Bool)

(assert (=> b!28260 m!40479))

(declare-fun m!40481 () Bool)

(assert (=> b!28256 m!40481))

(declare-fun m!40483 () Bool)

(assert (=> b!28263 m!40483))

(declare-fun m!40485 () Bool)

(assert (=> b!28255 m!40485))

(declare-fun m!40487 () Bool)

(assert (=> b!28266 m!40487))

(assert (=> b!28266 m!40487))

(declare-fun m!40489 () Bool)

(assert (=> b!28266 m!40489))

(declare-fun m!40491 () Bool)

(assert (=> b!28266 m!40491))

(assert (=> b!28266 m!40491))

(declare-fun m!40493 () Bool)

(assert (=> b!28266 m!40493))

(declare-fun m!40495 () Bool)

(assert (=> b!28265 m!40495))

(declare-fun m!40497 () Bool)

(assert (=> b!28250 m!40497))

(declare-fun m!40499 () Bool)

(assert (=> b!28250 m!40499))

(declare-fun m!40501 () Bool)

(assert (=> b!28250 m!40501))

(declare-fun m!40503 () Bool)

(assert (=> b!28250 m!40503))

(declare-fun m!40505 () Bool)

(assert (=> b!28250 m!40505))

(declare-fun m!40507 () Bool)

(assert (=> b!28250 m!40507))

(declare-fun m!40509 () Bool)

(assert (=> b!28250 m!40509))

(declare-fun m!40511 () Bool)

(assert (=> b!28250 m!40511))

(declare-fun m!40513 () Bool)

(assert (=> b!28254 m!40513))

(declare-fun m!40515 () Bool)

(assert (=> b!28251 m!40515))

(declare-fun m!40517 () Bool)

(assert (=> b!28259 m!40517))

(declare-fun m!40519 () Bool)

(assert (=> b!28264 m!40519))

(declare-fun m!40521 () Bool)

(assert (=> b!28264 m!40521))

(declare-fun m!40523 () Bool)

(assert (=> b!28264 m!40523))

(declare-fun m!40525 () Bool)

(assert (=> b!28257 m!40525))

(declare-fun m!40527 () Bool)

(assert (=> b!28252 m!40527))

(declare-fun m!40529 () Bool)

(assert (=> b!28252 m!40529))

(declare-fun m!40531 () Bool)

(assert (=> b!28267 m!40531))

(push 1)

(assert (not b!28261))

(assert (not b!28255))

(assert (not b!28250))

(assert (not b!28251))

(assert (not b!28260))

(assert (not b!28256))

(assert (not b!28263))

(assert (not b!28252))

(assert (not b!28264))

(assert (not b!28253))

(assert (not b!28254))

(assert (not b!28259))

(assert (not start!6012))

(assert (not b!28266))

(assert (not b!28267))

(assert (not b!28257))

(assert (not b!28258))

(assert (not b!28265))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

