; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10452 () Bool)

(assert start!10452)

(declare-fun res!43830 () Bool)

(declare-fun e!34931 () Bool)

(assert (=> start!10452 (=> (not res!43830) (not e!34931))))

(declare-datatypes ((array!2473 0))(
  ( (array!2474 (arr!1667 (Array (_ BitVec 32) (_ BitVec 8))) (size!1131 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2473)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10452 (= res!43830 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1131 srcBuffer!2))))))))

(assert (=> start!10452 e!34931))

(assert (=> start!10452 true))

(declare-fun array_inv!1036 (array!2473) Bool)

(assert (=> start!10452 (array_inv!1036 srcBuffer!2)))

(declare-datatypes ((BitStream!1954 0))(
  ( (BitStream!1955 (buf!1481 array!2473) (currentByte!3024 (_ BitVec 32)) (currentBit!3019 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1954)

(declare-fun e!34932 () Bool)

(declare-fun inv!12 (BitStream!1954) Bool)

(assert (=> start!10452 (and (inv!12 thiss!1379) e!34932)))

(declare-fun b!52507 () Bool)

(declare-fun res!43829 () Bool)

(assert (=> b!52507 (=> (not res!43829) (not e!34931))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52507 (= res!43829 (validate_offset_bits!1 ((_ sign_extend 32) (size!1131 (buf!1481 thiss!1379))) ((_ sign_extend 32) (currentByte!3024 thiss!1379)) ((_ sign_extend 32) (currentBit!3019 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52510 () Bool)

(assert (=> b!52510 (= e!34932 (array_inv!1036 (buf!1481 thiss!1379)))))

(declare-fun b!52508 () Bool)

(declare-fun e!34930 () Bool)

(assert (=> b!52508 (= e!34931 (not e!34930))))

(declare-fun res!43828 () Bool)

(assert (=> b!52508 (=> res!43828 e!34930)))

(assert (=> b!52508 (= res!43828 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1954 BitStream!1954) Bool)

(assert (=> b!52508 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3666 0))(
  ( (Unit!3667) )
))
(declare-fun lt!81478 () Unit!3666)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1954) Unit!3666)

(assert (=> b!52508 (= lt!81478 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81477 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52508 (= lt!81477 (bitIndex!0 (size!1131 (buf!1481 thiss!1379)) (currentByte!3024 thiss!1379) (currentBit!3019 thiss!1379)))))

(declare-fun b!52509 () Bool)

(declare-datatypes ((tuple2!4772 0))(
  ( (tuple2!4773 (_1!2491 Unit!3666) (_2!2491 BitStream!1954)) )
))
(declare-fun appendBitFromByte!0 (BitStream!1954 (_ BitVec 8) (_ BitVec 32)) tuple2!4772)

(assert (=> b!52509 (= e!34930 (= (size!1131 (buf!1481 thiss!1379)) (size!1131 (buf!1481 (_2!2491 (appendBitFromByte!0 thiss!1379 (select (arr!1667 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))))))

(assert (= (and start!10452 res!43830) b!52507))

(assert (= (and b!52507 res!43829) b!52508))

(assert (= (and b!52508 (not res!43828)) b!52509))

(assert (= start!10452 b!52510))

(declare-fun m!82885 () Bool)

(assert (=> b!52507 m!82885))

(declare-fun m!82887 () Bool)

(assert (=> b!52508 m!82887))

(declare-fun m!82889 () Bool)

(assert (=> b!52508 m!82889))

(declare-fun m!82891 () Bool)

(assert (=> b!52508 m!82891))

(declare-fun m!82893 () Bool)

(assert (=> start!10452 m!82893))

(declare-fun m!82895 () Bool)

(assert (=> start!10452 m!82895))

(declare-fun m!82897 () Bool)

(assert (=> b!52510 m!82897))

(declare-fun m!82899 () Bool)

(assert (=> b!52509 m!82899))

(assert (=> b!52509 m!82899))

(declare-fun m!82901 () Bool)

(assert (=> b!52509 m!82901))

(push 1)

(assert (not start!10452))

(assert (not b!52510))

(assert (not b!52508))

(assert (not b!52509))

(assert (not b!52507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!52599 () Bool)

(declare-fun res!43912 () Bool)

(declare-fun e!35002 () Bool)

(assert (=> b!52599 (=> (not res!43912) (not e!35002))))

(declare-fun lt!81592 () tuple2!4772)

(assert (=> b!52599 (= res!43912 (isPrefixOf!0 thiss!1379 (_2!2491 lt!81592)))))

(declare-fun b!52600 () Bool)

(declare-fun e!35000 () Bool)

(declare-fun e!34999 () Bool)

(assert (=> b!52600 (= e!35000 e!34999)))

(declare-fun res!43913 () Bool)

(assert (=> b!52600 (=> (not res!43913) (not e!34999))))

(declare-fun lt!81588 () tuple2!4772)

(declare-fun lt!81582 () Bool)

(declare-datatypes ((tuple2!4782 0))(
  ( (tuple2!4783 (_1!2496 BitStream!1954) (_2!2496 Bool)) )
))
(declare-fun lt!81584 () tuple2!4782)

(assert (=> b!52600 (= res!43913 (and (= (_2!2496 lt!81584) lt!81582) (= (_1!2496 lt!81584) (_2!2491 lt!81588))))))

(declare-fun readBitPure!0 (BitStream!1954) tuple2!4782)

(declare-fun readerFrom!0 (BitStream!1954 (_ BitVec 32) (_ BitVec 32)) BitStream!1954)

(assert (=> b!52600 (= lt!81584 (readBitPure!0 (readerFrom!0 (_2!2491 lt!81588) (currentBit!3019 thiss!1379) (currentByte!3024 thiss!1379))))))

(declare-fun b!52601 () Bool)

(assert (=> b!52601 (= e!34999 (= (bitIndex!0 (size!1131 (buf!1481 (_1!2496 lt!81584))) (currentByte!3024 (_1!2496 lt!81584)) (currentBit!3019 (_1!2496 lt!81584))) (bitIndex!0 (size!1131 (buf!1481 (_2!2491 lt!81588))) (currentByte!3024 (_2!2491 lt!81588)) (currentBit!3019 (_2!2491 lt!81588)))))))

(declare-fun b!52602 () Bool)

(declare-fun e!35001 () Bool)

(assert (=> b!52602 (= e!35002 e!35001)))

(declare-fun res!43915 () Bool)

(assert (=> b!52602 (=> (not res!43915) (not e!35001))))

(declare-fun lt!81590 () tuple2!4782)

(declare-fun lt!81583 () (_ BitVec 8))

(assert (=> b!52602 (= res!43915 (and (= (_2!2496 lt!81590) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1667 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!81583)) #b00000000000000000000000000000000))) (= (_1!2496 lt!81590) (_2!2491 lt!81592))))))

(declare-datatypes ((tuple2!4784 0))(
  ( (tuple2!4785 (_1!2497 array!2473) (_2!2497 BitStream!1954)) )
))
(declare-fun lt!81589 () tuple2!4784)

(declare-fun lt!81581 () BitStream!1954)

(declare-fun readBits!0 (BitStream!1954 (_ BitVec 64)) tuple2!4784)

(assert (=> b!52602 (= lt!81589 (readBits!0 lt!81581 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!52602 (= lt!81590 (readBitPure!0 lt!81581))))

(assert (=> b!52602 (= lt!81581 (readerFrom!0 (_2!2491 lt!81592) (currentBit!3019 thiss!1379) (currentByte!3024 thiss!1379)))))

(declare-fun b!52603 () Bool)

(assert (=> b!52603 (= e!35001 (= (bitIndex!0 (size!1131 (buf!1481 (_1!2496 lt!81590))) (currentByte!3024 (_1!2496 lt!81590)) (currentBit!3019 (_1!2496 lt!81590))) (bitIndex!0 (size!1131 (buf!1481 (_2!2491 lt!81592))) (currentByte!3024 (_2!2491 lt!81592)) (currentBit!3019 (_2!2491 lt!81592)))))))

(declare-fun d!16646 () Bool)

(assert (=> d!16646 e!35002))

(declare-fun res!43917 () Bool)

(assert (=> d!16646 (=> (not res!43917) (not e!35002))))

(assert (=> d!16646 (= res!43917 (= (size!1131 (buf!1481 (_2!2491 lt!81592))) (size!1131 (buf!1481 thiss!1379))))))

(declare-fun lt!81586 () array!2473)

(assert (=> d!16646 (= lt!81583 (select (arr!1667 lt!81586) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16646 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1131 lt!81586)))))

(assert (=> d!16646 (= lt!81586 (array!2474 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!81587 () tuple2!4772)

(assert (=> d!16646 (= lt!81592 (tuple2!4773 (_1!2491 lt!81587) (_2!2491 lt!81587)))))

(assert (=> d!16646 (= lt!81587 lt!81588)))

(assert (=> d!16646 e!35000))

(declare-fun res!43911 () Bool)

(assert (=> d!16646 (=> (not res!43911) (not e!35000))))

(assert (=> d!16646 (= res!43911 (= (size!1131 (buf!1481 thiss!1379)) (size!1131 (buf!1481 (_2!2491 lt!81588)))))))

(declare-fun appendBit!0 (BitStream!1954 Bool) tuple2!4772)

(assert (=> d!16646 (= lt!81588 (appendBit!0 thiss!1379 lt!81582))))

(assert (=> d!16646 (= lt!81582 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1667 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16646 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16646 (= (appendBitFromByte!0 thiss!1379 (select (arr!1667 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!81592)))

(declare-fun b!52604 () Bool)

(declare-fun res!43918 () Bool)

(assert (=> b!52604 (=> (not res!43918) (not e!35000))))

(assert (=> b!52604 (= res!43918 (= (bitIndex!0 (size!1131 (buf!1481 (_2!2491 lt!81588))) (currentByte!3024 (_2!2491 lt!81588)) (currentBit!3019 (_2!2491 lt!81588))) (bvadd (bitIndex!0 (size!1131 (buf!1481 thiss!1379)) (currentByte!3024 thiss!1379) (currentBit!3019 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!52605 () Bool)

(declare-fun res!43914 () Bool)

(assert (=> b!52605 (=> (not res!43914) (not e!35002))))

(declare-fun lt!81591 () (_ BitVec 64))

(declare-fun lt!81585 () (_ BitVec 64))

(assert (=> b!52605 (= res!43914 (= (bitIndex!0 (size!1131 (buf!1481 (_2!2491 lt!81592))) (currentByte!3024 (_2!2491 lt!81592)) (currentBit!3019 (_2!2491 lt!81592))) (bvadd lt!81585 lt!81591)))))

(assert (=> b!52605 (or (not (= (bvand lt!81585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81591 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!81585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!81585 lt!81591) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52605 (= lt!81591 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!52605 (= lt!81585 (bitIndex!0 (size!1131 (buf!1481 thiss!1379)) (currentByte!3024 thiss!1379) (currentBit!3019 thiss!1379)))))

(declare-fun b!52606 () Bool)

(declare-fun res!43916 () Bool)

(assert (=> b!52606 (=> (not res!43916) (not e!35000))))

(assert (=> b!52606 (= res!43916 (isPrefixOf!0 thiss!1379 (_2!2491 lt!81588)))))

(assert (= (and d!16646 res!43911) b!52604))

(assert (= (and b!52604 res!43918) b!52606))

(assert (= (and b!52606 res!43916) b!52600))

(assert (= (and b!52600 res!43913) b!52601))

(assert (= (and d!16646 res!43917) b!52605))

(assert (= (and b!52605 res!43914) b!52599))

(assert (= (and b!52599 res!43912) b!52602))

(assert (= (and b!52602 res!43915) b!52603))

(declare-fun m!82955 () Bool)

(assert (=> b!52600 m!82955))

(assert (=> b!52600 m!82955))

(declare-fun m!82957 () Bool)

(assert (=> b!52600 m!82957))

(declare-fun m!82959 () Bool)

(assert (=> b!52604 m!82959))

(assert (=> b!52604 m!82891))

(declare-fun m!82961 () Bool)

(assert (=> b!52605 m!82961))

(assert (=> b!52605 m!82891))

(declare-fun m!82963 () Bool)

(assert (=> b!52599 m!82963))

(declare-fun m!82965 () Bool)

(assert (=> b!52603 m!82965))

(assert (=> b!52603 m!82961))

(declare-fun m!82967 () Bool)

(assert (=> b!52602 m!82967))

(declare-fun m!82969 () Bool)

(assert (=> b!52602 m!82969))

(declare-fun m!82971 () Bool)

(assert (=> b!52602 m!82971))

(declare-fun m!82973 () Bool)

(assert (=> b!52606 m!82973))

(declare-fun m!82975 () Bool)

(assert (=> d!16646 m!82975))

(declare-fun m!82977 () Bool)

(assert (=> d!16646 m!82977))

(declare-fun m!82981 () Bool)

(assert (=> d!16646 m!82981))

(declare-fun m!82983 () Bool)

(assert (=> b!52601 m!82983))

(assert (=> b!52601 m!82959))

(assert (=> b!52509 d!16646))

(declare-fun d!16658 () Bool)

(assert (=> d!16658 (= (array_inv!1036 (buf!1481 thiss!1379)) (bvsge (size!1131 (buf!1481 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52510 d!16658))

(declare-fun d!16660 () Bool)

(assert (=> d!16660 (= (array_inv!1036 srcBuffer!2) (bvsge (size!1131 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10452 d!16660))

(declare-fun d!16664 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16664 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3019 thiss!1379) (currentByte!3024 thiss!1379) (size!1131 (buf!1481 thiss!1379))))))

(declare-fun bs!4220 () Bool)

(assert (= bs!4220 d!16664))

(declare-fun m!83011 () Bool)

(assert (=> bs!4220 m!83011))

(assert (=> start!10452 d!16664))

(declare-fun d!16670 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16670 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1131 (buf!1481 thiss!1379))) ((_ sign_extend 32) (currentByte!3024 thiss!1379)) ((_ sign_extend 32) (currentBit!3019 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1131 (buf!1481 thiss!1379))) ((_ sign_extend 32) (currentByte!3024 thiss!1379)) ((_ sign_extend 32) (currentBit!3019 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4222 () Bool)

(assert (= bs!4222 d!16670))

(declare-fun m!83013 () Bool)

(assert (=> bs!4222 m!83013))

(assert (=> b!52507 d!16670))

(declare-fun d!16672 () Bool)

(declare-fun res!43935 () Bool)

(declare-fun e!35012 () Bool)

(assert (=> d!16672 (=> (not res!43935) (not e!35012))))

(assert (=> d!16672 (= res!43935 (= (size!1131 (buf!1481 thiss!1379)) (size!1131 (buf!1481 thiss!1379))))))

(assert (=> d!16672 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35012)))

(declare-fun b!52621 () Bool)

(declare-fun res!43934 () Bool)

(assert (=> b!52621 (=> (not res!43934) (not e!35012))))

(assert (=> b!52621 (= res!43934 (bvsle (bitIndex!0 (size!1131 (buf!1481 thiss!1379)) (currentByte!3024 thiss!1379) (currentBit!3019 thiss!1379)) (bitIndex!0 (size!1131 (buf!1481 thiss!1379)) (currentByte!3024 thiss!1379) (currentBit!3019 thiss!1379))))))

(declare-fun b!52622 () Bool)

(declare-fun e!35011 () Bool)

(assert (=> b!52622 (= e!35012 e!35011)))

(declare-fun res!43933 () Bool)

(assert (=> b!52622 (=> res!43933 e!35011)))

(assert (=> b!52622 (= res!43933 (= (size!1131 (buf!1481 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52623 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2473 array!2473 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52623 (= e!35011 (arrayBitRangesEq!0 (buf!1481 thiss!1379) (buf!1481 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1131 (buf!1481 thiss!1379)) (currentByte!3024 thiss!1379) (currentBit!3019 thiss!1379))))))

(assert (= (and d!16672 res!43935) b!52621))

(assert (= (and b!52621 res!43934) b!52622))

(assert (= (and b!52622 (not res!43933)) b!52623))

(assert (=> b!52621 m!82891))

(assert (=> b!52621 m!82891))

(assert (=> b!52623 m!82891))

(assert (=> b!52623 m!82891))

(declare-fun m!83015 () Bool)

(assert (=> b!52623 m!83015))

(assert (=> b!52508 d!16672))

(declare-fun d!16674 () Bool)

(assert (=> d!16674 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81607 () Unit!3666)

(declare-fun choose!11 (BitStream!1954) Unit!3666)

(assert (=> d!16674 (= lt!81607 (choose!11 thiss!1379))))

(assert (=> d!16674 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81607)))

(declare-fun bs!4224 () Bool)

(assert (= bs!4224 d!16674))

(assert (=> bs!4224 m!82887))

(declare-fun m!83017 () Bool)

(assert (=> bs!4224 m!83017))

(assert (=> b!52508 d!16674))

(declare-fun d!16676 () Bool)

(declare-fun e!35015 () Bool)

(assert (=> d!16676 e!35015))

(declare-fun res!43941 () Bool)

(assert (=> d!16676 (=> (not res!43941) (not e!35015))))

(declare-fun lt!81620 () (_ BitVec 64))

(declare-fun lt!81625 () (_ BitVec 64))

(declare-fun lt!81624 () (_ BitVec 64))

(assert (=> d!16676 (= res!43941 (= lt!81625 (bvsub lt!81624 lt!81620)))))

(assert (=> d!16676 (or (= (bvand lt!81624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81624 lt!81620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16676 (= lt!81620 (remainingBits!0 ((_ sign_extend 32) (size!1131 (buf!1481 thiss!1379))) ((_ sign_extend 32) (currentByte!3024 thiss!1379)) ((_ sign_extend 32) (currentBit!3019 thiss!1379))))))

(declare-fun lt!81621 () (_ BitVec 64))

(declare-fun lt!81622 () (_ BitVec 64))

(assert (=> d!16676 (= lt!81624 (bvmul lt!81621 lt!81622))))

(assert (=> d!16676 (or (= lt!81621 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81622 (bvsdiv (bvmul lt!81621 lt!81622) lt!81621)))))

(assert (=> d!16676 (= lt!81622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16676 (= lt!81621 ((_ sign_extend 32) (size!1131 (buf!1481 thiss!1379))))))

(assert (=> d!16676 (= lt!81625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3024 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3019 thiss!1379))))))

(assert (=> d!16676 (invariant!0 (currentBit!3019 thiss!1379) (currentByte!3024 thiss!1379) (size!1131 (buf!1481 thiss!1379)))))

(assert (=> d!16676 (= (bitIndex!0 (size!1131 (buf!1481 thiss!1379)) (currentByte!3024 thiss!1379) (currentBit!3019 thiss!1379)) lt!81625)))

(declare-fun b!52628 () Bool)

(declare-fun res!43940 () Bool)

(assert (=> b!52628 (=> (not res!43940) (not e!35015))))

(assert (=> b!52628 (= res!43940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81625))))

(declare-fun b!52629 () Bool)

(declare-fun lt!81623 () (_ BitVec 64))

(assert (=> b!52629 (= e!35015 (bvsle lt!81625 (bvmul lt!81623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52629 (or (= lt!81623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81623)))))

(assert (=> b!52629 (= lt!81623 ((_ sign_extend 32) (size!1131 (buf!1481 thiss!1379))))))

(assert (= (and d!16676 res!43941) b!52628))

(assert (= (and b!52628 res!43940) b!52629))

(assert (=> d!16676 m!83013))

(assert (=> d!16676 m!83011))

(assert (=> b!52508 d!16676))

(push 1)

(assert (not b!52623))

(assert (not b!52604))

(assert (not d!16676))

(assert (not b!52599))

(assert (not b!52606))

(assert (not b!52601))

(assert (not b!52621))

(assert (not b!52602))

(assert (not b!52600))

(assert (not b!52603))

(assert (not d!16670))

(assert (not d!16646))

(assert (not d!16664))

(assert (not b!52605))

(assert (not d!16674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

