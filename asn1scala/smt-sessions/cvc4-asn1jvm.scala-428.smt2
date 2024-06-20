; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11380 () Bool)

(assert start!11380)

(declare-datatypes ((array!2609 0))(
  ( (array!2610 (arr!1738 (Array (_ BitVec 32) (_ BitVec 8))) (size!1186 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2609)

(declare-datatypes ((BitStream!2060 0))(
  ( (BitStream!2061 (buf!1555 array!2609) (currentByte!3149 (_ BitVec 32)) (currentBit!3144 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3899 0))(
  ( (Unit!3900) )
))
(declare-datatypes ((tuple2!5146 0))(
  ( (tuple2!5147 (_1!2684 Unit!3899) (_2!2684 BitStream!2060)) )
))
(declare-fun lt!88438 () tuple2!5146)

(declare-fun b!56404 () Bool)

(declare-fun e!37546 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5148 0))(
  ( (tuple2!5149 (_1!2685 BitStream!2060) (_2!2685 BitStream!2060)) )
))
(declare-fun lt!88435 () tuple2!5148)

(declare-datatypes ((List!605 0))(
  ( (Nil!602) (Cons!601 (h!720 Bool) (t!1355 List!605)) )
))
(declare-fun head!424 (List!605) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2060 array!2609 (_ BitVec 64) (_ BitVec 64)) List!605)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2060 BitStream!2060 (_ BitVec 64)) List!605)

(assert (=> b!56404 (= e!37546 (= (head!424 (byteArrayBitContentToList!0 (_2!2684 lt!88438) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!424 (bitStreamReadBitsIntoList!0 (_2!2684 lt!88438) (_1!2685 lt!88435) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!88440 () (_ BitVec 64))

(declare-fun lt!88441 () (_ BitVec 64))

(declare-fun b!56405 () Bool)

(declare-fun e!37544 () Bool)

(assert (=> b!56405 (= e!37544 (or (not (= lt!88440 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!88440 (bvand (bvadd lt!88441 to!314) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56405 (= lt!88440 (bvand lt!88441 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56405 (= lt!88441 (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438))))))

(declare-fun lt!88437 () tuple2!5146)

(declare-fun thiss!1379 () BitStream!2060)

(assert (=> b!56405 (= (size!1186 (buf!1555 (_2!2684 lt!88437))) (size!1186 (buf!1555 thiss!1379)))))

(declare-fun res!46934 () Bool)

(declare-fun e!37543 () Bool)

(assert (=> start!11380 (=> (not res!46934) (not e!37543))))

(assert (=> start!11380 (= res!46934 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1186 srcBuffer!2))))))))

(assert (=> start!11380 e!37543))

(assert (=> start!11380 true))

(declare-fun array_inv!1089 (array!2609) Bool)

(assert (=> start!11380 (array_inv!1089 srcBuffer!2)))

(declare-fun e!37547 () Bool)

(declare-fun inv!12 (BitStream!2060) Bool)

(assert (=> start!11380 (and (inv!12 thiss!1379) e!37547)))

(declare-fun b!56406 () Bool)

(declare-fun res!46931 () Bool)

(assert (=> b!56406 (=> res!46931 e!37544)))

(assert (=> b!56406 (= res!46931 (not (= (size!1186 (buf!1555 thiss!1379)) (size!1186 (buf!1555 (_2!2684 lt!88437))))))))

(declare-fun b!56407 () Bool)

(declare-fun res!46938 () Bool)

(assert (=> b!56407 (=> res!46938 e!37544)))

(declare-fun lt!88439 () (_ BitVec 64))

(assert (=> b!56407 (= res!46938 (not (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88437))) (currentByte!3149 (_2!2684 lt!88437)) (currentBit!3144 (_2!2684 lt!88437))) (bvsub (bvadd lt!88439 to!314) i!635))))))

(declare-fun b!56408 () Bool)

(assert (=> b!56408 (= e!37547 (array_inv!1089 (buf!1555 thiss!1379)))))

(declare-fun b!56409 () Bool)

(declare-fun res!46935 () Bool)

(assert (=> b!56409 (=> (not res!46935) (not e!37543))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56409 (= res!46935 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 thiss!1379))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!56410 () Bool)

(declare-fun e!37545 () Bool)

(assert (=> b!56410 (= e!37545 e!37544)))

(declare-fun res!46937 () Bool)

(assert (=> b!56410 (=> res!46937 e!37544)))

(declare-fun isPrefixOf!0 (BitStream!2060 BitStream!2060) Bool)

(assert (=> b!56410 (= res!46937 (not (isPrefixOf!0 (_2!2684 lt!88438) (_2!2684 lt!88437))))))

(assert (=> b!56410 (isPrefixOf!0 thiss!1379 (_2!2684 lt!88437))))

(declare-fun lt!88433 () Unit!3899)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2060 BitStream!2060 BitStream!2060) Unit!3899)

(assert (=> b!56410 (= lt!88433 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2684 lt!88438) (_2!2684 lt!88437)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2060 array!2609 (_ BitVec 64) (_ BitVec 64)) tuple2!5146)

(assert (=> b!56410 (= lt!88437 (appendBitsMSBFirstLoop!0 (_2!2684 lt!88438) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!56410 e!37546))

(declare-fun res!46936 () Bool)

(assert (=> b!56410 (=> (not res!46936) (not e!37546))))

(assert (=> b!56410 (= res!46936 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88434 () Unit!3899)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2060 array!2609 (_ BitVec 64)) Unit!3899)

(assert (=> b!56410 (= lt!88434 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1555 (_2!2684 lt!88438)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2060 BitStream!2060) tuple2!5148)

(assert (=> b!56410 (= lt!88435 (reader!0 thiss!1379 (_2!2684 lt!88438)))))

(declare-fun b!56411 () Bool)

(declare-fun e!37542 () Bool)

(assert (=> b!56411 (= e!37542 e!37545)))

(declare-fun res!46930 () Bool)

(assert (=> b!56411 (=> res!46930 e!37545)))

(assert (=> b!56411 (= res!46930 (not (isPrefixOf!0 thiss!1379 (_2!2684 lt!88438))))))

(assert (=> b!56411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88432 () Unit!3899)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2060 BitStream!2060 (_ BitVec 64) (_ BitVec 64)) Unit!3899)

(assert (=> b!56411 (= lt!88432 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2684 lt!88438) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2060 (_ BitVec 8) (_ BitVec 32)) tuple2!5146)

(assert (=> b!56411 (= lt!88438 (appendBitFromByte!0 thiss!1379 (select (arr!1738 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!56412 () Bool)

(assert (=> b!56412 (= e!37543 (not e!37542))))

(declare-fun res!46932 () Bool)

(assert (=> b!56412 (=> res!46932 e!37542)))

(assert (=> b!56412 (= res!46932 (bvsge i!635 to!314))))

(assert (=> b!56412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88436 () Unit!3899)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2060) Unit!3899)

(assert (=> b!56412 (= lt!88436 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!56412 (= lt!88439 (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)))))

(declare-fun b!56413 () Bool)

(declare-fun res!46933 () Bool)

(assert (=> b!56413 (=> res!46933 e!37544)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56413 (= res!46933 (not (invariant!0 (currentBit!3144 (_2!2684 lt!88437)) (currentByte!3149 (_2!2684 lt!88437)) (size!1186 (buf!1555 (_2!2684 lt!88437))))))))

(assert (= (and start!11380 res!46934) b!56409))

(assert (= (and b!56409 res!46935) b!56412))

(assert (= (and b!56412 (not res!46932)) b!56411))

(assert (= (and b!56411 (not res!46930)) b!56410))

(assert (= (and b!56410 res!46936) b!56404))

(assert (= (and b!56410 (not res!46937)) b!56407))

(assert (= (and b!56407 (not res!46938)) b!56413))

(assert (= (and b!56413 (not res!46933)) b!56406))

(assert (= (and b!56406 (not res!46931)) b!56405))

(assert (= start!11380 b!56408))

(declare-fun m!88905 () Bool)

(assert (=> b!56410 m!88905))

(declare-fun m!88907 () Bool)

(assert (=> b!56410 m!88907))

(declare-fun m!88909 () Bool)

(assert (=> b!56410 m!88909))

(declare-fun m!88911 () Bool)

(assert (=> b!56410 m!88911))

(declare-fun m!88913 () Bool)

(assert (=> b!56410 m!88913))

(declare-fun m!88915 () Bool)

(assert (=> b!56410 m!88915))

(declare-fun m!88917 () Bool)

(assert (=> b!56410 m!88917))

(declare-fun m!88919 () Bool)

(assert (=> b!56412 m!88919))

(declare-fun m!88921 () Bool)

(assert (=> b!56412 m!88921))

(declare-fun m!88923 () Bool)

(assert (=> b!56412 m!88923))

(declare-fun m!88925 () Bool)

(assert (=> b!56404 m!88925))

(assert (=> b!56404 m!88925))

(declare-fun m!88927 () Bool)

(assert (=> b!56404 m!88927))

(declare-fun m!88929 () Bool)

(assert (=> b!56404 m!88929))

(assert (=> b!56404 m!88929))

(declare-fun m!88931 () Bool)

(assert (=> b!56404 m!88931))

(declare-fun m!88933 () Bool)

(assert (=> b!56409 m!88933))

(declare-fun m!88935 () Bool)

(assert (=> b!56405 m!88935))

(declare-fun m!88937 () Bool)

(assert (=> start!11380 m!88937))

(declare-fun m!88939 () Bool)

(assert (=> start!11380 m!88939))

(declare-fun m!88941 () Bool)

(assert (=> b!56411 m!88941))

(declare-fun m!88943 () Bool)

(assert (=> b!56411 m!88943))

(declare-fun m!88945 () Bool)

(assert (=> b!56411 m!88945))

(assert (=> b!56411 m!88943))

(declare-fun m!88947 () Bool)

(assert (=> b!56411 m!88947))

(declare-fun m!88949 () Bool)

(assert (=> b!56411 m!88949))

(declare-fun m!88951 () Bool)

(assert (=> b!56413 m!88951))

(declare-fun m!88953 () Bool)

(assert (=> b!56408 m!88953))

(declare-fun m!88955 () Bool)

(assert (=> b!56407 m!88955))

(push 1)

(assert (not b!56410))

(assert (not b!56412))

(assert (not b!56404))

(assert (not b!56407))

(assert (not b!56405))

(assert (not b!56409))

(assert (not b!56413))

(assert (not b!56411))

(assert (not start!11380))

(assert (not b!56408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17976 () Bool)

(declare-fun res!46977 () Bool)

(declare-fun e!37582 () Bool)

(assert (=> d!17976 (=> (not res!46977) (not e!37582))))

(assert (=> d!17976 (= res!46977 (= (size!1186 (buf!1555 thiss!1379)) (size!1186 (buf!1555 (_2!2684 lt!88437)))))))

(assert (=> d!17976 (= (isPrefixOf!0 thiss!1379 (_2!2684 lt!88437)) e!37582)))

(declare-fun b!56468 () Bool)

(declare-fun res!46975 () Bool)

(assert (=> b!56468 (=> (not res!46975) (not e!37582))))

(assert (=> b!56468 (= res!46975 (bvsle (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)) (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88437))) (currentByte!3149 (_2!2684 lt!88437)) (currentBit!3144 (_2!2684 lt!88437)))))))

(declare-fun b!56469 () Bool)

(declare-fun e!37583 () Bool)

(assert (=> b!56469 (= e!37582 e!37583)))

(declare-fun res!46976 () Bool)

(assert (=> b!56469 (=> res!46976 e!37583)))

(assert (=> b!56469 (= res!46976 (= (size!1186 (buf!1555 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56470 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2609 array!2609 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56470 (= e!37583 (arrayBitRangesEq!0 (buf!1555 thiss!1379) (buf!1555 (_2!2684 lt!88437)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379))))))

(assert (= (and d!17976 res!46977) b!56468))

(assert (= (and b!56468 res!46975) b!56469))

(assert (= (and b!56469 (not res!46976)) b!56470))

(assert (=> b!56468 m!88923))

(assert (=> b!56468 m!88955))

(assert (=> b!56470 m!88923))

(assert (=> b!56470 m!88923))

(declare-fun m!88987 () Bool)

(assert (=> b!56470 m!88987))

(assert (=> b!56410 d!17976))

(declare-fun b!56516 () Bool)

(declare-fun res!47018 () Bool)

(declare-fun e!37607 () Bool)

(assert (=> b!56516 (=> (not res!47018) (not e!37607))))

(declare-fun lt!88584 () tuple2!5148)

(assert (=> b!56516 (= res!47018 (isPrefixOf!0 (_2!2685 lt!88584) (_2!2684 lt!88438)))))

(declare-fun b!56517 () Bool)

(declare-fun e!37606 () Unit!3899)

(declare-fun Unit!3902 () Unit!3899)

(assert (=> b!56517 (= e!37606 Unit!3902)))

(declare-fun b!56518 () Bool)

(declare-fun lt!88579 () Unit!3899)

(assert (=> b!56518 (= e!37606 lt!88579)))

(declare-fun lt!88575 () (_ BitVec 64))

(assert (=> b!56518 (= lt!88575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88581 () (_ BitVec 64))

(assert (=> b!56518 (= lt!88581 (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2609 array!2609 (_ BitVec 64) (_ BitVec 64)) Unit!3899)

(assert (=> b!56518 (= lt!88579 (arrayBitRangesEqSymmetric!0 (buf!1555 thiss!1379) (buf!1555 (_2!2684 lt!88438)) lt!88575 lt!88581))))

(assert (=> b!56518 (arrayBitRangesEq!0 (buf!1555 (_2!2684 lt!88438)) (buf!1555 thiss!1379) lt!88575 lt!88581)))

(declare-fun d!17978 () Bool)

(assert (=> d!17978 e!37607))

(declare-fun res!47019 () Bool)

(assert (=> d!17978 (=> (not res!47019) (not e!37607))))

(assert (=> d!17978 (= res!47019 (isPrefixOf!0 (_1!2685 lt!88584) (_2!2685 lt!88584)))))

(declare-fun lt!88577 () BitStream!2060)

(assert (=> d!17978 (= lt!88584 (tuple2!5149 lt!88577 (_2!2684 lt!88438)))))

(declare-fun lt!88583 () Unit!3899)

(declare-fun lt!88574 () Unit!3899)

(assert (=> d!17978 (= lt!88583 lt!88574)))

(assert (=> d!17978 (isPrefixOf!0 lt!88577 (_2!2684 lt!88438))))

(assert (=> d!17978 (= lt!88574 (lemmaIsPrefixTransitive!0 lt!88577 (_2!2684 lt!88438) (_2!2684 lt!88438)))))

(declare-fun lt!88573 () Unit!3899)

(declare-fun lt!88580 () Unit!3899)

(assert (=> d!17978 (= lt!88573 lt!88580)))

(assert (=> d!17978 (isPrefixOf!0 lt!88577 (_2!2684 lt!88438))))

(assert (=> d!17978 (= lt!88580 (lemmaIsPrefixTransitive!0 lt!88577 thiss!1379 (_2!2684 lt!88438)))))

(declare-fun lt!88578 () Unit!3899)

(assert (=> d!17978 (= lt!88578 e!37606)))

(declare-fun c!4059 () Bool)

(assert (=> d!17978 (= c!4059 (not (= (size!1186 (buf!1555 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!88572 () Unit!3899)

(declare-fun lt!88570 () Unit!3899)

(assert (=> d!17978 (= lt!88572 lt!88570)))

(assert (=> d!17978 (isPrefixOf!0 (_2!2684 lt!88438) (_2!2684 lt!88438))))

(assert (=> d!17978 (= lt!88570 (lemmaIsPrefixRefl!0 (_2!2684 lt!88438)))))

(declare-fun lt!88576 () Unit!3899)

(declare-fun lt!88566 () Unit!3899)

(assert (=> d!17978 (= lt!88576 lt!88566)))

(assert (=> d!17978 (= lt!88566 (lemmaIsPrefixRefl!0 (_2!2684 lt!88438)))))

(declare-fun lt!88569 () Unit!3899)

(declare-fun lt!88585 () Unit!3899)

(assert (=> d!17978 (= lt!88569 lt!88585)))

(assert (=> d!17978 (isPrefixOf!0 lt!88577 lt!88577)))

(assert (=> d!17978 (= lt!88585 (lemmaIsPrefixRefl!0 lt!88577))))

(declare-fun lt!88568 () Unit!3899)

(declare-fun lt!88567 () Unit!3899)

(assert (=> d!17978 (= lt!88568 lt!88567)))

(assert (=> d!17978 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17978 (= lt!88567 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17978 (= lt!88577 (BitStream!2061 (buf!1555 (_2!2684 lt!88438)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)))))

(assert (=> d!17978 (isPrefixOf!0 thiss!1379 (_2!2684 lt!88438))))

(assert (=> d!17978 (= (reader!0 thiss!1379 (_2!2684 lt!88438)) lt!88584)))

(declare-fun b!56519 () Bool)

(declare-fun res!47020 () Bool)

(assert (=> b!56519 (=> (not res!47020) (not e!37607))))

(assert (=> b!56519 (= res!47020 (isPrefixOf!0 (_1!2685 lt!88584) thiss!1379))))

(declare-fun lt!88571 () (_ BitVec 64))

(declare-fun b!56520 () Bool)

(declare-fun lt!88582 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2060 (_ BitVec 64)) BitStream!2060)

(assert (=> b!56520 (= e!37607 (= (_1!2685 lt!88584) (withMovedBitIndex!0 (_2!2685 lt!88584) (bvsub lt!88571 lt!88582))))))

(assert (=> b!56520 (or (= (bvand lt!88571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88571 lt!88582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56520 (= lt!88582 (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438))))))

(assert (=> b!56520 (= lt!88571 (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)))))

(assert (= (and d!17978 c!4059) b!56518))

(assert (= (and d!17978 (not c!4059)) b!56517))

(assert (= (and d!17978 res!47019) b!56519))

(assert (= (and b!56519 res!47020) b!56516))

(assert (= (and b!56516 res!47018) b!56520))

(declare-fun m!89023 () Bool)

(assert (=> b!56520 m!89023))

(assert (=> b!56520 m!88935))

(assert (=> b!56520 m!88923))

(declare-fun m!89025 () Bool)

(assert (=> b!56516 m!89025))

(assert (=> b!56518 m!88923))

(declare-fun m!89027 () Bool)

(assert (=> b!56518 m!89027))

(declare-fun m!89029 () Bool)

(assert (=> b!56518 m!89029))

(assert (=> d!17978 m!88919))

(assert (=> d!17978 m!88921))

(declare-fun m!89031 () Bool)

(assert (=> d!17978 m!89031))

(declare-fun m!89033 () Bool)

(assert (=> d!17978 m!89033))

(declare-fun m!89035 () Bool)

(assert (=> d!17978 m!89035))

(declare-fun m!89037 () Bool)

(assert (=> d!17978 m!89037))

(declare-fun m!89039 () Bool)

(assert (=> d!17978 m!89039))

(declare-fun m!89041 () Bool)

(assert (=> d!17978 m!89041))

(declare-fun m!89043 () Bool)

(assert (=> d!17978 m!89043))

(declare-fun m!89045 () Bool)

(assert (=> d!17978 m!89045))

(assert (=> d!17978 m!88949))

(declare-fun m!89047 () Bool)

(assert (=> b!56519 m!89047))

(assert (=> b!56410 d!17978))

(declare-fun d!17996 () Bool)

(assert (=> d!17996 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88588 () Unit!3899)

(declare-fun choose!9 (BitStream!2060 array!2609 (_ BitVec 64) BitStream!2060) Unit!3899)

(assert (=> d!17996 (= lt!88588 (choose!9 thiss!1379 (buf!1555 (_2!2684 lt!88438)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2061 (buf!1555 (_2!2684 lt!88438)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379))))))

(assert (=> d!17996 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1555 (_2!2684 lt!88438)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88588)))

(declare-fun bs!4503 () Bool)

(assert (= bs!4503 d!17996))

(assert (=> bs!4503 m!88905))

(declare-fun m!89049 () Bool)

(assert (=> bs!4503 m!89049))

(assert (=> b!56410 d!17996))

(declare-fun b!56595 () Bool)

(declare-fun e!37640 () Bool)

(declare-fun lt!88849 () (_ BitVec 64))

(assert (=> b!56595 (= e!37640 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438))) lt!88849))))

(declare-fun c!4068 () Bool)

(declare-fun lt!88852 () tuple2!5146)

(declare-fun bm!727 () Bool)

(declare-fun call!730 () tuple2!5148)

(assert (=> bm!727 (= call!730 (reader!0 (_2!2684 lt!88438) (ite c!4068 (_2!2684 lt!88852) (_2!2684 lt!88438))))))

(declare-fun b!56597 () Bool)

(declare-fun e!37642 () tuple2!5146)

(declare-fun Unit!3911 () Unit!3899)

(assert (=> b!56597 (= e!37642 (tuple2!5147 Unit!3911 (_2!2684 lt!88852)))))

(declare-fun lt!88878 () tuple2!5146)

(assert (=> b!56597 (= lt!88878 (appendBitFromByte!0 (_2!2684 lt!88438) (select (arr!1738 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!88882 () (_ BitVec 64))

(assert (=> b!56597 (= lt!88882 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88880 () (_ BitVec 64))

(assert (=> b!56597 (= lt!88880 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88875 () Unit!3899)

(assert (=> b!56597 (= lt!88875 (validateOffsetBitsIneqLemma!0 (_2!2684 lt!88438) (_2!2684 lt!88878) lt!88882 lt!88880))))

(assert (=> b!56597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88878)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88878))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88878))) (bvsub lt!88882 lt!88880))))

(declare-fun lt!88851 () Unit!3899)

(assert (=> b!56597 (= lt!88851 lt!88875)))

(declare-fun lt!88839 () tuple2!5148)

(assert (=> b!56597 (= lt!88839 (reader!0 (_2!2684 lt!88438) (_2!2684 lt!88878)))))

(declare-fun lt!88877 () (_ BitVec 64))

(assert (=> b!56597 (= lt!88877 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88841 () Unit!3899)

(assert (=> b!56597 (= lt!88841 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2684 lt!88438) (buf!1555 (_2!2684 lt!88878)) lt!88877))))

(assert (=> b!56597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88878)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438))) lt!88877)))

(declare-fun lt!88868 () Unit!3899)

(assert (=> b!56597 (= lt!88868 lt!88841)))

(assert (=> b!56597 (= (head!424 (byteArrayBitContentToList!0 (_2!2684 lt!88878) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!424 (bitStreamReadBitsIntoList!0 (_2!2684 lt!88878) (_1!2685 lt!88839) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88856 () Unit!3899)

(declare-fun Unit!3913 () Unit!3899)

(assert (=> b!56597 (= lt!88856 Unit!3913)))

(assert (=> b!56597 (= lt!88852 (appendBitsMSBFirstLoop!0 (_2!2684 lt!88878) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!88860 () Unit!3899)

(assert (=> b!56597 (= lt!88860 (lemmaIsPrefixTransitive!0 (_2!2684 lt!88438) (_2!2684 lt!88878) (_2!2684 lt!88852)))))

(assert (=> b!56597 (isPrefixOf!0 (_2!2684 lt!88438) (_2!2684 lt!88852))))

(declare-fun lt!88845 () Unit!3899)

(assert (=> b!56597 (= lt!88845 lt!88860)))

(assert (=> b!56597 (= (size!1186 (buf!1555 (_2!2684 lt!88852))) (size!1186 (buf!1555 (_2!2684 lt!88438))))))

(declare-fun lt!88853 () Unit!3899)

(declare-fun Unit!3915 () Unit!3899)

(assert (=> b!56597 (= lt!88853 Unit!3915)))

(assert (=> b!56597 (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88852))) (currentByte!3149 (_2!2684 lt!88852)) (currentBit!3144 (_2!2684 lt!88852))) (bvsub (bvadd (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88863 () Unit!3899)

(declare-fun Unit!3917 () Unit!3899)

(assert (=> b!56597 (= lt!88863 Unit!3917)))

(assert (=> b!56597 (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88852))) (currentByte!3149 (_2!2684 lt!88852)) (currentBit!3144 (_2!2684 lt!88852))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88878))) (currentByte!3149 (_2!2684 lt!88878)) (currentBit!3144 (_2!2684 lt!88878))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88864 () Unit!3899)

(declare-fun Unit!3920 () Unit!3899)

(assert (=> b!56597 (= lt!88864 Unit!3920)))

(declare-fun lt!88855 () tuple2!5148)

(assert (=> b!56597 (= lt!88855 call!730)))

(declare-fun lt!88858 () (_ BitVec 64))

(assert (=> b!56597 (= lt!88858 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88859 () Unit!3899)

(assert (=> b!56597 (= lt!88859 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2684 lt!88438) (buf!1555 (_2!2684 lt!88852)) lt!88858))))

(assert (=> b!56597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88852)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438))) lt!88858)))

(declare-fun lt!88842 () Unit!3899)

(assert (=> b!56597 (= lt!88842 lt!88859)))

(declare-fun lt!88870 () tuple2!5148)

(assert (=> b!56597 (= lt!88870 (reader!0 (_2!2684 lt!88878) (_2!2684 lt!88852)))))

(declare-fun lt!88879 () (_ BitVec 64))

(assert (=> b!56597 (= lt!88879 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88844 () Unit!3899)

(assert (=> b!56597 (= lt!88844 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2684 lt!88878) (buf!1555 (_2!2684 lt!88852)) lt!88879))))

(assert (=> b!56597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88852)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88878))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88878))) lt!88879)))

(declare-fun lt!88848 () Unit!3899)

(assert (=> b!56597 (= lt!88848 lt!88844)))

(declare-fun lt!88866 () List!605)

(assert (=> b!56597 (= lt!88866 (byteArrayBitContentToList!0 (_2!2684 lt!88852) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!88874 () List!605)

(assert (=> b!56597 (= lt!88874 (byteArrayBitContentToList!0 (_2!2684 lt!88852) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88850 () List!605)

(assert (=> b!56597 (= lt!88850 (bitStreamReadBitsIntoList!0 (_2!2684 lt!88852) (_1!2685 lt!88855) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!88854 () List!605)

(assert (=> b!56597 (= lt!88854 (bitStreamReadBitsIntoList!0 (_2!2684 lt!88852) (_1!2685 lt!88870) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88865 () (_ BitVec 64))

(assert (=> b!56597 (= lt!88865 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88862 () Unit!3899)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2060 BitStream!2060 BitStream!2060 BitStream!2060 (_ BitVec 64) List!605) Unit!3899)

(assert (=> b!56597 (= lt!88862 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2684 lt!88852) (_2!2684 lt!88852) (_1!2685 lt!88855) (_1!2685 lt!88870) lt!88865 lt!88850))))

(declare-fun tail!272 (List!605) List!605)

(assert (=> b!56597 (= (bitStreamReadBitsIntoList!0 (_2!2684 lt!88852) (_1!2685 lt!88870) (bvsub lt!88865 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!272 lt!88850))))

(declare-fun lt!88847 () Unit!3899)

(assert (=> b!56597 (= lt!88847 lt!88862)))

(declare-fun lt!88881 () (_ BitVec 64))

(declare-fun lt!88846 () Unit!3899)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2609 array!2609 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3899)

(assert (=> b!56597 (= lt!88846 (arrayBitRangesEqImpliesEq!0 (buf!1555 (_2!2684 lt!88878)) (buf!1555 (_2!2684 lt!88852)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!88881 (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88878))) (currentByte!3149 (_2!2684 lt!88878)) (currentBit!3144 (_2!2684 lt!88878)))))))

(declare-fun bitAt!0 (array!2609 (_ BitVec 64)) Bool)

(assert (=> b!56597 (= (bitAt!0 (buf!1555 (_2!2684 lt!88878)) lt!88881) (bitAt!0 (buf!1555 (_2!2684 lt!88852)) lt!88881))))

(declare-fun lt!88867 () Unit!3899)

(assert (=> b!56597 (= lt!88867 lt!88846)))

(declare-fun b!56598 () Bool)

(declare-fun lt!88857 () tuple2!5146)

(declare-fun e!37641 () Bool)

(declare-fun lt!88876 () tuple2!5148)

(assert (=> b!56598 (= e!37641 (= (bitStreamReadBitsIntoList!0 (_2!2684 lt!88857) (_1!2685 lt!88876) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2684 lt!88857) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!56598 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56598 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!88861 () Unit!3899)

(declare-fun lt!88869 () Unit!3899)

(assert (=> b!56598 (= lt!88861 lt!88869)))

(assert (=> b!56598 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88857)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438))) lt!88849)))

(assert (=> b!56598 (= lt!88869 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2684 lt!88438) (buf!1555 (_2!2684 lt!88857)) lt!88849))))

(assert (=> b!56598 e!37640))

(declare-fun res!47081 () Bool)

(assert (=> b!56598 (=> (not res!47081) (not e!37640))))

(assert (=> b!56598 (= res!47081 (and (= (size!1186 (buf!1555 (_2!2684 lt!88438))) (size!1186 (buf!1555 (_2!2684 lt!88857)))) (bvsge lt!88849 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56598 (= lt!88849 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!56598 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56598 (= lt!88876 (reader!0 (_2!2684 lt!88438) (_2!2684 lt!88857)))))

(declare-fun b!56599 () Bool)

(declare-fun res!47083 () Bool)

(assert (=> b!56599 (=> (not res!47083) (not e!37641))))

(assert (=> b!56599 (= res!47083 (= (size!1186 (buf!1555 (_2!2684 lt!88438))) (size!1186 (buf!1555 (_2!2684 lt!88857)))))))

(declare-fun b!56600 () Bool)

(declare-fun res!47080 () Bool)

(assert (=> b!56600 (=> (not res!47080) (not e!37641))))

(assert (=> b!56600 (= res!47080 (= (size!1186 (buf!1555 (_2!2684 lt!88857))) (size!1186 (buf!1555 (_2!2684 lt!88438)))))))

(declare-fun b!56596 () Bool)

(declare-fun Unit!3923 () Unit!3899)

(assert (=> b!56596 (= e!37642 (tuple2!5147 Unit!3923 (_2!2684 lt!88438)))))

(assert (=> b!56596 (= (size!1186 (buf!1555 (_2!2684 lt!88438))) (size!1186 (buf!1555 (_2!2684 lt!88438))))))

(declare-fun lt!88843 () Unit!3899)

(declare-fun Unit!3924 () Unit!3899)

(assert (=> b!56596 (= lt!88843 Unit!3924)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2060 array!2609 array!2609 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5162 0))(
  ( (tuple2!5163 (_1!2692 array!2609) (_2!2692 BitStream!2060)) )
))
(declare-fun readBits!0 (BitStream!2060 (_ BitVec 64)) tuple2!5162)

(assert (=> b!56596 (checkByteArrayBitContent!0 (_2!2684 lt!88438) srcBuffer!2 (_1!2692 (readBits!0 (_1!2685 call!730) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!17998 () Bool)

(assert (=> d!17998 e!37641))

(declare-fun res!47078 () Bool)

(assert (=> d!17998 (=> (not res!47078) (not e!37641))))

(declare-fun lt!88873 () (_ BitVec 64))

(assert (=> d!17998 (= res!47078 (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88857))) (currentByte!3149 (_2!2684 lt!88857)) (currentBit!3144 (_2!2684 lt!88857))) (bvsub lt!88873 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17998 (or (= (bvand lt!88873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88873 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!88840 () (_ BitVec 64))

(assert (=> d!17998 (= lt!88873 (bvadd lt!88840 to!314))))

(assert (=> d!17998 (or (not (= (bvand lt!88840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!88840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!88840 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17998 (= lt!88840 (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438))))))

(assert (=> d!17998 (= lt!88857 e!37642)))

(assert (=> d!17998 (= c!4068 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!88872 () Unit!3899)

(declare-fun lt!88871 () Unit!3899)

(assert (=> d!17998 (= lt!88872 lt!88871)))

(assert (=> d!17998 (isPrefixOf!0 (_2!2684 lt!88438) (_2!2684 lt!88438))))

(assert (=> d!17998 (= lt!88871 (lemmaIsPrefixRefl!0 (_2!2684 lt!88438)))))

(assert (=> d!17998 (= lt!88881 (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438))))))

(assert (=> d!17998 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17998 (= (appendBitsMSBFirstLoop!0 (_2!2684 lt!88438) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!88857)))

(declare-fun b!56601 () Bool)

(declare-fun res!47079 () Bool)

(assert (=> b!56601 (=> (not res!47079) (not e!37641))))

(assert (=> b!56601 (= res!47079 (invariant!0 (currentBit!3144 (_2!2684 lt!88857)) (currentByte!3149 (_2!2684 lt!88857)) (size!1186 (buf!1555 (_2!2684 lt!88857)))))))

(declare-fun b!56602 () Bool)

(declare-fun res!47082 () Bool)

(assert (=> b!56602 (=> (not res!47082) (not e!37641))))

(assert (=> b!56602 (= res!47082 (isPrefixOf!0 (_2!2684 lt!88438) (_2!2684 lt!88857)))))

(assert (= (and d!17998 c!4068) b!56597))

(assert (= (and d!17998 (not c!4068)) b!56596))

(assert (= (or b!56597 b!56596) bm!727))

(assert (= (and d!17998 res!47078) b!56601))

(assert (= (and b!56601 res!47079) b!56599))

(assert (= (and b!56599 res!47083) b!56602))

(assert (= (and b!56602 res!47082) b!56600))

(assert (= (and b!56600 res!47080) b!56598))

(assert (= (and b!56598 res!47081) b!56595))

(declare-fun m!89139 () Bool)

(assert (=> b!56595 m!89139))

(declare-fun m!89141 () Bool)

(assert (=> b!56598 m!89141))

(declare-fun m!89143 () Bool)

(assert (=> b!56598 m!89143))

(declare-fun m!89145 () Bool)

(assert (=> b!56598 m!89145))

(declare-fun m!89147 () Bool)

(assert (=> b!56598 m!89147))

(declare-fun m!89149 () Bool)

(assert (=> b!56598 m!89149))

(declare-fun m!89151 () Bool)

(assert (=> bm!727 m!89151))

(declare-fun m!89153 () Bool)

(assert (=> b!56602 m!89153))

(declare-fun m!89155 () Bool)

(assert (=> d!17998 m!89155))

(assert (=> d!17998 m!88935))

(assert (=> d!17998 m!89037))

(assert (=> d!17998 m!89041))

(declare-fun m!89157 () Bool)

(assert (=> b!56596 m!89157))

(declare-fun m!89159 () Bool)

(assert (=> b!56596 m!89159))

(declare-fun m!89161 () Bool)

(assert (=> b!56601 m!89161))

(declare-fun m!89163 () Bool)

(assert (=> b!56597 m!89163))

(declare-fun m!89165 () Bool)

(assert (=> b!56597 m!89165))

(declare-fun m!89167 () Bool)

(assert (=> b!56597 m!89167))

(declare-fun m!89169 () Bool)

(assert (=> b!56597 m!89169))

(declare-fun m!89171 () Bool)

(assert (=> b!56597 m!89171))

(declare-fun m!89173 () Bool)

(assert (=> b!56597 m!89173))

(declare-fun m!89175 () Bool)

(assert (=> b!56597 m!89175))

(declare-fun m!89177 () Bool)

(assert (=> b!56597 m!89177))

(declare-fun m!89179 () Bool)

(assert (=> b!56597 m!89179))

(assert (=> b!56597 m!89167))

(declare-fun m!89181 () Bool)

(assert (=> b!56597 m!89181))

(declare-fun m!89183 () Bool)

(assert (=> b!56597 m!89183))

(declare-fun m!89185 () Bool)

(assert (=> b!56597 m!89185))

(declare-fun m!89187 () Bool)

(assert (=> b!56597 m!89187))

(declare-fun m!89189 () Bool)

(assert (=> b!56597 m!89189))

(declare-fun m!89191 () Bool)

(assert (=> b!56597 m!89191))

(declare-fun m!89193 () Bool)

(assert (=> b!56597 m!89193))

(declare-fun m!89195 () Bool)

(assert (=> b!56597 m!89195))

(declare-fun m!89197 () Bool)

(assert (=> b!56597 m!89197))

(assert (=> b!56597 m!89183))

(declare-fun m!89199 () Bool)

(assert (=> b!56597 m!89199))

(declare-fun m!89201 () Bool)

(assert (=> b!56597 m!89201))

(declare-fun m!89203 () Bool)

(assert (=> b!56597 m!89203))

(declare-fun m!89205 () Bool)

(assert (=> b!56597 m!89205))

(declare-fun m!89207 () Bool)

(assert (=> b!56597 m!89207))

(declare-fun m!89209 () Bool)

(assert (=> b!56597 m!89209))

(declare-fun m!89211 () Bool)

(assert (=> b!56597 m!89211))

(declare-fun m!89213 () Bool)

(assert (=> b!56597 m!89213))

(declare-fun m!89215 () Bool)

(assert (=> b!56597 m!89215))

(declare-fun m!89217 () Bool)

(assert (=> b!56597 m!89217))

(assert (=> b!56597 m!89187))

(declare-fun m!89219 () Bool)

(assert (=> b!56597 m!89219))

(assert (=> b!56597 m!89177))

(declare-fun m!89221 () Bool)

(assert (=> b!56597 m!89221))

(assert (=> b!56597 m!88935))

(declare-fun m!89223 () Bool)

(assert (=> b!56597 m!89223))

(assert (=> b!56410 d!17998))

(declare-fun d!18014 () Bool)

(declare-fun res!47086 () Bool)

(declare-fun e!37643 () Bool)

(assert (=> d!18014 (=> (not res!47086) (not e!37643))))

(assert (=> d!18014 (= res!47086 (= (size!1186 (buf!1555 (_2!2684 lt!88438))) (size!1186 (buf!1555 (_2!2684 lt!88437)))))))

(assert (=> d!18014 (= (isPrefixOf!0 (_2!2684 lt!88438) (_2!2684 lt!88437)) e!37643)))

(declare-fun b!56603 () Bool)

(declare-fun res!47084 () Bool)

(assert (=> b!56603 (=> (not res!47084) (not e!37643))))

(assert (=> b!56603 (= res!47084 (bvsle (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438))) (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88437))) (currentByte!3149 (_2!2684 lt!88437)) (currentBit!3144 (_2!2684 lt!88437)))))))

(declare-fun b!56604 () Bool)

(declare-fun e!37644 () Bool)

(assert (=> b!56604 (= e!37643 e!37644)))

(declare-fun res!47085 () Bool)

(assert (=> b!56604 (=> res!47085 e!37644)))

(assert (=> b!56604 (= res!47085 (= (size!1186 (buf!1555 (_2!2684 lt!88438))) #b00000000000000000000000000000000))))

(declare-fun b!56605 () Bool)

(assert (=> b!56605 (= e!37644 (arrayBitRangesEq!0 (buf!1555 (_2!2684 lt!88438)) (buf!1555 (_2!2684 lt!88437)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438)))))))

(assert (= (and d!18014 res!47086) b!56603))

(assert (= (and b!56603 res!47084) b!56604))

(assert (= (and b!56604 (not res!47085)) b!56605))

(assert (=> b!56603 m!88935))

(assert (=> b!56603 m!88955))

(assert (=> b!56605 m!88935))

(assert (=> b!56605 m!88935))

(declare-fun m!89225 () Bool)

(assert (=> b!56605 m!89225))

(assert (=> b!56410 d!18014))

(declare-fun d!18016 () Bool)

(assert (=> d!18016 (isPrefixOf!0 thiss!1379 (_2!2684 lt!88437))))

(declare-fun lt!88885 () Unit!3899)

(declare-fun choose!30 (BitStream!2060 BitStream!2060 BitStream!2060) Unit!3899)

(assert (=> d!18016 (= lt!88885 (choose!30 thiss!1379 (_2!2684 lt!88438) (_2!2684 lt!88437)))))

(assert (=> d!18016 (isPrefixOf!0 thiss!1379 (_2!2684 lt!88438))))

(assert (=> d!18016 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2684 lt!88438) (_2!2684 lt!88437)) lt!88885)))

(declare-fun bs!4507 () Bool)

(assert (= bs!4507 d!18016))

(assert (=> bs!4507 m!88917))

(declare-fun m!89227 () Bool)

(assert (=> bs!4507 m!89227))

(assert (=> bs!4507 m!88949))

(assert (=> b!56410 d!18016))

(declare-fun d!18018 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18018 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4508 () Bool)

(assert (= bs!4508 d!18018))

(declare-fun m!89229 () Bool)

(assert (=> bs!4508 m!89229))

(assert (=> b!56410 d!18018))

(declare-fun d!18020 () Bool)

(declare-fun e!37647 () Bool)

(assert (=> d!18020 e!37647))

(declare-fun res!47092 () Bool)

(assert (=> d!18020 (=> (not res!47092) (not e!37647))))

(declare-fun lt!88902 () (_ BitVec 64))

(declare-fun lt!88899 () (_ BitVec 64))

(declare-fun lt!88898 () (_ BitVec 64))

(assert (=> d!18020 (= res!47092 (= lt!88902 (bvsub lt!88899 lt!88898)))))

(assert (=> d!18020 (or (= (bvand lt!88899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88899 lt!88898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18020 (= lt!88898 (remainingBits!0 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438)))))))

(declare-fun lt!88900 () (_ BitVec 64))

(declare-fun lt!88903 () (_ BitVec 64))

(assert (=> d!18020 (= lt!88899 (bvmul lt!88900 lt!88903))))

(assert (=> d!18020 (or (= lt!88900 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!88903 (bvsdiv (bvmul lt!88900 lt!88903) lt!88900)))))

(assert (=> d!18020 (= lt!88903 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18020 (= lt!88900 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))))))

(assert (=> d!18020 (= lt!88902 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438)))))))

(assert (=> d!18020 (invariant!0 (currentBit!3144 (_2!2684 lt!88438)) (currentByte!3149 (_2!2684 lt!88438)) (size!1186 (buf!1555 (_2!2684 lt!88438))))))

(assert (=> d!18020 (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438))) lt!88902)))

(declare-fun b!56610 () Bool)

(declare-fun res!47091 () Bool)

(assert (=> b!56610 (=> (not res!47091) (not e!37647))))

(assert (=> b!56610 (= res!47091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!88902))))

(declare-fun b!56611 () Bool)

(declare-fun lt!88901 () (_ BitVec 64))

(assert (=> b!56611 (= e!37647 (bvsle lt!88902 (bvmul lt!88901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56611 (or (= lt!88901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!88901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!88901)))))

(assert (=> b!56611 (= lt!88901 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))))))

(assert (= (and d!18020 res!47092) b!56610))

(assert (= (and b!56610 res!47091) b!56611))

(declare-fun m!89231 () Bool)

(assert (=> d!18020 m!89231))

(declare-fun m!89233 () Bool)

(assert (=> d!18020 m!89233))

(assert (=> b!56405 d!18020))

(declare-fun d!18022 () Bool)

(assert (=> d!18022 (= (array_inv!1089 srcBuffer!2) (bvsge (size!1186 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11380 d!18022))

(declare-fun d!18024 () Bool)

(assert (=> d!18024 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3144 thiss!1379) (currentByte!3149 thiss!1379) (size!1186 (buf!1555 thiss!1379))))))

(declare-fun bs!4509 () Bool)

(assert (= bs!4509 d!18024))

(declare-fun m!89235 () Bool)

(assert (=> bs!4509 m!89235))

(assert (=> start!11380 d!18024))

(declare-fun d!18026 () Bool)

(assert (=> d!18026 (= (head!424 (byteArrayBitContentToList!0 (_2!2684 lt!88438) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!720 (byteArrayBitContentToList!0 (_2!2684 lt!88438) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56404 d!18026))

(declare-fun d!18028 () Bool)

(declare-fun c!4071 () Bool)

(assert (=> d!18028 (= c!4071 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37650 () List!605)

(assert (=> d!18028 (= (byteArrayBitContentToList!0 (_2!2684 lt!88438) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37650)))

(declare-fun b!56616 () Bool)

(assert (=> b!56616 (= e!37650 Nil!602)))

(declare-fun b!56617 () Bool)

(assert (=> b!56617 (= e!37650 (Cons!601 (not (= (bvand ((_ sign_extend 24) (select (arr!1738 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2684 lt!88438) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18028 c!4071) b!56616))

(assert (= (and d!18028 (not c!4071)) b!56617))

(assert (=> b!56617 m!88943))

(declare-fun m!89237 () Bool)

(assert (=> b!56617 m!89237))

(declare-fun m!89239 () Bool)

(assert (=> b!56617 m!89239))

(assert (=> b!56404 d!18028))

(declare-fun d!18030 () Bool)

(assert (=> d!18030 (= (head!424 (bitStreamReadBitsIntoList!0 (_2!2684 lt!88438) (_1!2685 lt!88435) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!720 (bitStreamReadBitsIntoList!0 (_2!2684 lt!88438) (_1!2685 lt!88435) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56404 d!18030))

(declare-fun b!56632 () Bool)

(declare-fun e!37658 () Bool)

(declare-fun lt!88990 () List!605)

(declare-fun isEmpty!170 (List!605) Bool)

(assert (=> b!56632 (= e!37658 (isEmpty!170 lt!88990))))

(declare-fun b!56633 () Bool)

(declare-fun length!284 (List!605) Int)

(assert (=> b!56633 (= e!37658 (> (length!284 lt!88990) 0))))

(declare-fun b!56630 () Bool)

(declare-datatypes ((tuple2!5168 0))(
  ( (tuple2!5169 (_1!2695 List!605) (_2!2695 BitStream!2060)) )
))
(declare-fun e!37657 () tuple2!5168)

(assert (=> b!56630 (= e!37657 (tuple2!5169 Nil!602 (_1!2685 lt!88435)))))

(declare-fun lt!88992 () (_ BitVec 64))

(declare-fun b!56631 () Bool)

(declare-datatypes ((tuple2!5170 0))(
  ( (tuple2!5171 (_1!2696 Bool) (_2!2696 BitStream!2060)) )
))
(declare-fun lt!88991 () tuple2!5170)

(assert (=> b!56631 (= e!37657 (tuple2!5169 (Cons!601 (_1!2696 lt!88991) (bitStreamReadBitsIntoList!0 (_2!2684 lt!88438) (_2!2696 lt!88991) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!88992))) (_2!2696 lt!88991)))))

(declare-fun readBit!0 (BitStream!2060) tuple2!5170)

(assert (=> b!56631 (= lt!88991 (readBit!0 (_1!2685 lt!88435)))))

(assert (=> b!56631 (= lt!88992 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!18032 () Bool)

(assert (=> d!18032 e!37658))

(declare-fun c!4079 () Bool)

(assert (=> d!18032 (= c!4079 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18032 (= lt!88990 (_1!2695 e!37657))))

(declare-fun c!4078 () Bool)

(assert (=> d!18032 (= c!4078 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18032 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18032 (= (bitStreamReadBitsIntoList!0 (_2!2684 lt!88438) (_1!2685 lt!88435) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88990)))

(assert (= (and d!18032 c!4078) b!56630))

(assert (= (and d!18032 (not c!4078)) b!56631))

(assert (= (and d!18032 c!4079) b!56632))

(assert (= (and d!18032 (not c!4079)) b!56633))

(declare-fun m!89241 () Bool)

(assert (=> b!56632 m!89241))

(declare-fun m!89243 () Bool)

(assert (=> b!56633 m!89243))

(declare-fun m!89245 () Bool)

(assert (=> b!56631 m!89245))

(declare-fun m!89247 () Bool)

(assert (=> b!56631 m!89247))

(assert (=> b!56404 d!18032))

(declare-fun d!18034 () Bool)

(assert (=> d!18034 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 thiss!1379))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1186 (buf!1555 thiss!1379))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4510 () Bool)

(assert (= bs!4510 d!18034))

(declare-fun m!89249 () Bool)

(assert (=> bs!4510 m!89249))

(assert (=> b!56409 d!18034))

(declare-fun d!18036 () Bool)

(declare-fun e!37659 () Bool)

(assert (=> d!18036 e!37659))

(declare-fun res!47094 () Bool)

(assert (=> d!18036 (=> (not res!47094) (not e!37659))))

(declare-fun lt!88997 () (_ BitVec 64))

(declare-fun lt!88998 () (_ BitVec 64))

(declare-fun lt!89001 () (_ BitVec 64))

(assert (=> d!18036 (= res!47094 (= lt!89001 (bvsub lt!88998 lt!88997)))))

(assert (=> d!18036 (or (= (bvand lt!88998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88997 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88998 lt!88997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18036 (= lt!88997 (remainingBits!0 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88437)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88437))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88437)))))))

(declare-fun lt!88999 () (_ BitVec 64))

(declare-fun lt!89002 () (_ BitVec 64))

(assert (=> d!18036 (= lt!88998 (bvmul lt!88999 lt!89002))))

(assert (=> d!18036 (or (= lt!88999 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89002 (bvsdiv (bvmul lt!88999 lt!89002) lt!88999)))))

(assert (=> d!18036 (= lt!89002 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18036 (= lt!88999 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88437)))))))

(assert (=> d!18036 (= lt!89001 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88437))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88437)))))))

(assert (=> d!18036 (invariant!0 (currentBit!3144 (_2!2684 lt!88437)) (currentByte!3149 (_2!2684 lt!88437)) (size!1186 (buf!1555 (_2!2684 lt!88437))))))

(assert (=> d!18036 (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88437))) (currentByte!3149 (_2!2684 lt!88437)) (currentBit!3144 (_2!2684 lt!88437))) lt!89001)))

(declare-fun b!56634 () Bool)

(declare-fun res!47093 () Bool)

(assert (=> b!56634 (=> (not res!47093) (not e!37659))))

(assert (=> b!56634 (= res!47093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89001))))

(declare-fun b!56635 () Bool)

(declare-fun lt!89000 () (_ BitVec 64))

(assert (=> b!56635 (= e!37659 (bvsle lt!89001 (bvmul lt!89000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56635 (or (= lt!89000 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89000 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89000)))))

(assert (=> b!56635 (= lt!89000 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88437)))))))

(assert (= (and d!18036 res!47094) b!56634))

(assert (= (and b!56634 res!47093) b!56635))

(declare-fun m!89251 () Bool)

(assert (=> d!18036 m!89251))

(assert (=> d!18036 m!88951))

(assert (=> b!56407 d!18036))

(declare-fun d!18038 () Bool)

(assert (=> d!18038 (= (array_inv!1089 (buf!1555 thiss!1379)) (bvsge (size!1186 (buf!1555 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!56408 d!18038))

(declare-fun d!18040 () Bool)

(assert (=> d!18040 (= (invariant!0 (currentBit!3144 (_2!2684 lt!88437)) (currentByte!3149 (_2!2684 lt!88437)) (size!1186 (buf!1555 (_2!2684 lt!88437)))) (and (bvsge (currentBit!3144 (_2!2684 lt!88437)) #b00000000000000000000000000000000) (bvslt (currentBit!3144 (_2!2684 lt!88437)) #b00000000000000000000000000001000) (bvsge (currentByte!3149 (_2!2684 lt!88437)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3149 (_2!2684 lt!88437)) (size!1186 (buf!1555 (_2!2684 lt!88437)))) (and (= (currentBit!3144 (_2!2684 lt!88437)) #b00000000000000000000000000000000) (= (currentByte!3149 (_2!2684 lt!88437)) (size!1186 (buf!1555 (_2!2684 lt!88437))))))))))

(assert (=> b!56413 d!18040))

(declare-fun d!18042 () Bool)

(declare-fun res!47098 () Bool)

(declare-fun e!37662 () Bool)

(assert (=> d!18042 (=> (not res!47098) (not e!37662))))

(assert (=> d!18042 (= res!47098 (= (size!1186 (buf!1555 thiss!1379)) (size!1186 (buf!1555 (_2!2684 lt!88438)))))))

(assert (=> d!18042 (= (isPrefixOf!0 thiss!1379 (_2!2684 lt!88438)) e!37662)))

(declare-fun b!56640 () Bool)

(declare-fun res!47095 () Bool)

(assert (=> b!56640 (=> (not res!47095) (not e!37662))))

(assert (=> b!56640 (= res!47095 (bvsle (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)) (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!88438))) (currentByte!3149 (_2!2684 lt!88438)) (currentBit!3144 (_2!2684 lt!88438)))))))

(declare-fun b!56641 () Bool)

(declare-fun e!37665 () Bool)

(assert (=> b!56641 (= e!37662 e!37665)))

(declare-fun res!47096 () Bool)

(assert (=> b!56641 (=> res!47096 e!37665)))

(assert (=> b!56641 (= res!47096 (= (size!1186 (buf!1555 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56642 () Bool)

(assert (=> b!56642 (= e!37665 (arrayBitRangesEq!0 (buf!1555 thiss!1379) (buf!1555 (_2!2684 lt!88438)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379))))))

(assert (= (and d!18042 res!47098) b!56640))

(assert (= (and b!56640 res!47095) b!56641))

(assert (= (and b!56641 (not res!47096)) b!56642))

(assert (=> b!56640 m!88923))

(assert (=> b!56640 m!88935))

(assert (=> b!56642 m!88923))

(assert (=> b!56642 m!88923))

(declare-fun m!89253 () Bool)

(assert (=> b!56642 m!89253))

(assert (=> b!56411 d!18042))

(declare-fun d!18044 () Bool)

(assert (=> d!18044 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4511 () Bool)

(assert (= bs!4511 d!18044))

(assert (=> bs!4511 m!89231))

(assert (=> b!56411 d!18044))

(declare-fun d!18046 () Bool)

(declare-fun e!37670 () Bool)

(assert (=> d!18046 e!37670))

(declare-fun res!47112 () Bool)

(assert (=> d!18046 (=> (not res!47112) (not e!37670))))

(assert (=> d!18046 (= res!47112 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!89085 () Unit!3899)

(declare-fun choose!27 (BitStream!2060 BitStream!2060 (_ BitVec 64) (_ BitVec 64)) Unit!3899)

(assert (=> d!18046 (= lt!89085 (choose!27 thiss!1379 (_2!2684 lt!88438) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18046 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18046 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2684 lt!88438) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89085)))

(declare-fun b!56657 () Bool)

(assert (=> b!56657 (= e!37670 (validate_offset_bits!1 ((_ sign_extend 32) (size!1186 (buf!1555 (_2!2684 lt!88438)))) ((_ sign_extend 32) (currentByte!3149 (_2!2684 lt!88438))) ((_ sign_extend 32) (currentBit!3144 (_2!2684 lt!88438))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18046 res!47112) b!56657))

(declare-fun m!89255 () Bool)

(assert (=> d!18046 m!89255))

(assert (=> b!56657 m!88945))

(assert (=> b!56411 d!18046))

(declare-fun b!56740 () Bool)

(declare-fun res!47178 () Bool)

(declare-fun e!37710 () Bool)

(assert (=> b!56740 (=> (not res!47178) (not e!37710))))

(declare-fun lt!89261 () tuple2!5146)

(assert (=> b!56740 (= res!47178 (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!89261))) (currentByte!3149 (_2!2684 lt!89261)) (currentBit!3144 (_2!2684 lt!89261))) (bvadd (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!18048 () Bool)

(declare-fun e!37712 () Bool)

(assert (=> d!18048 e!37712))

(declare-fun res!47176 () Bool)

(assert (=> d!18048 (=> (not res!47176) (not e!37712))))

(declare-fun lt!89262 () tuple2!5146)

(assert (=> d!18048 (= res!47176 (= (size!1186 (buf!1555 (_2!2684 lt!89262))) (size!1186 (buf!1555 thiss!1379))))))

(declare-fun lt!89269 () (_ BitVec 8))

(declare-fun lt!89259 () array!2609)

(assert (=> d!18048 (= lt!89269 (select (arr!1738 lt!89259) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18048 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1186 lt!89259)))))

(assert (=> d!18048 (= lt!89259 (array!2610 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!89267 () tuple2!5146)

(assert (=> d!18048 (= lt!89262 (tuple2!5147 (_1!2684 lt!89267) (_2!2684 lt!89267)))))

(assert (=> d!18048 (= lt!89267 lt!89261)))

(assert (=> d!18048 e!37710))

(declare-fun res!47177 () Bool)

(assert (=> d!18048 (=> (not res!47177) (not e!37710))))

(assert (=> d!18048 (= res!47177 (= (size!1186 (buf!1555 thiss!1379)) (size!1186 (buf!1555 (_2!2684 lt!89261)))))))

(declare-fun lt!89264 () Bool)

(declare-fun appendBit!0 (BitStream!2060 Bool) tuple2!5146)

(assert (=> d!18048 (= lt!89261 (appendBit!0 thiss!1379 lt!89264))))

(assert (=> d!18048 (= lt!89264 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1738 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18048 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18048 (= (appendBitFromByte!0 thiss!1379 (select (arr!1738 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!89262)))

(declare-fun b!56741 () Bool)

(declare-fun res!47175 () Bool)

(assert (=> b!56741 (=> (not res!47175) (not e!37712))))

(assert (=> b!56741 (= res!47175 (isPrefixOf!0 thiss!1379 (_2!2684 lt!89262)))))

(declare-fun b!56742 () Bool)

(declare-fun e!37709 () Bool)

(declare-datatypes ((tuple2!5172 0))(
  ( (tuple2!5173 (_1!2697 BitStream!2060) (_2!2697 Bool)) )
))
(declare-fun lt!89258 () tuple2!5172)

(assert (=> b!56742 (= e!37709 (= (bitIndex!0 (size!1186 (buf!1555 (_1!2697 lt!89258))) (currentByte!3149 (_1!2697 lt!89258)) (currentBit!3144 (_1!2697 lt!89258))) (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!89261))) (currentByte!3149 (_2!2684 lt!89261)) (currentBit!3144 (_2!2684 lt!89261)))))))

(declare-fun b!56743 () Bool)

(declare-fun e!37711 () Bool)

(assert (=> b!56743 (= e!37712 e!37711)))

(declare-fun res!47174 () Bool)

(assert (=> b!56743 (=> (not res!47174) (not e!37711))))

(declare-fun lt!89263 () tuple2!5172)

(assert (=> b!56743 (= res!47174 (and (= (_2!2697 lt!89263) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1738 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!89269)) #b00000000000000000000000000000000))) (= (_1!2697 lt!89263) (_2!2684 lt!89262))))))

(declare-fun lt!89268 () tuple2!5162)

(declare-fun lt!89266 () BitStream!2060)

(assert (=> b!56743 (= lt!89268 (readBits!0 lt!89266 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2060) tuple2!5172)

(assert (=> b!56743 (= lt!89263 (readBitPure!0 lt!89266))))

(declare-fun readerFrom!0 (BitStream!2060 (_ BitVec 32) (_ BitVec 32)) BitStream!2060)

(assert (=> b!56743 (= lt!89266 (readerFrom!0 (_2!2684 lt!89262) (currentBit!3144 thiss!1379) (currentByte!3149 thiss!1379)))))

(declare-fun b!56744 () Bool)

(assert (=> b!56744 (= e!37711 (= (bitIndex!0 (size!1186 (buf!1555 (_1!2697 lt!89263))) (currentByte!3149 (_1!2697 lt!89263)) (currentBit!3144 (_1!2697 lt!89263))) (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!89262))) (currentByte!3149 (_2!2684 lt!89262)) (currentBit!3144 (_2!2684 lt!89262)))))))

(declare-fun b!56745 () Bool)

(declare-fun res!47172 () Bool)

(assert (=> b!56745 (=> (not res!47172) (not e!37710))))

(assert (=> b!56745 (= res!47172 (isPrefixOf!0 thiss!1379 (_2!2684 lt!89261)))))

(declare-fun b!56746 () Bool)

(declare-fun res!47179 () Bool)

(assert (=> b!56746 (=> (not res!47179) (not e!37712))))

(declare-fun lt!89260 () (_ BitVec 64))

(declare-fun lt!89265 () (_ BitVec 64))

(assert (=> b!56746 (= res!47179 (= (bitIndex!0 (size!1186 (buf!1555 (_2!2684 lt!89262))) (currentByte!3149 (_2!2684 lt!89262)) (currentBit!3144 (_2!2684 lt!89262))) (bvadd lt!89260 lt!89265)))))

(assert (=> b!56746 (or (not (= (bvand lt!89260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89265 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!89260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!89260 lt!89265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56746 (= lt!89265 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!56746 (= lt!89260 (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)))))

(declare-fun b!56747 () Bool)

(assert (=> b!56747 (= e!37710 e!37709)))

(declare-fun res!47173 () Bool)

(assert (=> b!56747 (=> (not res!47173) (not e!37709))))

(assert (=> b!56747 (= res!47173 (and (= (_2!2697 lt!89258) lt!89264) (= (_1!2697 lt!89258) (_2!2684 lt!89261))))))

(assert (=> b!56747 (= lt!89258 (readBitPure!0 (readerFrom!0 (_2!2684 lt!89261) (currentBit!3144 thiss!1379) (currentByte!3149 thiss!1379))))))

(assert (= (and d!18048 res!47177) b!56740))

(assert (= (and b!56740 res!47178) b!56745))

(assert (= (and b!56745 res!47172) b!56747))

(assert (= (and b!56747 res!47173) b!56742))

(assert (= (and d!18048 res!47176) b!56746))

(assert (= (and b!56746 res!47179) b!56741))

(assert (= (and b!56741 res!47175) b!56743))

(assert (= (and b!56743 res!47174) b!56744))

(declare-fun m!89461 () Bool)

(assert (=> b!56742 m!89461))

(declare-fun m!89463 () Bool)

(assert (=> b!56742 m!89463))

(declare-fun m!89465 () Bool)

(assert (=> b!56744 m!89465))

(declare-fun m!89467 () Bool)

(assert (=> b!56744 m!89467))

(assert (=> b!56746 m!89467))

(assert (=> b!56746 m!88923))

(assert (=> b!56740 m!89463))

(assert (=> b!56740 m!88923))

(declare-fun m!89469 () Bool)

(assert (=> b!56747 m!89469))

(assert (=> b!56747 m!89469))

(declare-fun m!89471 () Bool)

(assert (=> b!56747 m!89471))

(declare-fun m!89473 () Bool)

(assert (=> d!18048 m!89473))

(declare-fun m!89475 () Bool)

(assert (=> d!18048 m!89475))

(assert (=> d!18048 m!89237))

(declare-fun m!89477 () Bool)

(assert (=> b!56741 m!89477))

(declare-fun m!89479 () Bool)

(assert (=> b!56745 m!89479))

(declare-fun m!89481 () Bool)

(assert (=> b!56743 m!89481))

(declare-fun m!89483 () Bool)

(assert (=> b!56743 m!89483))

(declare-fun m!89485 () Bool)

(assert (=> b!56743 m!89485))

(assert (=> b!56411 d!18048))

(declare-fun d!18088 () Bool)

(declare-fun res!47182 () Bool)

(declare-fun e!37713 () Bool)

(assert (=> d!18088 (=> (not res!47182) (not e!37713))))

(assert (=> d!18088 (= res!47182 (= (size!1186 (buf!1555 thiss!1379)) (size!1186 (buf!1555 thiss!1379))))))

(assert (=> d!18088 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37713)))

(declare-fun b!56748 () Bool)

(declare-fun res!47180 () Bool)

(assert (=> b!56748 (=> (not res!47180) (not e!37713))))

(assert (=> b!56748 (= res!47180 (bvsle (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)) (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379))))))

(declare-fun b!56749 () Bool)

(declare-fun e!37714 () Bool)

(assert (=> b!56749 (= e!37713 e!37714)))

(declare-fun res!47181 () Bool)

(assert (=> b!56749 (=> res!47181 e!37714)))

(assert (=> b!56749 (= res!47181 (= (size!1186 (buf!1555 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56750 () Bool)

(assert (=> b!56750 (= e!37714 (arrayBitRangesEq!0 (buf!1555 thiss!1379) (buf!1555 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379))))))

(assert (= (and d!18088 res!47182) b!56748))

(assert (= (and b!56748 res!47180) b!56749))

(assert (= (and b!56749 (not res!47181)) b!56750))

(assert (=> b!56748 m!88923))

(assert (=> b!56748 m!88923))

(assert (=> b!56750 m!88923))

(assert (=> b!56750 m!88923))

(declare-fun m!89487 () Bool)

(assert (=> b!56750 m!89487))

(assert (=> b!56412 d!18088))

(declare-fun d!18090 () Bool)

(assert (=> d!18090 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!89272 () Unit!3899)

(declare-fun choose!11 (BitStream!2060) Unit!3899)

(assert (=> d!18090 (= lt!89272 (choose!11 thiss!1379))))

(assert (=> d!18090 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!89272)))

(declare-fun bs!4520 () Bool)

(assert (= bs!4520 d!18090))

(assert (=> bs!4520 m!88919))

(declare-fun m!89489 () Bool)

(assert (=> bs!4520 m!89489))

(assert (=> b!56412 d!18090))

(declare-fun d!18092 () Bool)

(declare-fun e!37715 () Bool)

(assert (=> d!18092 e!37715))

(declare-fun res!47184 () Bool)

(assert (=> d!18092 (=> (not res!47184) (not e!37715))))

(declare-fun lt!89273 () (_ BitVec 64))

(declare-fun lt!89277 () (_ BitVec 64))

(declare-fun lt!89274 () (_ BitVec 64))

(assert (=> d!18092 (= res!47184 (= lt!89277 (bvsub lt!89274 lt!89273)))))

(assert (=> d!18092 (or (= (bvand lt!89274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89274 lt!89273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18092 (= lt!89273 (remainingBits!0 ((_ sign_extend 32) (size!1186 (buf!1555 thiss!1379))) ((_ sign_extend 32) (currentByte!3149 thiss!1379)) ((_ sign_extend 32) (currentBit!3144 thiss!1379))))))

(declare-fun lt!89275 () (_ BitVec 64))

(declare-fun lt!89278 () (_ BitVec 64))

(assert (=> d!18092 (= lt!89274 (bvmul lt!89275 lt!89278))))

(assert (=> d!18092 (or (= lt!89275 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89278 (bvsdiv (bvmul lt!89275 lt!89278) lt!89275)))))

(assert (=> d!18092 (= lt!89278 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18092 (= lt!89275 ((_ sign_extend 32) (size!1186 (buf!1555 thiss!1379))))))

(assert (=> d!18092 (= lt!89277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3149 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3144 thiss!1379))))))

(assert (=> d!18092 (invariant!0 (currentBit!3144 thiss!1379) (currentByte!3149 thiss!1379) (size!1186 (buf!1555 thiss!1379)))))

(assert (=> d!18092 (= (bitIndex!0 (size!1186 (buf!1555 thiss!1379)) (currentByte!3149 thiss!1379) (currentBit!3144 thiss!1379)) lt!89277)))

(declare-fun b!56751 () Bool)

(declare-fun res!47183 () Bool)

(assert (=> b!56751 (=> (not res!47183) (not e!37715))))

(assert (=> b!56751 (= res!47183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89277))))

(declare-fun b!56752 () Bool)

(declare-fun lt!89276 () (_ BitVec 64))

(assert (=> b!56752 (= e!37715 (bvsle lt!89277 (bvmul lt!89276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56752 (or (= lt!89276 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89276 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89276)))))

(assert (=> b!56752 (= lt!89276 ((_ sign_extend 32) (size!1186 (buf!1555 thiss!1379))))))

(assert (= (and d!18092 res!47184) b!56751))

(assert (= (and b!56751 res!47183) b!56752))

(assert (=> d!18092 m!89249))

(assert (=> d!18092 m!89235))

(assert (=> b!56412 d!18092))

(push 1)

