; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10454 () Bool)

(assert start!10454)

(declare-fun b!52519 () Bool)

(declare-fun res!43838 () Bool)

(declare-fun e!34948 () Bool)

(assert (=> b!52519 (=> (not res!43838) (not e!34948))))

(declare-datatypes ((array!2475 0))(
  ( (array!2476 (arr!1668 (Array (_ BitVec 32) (_ BitVec 8))) (size!1132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1956 0))(
  ( (BitStream!1957 (buf!1482 array!2475) (currentByte!3025 (_ BitVec 32)) (currentBit!3020 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1956)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52519 (= res!43838 (validate_offset_bits!1 ((_ sign_extend 32) (size!1132 (buf!1482 thiss!1379))) ((_ sign_extend 32) (currentByte!3025 thiss!1379)) ((_ sign_extend 32) (currentBit!3020 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2475)

(declare-fun b!52521 () Bool)

(declare-fun e!34945 () Bool)

(declare-datatypes ((Unit!3668 0))(
  ( (Unit!3669) )
))
(declare-datatypes ((tuple2!4774 0))(
  ( (tuple2!4775 (_1!2492 Unit!3668) (_2!2492 BitStream!1956)) )
))
(declare-fun appendBitFromByte!0 (BitStream!1956 (_ BitVec 8) (_ BitVec 32)) tuple2!4774)

(assert (=> b!52521 (= e!34945 (= (size!1132 (buf!1482 thiss!1379)) (size!1132 (buf!1482 (_2!2492 (appendBitFromByte!0 thiss!1379 (select (arr!1668 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))))))

(declare-fun b!52522 () Bool)

(declare-fun e!34949 () Bool)

(declare-fun array_inv!1037 (array!2475) Bool)

(assert (=> b!52522 (= e!34949 (array_inv!1037 (buf!1482 thiss!1379)))))

(declare-fun res!43839 () Bool)

(assert (=> start!10454 (=> (not res!43839) (not e!34948))))

(assert (=> start!10454 (= res!43839 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1132 srcBuffer!2))))))))

(assert (=> start!10454 e!34948))

(assert (=> start!10454 true))

(assert (=> start!10454 (array_inv!1037 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1956) Bool)

(assert (=> start!10454 (and (inv!12 thiss!1379) e!34949)))

(declare-fun b!52520 () Bool)

(assert (=> b!52520 (= e!34948 (not e!34945))))

(declare-fun res!43837 () Bool)

(assert (=> b!52520 (=> res!43837 e!34945)))

(assert (=> b!52520 (= res!43837 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1956 BitStream!1956) Bool)

(assert (=> b!52520 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81483 () Unit!3668)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1956) Unit!3668)

(assert (=> b!52520 (= lt!81483 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52520 (= lt!81484 (bitIndex!0 (size!1132 (buf!1482 thiss!1379)) (currentByte!3025 thiss!1379) (currentBit!3020 thiss!1379)))))

(assert (= (and start!10454 res!43839) b!52519))

(assert (= (and b!52519 res!43838) b!52520))

(assert (= (and b!52520 (not res!43837)) b!52521))

(assert (= start!10454 b!52522))

(declare-fun m!82903 () Bool)

(assert (=> b!52522 m!82903))

(declare-fun m!82905 () Bool)

(assert (=> b!52519 m!82905))

(declare-fun m!82907 () Bool)

(assert (=> b!52521 m!82907))

(assert (=> b!52521 m!82907))

(declare-fun m!82909 () Bool)

(assert (=> b!52521 m!82909))

(declare-fun m!82911 () Bool)

(assert (=> b!52520 m!82911))

(declare-fun m!82913 () Bool)

(assert (=> b!52520 m!82913))

(declare-fun m!82915 () Bool)

(assert (=> b!52520 m!82915))

(declare-fun m!82917 () Bool)

(assert (=> start!10454 m!82917))

(declare-fun m!82919 () Bool)

(assert (=> start!10454 m!82919))

(check-sat (not b!52519) (not b!52522) (not b!52521) (not b!52520) (not start!10454))
(check-sat)
(get-model)

(declare-fun d!16638 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1132 (buf!1482 thiss!1379))) ((_ sign_extend 32) (currentByte!3025 thiss!1379)) ((_ sign_extend 32) (currentBit!3020 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1132 (buf!1482 thiss!1379))) ((_ sign_extend 32) (currentByte!3025 thiss!1379)) ((_ sign_extend 32) (currentBit!3020 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4215 () Bool)

(assert (= bs!4215 d!16638))

(declare-fun m!82939 () Bool)

(assert (=> bs!4215 m!82939))

(assert (=> b!52519 d!16638))

(declare-fun d!16640 () Bool)

(declare-fun res!43856 () Bool)

(declare-fun e!34969 () Bool)

(assert (=> d!16640 (=> (not res!43856) (not e!34969))))

(assert (=> d!16640 (= res!43856 (= (size!1132 (buf!1482 thiss!1379)) (size!1132 (buf!1482 thiss!1379))))))

(assert (=> d!16640 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!34969)))

(declare-fun b!52541 () Bool)

(declare-fun res!43857 () Bool)

(assert (=> b!52541 (=> (not res!43857) (not e!34969))))

(assert (=> b!52541 (= res!43857 (bvsle (bitIndex!0 (size!1132 (buf!1482 thiss!1379)) (currentByte!3025 thiss!1379) (currentBit!3020 thiss!1379)) (bitIndex!0 (size!1132 (buf!1482 thiss!1379)) (currentByte!3025 thiss!1379) (currentBit!3020 thiss!1379))))))

(declare-fun b!52542 () Bool)

(declare-fun e!34970 () Bool)

(assert (=> b!52542 (= e!34969 e!34970)))

(declare-fun res!43855 () Bool)

(assert (=> b!52542 (=> res!43855 e!34970)))

(assert (=> b!52542 (= res!43855 (= (size!1132 (buf!1482 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52543 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2475 array!2475 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52543 (= e!34970 (arrayBitRangesEq!0 (buf!1482 thiss!1379) (buf!1482 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1132 (buf!1482 thiss!1379)) (currentByte!3025 thiss!1379) (currentBit!3020 thiss!1379))))))

(assert (= (and d!16640 res!43856) b!52541))

(assert (= (and b!52541 res!43857) b!52542))

(assert (= (and b!52542 (not res!43855)) b!52543))

(assert (=> b!52541 m!82915))

(assert (=> b!52541 m!82915))

(assert (=> b!52543 m!82915))

(assert (=> b!52543 m!82915))

(declare-fun m!82941 () Bool)

(assert (=> b!52543 m!82941))

(assert (=> b!52520 d!16640))

(declare-fun d!16642 () Bool)

(assert (=> d!16642 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81493 () Unit!3668)

(declare-fun choose!11 (BitStream!1956) Unit!3668)

(assert (=> d!16642 (= lt!81493 (choose!11 thiss!1379))))

(assert (=> d!16642 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81493)))

(declare-fun bs!4217 () Bool)

(assert (= bs!4217 d!16642))

(assert (=> bs!4217 m!82911))

(declare-fun m!82943 () Bool)

(assert (=> bs!4217 m!82943))

(assert (=> b!52520 d!16642))

(declare-fun d!16644 () Bool)

(declare-fun e!34973 () Bool)

(assert (=> d!16644 e!34973))

(declare-fun res!43862 () Bool)

(assert (=> d!16644 (=> (not res!43862) (not e!34973))))

(declare-fun lt!81510 () (_ BitVec 64))

(declare-fun lt!81511 () (_ BitVec 64))

(declare-fun lt!81508 () (_ BitVec 64))

(assert (=> d!16644 (= res!43862 (= lt!81508 (bvsub lt!81511 lt!81510)))))

(assert (=> d!16644 (or (= (bvand lt!81511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81511 lt!81510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16644 (= lt!81510 (remainingBits!0 ((_ sign_extend 32) (size!1132 (buf!1482 thiss!1379))) ((_ sign_extend 32) (currentByte!3025 thiss!1379)) ((_ sign_extend 32) (currentBit!3020 thiss!1379))))))

(declare-fun lt!81507 () (_ BitVec 64))

(declare-fun lt!81506 () (_ BitVec 64))

(assert (=> d!16644 (= lt!81511 (bvmul lt!81507 lt!81506))))

(assert (=> d!16644 (or (= lt!81507 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81506 (bvsdiv (bvmul lt!81507 lt!81506) lt!81507)))))

(assert (=> d!16644 (= lt!81506 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16644 (= lt!81507 ((_ sign_extend 32) (size!1132 (buf!1482 thiss!1379))))))

(assert (=> d!16644 (= lt!81508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3025 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3020 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16644 (invariant!0 (currentBit!3020 thiss!1379) (currentByte!3025 thiss!1379) (size!1132 (buf!1482 thiss!1379)))))

(assert (=> d!16644 (= (bitIndex!0 (size!1132 (buf!1482 thiss!1379)) (currentByte!3025 thiss!1379) (currentBit!3020 thiss!1379)) lt!81508)))

(declare-fun b!52548 () Bool)

(declare-fun res!43863 () Bool)

(assert (=> b!52548 (=> (not res!43863) (not e!34973))))

(assert (=> b!52548 (= res!43863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81508))))

(declare-fun b!52549 () Bool)

(declare-fun lt!81509 () (_ BitVec 64))

(assert (=> b!52549 (= e!34973 (bvsle lt!81508 (bvmul lt!81509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52549 (or (= lt!81509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81509)))))

(assert (=> b!52549 (= lt!81509 ((_ sign_extend 32) (size!1132 (buf!1482 thiss!1379))))))

(assert (= (and d!16644 res!43862) b!52548))

(assert (= (and b!52548 res!43863) b!52549))

(assert (=> d!16644 m!82939))

(declare-fun m!82945 () Bool)

(assert (=> d!16644 m!82945))

(assert (=> b!52520 d!16644))

(declare-fun b!52607 () Bool)

(declare-fun res!43922 () Bool)

(declare-fun e!35004 () Bool)

(assert (=> b!52607 (=> (not res!43922) (not e!35004))))

(declare-fun lt!81601 () tuple2!4774)

(assert (=> b!52607 (= res!43922 (isPrefixOf!0 thiss!1379 (_2!2492 lt!81601)))))

(declare-fun b!52608 () Bool)

(declare-fun e!35003 () Bool)

(declare-datatypes ((tuple2!4778 0))(
  ( (tuple2!4779 (_1!2494 BitStream!1956) (_2!2494 Bool)) )
))
(declare-fun lt!81596 () tuple2!4778)

(assert (=> b!52608 (= e!35003 (= (bitIndex!0 (size!1132 (buf!1482 (_1!2494 lt!81596))) (currentByte!3025 (_1!2494 lt!81596)) (currentBit!3020 (_1!2494 lt!81596))) (bitIndex!0 (size!1132 (buf!1482 (_2!2492 lt!81601))) (currentByte!3025 (_2!2492 lt!81601)) (currentBit!3020 (_2!2492 lt!81601)))))))

(declare-fun b!52609 () Bool)

(declare-fun e!35005 () Bool)

(declare-fun e!35006 () Bool)

(assert (=> b!52609 (= e!35005 e!35006)))

(declare-fun res!43920 () Bool)

(assert (=> b!52609 (=> (not res!43920) (not e!35006))))

(declare-fun lt!81599 () tuple2!4778)

(declare-fun lt!81604 () Bool)

(declare-fun lt!81595 () tuple2!4774)

(assert (=> b!52609 (= res!43920 (and (= (_2!2494 lt!81599) lt!81604) (= (_1!2494 lt!81599) (_2!2492 lt!81595))))))

(declare-fun readBitPure!0 (BitStream!1956) tuple2!4778)

(declare-fun readerFrom!0 (BitStream!1956 (_ BitVec 32) (_ BitVec 32)) BitStream!1956)

(assert (=> b!52609 (= lt!81599 (readBitPure!0 (readerFrom!0 (_2!2492 lt!81595) (currentBit!3020 thiss!1379) (currentByte!3025 thiss!1379))))))

(declare-fun b!52610 () Bool)

(declare-fun res!43924 () Bool)

(assert (=> b!52610 (=> (not res!43924) (not e!35004))))

(declare-fun lt!81594 () (_ BitVec 64))

(declare-fun lt!81600 () (_ BitVec 64))

(assert (=> b!52610 (= res!43924 (= (bitIndex!0 (size!1132 (buf!1482 (_2!2492 lt!81601))) (currentByte!3025 (_2!2492 lt!81601)) (currentBit!3020 (_2!2492 lt!81601))) (bvadd lt!81594 lt!81600)))))

(assert (=> b!52610 (or (not (= (bvand lt!81594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81600 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!81594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!81594 lt!81600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52610 (= lt!81600 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!52610 (= lt!81594 (bitIndex!0 (size!1132 (buf!1482 thiss!1379)) (currentByte!3025 thiss!1379) (currentBit!3020 thiss!1379)))))

(declare-fun d!16648 () Bool)

(assert (=> d!16648 e!35004))

(declare-fun res!43921 () Bool)

(assert (=> d!16648 (=> (not res!43921) (not e!35004))))

(assert (=> d!16648 (= res!43921 (= (size!1132 (buf!1482 (_2!2492 lt!81601))) (size!1132 (buf!1482 thiss!1379))))))

(declare-fun lt!81603 () (_ BitVec 8))

(declare-fun lt!81597 () array!2475)

(assert (=> d!16648 (= lt!81603 (select (arr!1668 lt!81597) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16648 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1132 lt!81597)))))

(assert (=> d!16648 (= lt!81597 (array!2476 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!81602 () tuple2!4774)

(assert (=> d!16648 (= lt!81601 (tuple2!4775 (_1!2492 lt!81602) (_2!2492 lt!81602)))))

(assert (=> d!16648 (= lt!81602 lt!81595)))

(assert (=> d!16648 e!35005))

(declare-fun res!43923 () Bool)

(assert (=> d!16648 (=> (not res!43923) (not e!35005))))

(assert (=> d!16648 (= res!43923 (= (size!1132 (buf!1482 thiss!1379)) (size!1132 (buf!1482 (_2!2492 lt!81595)))))))

(declare-fun appendBit!0 (BitStream!1956 Bool) tuple2!4774)

(assert (=> d!16648 (= lt!81595 (appendBit!0 thiss!1379 lt!81604))))

(assert (=> d!16648 (= lt!81604 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1668 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16648 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16648 (= (appendBitFromByte!0 thiss!1379 (select (arr!1668 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!81601)))

(declare-fun b!52611 () Bool)

(assert (=> b!52611 (= e!35006 (= (bitIndex!0 (size!1132 (buf!1482 (_1!2494 lt!81599))) (currentByte!3025 (_1!2494 lt!81599)) (currentBit!3020 (_1!2494 lt!81599))) (bitIndex!0 (size!1132 (buf!1482 (_2!2492 lt!81595))) (currentByte!3025 (_2!2492 lt!81595)) (currentBit!3020 (_2!2492 lt!81595)))))))

(declare-fun b!52612 () Bool)

(declare-fun res!43919 () Bool)

(assert (=> b!52612 (=> (not res!43919) (not e!35005))))

(assert (=> b!52612 (= res!43919 (isPrefixOf!0 thiss!1379 (_2!2492 lt!81595)))))

(declare-fun b!52613 () Bool)

(declare-fun res!43926 () Bool)

(assert (=> b!52613 (=> (not res!43926) (not e!35005))))

(assert (=> b!52613 (= res!43926 (= (bitIndex!0 (size!1132 (buf!1482 (_2!2492 lt!81595))) (currentByte!3025 (_2!2492 lt!81595)) (currentBit!3020 (_2!2492 lt!81595))) (bvadd (bitIndex!0 (size!1132 (buf!1482 thiss!1379)) (currentByte!3025 thiss!1379) (currentBit!3020 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!52614 () Bool)

(assert (=> b!52614 (= e!35004 e!35003)))

(declare-fun res!43925 () Bool)

(assert (=> b!52614 (=> (not res!43925) (not e!35003))))

(assert (=> b!52614 (= res!43925 (and (= (_2!2494 lt!81596) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1668 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!81603)) #b00000000000000000000000000000000))) (= (_1!2494 lt!81596) (_2!2492 lt!81601))))))

(declare-datatypes ((tuple2!4780 0))(
  ( (tuple2!4781 (_1!2495 array!2475) (_2!2495 BitStream!1956)) )
))
(declare-fun lt!81593 () tuple2!4780)

(declare-fun lt!81598 () BitStream!1956)

(declare-fun readBits!0 (BitStream!1956 (_ BitVec 64)) tuple2!4780)

(assert (=> b!52614 (= lt!81593 (readBits!0 lt!81598 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!52614 (= lt!81596 (readBitPure!0 lt!81598))))

(assert (=> b!52614 (= lt!81598 (readerFrom!0 (_2!2492 lt!81601) (currentBit!3020 thiss!1379) (currentByte!3025 thiss!1379)))))

(assert (= (and d!16648 res!43923) b!52613))

(assert (= (and b!52613 res!43926) b!52612))

(assert (= (and b!52612 res!43919) b!52609))

(assert (= (and b!52609 res!43920) b!52611))

(assert (= (and d!16648 res!43921) b!52610))

(assert (= (and b!52610 res!43924) b!52607))

(assert (= (and b!52607 res!43922) b!52614))

(assert (= (and b!52614 res!43925) b!52608))

(declare-fun m!82979 () Bool)

(assert (=> b!52609 m!82979))

(assert (=> b!52609 m!82979))

(declare-fun m!82985 () Bool)

(assert (=> b!52609 m!82985))

(declare-fun m!82987 () Bool)

(assert (=> b!52610 m!82987))

(assert (=> b!52610 m!82915))

(declare-fun m!82989 () Bool)

(assert (=> b!52607 m!82989))

(declare-fun m!82991 () Bool)

(assert (=> b!52608 m!82991))

(assert (=> b!52608 m!82987))

(declare-fun m!82993 () Bool)

(assert (=> b!52614 m!82993))

(declare-fun m!82995 () Bool)

(assert (=> b!52614 m!82995))

(declare-fun m!82997 () Bool)

(assert (=> b!52614 m!82997))

(declare-fun m!82999 () Bool)

(assert (=> b!52612 m!82999))

(declare-fun m!83001 () Bool)

(assert (=> b!52613 m!83001))

(assert (=> b!52613 m!82915))

(declare-fun m!83003 () Bool)

(assert (=> b!52611 m!83003))

(assert (=> b!52611 m!83001))

(declare-fun m!83005 () Bool)

(assert (=> d!16648 m!83005))

(declare-fun m!83007 () Bool)

(assert (=> d!16648 m!83007))

(declare-fun m!83009 () Bool)

(assert (=> d!16648 m!83009))

(assert (=> b!52521 d!16648))

(declare-fun d!16662 () Bool)

(assert (=> d!16662 (= (array_inv!1037 (buf!1482 thiss!1379)) (bvsge (size!1132 (buf!1482 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52522 d!16662))

(declare-fun d!16666 () Bool)

(assert (=> d!16666 (= (array_inv!1037 srcBuffer!2) (bvsge (size!1132 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10454 d!16666))

(declare-fun d!16668 () Bool)

(assert (=> d!16668 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3020 thiss!1379) (currentByte!3025 thiss!1379) (size!1132 (buf!1482 thiss!1379))))))

(declare-fun bs!4221 () Bool)

(assert (= bs!4221 d!16668))

(assert (=> bs!4221 m!82945))

(assert (=> start!10454 d!16668))

(check-sat (not b!52608) (not b!52612) (not b!52614) (not b!52541) (not d!16642) (not d!16638) (not b!52543) (not d!16648) (not b!52613) (not b!52607) (not b!52610) (not b!52611) (not d!16644) (not b!52609) (not d!16668))
