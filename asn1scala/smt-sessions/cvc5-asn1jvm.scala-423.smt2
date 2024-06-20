; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11064 () Bool)

(assert start!11064)

(declare-fun b!54931 () Bool)

(declare-fun e!36626 () Bool)

(declare-datatypes ((array!2566 0))(
  ( (array!2567 (arr!1712 (Array (_ BitVec 32) (_ BitVec 8))) (size!1169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2026 0))(
  ( (BitStream!2027 (buf!1529 array!2566) (currentByte!3108 (_ BitVec 32)) (currentBit!3103 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2026)

(declare-fun array_inv!1072 (array!2566) Bool)

(assert (=> b!54931 (= e!36626 (array_inv!1072 (buf!1529 thiss!1379)))))

(declare-fun res!45792 () Bool)

(declare-fun e!36629 () Bool)

(assert (=> start!11064 (=> (not res!45792) (not e!36629))))

(declare-fun srcBuffer!2 () array!2566)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11064 (= res!45792 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1169 srcBuffer!2))))))))

(assert (=> start!11064 e!36629))

(assert (=> start!11064 true))

(assert (=> start!11064 (array_inv!1072 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2026) Bool)

(assert (=> start!11064 (and (inv!12 thiss!1379) e!36626)))

(declare-fun b!54932 () Bool)

(declare-fun e!36624 () Bool)

(declare-fun e!36622 () Bool)

(assert (=> b!54932 (= e!36624 e!36622)))

(declare-fun res!45791 () Bool)

(assert (=> b!54932 (=> res!45791 e!36622)))

(declare-datatypes ((Unit!3793 0))(
  ( (Unit!3794) )
))
(declare-datatypes ((tuple2!5006 0))(
  ( (tuple2!5007 (_1!2614 Unit!3793) (_2!2614 BitStream!2026)) )
))
(declare-fun lt!85511 () tuple2!5006)

(declare-fun isPrefixOf!0 (BitStream!2026 BitStream!2026) Bool)

(assert (=> b!54932 (= res!45791 (not (isPrefixOf!0 thiss!1379 (_2!2614 lt!85511))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54932 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85512 () Unit!3793)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2026 BitStream!2026 (_ BitVec 64) (_ BitVec 64)) Unit!3793)

(assert (=> b!54932 (= lt!85512 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2614 lt!85511) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2026 (_ BitVec 8) (_ BitVec 32)) tuple2!5006)

(assert (=> b!54932 (= lt!85511 (appendBitFromByte!0 thiss!1379 (select (arr!1712 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54933 () Bool)

(declare-fun res!45790 () Bool)

(assert (=> b!54933 (=> (not res!45790) (not e!36629))))

(assert (=> b!54933 (= res!45790 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 thiss!1379))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54934 () Bool)

(assert (=> b!54934 (= e!36629 (not e!36624))))

(declare-fun res!45788 () Bool)

(assert (=> b!54934 (=> res!45788 e!36624)))

(assert (=> b!54934 (= res!45788 (bvsge i!635 to!314))))

(assert (=> b!54934 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!85510 () Unit!3793)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2026) Unit!3793)

(assert (=> b!54934 (= lt!85510 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!85515 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54934 (= lt!85515 (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)))))

(declare-fun b!54935 () Bool)

(declare-fun e!36625 () Bool)

(assert (=> b!54935 (= e!36622 e!36625)))

(declare-fun res!45789 () Bool)

(assert (=> b!54935 (=> res!45789 e!36625)))

(declare-fun lt!85518 () tuple2!5006)

(assert (=> b!54935 (= res!45789 (not (isPrefixOf!0 (_2!2614 lt!85511) (_2!2614 lt!85518))))))

(assert (=> b!54935 (isPrefixOf!0 thiss!1379 (_2!2614 lt!85518))))

(declare-fun lt!85516 () Unit!3793)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2026 BitStream!2026 BitStream!2026) Unit!3793)

(assert (=> b!54935 (= lt!85516 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2614 lt!85511) (_2!2614 lt!85518)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2026 array!2566 (_ BitVec 64) (_ BitVec 64)) tuple2!5006)

(assert (=> b!54935 (= lt!85518 (appendBitsMSBFirstLoop!0 (_2!2614 lt!85511) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36628 () Bool)

(assert (=> b!54935 e!36628))

(declare-fun res!45787 () Bool)

(assert (=> b!54935 (=> (not res!45787) (not e!36628))))

(assert (=> b!54935 (= res!45787 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85517 () Unit!3793)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2026 array!2566 (_ BitVec 64)) Unit!3793)

(assert (=> b!54935 (= lt!85517 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1529 (_2!2614 lt!85511)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5008 0))(
  ( (tuple2!5009 (_1!2615 BitStream!2026) (_2!2615 BitStream!2026)) )
))
(declare-fun lt!85513 () tuple2!5008)

(declare-fun reader!0 (BitStream!2026 BitStream!2026) tuple2!5008)

(assert (=> b!54935 (= lt!85513 (reader!0 thiss!1379 (_2!2614 lt!85511)))))

(declare-fun b!54936 () Bool)

(declare-datatypes ((List!588 0))(
  ( (Nil!585) (Cons!584 (h!703 Bool) (t!1338 List!588)) )
))
(declare-fun head!407 (List!588) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2026 array!2566 (_ BitVec 64) (_ BitVec 64)) List!588)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2026 BitStream!2026 (_ BitVec 64)) List!588)

(assert (=> b!54936 (= e!36628 (= (head!407 (byteArrayBitContentToList!0 (_2!2614 lt!85511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!407 (bitStreamReadBitsIntoList!0 (_2!2614 lt!85511) (_1!2615 lt!85513) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54937 () Bool)

(declare-fun lt!85519 () (_ BitVec 64))

(declare-fun lt!85514 () (_ BitVec 64))

(assert (=> b!54937 (= e!36625 (or (= lt!85514 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!85514 (bvand (bvsub lt!85519 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!54937 (= lt!85514 (bvand lt!85519 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!54937 (= lt!85519 (bvadd lt!85515 to!314))))

(assert (= (and start!11064 res!45792) b!54933))

(assert (= (and b!54933 res!45790) b!54934))

(assert (= (and b!54934 (not res!45788)) b!54932))

(assert (= (and b!54932 (not res!45791)) b!54935))

(assert (= (and b!54935 res!45787) b!54936))

(assert (= (and b!54935 (not res!45789)) b!54937))

(assert (= start!11064 b!54931))

(declare-fun m!86461 () Bool)

(assert (=> b!54936 m!86461))

(assert (=> b!54936 m!86461))

(declare-fun m!86463 () Bool)

(assert (=> b!54936 m!86463))

(declare-fun m!86465 () Bool)

(assert (=> b!54936 m!86465))

(assert (=> b!54936 m!86465))

(declare-fun m!86467 () Bool)

(assert (=> b!54936 m!86467))

(declare-fun m!86469 () Bool)

(assert (=> b!54934 m!86469))

(declare-fun m!86471 () Bool)

(assert (=> b!54934 m!86471))

(declare-fun m!86473 () Bool)

(assert (=> b!54934 m!86473))

(declare-fun m!86475 () Bool)

(assert (=> b!54935 m!86475))

(declare-fun m!86477 () Bool)

(assert (=> b!54935 m!86477))

(declare-fun m!86479 () Bool)

(assert (=> b!54935 m!86479))

(declare-fun m!86481 () Bool)

(assert (=> b!54935 m!86481))

(declare-fun m!86483 () Bool)

(assert (=> b!54935 m!86483))

(declare-fun m!86485 () Bool)

(assert (=> b!54935 m!86485))

(declare-fun m!86487 () Bool)

(assert (=> b!54935 m!86487))

(declare-fun m!86489 () Bool)

(assert (=> b!54932 m!86489))

(declare-fun m!86491 () Bool)

(assert (=> b!54932 m!86491))

(declare-fun m!86493 () Bool)

(assert (=> b!54932 m!86493))

(declare-fun m!86495 () Bool)

(assert (=> b!54932 m!86495))

(assert (=> b!54932 m!86493))

(declare-fun m!86497 () Bool)

(assert (=> b!54932 m!86497))

(declare-fun m!86499 () Bool)

(assert (=> b!54931 m!86499))

(declare-fun m!86501 () Bool)

(assert (=> b!54933 m!86501))

(declare-fun m!86503 () Bool)

(assert (=> start!11064 m!86503))

(declare-fun m!86505 () Bool)

(assert (=> start!11064 m!86505))

(push 1)

(assert (not start!11064))

(assert (not b!54936))

(assert (not b!54933))

(assert (not b!54934))

(assert (not b!54931))

(assert (not b!54935))

(assert (not b!54932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17522 () Bool)

(declare-fun res!45851 () Bool)

(declare-fun e!36693 () Bool)

(assert (=> d!17522 (=> (not res!45851) (not e!36693))))

(assert (=> d!17522 (= res!45851 (= (size!1169 (buf!1529 thiss!1379)) (size!1169 (buf!1529 thiss!1379))))))

(assert (=> d!17522 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36693)))

(declare-fun b!55005 () Bool)

(declare-fun res!45852 () Bool)

(assert (=> b!55005 (=> (not res!45852) (not e!36693))))

(assert (=> b!55005 (= res!45852 (bvsle (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)) (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379))))))

(declare-fun b!55006 () Bool)

(declare-fun e!36694 () Bool)

(assert (=> b!55006 (= e!36693 e!36694)))

(declare-fun res!45850 () Bool)

(assert (=> b!55006 (=> res!45850 e!36694)))

(assert (=> b!55006 (= res!45850 (= (size!1169 (buf!1529 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55007 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2566 array!2566 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55007 (= e!36694 (arrayBitRangesEq!0 (buf!1529 thiss!1379) (buf!1529 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379))))))

(assert (= (and d!17522 res!45851) b!55005))

(assert (= (and b!55005 res!45852) b!55006))

(assert (= (and b!55006 (not res!45850)) b!55007))

(assert (=> b!55005 m!86473))

(assert (=> b!55005 m!86473))

(assert (=> b!55007 m!86473))

(assert (=> b!55007 m!86473))

(declare-fun m!86607 () Bool)

(assert (=> b!55007 m!86607))

(assert (=> b!54934 d!17522))

(declare-fun d!17524 () Bool)

(assert (=> d!17524 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!85643 () Unit!3793)

(declare-fun choose!11 (BitStream!2026) Unit!3793)

(assert (=> d!17524 (= lt!85643 (choose!11 thiss!1379))))

(assert (=> d!17524 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!85643)))

(declare-fun bs!4413 () Bool)

(assert (= bs!4413 d!17524))

(assert (=> bs!4413 m!86469))

(declare-fun m!86609 () Bool)

(assert (=> bs!4413 m!86609))

(assert (=> b!54934 d!17524))

(declare-fun d!17526 () Bool)

(declare-fun e!36705 () Bool)

(assert (=> d!17526 e!36705))

(declare-fun res!45872 () Bool)

(assert (=> d!17526 (=> (not res!45872) (not e!36705))))

(declare-fun lt!85685 () (_ BitVec 64))

(declare-fun lt!85686 () (_ BitVec 64))

(declare-fun lt!85684 () (_ BitVec 64))

(assert (=> d!17526 (= res!45872 (= lt!85684 (bvsub lt!85685 lt!85686)))))

(assert (=> d!17526 (or (= (bvand lt!85685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85685 lt!85686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17526 (= lt!85686 (remainingBits!0 ((_ sign_extend 32) (size!1169 (buf!1529 thiss!1379))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379))))))

(declare-fun lt!85683 () (_ BitVec 64))

(declare-fun lt!85682 () (_ BitVec 64))

(assert (=> d!17526 (= lt!85685 (bvmul lt!85683 lt!85682))))

(assert (=> d!17526 (or (= lt!85683 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!85682 (bvsdiv (bvmul lt!85683 lt!85682) lt!85683)))))

(assert (=> d!17526 (= lt!85682 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17526 (= lt!85683 ((_ sign_extend 32) (size!1169 (buf!1529 thiss!1379))))))

(assert (=> d!17526 (= lt!85684 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3108 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3103 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17526 (invariant!0 (currentBit!3103 thiss!1379) (currentByte!3108 thiss!1379) (size!1169 (buf!1529 thiss!1379)))))

(assert (=> d!17526 (= (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)) lt!85684)))

(declare-fun b!55029 () Bool)

(declare-fun res!45873 () Bool)

(assert (=> b!55029 (=> (not res!45873) (not e!36705))))

(assert (=> b!55029 (= res!45873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!85684))))

(declare-fun b!55030 () Bool)

(declare-fun lt!85687 () (_ BitVec 64))

(assert (=> b!55030 (= e!36705 (bvsle lt!85684 (bvmul lt!85687 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55030 (or (= lt!85687 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!85687 #b0000000000000000000000000000000000000000000000000000000000001000) lt!85687)))))

(assert (=> b!55030 (= lt!85687 ((_ sign_extend 32) (size!1169 (buf!1529 thiss!1379))))))

(assert (= (and d!17526 res!45872) b!55029))

(assert (= (and b!55029 res!45873) b!55030))

(declare-fun m!86649 () Bool)

(assert (=> d!17526 m!86649))

(declare-fun m!86653 () Bool)

(assert (=> d!17526 m!86653))

(assert (=> b!54934 d!17526))

(declare-fun d!17540 () Bool)

(assert (=> d!17540 (= (array_inv!1072 srcBuffer!2) (bvsge (size!1169 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11064 d!17540))

(declare-fun d!17542 () Bool)

(assert (=> d!17542 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3103 thiss!1379) (currentByte!3108 thiss!1379) (size!1169 (buf!1529 thiss!1379))))))

(declare-fun bs!4417 () Bool)

(assert (= bs!4417 d!17542))

(assert (=> bs!4417 m!86653))

(assert (=> start!11064 d!17542))

(declare-fun d!17544 () Bool)

(assert (=> d!17544 (isPrefixOf!0 thiss!1379 (_2!2614 lt!85518))))

(declare-fun lt!85690 () Unit!3793)

(declare-fun choose!30 (BitStream!2026 BitStream!2026 BitStream!2026) Unit!3793)

(assert (=> d!17544 (= lt!85690 (choose!30 thiss!1379 (_2!2614 lt!85511) (_2!2614 lt!85518)))))

(assert (=> d!17544 (isPrefixOf!0 thiss!1379 (_2!2614 lt!85511))))

(assert (=> d!17544 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2614 lt!85511) (_2!2614 lt!85518)) lt!85690)))

(declare-fun bs!4418 () Bool)

(assert (= bs!4418 d!17544))

(assert (=> bs!4418 m!86483))

(declare-fun m!86655 () Bool)

(assert (=> bs!4418 m!86655))

(assert (=> bs!4418 m!86495))

(assert (=> b!54935 d!17544))

(declare-fun d!17546 () Bool)

(declare-fun res!45875 () Bool)

(declare-fun e!36706 () Bool)

(assert (=> d!17546 (=> (not res!45875) (not e!36706))))

(assert (=> d!17546 (= res!45875 (= (size!1169 (buf!1529 thiss!1379)) (size!1169 (buf!1529 (_2!2614 lt!85518)))))))

(assert (=> d!17546 (= (isPrefixOf!0 thiss!1379 (_2!2614 lt!85518)) e!36706)))

(declare-fun b!55031 () Bool)

(declare-fun res!45876 () Bool)

(assert (=> b!55031 (=> (not res!45876) (not e!36706))))

(assert (=> b!55031 (= res!45876 (bvsle (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)) (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85518))) (currentByte!3108 (_2!2614 lt!85518)) (currentBit!3103 (_2!2614 lt!85518)))))))

(declare-fun b!55032 () Bool)

(declare-fun e!36707 () Bool)

(assert (=> b!55032 (= e!36706 e!36707)))

(declare-fun res!45874 () Bool)

(assert (=> b!55032 (=> res!45874 e!36707)))

(assert (=> b!55032 (= res!45874 (= (size!1169 (buf!1529 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55033 () Bool)

(assert (=> b!55033 (= e!36707 (arrayBitRangesEq!0 (buf!1529 thiss!1379) (buf!1529 (_2!2614 lt!85518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379))))))

(assert (= (and d!17546 res!45875) b!55031))

(assert (= (and b!55031 res!45876) b!55032))

(assert (= (and b!55032 (not res!45874)) b!55033))

(assert (=> b!55031 m!86473))

(declare-fun m!86657 () Bool)

(assert (=> b!55031 m!86657))

(assert (=> b!55033 m!86473))

(assert (=> b!55033 m!86473))

(declare-fun m!86659 () Bool)

(assert (=> b!55033 m!86659))

(assert (=> b!54935 d!17546))

(declare-fun b!55056 () Bool)

(declare-fun res!45897 () Bool)

(declare-fun e!36722 () Bool)

(assert (=> b!55056 (=> (not res!45897) (not e!36722))))

(declare-fun lt!85738 () tuple2!5008)

(assert (=> b!55056 (= res!45897 (isPrefixOf!0 (_1!2615 lt!85738) thiss!1379))))

(declare-fun b!55057 () Bool)

(declare-fun res!45896 () Bool)

(assert (=> b!55057 (=> (not res!45896) (not e!36722))))

(assert (=> b!55057 (= res!45896 (isPrefixOf!0 (_2!2615 lt!85738) (_2!2614 lt!85511)))))

(declare-fun b!55058 () Bool)

(declare-fun e!36721 () Unit!3793)

(declare-fun Unit!3805 () Unit!3793)

(assert (=> b!55058 (= e!36721 Unit!3805)))

(declare-fun b!55059 () Bool)

(declare-fun lt!85746 () (_ BitVec 64))

(declare-fun lt!85747 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2026 (_ BitVec 64)) BitStream!2026)

(assert (=> b!55059 (= e!36722 (= (_1!2615 lt!85738) (withMovedBitIndex!0 (_2!2615 lt!85738) (bvsub lt!85746 lt!85747))))))

(assert (=> b!55059 (or (= (bvand lt!85746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85746 lt!85747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55059 (= lt!85747 (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85511))) (currentByte!3108 (_2!2614 lt!85511)) (currentBit!3103 (_2!2614 lt!85511))))))

(assert (=> b!55059 (= lt!85746 (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)))))

(declare-fun b!55060 () Bool)

(declare-fun lt!85740 () Unit!3793)

(assert (=> b!55060 (= e!36721 lt!85740)))

(declare-fun lt!85748 () (_ BitVec 64))

(assert (=> b!55060 (= lt!85748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85753 () (_ BitVec 64))

(assert (=> b!55060 (= lt!85753 (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2566 array!2566 (_ BitVec 64) (_ BitVec 64)) Unit!3793)

(assert (=> b!55060 (= lt!85740 (arrayBitRangesEqSymmetric!0 (buf!1529 thiss!1379) (buf!1529 (_2!2614 lt!85511)) lt!85748 lt!85753))))

(assert (=> b!55060 (arrayBitRangesEq!0 (buf!1529 (_2!2614 lt!85511)) (buf!1529 thiss!1379) lt!85748 lt!85753)))

(declare-fun d!17548 () Bool)

(assert (=> d!17548 e!36722))

(declare-fun res!45895 () Bool)

(assert (=> d!17548 (=> (not res!45895) (not e!36722))))

(assert (=> d!17548 (= res!45895 (isPrefixOf!0 (_1!2615 lt!85738) (_2!2615 lt!85738)))))

(declare-fun lt!85741 () BitStream!2026)

(assert (=> d!17548 (= lt!85738 (tuple2!5009 lt!85741 (_2!2614 lt!85511)))))

(declare-fun lt!85735 () Unit!3793)

(declare-fun lt!85750 () Unit!3793)

(assert (=> d!17548 (= lt!85735 lt!85750)))

(assert (=> d!17548 (isPrefixOf!0 lt!85741 (_2!2614 lt!85511))))

(assert (=> d!17548 (= lt!85750 (lemmaIsPrefixTransitive!0 lt!85741 (_2!2614 lt!85511) (_2!2614 lt!85511)))))

(declare-fun lt!85752 () Unit!3793)

(declare-fun lt!85749 () Unit!3793)

(assert (=> d!17548 (= lt!85752 lt!85749)))

(assert (=> d!17548 (isPrefixOf!0 lt!85741 (_2!2614 lt!85511))))

(assert (=> d!17548 (= lt!85749 (lemmaIsPrefixTransitive!0 lt!85741 thiss!1379 (_2!2614 lt!85511)))))

(declare-fun lt!85745 () Unit!3793)

(assert (=> d!17548 (= lt!85745 e!36721)))

(declare-fun c!3918 () Bool)

(assert (=> d!17548 (= c!3918 (not (= (size!1169 (buf!1529 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!85751 () Unit!3793)

(declare-fun lt!85743 () Unit!3793)

(assert (=> d!17548 (= lt!85751 lt!85743)))

(assert (=> d!17548 (isPrefixOf!0 (_2!2614 lt!85511) (_2!2614 lt!85511))))

(assert (=> d!17548 (= lt!85743 (lemmaIsPrefixRefl!0 (_2!2614 lt!85511)))))

(declare-fun lt!85739 () Unit!3793)

(declare-fun lt!85744 () Unit!3793)

(assert (=> d!17548 (= lt!85739 lt!85744)))

(assert (=> d!17548 (= lt!85744 (lemmaIsPrefixRefl!0 (_2!2614 lt!85511)))))

(declare-fun lt!85742 () Unit!3793)

(declare-fun lt!85736 () Unit!3793)

(assert (=> d!17548 (= lt!85742 lt!85736)))

(assert (=> d!17548 (isPrefixOf!0 lt!85741 lt!85741)))

(assert (=> d!17548 (= lt!85736 (lemmaIsPrefixRefl!0 lt!85741))))

(declare-fun lt!85734 () Unit!3793)

(declare-fun lt!85737 () Unit!3793)

(assert (=> d!17548 (= lt!85734 lt!85737)))

(assert (=> d!17548 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17548 (= lt!85737 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17548 (= lt!85741 (BitStream!2027 (buf!1529 (_2!2614 lt!85511)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)))))

(assert (=> d!17548 (isPrefixOf!0 thiss!1379 (_2!2614 lt!85511))))

(assert (=> d!17548 (= (reader!0 thiss!1379 (_2!2614 lt!85511)) lt!85738)))

(assert (= (and d!17548 c!3918) b!55060))

(assert (= (and d!17548 (not c!3918)) b!55058))

(assert (= (and d!17548 res!45895) b!55056))

(assert (= (and b!55056 res!45897) b!55057))

(assert (= (and b!55057 res!45896) b!55059))

(declare-fun m!86671 () Bool)

(assert (=> b!55057 m!86671))

(declare-fun m!86673 () Bool)

(assert (=> b!55056 m!86673))

(assert (=> d!17548 m!86471))

(declare-fun m!86675 () Bool)

(assert (=> d!17548 m!86675))

(declare-fun m!86677 () Bool)

(assert (=> d!17548 m!86677))

(declare-fun m!86679 () Bool)

(assert (=> d!17548 m!86679))

(declare-fun m!86681 () Bool)

(assert (=> d!17548 m!86681))

(declare-fun m!86683 () Bool)

(assert (=> d!17548 m!86683))

(declare-fun m!86685 () Bool)

(assert (=> d!17548 m!86685))

(assert (=> d!17548 m!86495))

(declare-fun m!86687 () Bool)

(assert (=> d!17548 m!86687))

(assert (=> d!17548 m!86469))

(declare-fun m!86689 () Bool)

(assert (=> d!17548 m!86689))

(assert (=> b!55060 m!86473))

(declare-fun m!86691 () Bool)

(assert (=> b!55060 m!86691))

(declare-fun m!86693 () Bool)

(assert (=> b!55060 m!86693))

(declare-fun m!86695 () Bool)

(assert (=> b!55059 m!86695))

(declare-fun m!86697 () Bool)

(assert (=> b!55059 m!86697))

(assert (=> b!55059 m!86473))

(assert (=> b!54935 d!17548))

(declare-fun d!17562 () Bool)

(declare-fun res!45899 () Bool)

(declare-fun e!36723 () Bool)

(assert (=> d!17562 (=> (not res!45899) (not e!36723))))

(assert (=> d!17562 (= res!45899 (= (size!1169 (buf!1529 (_2!2614 lt!85511))) (size!1169 (buf!1529 (_2!2614 lt!85518)))))))

(assert (=> d!17562 (= (isPrefixOf!0 (_2!2614 lt!85511) (_2!2614 lt!85518)) e!36723)))

(declare-fun b!55061 () Bool)

(declare-fun res!45900 () Bool)

(assert (=> b!55061 (=> (not res!45900) (not e!36723))))

(assert (=> b!55061 (= res!45900 (bvsle (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85511))) (currentByte!3108 (_2!2614 lt!85511)) (currentBit!3103 (_2!2614 lt!85511))) (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85518))) (currentByte!3108 (_2!2614 lt!85518)) (currentBit!3103 (_2!2614 lt!85518)))))))

(declare-fun b!55062 () Bool)

(declare-fun e!36724 () Bool)

(assert (=> b!55062 (= e!36723 e!36724)))

(declare-fun res!45898 () Bool)

(assert (=> b!55062 (=> res!45898 e!36724)))

(assert (=> b!55062 (= res!45898 (= (size!1169 (buf!1529 (_2!2614 lt!85511))) #b00000000000000000000000000000000))))

(declare-fun b!55063 () Bool)

(assert (=> b!55063 (= e!36724 (arrayBitRangesEq!0 (buf!1529 (_2!2614 lt!85511)) (buf!1529 (_2!2614 lt!85518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85511))) (currentByte!3108 (_2!2614 lt!85511)) (currentBit!3103 (_2!2614 lt!85511)))))))

(assert (= (and d!17562 res!45899) b!55061))

(assert (= (and b!55061 res!45900) b!55062))

(assert (= (and b!55062 (not res!45898)) b!55063))

(assert (=> b!55061 m!86697))

(assert (=> b!55061 m!86657))

(assert (=> b!55063 m!86697))

(assert (=> b!55063 m!86697))

(declare-fun m!86699 () Bool)

(assert (=> b!55063 m!86699))

(assert (=> b!54935 d!17562))

(declare-fun b!55180 () Bool)

(declare-fun res!45983 () Bool)

(declare-fun e!36780 () Bool)

(assert (=> b!55180 (=> (not res!45983) (not e!36780))))

(declare-fun lt!86116 () tuple2!5006)

(assert (=> b!55180 (= res!45983 (invariant!0 (currentBit!3103 (_2!2614 lt!86116)) (currentByte!3108 (_2!2614 lt!86116)) (size!1169 (buf!1529 (_2!2614 lt!86116)))))))

(declare-fun b!55181 () Bool)

(declare-fun e!36779 () tuple2!5006)

(declare-fun lt!86140 () tuple2!5006)

(declare-fun Unit!3808 () Unit!3793)

(assert (=> b!55181 (= e!36779 (tuple2!5007 Unit!3808 (_2!2614 lt!86140)))))

(declare-fun lt!86122 () tuple2!5006)

(assert (=> b!55181 (= lt!86122 (appendBitFromByte!0 (_2!2614 lt!85511) (select (arr!1712 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!86120 () (_ BitVec 64))

(assert (=> b!55181 (= lt!86120 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86110 () (_ BitVec 64))

(assert (=> b!55181 (= lt!86110 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86129 () Unit!3793)

(assert (=> b!55181 (= lt!86129 (validateOffsetBitsIneqLemma!0 (_2!2614 lt!85511) (_2!2614 lt!86122) lt!86120 lt!86110))))

(assert (=> b!55181 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!86122)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!86122))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!86122))) (bvsub lt!86120 lt!86110))))

(declare-fun lt!86117 () Unit!3793)

(assert (=> b!55181 (= lt!86117 lt!86129)))

(declare-fun lt!86133 () tuple2!5008)

(declare-fun call!706 () tuple2!5008)

(assert (=> b!55181 (= lt!86133 call!706)))

(declare-fun lt!86126 () (_ BitVec 64))

(assert (=> b!55181 (= lt!86126 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86104 () Unit!3793)

(assert (=> b!55181 (= lt!86104 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2614 lt!85511) (buf!1529 (_2!2614 lt!86122)) lt!86126))))

(assert (=> b!55181 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!86122)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511))) lt!86126)))

(declare-fun lt!86146 () Unit!3793)

(assert (=> b!55181 (= lt!86146 lt!86104)))

(assert (=> b!55181 (= (head!407 (byteArrayBitContentToList!0 (_2!2614 lt!86122) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!407 (bitStreamReadBitsIntoList!0 (_2!2614 lt!86122) (_1!2615 lt!86133) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86138 () Unit!3793)

(declare-fun Unit!3809 () Unit!3793)

(assert (=> b!55181 (= lt!86138 Unit!3809)))

(assert (=> b!55181 (= lt!86140 (appendBitsMSBFirstLoop!0 (_2!2614 lt!86122) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!86115 () Unit!3793)

(assert (=> b!55181 (= lt!86115 (lemmaIsPrefixTransitive!0 (_2!2614 lt!85511) (_2!2614 lt!86122) (_2!2614 lt!86140)))))

(assert (=> b!55181 (isPrefixOf!0 (_2!2614 lt!85511) (_2!2614 lt!86140))))

(declare-fun lt!86142 () Unit!3793)

(assert (=> b!55181 (= lt!86142 lt!86115)))

(assert (=> b!55181 (= (size!1169 (buf!1529 (_2!2614 lt!86140))) (size!1169 (buf!1529 (_2!2614 lt!85511))))))

(declare-fun lt!86143 () Unit!3793)

(declare-fun Unit!3810 () Unit!3793)

(assert (=> b!55181 (= lt!86143 Unit!3810)))

(assert (=> b!55181 (= (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86140))) (currentByte!3108 (_2!2614 lt!86140)) (currentBit!3103 (_2!2614 lt!86140))) (bvsub (bvadd (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85511))) (currentByte!3108 (_2!2614 lt!85511)) (currentBit!3103 (_2!2614 lt!85511))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86103 () Unit!3793)

(declare-fun Unit!3811 () Unit!3793)

(assert (=> b!55181 (= lt!86103 Unit!3811)))

(assert (=> b!55181 (= (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86140))) (currentByte!3108 (_2!2614 lt!86140)) (currentBit!3103 (_2!2614 lt!86140))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86122))) (currentByte!3108 (_2!2614 lt!86122)) (currentBit!3103 (_2!2614 lt!86122))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86112 () Unit!3793)

(declare-fun Unit!3812 () Unit!3793)

(assert (=> b!55181 (= lt!86112 Unit!3812)))

(declare-fun lt!86113 () tuple2!5008)

(assert (=> b!55181 (= lt!86113 (reader!0 (_2!2614 lt!85511) (_2!2614 lt!86140)))))

(declare-fun lt!86144 () (_ BitVec 64))

(assert (=> b!55181 (= lt!86144 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86141 () Unit!3793)

(assert (=> b!55181 (= lt!86141 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2614 lt!85511) (buf!1529 (_2!2614 lt!86140)) lt!86144))))

(assert (=> b!55181 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!86140)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511))) lt!86144)))

(declare-fun lt!86111 () Unit!3793)

(assert (=> b!55181 (= lt!86111 lt!86141)))

(declare-fun lt!86114 () tuple2!5008)

(assert (=> b!55181 (= lt!86114 (reader!0 (_2!2614 lt!86122) (_2!2614 lt!86140)))))

(declare-fun lt!86118 () (_ BitVec 64))

(assert (=> b!55181 (= lt!86118 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86106 () Unit!3793)

(assert (=> b!55181 (= lt!86106 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2614 lt!86122) (buf!1529 (_2!2614 lt!86140)) lt!86118))))

(assert (=> b!55181 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!86140)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!86122))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!86122))) lt!86118)))

(declare-fun lt!86125 () Unit!3793)

(assert (=> b!55181 (= lt!86125 lt!86106)))

(declare-fun lt!86134 () List!588)

(assert (=> b!55181 (= lt!86134 (byteArrayBitContentToList!0 (_2!2614 lt!86140) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!86105 () List!588)

(assert (=> b!55181 (= lt!86105 (byteArrayBitContentToList!0 (_2!2614 lt!86140) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86109 () List!588)

(assert (=> b!55181 (= lt!86109 (bitStreamReadBitsIntoList!0 (_2!2614 lt!86140) (_1!2615 lt!86113) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!86135 () List!588)

(assert (=> b!55181 (= lt!86135 (bitStreamReadBitsIntoList!0 (_2!2614 lt!86140) (_1!2615 lt!86114) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86127 () (_ BitVec 64))

(assert (=> b!55181 (= lt!86127 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86137 () Unit!3793)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2026 BitStream!2026 BitStream!2026 BitStream!2026 (_ BitVec 64) List!588) Unit!3793)

(assert (=> b!55181 (= lt!86137 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2614 lt!86140) (_2!2614 lt!86140) (_1!2615 lt!86113) (_1!2615 lt!86114) lt!86127 lt!86109))))

(declare-fun tail!262 (List!588) List!588)

(assert (=> b!55181 (= (bitStreamReadBitsIntoList!0 (_2!2614 lt!86140) (_1!2615 lt!86114) (bvsub lt!86127 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!262 lt!86109))))

(declare-fun lt!86124 () Unit!3793)

(assert (=> b!55181 (= lt!86124 lt!86137)))

(declare-fun lt!86131 () (_ BitVec 64))

(declare-fun lt!86123 () Unit!3793)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2566 array!2566 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3793)

(assert (=> b!55181 (= lt!86123 (arrayBitRangesEqImpliesEq!0 (buf!1529 (_2!2614 lt!86122)) (buf!1529 (_2!2614 lt!86140)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!86131 (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86122))) (currentByte!3108 (_2!2614 lt!86122)) (currentBit!3103 (_2!2614 lt!86122)))))))

(declare-fun bitAt!0 (array!2566 (_ BitVec 64)) Bool)

(assert (=> b!55181 (= (bitAt!0 (buf!1529 (_2!2614 lt!86122)) lt!86131) (bitAt!0 (buf!1529 (_2!2614 lt!86140)) lt!86131))))

(declare-fun lt!86119 () Unit!3793)

(assert (=> b!55181 (= lt!86119 lt!86123)))

(declare-fun b!55182 () Bool)

(declare-fun res!45987 () Bool)

(assert (=> b!55182 (=> (not res!45987) (not e!36780))))

(assert (=> b!55182 (= res!45987 (= (size!1169 (buf!1529 (_2!2614 lt!85511))) (size!1169 (buf!1529 (_2!2614 lt!86116)))))))

(declare-fun b!55183 () Bool)

(declare-fun e!36778 () Bool)

(declare-fun lt!86139 () (_ BitVec 64))

(assert (=> b!55183 (= e!36778 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511))) lt!86139))))

(declare-fun b!55184 () Bool)

(declare-fun Unit!3813 () Unit!3793)

(assert (=> b!55184 (= e!36779 (tuple2!5007 Unit!3813 (_2!2614 lt!85511)))))

(assert (=> b!55184 (= (size!1169 (buf!1529 (_2!2614 lt!85511))) (size!1169 (buf!1529 (_2!2614 lt!85511))))))

(declare-fun lt!86136 () Unit!3793)

(declare-fun Unit!3814 () Unit!3793)

(assert (=> b!55184 (= lt!86136 Unit!3814)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2026 array!2566 array!2566 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5028 0))(
  ( (tuple2!5029 (_1!2625 array!2566) (_2!2625 BitStream!2026)) )
))
(declare-fun readBits!0 (BitStream!2026 (_ BitVec 64)) tuple2!5028)

(assert (=> b!55184 (checkByteArrayBitContent!0 (_2!2614 lt!85511) srcBuffer!2 (_1!2625 (readBits!0 (_1!2615 call!706) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!703 () Bool)

(declare-fun c!3936 () Bool)

(assert (=> bm!703 (= call!706 (reader!0 (_2!2614 lt!85511) (ite c!3936 (_2!2614 lt!86122) (_2!2614 lt!85511))))))

(declare-fun b!55185 () Bool)

(declare-fun res!45982 () Bool)

(assert (=> b!55185 (=> (not res!45982) (not e!36780))))

(assert (=> b!55185 (= res!45982 (= (size!1169 (buf!1529 (_2!2614 lt!86116))) (size!1169 (buf!1529 (_2!2614 lt!85511)))))))

(declare-fun d!17564 () Bool)

(assert (=> d!17564 e!36780))

(declare-fun res!45986 () Bool)

(assert (=> d!17564 (=> (not res!45986) (not e!36780))))

(declare-fun lt!86128 () (_ BitVec 64))

(assert (=> d!17564 (= res!45986 (= (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86116))) (currentByte!3108 (_2!2614 lt!86116)) (currentBit!3103 (_2!2614 lt!86116))) (bvsub lt!86128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17564 (or (= (bvand lt!86128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!86107 () (_ BitVec 64))

(assert (=> d!17564 (= lt!86128 (bvadd lt!86107 to!314))))

(assert (=> d!17564 (or (not (= (bvand lt!86107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!86107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!86107 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17564 (= lt!86107 (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85511))) (currentByte!3108 (_2!2614 lt!85511)) (currentBit!3103 (_2!2614 lt!85511))))))

(assert (=> d!17564 (= lt!86116 e!36779)))

(assert (=> d!17564 (= c!3936 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!86121 () Unit!3793)

(declare-fun lt!86108 () Unit!3793)

(assert (=> d!17564 (= lt!86121 lt!86108)))

(assert (=> d!17564 (isPrefixOf!0 (_2!2614 lt!85511) (_2!2614 lt!85511))))

(assert (=> d!17564 (= lt!86108 (lemmaIsPrefixRefl!0 (_2!2614 lt!85511)))))

(assert (=> d!17564 (= lt!86131 (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85511))) (currentByte!3108 (_2!2614 lt!85511)) (currentBit!3103 (_2!2614 lt!85511))))))

(assert (=> d!17564 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17564 (= (appendBitsMSBFirstLoop!0 (_2!2614 lt!85511) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!86116)))

(declare-fun b!55186 () Bool)

(declare-fun lt!86132 () tuple2!5008)

(assert (=> b!55186 (= e!36780 (= (bitStreamReadBitsIntoList!0 (_2!2614 lt!86116) (_1!2615 lt!86132) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2614 lt!86116) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!55186 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55186 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!86130 () Unit!3793)

(declare-fun lt!86145 () Unit!3793)

(assert (=> b!55186 (= lt!86130 lt!86145)))

(assert (=> b!55186 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!86116)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511))) lt!86139)))

(assert (=> b!55186 (= lt!86145 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2614 lt!85511) (buf!1529 (_2!2614 lt!86116)) lt!86139))))

(assert (=> b!55186 e!36778))

(declare-fun res!45985 () Bool)

(assert (=> b!55186 (=> (not res!45985) (not e!36778))))

(assert (=> b!55186 (= res!45985 (and (= (size!1169 (buf!1529 (_2!2614 lt!85511))) (size!1169 (buf!1529 (_2!2614 lt!86116)))) (bvsge lt!86139 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55186 (= lt!86139 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!55186 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55186 (= lt!86132 (reader!0 (_2!2614 lt!85511) (_2!2614 lt!86116)))))

(declare-fun b!55187 () Bool)

(declare-fun res!45984 () Bool)

(assert (=> b!55187 (=> (not res!45984) (not e!36780))))

(assert (=> b!55187 (= res!45984 (isPrefixOf!0 (_2!2614 lt!85511) (_2!2614 lt!86116)))))

(assert (= (and d!17564 c!3936) b!55181))

(assert (= (and d!17564 (not c!3936)) b!55184))

(assert (= (or b!55181 b!55184) bm!703))

(assert (= (and d!17564 res!45986) b!55180))

(assert (= (and b!55180 res!45983) b!55182))

(assert (= (and b!55182 res!45987) b!55187))

(assert (= (and b!55187 res!45984) b!55185))

(assert (= (and b!55185 res!45982) b!55186))

(assert (= (and b!55186 res!45985) b!55183))

(declare-fun m!86875 () Bool)

(assert (=> b!55183 m!86875))

(declare-fun m!86877 () Bool)

(assert (=> b!55181 m!86877))

(declare-fun m!86879 () Bool)

(assert (=> b!55181 m!86879))

(declare-fun m!86881 () Bool)

(assert (=> b!55181 m!86881))

(declare-fun m!86883 () Bool)

(assert (=> b!55181 m!86883))

(declare-fun m!86885 () Bool)

(assert (=> b!55181 m!86885))

(declare-fun m!86887 () Bool)

(assert (=> b!55181 m!86887))

(declare-fun m!86889 () Bool)

(assert (=> b!55181 m!86889))

(declare-fun m!86891 () Bool)

(assert (=> b!55181 m!86891))

(declare-fun m!86893 () Bool)

(assert (=> b!55181 m!86893))

(declare-fun m!86895 () Bool)

(assert (=> b!55181 m!86895))

(assert (=> b!55181 m!86893))

(declare-fun m!86897 () Bool)

(assert (=> b!55181 m!86897))

(assert (=> b!55181 m!86889))

(declare-fun m!86899 () Bool)

(assert (=> b!55181 m!86899))

(declare-fun m!86901 () Bool)

(assert (=> b!55181 m!86901))

(declare-fun m!86903 () Bool)

(assert (=> b!55181 m!86903))

(declare-fun m!86905 () Bool)

(assert (=> b!55181 m!86905))

(declare-fun m!86907 () Bool)

(assert (=> b!55181 m!86907))

(declare-fun m!86909 () Bool)

(assert (=> b!55181 m!86909))

(declare-fun m!86911 () Bool)

(assert (=> b!55181 m!86911))

(declare-fun m!86913 () Bool)

(assert (=> b!55181 m!86913))

(declare-fun m!86915 () Bool)

(assert (=> b!55181 m!86915))

(declare-fun m!86917 () Bool)

(assert (=> b!55181 m!86917))

(declare-fun m!86919 () Bool)

(assert (=> b!55181 m!86919))

(assert (=> b!55181 m!86697))

(declare-fun m!86921 () Bool)

(assert (=> b!55181 m!86921))

(declare-fun m!86923 () Bool)

(assert (=> b!55181 m!86923))

(declare-fun m!86925 () Bool)

(assert (=> b!55181 m!86925))

(declare-fun m!86927 () Bool)

(assert (=> b!55181 m!86927))

(assert (=> b!55181 m!86905))

(declare-fun m!86929 () Bool)

(assert (=> b!55181 m!86929))

(assert (=> b!55181 m!86877))

(declare-fun m!86931 () Bool)

(assert (=> b!55181 m!86931))

(declare-fun m!86933 () Bool)

(assert (=> b!55181 m!86933))

(declare-fun m!86935 () Bool)

(assert (=> b!55181 m!86935))

(declare-fun m!86937 () Bool)

(assert (=> b!55181 m!86937))

(declare-fun m!86939 () Bool)

(assert (=> b!55187 m!86939))

(declare-fun m!86941 () Bool)

(assert (=> b!55180 m!86941))

(declare-fun m!86943 () Bool)

(assert (=> d!17564 m!86943))

(assert (=> d!17564 m!86697))

(assert (=> d!17564 m!86679))

(assert (=> d!17564 m!86685))

(declare-fun m!86945 () Bool)

(assert (=> b!55184 m!86945))

(declare-fun m!86947 () Bool)

(assert (=> b!55184 m!86947))

(declare-fun m!86949 () Bool)

(assert (=> b!55186 m!86949))

(declare-fun m!86951 () Bool)

(assert (=> b!55186 m!86951))

(declare-fun m!86953 () Bool)

(assert (=> b!55186 m!86953))

(declare-fun m!86955 () Bool)

(assert (=> b!55186 m!86955))

(declare-fun m!86957 () Bool)

(assert (=> b!55186 m!86957))

(declare-fun m!86959 () Bool)

(assert (=> bm!703 m!86959))

(assert (=> b!54935 d!17564))

(declare-fun d!17610 () Bool)

(assert (=> d!17610 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86152 () Unit!3793)

(declare-fun choose!9 (BitStream!2026 array!2566 (_ BitVec 64) BitStream!2026) Unit!3793)

(assert (=> d!17610 (= lt!86152 (choose!9 thiss!1379 (buf!1529 (_2!2614 lt!85511)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2027 (buf!1529 (_2!2614 lt!85511)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379))))))

(assert (=> d!17610 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1529 (_2!2614 lt!85511)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86152)))

(declare-fun bs!4428 () Bool)

(assert (= bs!4428 d!17610))

(assert (=> bs!4428 m!86487))

(declare-fun m!86961 () Bool)

(assert (=> bs!4428 m!86961))

(assert (=> b!54935 d!17610))

(declare-fun d!17612 () Bool)

(assert (=> d!17612 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4429 () Bool)

(assert (= bs!4429 d!17612))

(declare-fun m!86963 () Bool)

(assert (=> bs!4429 m!86963))

(assert (=> b!54935 d!17612))

(declare-fun d!17614 () Bool)

(assert (=> d!17614 (= (head!407 (byteArrayBitContentToList!0 (_2!2614 lt!85511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!703 (byteArrayBitContentToList!0 (_2!2614 lt!85511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54936 d!17614))

(declare-fun d!17616 () Bool)

(declare-fun c!3939 () Bool)

(assert (=> d!17616 (= c!3939 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36786 () List!588)

(assert (=> d!17616 (= (byteArrayBitContentToList!0 (_2!2614 lt!85511) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36786)))

(declare-fun b!55195 () Bool)

(assert (=> b!55195 (= e!36786 Nil!585)))

(declare-fun b!55196 () Bool)

(assert (=> b!55196 (= e!36786 (Cons!584 (not (= (bvand ((_ sign_extend 24) (select (arr!1712 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2614 lt!85511) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17616 c!3939) b!55195))

(assert (= (and d!17616 (not c!3939)) b!55196))

(assert (=> b!55196 m!86493))

(declare-fun m!86965 () Bool)

(assert (=> b!55196 m!86965))

(declare-fun m!86967 () Bool)

(assert (=> b!55196 m!86967))

(assert (=> b!54936 d!17616))

(declare-fun d!17618 () Bool)

(assert (=> d!17618 (= (head!407 (bitStreamReadBitsIntoList!0 (_2!2614 lt!85511) (_1!2615 lt!85513) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!703 (bitStreamReadBitsIntoList!0 (_2!2614 lt!85511) (_1!2615 lt!85513) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54936 d!17618))

(declare-datatypes ((tuple2!5032 0))(
  ( (tuple2!5033 (_1!2627 Bool) (_2!2627 BitStream!2026)) )
))
(declare-fun lt!86160 () tuple2!5032)

(declare-datatypes ((tuple2!5034 0))(
  ( (tuple2!5035 (_1!2628 List!588) (_2!2628 BitStream!2026)) )
))
(declare-fun e!36791 () tuple2!5034)

(declare-fun lt!86159 () (_ BitVec 64))

(declare-fun b!55206 () Bool)

(assert (=> b!55206 (= e!36791 (tuple2!5035 (Cons!584 (_1!2627 lt!86160) (bitStreamReadBitsIntoList!0 (_2!2614 lt!85511) (_2!2627 lt!86160) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!86159))) (_2!2627 lt!86160)))))

(declare-fun readBit!0 (BitStream!2026) tuple2!5032)

(assert (=> b!55206 (= lt!86160 (readBit!0 (_1!2615 lt!85513)))))

(assert (=> b!55206 (= lt!86159 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!55207 () Bool)

(declare-fun e!36792 () Bool)

(declare-fun lt!86161 () List!588)

(declare-fun isEmpty!160 (List!588) Bool)

(assert (=> b!55207 (= e!36792 (isEmpty!160 lt!86161))))

(declare-fun b!55205 () Bool)

(assert (=> b!55205 (= e!36791 (tuple2!5035 Nil!585 (_1!2615 lt!85513)))))

(declare-fun d!17620 () Bool)

(assert (=> d!17620 e!36792))

(declare-fun c!3945 () Bool)

(assert (=> d!17620 (= c!3945 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17620 (= lt!86161 (_1!2628 e!36791))))

(declare-fun c!3944 () Bool)

(assert (=> d!17620 (= c!3944 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17620 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17620 (= (bitStreamReadBitsIntoList!0 (_2!2614 lt!85511) (_1!2615 lt!85513) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86161)))

(declare-fun b!55208 () Bool)

(declare-fun length!274 (List!588) Int)

(assert (=> b!55208 (= e!36792 (> (length!274 lt!86161) 0))))

(assert (= (and d!17620 c!3944) b!55205))

(assert (= (and d!17620 (not c!3944)) b!55206))

(assert (= (and d!17620 c!3945) b!55207))

(assert (= (and d!17620 (not c!3945)) b!55208))

(declare-fun m!86969 () Bool)

(assert (=> b!55206 m!86969))

(declare-fun m!86971 () Bool)

(assert (=> b!55206 m!86971))

(declare-fun m!86973 () Bool)

(assert (=> b!55207 m!86973))

(declare-fun m!86975 () Bool)

(assert (=> b!55208 m!86975))

(assert (=> b!54936 d!17620))

(declare-fun d!17622 () Bool)

(assert (=> d!17622 (= (array_inv!1072 (buf!1529 thiss!1379)) (bvsge (size!1169 (buf!1529 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54931 d!17622))

(declare-fun d!17624 () Bool)

(declare-fun res!45992 () Bool)

(declare-fun e!36793 () Bool)

(assert (=> d!17624 (=> (not res!45992) (not e!36793))))

(assert (=> d!17624 (= res!45992 (= (size!1169 (buf!1529 thiss!1379)) (size!1169 (buf!1529 (_2!2614 lt!85511)))))))

(assert (=> d!17624 (= (isPrefixOf!0 thiss!1379 (_2!2614 lt!85511)) e!36793)))

(declare-fun b!55209 () Bool)

(declare-fun res!45993 () Bool)

(assert (=> b!55209 (=> (not res!45993) (not e!36793))))

(assert (=> b!55209 (= res!45993 (bvsle (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)) (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!85511))) (currentByte!3108 (_2!2614 lt!85511)) (currentBit!3103 (_2!2614 lt!85511)))))))

(declare-fun b!55210 () Bool)

(declare-fun e!36794 () Bool)

(assert (=> b!55210 (= e!36793 e!36794)))

(declare-fun res!45991 () Bool)

(assert (=> b!55210 (=> res!45991 e!36794)))

(assert (=> b!55210 (= res!45991 (= (size!1169 (buf!1529 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55211 () Bool)

(assert (=> b!55211 (= e!36794 (arrayBitRangesEq!0 (buf!1529 thiss!1379) (buf!1529 (_2!2614 lt!85511)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379))))))

(assert (= (and d!17624 res!45992) b!55209))

(assert (= (and b!55209 res!45993) b!55210))

(assert (= (and b!55210 (not res!45991)) b!55211))

(assert (=> b!55209 m!86473))

(assert (=> b!55209 m!86697))

(assert (=> b!55211 m!86473))

(assert (=> b!55211 m!86473))

(declare-fun m!86977 () Bool)

(assert (=> b!55211 m!86977))

(assert (=> b!54932 d!17624))

(declare-fun d!17626 () Bool)

(assert (=> d!17626 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4430 () Bool)

(assert (= bs!4430 d!17626))

(declare-fun m!86979 () Bool)

(assert (=> bs!4430 m!86979))

(assert (=> b!54932 d!17626))

(declare-fun d!17628 () Bool)

(declare-fun e!36797 () Bool)

(assert (=> d!17628 e!36797))

(declare-fun res!45996 () Bool)

(assert (=> d!17628 (=> (not res!45996) (not e!36797))))

(assert (=> d!17628 (= res!45996 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!86164 () Unit!3793)

(declare-fun choose!27 (BitStream!2026 BitStream!2026 (_ BitVec 64) (_ BitVec 64)) Unit!3793)

(assert (=> d!17628 (= lt!86164 (choose!27 thiss!1379 (_2!2614 lt!85511) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17628 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17628 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2614 lt!85511) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86164)))

(declare-fun b!55214 () Bool)

(assert (=> b!55214 (= e!36797 (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 (_2!2614 lt!85511)))) ((_ sign_extend 32) (currentByte!3108 (_2!2614 lt!85511))) ((_ sign_extend 32) (currentBit!3103 (_2!2614 lt!85511))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17628 res!45996) b!55214))

(declare-fun m!86981 () Bool)

(assert (=> d!17628 m!86981))

(assert (=> b!55214 m!86489))

(assert (=> b!54932 d!17628))

(declare-fun b!55281 () Bool)

(declare-fun e!36829 () Bool)

(declare-fun e!36828 () Bool)

(assert (=> b!55281 (= e!36829 e!36828)))

(declare-fun res!46057 () Bool)

(assert (=> b!55281 (=> (not res!46057) (not e!36828))))

(declare-fun lt!86361 () (_ BitVec 8))

(declare-fun lt!86360 () tuple2!5006)

(declare-datatypes ((tuple2!5036 0))(
  ( (tuple2!5037 (_1!2629 BitStream!2026) (_2!2629 Bool)) )
))
(declare-fun lt!86363 () tuple2!5036)

(assert (=> b!55281 (= res!46057 (and (= (_2!2629 lt!86363) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1712 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!86361)) #b00000000000000000000000000000000))) (= (_1!2629 lt!86363) (_2!2614 lt!86360))))))

(declare-fun lt!86367 () tuple2!5028)

(declare-fun lt!86359 () BitStream!2026)

(assert (=> b!55281 (= lt!86367 (readBits!0 lt!86359 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2026) tuple2!5036)

(assert (=> b!55281 (= lt!86363 (readBitPure!0 lt!86359))))

(declare-fun readerFrom!0 (BitStream!2026 (_ BitVec 32) (_ BitVec 32)) BitStream!2026)

(assert (=> b!55281 (= lt!86359 (readerFrom!0 (_2!2614 lt!86360) (currentBit!3103 thiss!1379) (currentByte!3108 thiss!1379)))))

(declare-fun b!55282 () Bool)

(declare-fun res!46061 () Bool)

(declare-fun e!36830 () Bool)

(assert (=> b!55282 (=> (not res!46061) (not e!36830))))

(declare-fun lt!86364 () tuple2!5006)

(assert (=> b!55282 (= res!46061 (= (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86364))) (currentByte!3108 (_2!2614 lt!86364)) (currentBit!3103 (_2!2614 lt!86364))) (bvadd (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!55283 () Bool)

(declare-fun e!36827 () Bool)

(assert (=> b!55283 (= e!36830 e!36827)))

(declare-fun res!46058 () Bool)

(assert (=> b!55283 (=> (not res!46058) (not e!36827))))

(declare-fun lt!86368 () Bool)

(declare-fun lt!86366 () tuple2!5036)

(assert (=> b!55283 (= res!46058 (and (= (_2!2629 lt!86366) lt!86368) (= (_1!2629 lt!86366) (_2!2614 lt!86364))))))

(assert (=> b!55283 (= lt!86366 (readBitPure!0 (readerFrom!0 (_2!2614 lt!86364) (currentBit!3103 thiss!1379) (currentByte!3108 thiss!1379))))))

(declare-fun b!55284 () Bool)

(declare-fun res!46059 () Bool)

(assert (=> b!55284 (=> (not res!46059) (not e!36829))))

(assert (=> b!55284 (= res!46059 (isPrefixOf!0 thiss!1379 (_2!2614 lt!86360)))))

(declare-fun d!17630 () Bool)

(assert (=> d!17630 e!36829))

(declare-fun res!46056 () Bool)

(assert (=> d!17630 (=> (not res!46056) (not e!36829))))

(assert (=> d!17630 (= res!46056 (= (size!1169 (buf!1529 (_2!2614 lt!86360))) (size!1169 (buf!1529 thiss!1379))))))

(declare-fun lt!86365 () array!2566)

(assert (=> d!17630 (= lt!86361 (select (arr!1712 lt!86365) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17630 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1169 lt!86365)))))

(assert (=> d!17630 (= lt!86365 (array!2567 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!86357 () tuple2!5006)

(assert (=> d!17630 (= lt!86360 (tuple2!5007 (_1!2614 lt!86357) (_2!2614 lt!86357)))))

(assert (=> d!17630 (= lt!86357 lt!86364)))

(assert (=> d!17630 e!36830))

(declare-fun res!46060 () Bool)

(assert (=> d!17630 (=> (not res!46060) (not e!36830))))

(assert (=> d!17630 (= res!46060 (= (size!1169 (buf!1529 thiss!1379)) (size!1169 (buf!1529 (_2!2614 lt!86364)))))))

(declare-fun appendBit!0 (BitStream!2026 Bool) tuple2!5006)

(assert (=> d!17630 (= lt!86364 (appendBit!0 thiss!1379 lt!86368))))

(assert (=> d!17630 (= lt!86368 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1712 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17630 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17630 (= (appendBitFromByte!0 thiss!1379 (select (arr!1712 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!86360)))

(declare-fun b!55285 () Bool)

(assert (=> b!55285 (= e!36827 (= (bitIndex!0 (size!1169 (buf!1529 (_1!2629 lt!86366))) (currentByte!3108 (_1!2629 lt!86366)) (currentBit!3103 (_1!2629 lt!86366))) (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86364))) (currentByte!3108 (_2!2614 lt!86364)) (currentBit!3103 (_2!2614 lt!86364)))))))

(declare-fun b!55286 () Bool)

(declare-fun res!46062 () Bool)

(assert (=> b!55286 (=> (not res!46062) (not e!36830))))

(assert (=> b!55286 (= res!46062 (isPrefixOf!0 thiss!1379 (_2!2614 lt!86364)))))

(declare-fun b!55287 () Bool)

(assert (=> b!55287 (= e!36828 (= (bitIndex!0 (size!1169 (buf!1529 (_1!2629 lt!86363))) (currentByte!3108 (_1!2629 lt!86363)) (currentBit!3103 (_1!2629 lt!86363))) (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86360))) (currentByte!3108 (_2!2614 lt!86360)) (currentBit!3103 (_2!2614 lt!86360)))))))

(declare-fun b!55288 () Bool)

(declare-fun res!46055 () Bool)

(assert (=> b!55288 (=> (not res!46055) (not e!36829))))

(declare-fun lt!86358 () (_ BitVec 64))

(declare-fun lt!86362 () (_ BitVec 64))

(assert (=> b!55288 (= res!46055 (= (bitIndex!0 (size!1169 (buf!1529 (_2!2614 lt!86360))) (currentByte!3108 (_2!2614 lt!86360)) (currentBit!3103 (_2!2614 lt!86360))) (bvadd lt!86362 lt!86358)))))

(assert (=> b!55288 (or (not (= (bvand lt!86362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86358 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!86362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!86362 lt!86358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55288 (= lt!86358 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!55288 (= lt!86362 (bitIndex!0 (size!1169 (buf!1529 thiss!1379)) (currentByte!3108 thiss!1379) (currentBit!3103 thiss!1379)))))

(assert (= (and d!17630 res!46060) b!55282))

(assert (= (and b!55282 res!46061) b!55286))

(assert (= (and b!55286 res!46062) b!55283))

(assert (= (and b!55283 res!46058) b!55285))

(assert (= (and d!17630 res!46056) b!55288))

(assert (= (and b!55288 res!46055) b!55284))

(assert (= (and b!55284 res!46059) b!55281))

(assert (= (and b!55281 res!46057) b!55287))

(declare-fun m!87095 () Bool)

(assert (=> b!55282 m!87095))

(assert (=> b!55282 m!86473))

(declare-fun m!87097 () Bool)

(assert (=> b!55287 m!87097))

(declare-fun m!87099 () Bool)

(assert (=> b!55287 m!87099))

(assert (=> b!55288 m!87099))

(assert (=> b!55288 m!86473))

(declare-fun m!87101 () Bool)

(assert (=> d!17630 m!87101))

(declare-fun m!87103 () Bool)

(assert (=> d!17630 m!87103))

(assert (=> d!17630 m!86965))

(declare-fun m!87105 () Bool)

(assert (=> b!55284 m!87105))

(declare-fun m!87107 () Bool)

(assert (=> b!55285 m!87107))

(assert (=> b!55285 m!87095))

(declare-fun m!87109 () Bool)

(assert (=> b!55286 m!87109))

(declare-fun m!87111 () Bool)

(assert (=> b!55283 m!87111))

(assert (=> b!55283 m!87111))

(declare-fun m!87113 () Bool)

(assert (=> b!55283 m!87113))

(declare-fun m!87115 () Bool)

(assert (=> b!55281 m!87115))

(declare-fun m!87117 () Bool)

(assert (=> b!55281 m!87117))

(declare-fun m!87119 () Bool)

(assert (=> b!55281 m!87119))

(assert (=> b!54932 d!17630))

(declare-fun d!17634 () Bool)

(assert (=> d!17634 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1169 (buf!1529 thiss!1379))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1169 (buf!1529 thiss!1379))) ((_ sign_extend 32) (currentByte!3108 thiss!1379)) ((_ sign_extend 32) (currentBit!3103 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4431 () Bool)

(assert (= bs!4431 d!17634))

(assert (=> bs!4431 m!86649))

(assert (=> b!54933 d!17634))

(push 1)

(assert (not b!55208))

(assert (not b!55286))

(assert (not b!55211))

(assert (not b!55060))

(assert (not bm!703))

(assert (not b!55057))

(assert (not b!55031))

(assert (not b!55063))

(assert (not b!55061))

(assert (not b!55285))

(assert (not b!55287))

(assert (not d!17524))

(assert (not b!55284))

(assert (not b!55007))

(assert (not b!55005))

(assert (not b!55056))

(assert (not b!55207))

(assert (not b!55283))

(assert (not b!55282))

(assert (not b!55180))

(assert (not b!55186))

(assert (not d!17610))

(assert (not b!55184))

(assert (not d!17542))

(assert (not b!55196))

(assert (not b!55187))

(assert (not d!17630))

(assert (not d!17564))

(assert (not b!55281))

(assert (not d!17544))

(assert (not b!55288))

(assert (not d!17626))

(assert (not b!55059))

(assert (not b!55209))

(assert (not b!55033))

(assert (not d!17526))

(assert (not d!17548))

(assert (not b!55181))

(assert (not d!17634))

(assert (not b!55214))

(assert (not b!55183))

(assert (not d!17628))

(assert (not b!55206))

(assert (not d!17612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

