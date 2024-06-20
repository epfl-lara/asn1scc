; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10508 () Bool)

(assert start!10508)

(declare-fun res!44015 () Bool)

(declare-fun e!35104 () Bool)

(assert (=> start!10508 (=> (not res!44015) (not e!35104))))

(declare-datatypes ((array!2490 0))(
  ( (array!2491 (arr!1674 (Array (_ BitVec 32) (_ BitVec 8))) (size!1138 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2490)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10508 (= res!44015 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1138 srcBuffer!2))))))))

(assert (=> start!10508 e!35104))

(assert (=> start!10508 true))

(declare-fun array_inv!1043 (array!2490) Bool)

(assert (=> start!10508 (array_inv!1043 srcBuffer!2)))

(declare-datatypes ((BitStream!1968 0))(
  ( (BitStream!1969 (buf!1488 array!2490) (currentByte!3037 (_ BitVec 32)) (currentBit!3032 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1968)

(declare-fun e!35103 () Bool)

(declare-fun inv!12 (BitStream!1968) Bool)

(assert (=> start!10508 (and (inv!12 thiss!1379) e!35103)))

(declare-fun b!52716 () Bool)

(declare-fun e!35106 () Bool)

(declare-datatypes ((Unit!3680 0))(
  ( (Unit!3681) )
))
(declare-datatypes ((tuple2!4794 0))(
  ( (tuple2!4795 (_1!2502 Unit!3680) (_2!2502 BitStream!1968)) )
))
(declare-fun lt!81706 () tuple2!4794)

(declare-fun lt!81704 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52716 (= e!35106 (bvsle (bitIndex!0 (size!1138 (buf!1488 (_2!2502 lt!81706))) (currentByte!3037 (_2!2502 lt!81706)) (currentBit!3032 (_2!2502 lt!81706))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!81704)))))

(declare-fun b!52717 () Bool)

(declare-fun res!44014 () Bool)

(assert (=> b!52717 (=> (not res!44014) (not e!35104))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52717 (= res!44014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1138 (buf!1488 thiss!1379))) ((_ sign_extend 32) (currentByte!3037 thiss!1379)) ((_ sign_extend 32) (currentBit!3032 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52718 () Bool)

(declare-fun e!35105 () Bool)

(assert (=> b!52718 (= e!35104 (not e!35105))))

(declare-fun res!44016 () Bool)

(assert (=> b!52718 (=> res!44016 e!35105)))

(assert (=> b!52718 (= res!44016 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1968 BitStream!1968) Bool)

(assert (=> b!52718 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81705 () Unit!3680)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1968) Unit!3680)

(assert (=> b!52718 (= lt!81705 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!52718 (= lt!81704 (bitIndex!0 (size!1138 (buf!1488 thiss!1379)) (currentByte!3037 thiss!1379) (currentBit!3032 thiss!1379)))))

(declare-fun b!52719 () Bool)

(assert (=> b!52719 (= e!35103 (array_inv!1043 (buf!1488 thiss!1379)))))

(declare-fun b!52720 () Bool)

(assert (=> b!52720 (= e!35105 e!35106)))

(declare-fun res!44013 () Bool)

(assert (=> b!52720 (=> res!44013 e!35106)))

(assert (=> b!52720 (= res!44013 (not (= (size!1138 (buf!1488 thiss!1379)) (size!1138 (buf!1488 (_2!2502 lt!81706))))))))

(declare-fun appendBitFromByte!0 (BitStream!1968 (_ BitVec 8) (_ BitVec 32)) tuple2!4794)

(assert (=> b!52720 (= lt!81706 (appendBitFromByte!0 thiss!1379 (select (arr!1674 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!10508 res!44015) b!52717))

(assert (= (and b!52717 res!44014) b!52718))

(assert (= (and b!52718 (not res!44016)) b!52720))

(assert (= (and b!52720 (not res!44013)) b!52716))

(assert (= start!10508 b!52719))

(declare-fun m!83121 () Bool)

(assert (=> b!52720 m!83121))

(assert (=> b!52720 m!83121))

(declare-fun m!83123 () Bool)

(assert (=> b!52720 m!83123))

(declare-fun m!83125 () Bool)

(assert (=> b!52716 m!83125))

(declare-fun m!83127 () Bool)

(assert (=> b!52717 m!83127))

(declare-fun m!83129 () Bool)

(assert (=> start!10508 m!83129))

(declare-fun m!83131 () Bool)

(assert (=> start!10508 m!83131))

(declare-fun m!83133 () Bool)

(assert (=> b!52719 m!83133))

(declare-fun m!83135 () Bool)

(assert (=> b!52718 m!83135))

(declare-fun m!83137 () Bool)

(assert (=> b!52718 m!83137))

(declare-fun m!83139 () Bool)

(assert (=> b!52718 m!83139))

(check-sat (not b!52718) (not b!52719) (not b!52717) (not b!52716) (not start!10508) (not b!52720))
(check-sat)
(get-model)

(declare-fun d!16690 () Bool)

(assert (=> d!16690 (= (array_inv!1043 srcBuffer!2) (bvsge (size!1138 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10508 d!16690))

(declare-fun d!16692 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16692 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3032 thiss!1379) (currentByte!3037 thiss!1379) (size!1138 (buf!1488 thiss!1379))))))

(declare-fun bs!4233 () Bool)

(assert (= bs!4233 d!16692))

(declare-fun m!83161 () Bool)

(assert (=> bs!4233 m!83161))

(assert (=> start!10508 d!16692))

(declare-fun b!52759 () Bool)

(declare-fun res!44055 () Bool)

(declare-fun e!35140 () Bool)

(assert (=> b!52759 (=> (not res!44055) (not e!35140))))

(declare-fun lt!81765 () (_ BitVec 64))

(declare-fun lt!81758 () tuple2!4794)

(declare-fun lt!81761 () (_ BitVec 64))

(assert (=> b!52759 (= res!44055 (= (bitIndex!0 (size!1138 (buf!1488 (_2!2502 lt!81758))) (currentByte!3037 (_2!2502 lt!81758)) (currentBit!3032 (_2!2502 lt!81758))) (bvadd lt!81765 lt!81761)))))

(assert (=> b!52759 (or (not (= (bvand lt!81765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81761 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!81765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!81765 lt!81761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52759 (= lt!81761 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!52759 (= lt!81765 (bitIndex!0 (size!1138 (buf!1488 thiss!1379)) (currentByte!3037 thiss!1379) (currentBit!3032 thiss!1379)))))

(declare-fun b!52760 () Bool)

(declare-fun res!44051 () Bool)

(assert (=> b!52760 (=> (not res!44051) (not e!35140))))

(assert (=> b!52760 (= res!44051 (isPrefixOf!0 thiss!1379 (_2!2502 lt!81758)))))

(declare-fun b!52761 () Bool)

(declare-fun e!35138 () Bool)

(declare-datatypes ((tuple2!4798 0))(
  ( (tuple2!4799 (_1!2504 BitStream!1968) (_2!2504 Bool)) )
))
(declare-fun lt!81760 () tuple2!4798)

(declare-fun lt!81766 () tuple2!4794)

(assert (=> b!52761 (= e!35138 (= (bitIndex!0 (size!1138 (buf!1488 (_1!2504 lt!81760))) (currentByte!3037 (_1!2504 lt!81760)) (currentBit!3032 (_1!2504 lt!81760))) (bitIndex!0 (size!1138 (buf!1488 (_2!2502 lt!81766))) (currentByte!3037 (_2!2502 lt!81766)) (currentBit!3032 (_2!2502 lt!81766)))))))

(declare-fun b!52762 () Bool)

(declare-fun res!44053 () Bool)

(declare-fun e!35139 () Bool)

(assert (=> b!52762 (=> (not res!44053) (not e!35139))))

(assert (=> b!52762 (= res!44053 (isPrefixOf!0 thiss!1379 (_2!2502 lt!81766)))))

(declare-fun b!52763 () Bool)

(declare-fun res!44056 () Bool)

(assert (=> b!52763 (=> (not res!44056) (not e!35139))))

(assert (=> b!52763 (= res!44056 (= (bitIndex!0 (size!1138 (buf!1488 (_2!2502 lt!81766))) (currentByte!3037 (_2!2502 lt!81766)) (currentBit!3032 (_2!2502 lt!81766))) (bvadd (bitIndex!0 (size!1138 (buf!1488 thiss!1379)) (currentByte!3037 thiss!1379) (currentBit!3032 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!16694 () Bool)

(assert (=> d!16694 e!35140))

(declare-fun res!44058 () Bool)

(assert (=> d!16694 (=> (not res!44058) (not e!35140))))

(assert (=> d!16694 (= res!44058 (= (size!1138 (buf!1488 (_2!2502 lt!81758))) (size!1138 (buf!1488 thiss!1379))))))

(declare-fun lt!81767 () (_ BitVec 8))

(declare-fun lt!81759 () array!2490)

(assert (=> d!16694 (= lt!81767 (select (arr!1674 lt!81759) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16694 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1138 lt!81759)))))

(assert (=> d!16694 (= lt!81759 (array!2491 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!81764 () tuple2!4794)

(assert (=> d!16694 (= lt!81758 (tuple2!4795 (_1!2502 lt!81764) (_2!2502 lt!81764)))))

(assert (=> d!16694 (= lt!81764 lt!81766)))

(assert (=> d!16694 e!35139))

(declare-fun res!44052 () Bool)

(assert (=> d!16694 (=> (not res!44052) (not e!35139))))

(assert (=> d!16694 (= res!44052 (= (size!1138 (buf!1488 thiss!1379)) (size!1138 (buf!1488 (_2!2502 lt!81766)))))))

(declare-fun lt!81763 () Bool)

(declare-fun appendBit!0 (BitStream!1968 Bool) tuple2!4794)

(assert (=> d!16694 (= lt!81766 (appendBit!0 thiss!1379 lt!81763))))

(assert (=> d!16694 (= lt!81763 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1674 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16694 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16694 (= (appendBitFromByte!0 thiss!1379 (select (arr!1674 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!81758)))

(declare-fun b!52764 () Bool)

(declare-fun e!35141 () Bool)

(declare-fun lt!81762 () tuple2!4798)

(assert (=> b!52764 (= e!35141 (= (bitIndex!0 (size!1138 (buf!1488 (_1!2504 lt!81762))) (currentByte!3037 (_1!2504 lt!81762)) (currentBit!3032 (_1!2504 lt!81762))) (bitIndex!0 (size!1138 (buf!1488 (_2!2502 lt!81758))) (currentByte!3037 (_2!2502 lt!81758)) (currentBit!3032 (_2!2502 lt!81758)))))))

(declare-fun b!52765 () Bool)

(assert (=> b!52765 (= e!35140 e!35141)))

(declare-fun res!44054 () Bool)

(assert (=> b!52765 (=> (not res!44054) (not e!35141))))

(assert (=> b!52765 (= res!44054 (and (= (_2!2504 lt!81762) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1674 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!81767)) #b00000000000000000000000000000000))) (= (_1!2504 lt!81762) (_2!2502 lt!81758))))))

(declare-datatypes ((tuple2!4800 0))(
  ( (tuple2!4801 (_1!2505 array!2490) (_2!2505 BitStream!1968)) )
))
(declare-fun lt!81769 () tuple2!4800)

(declare-fun lt!81768 () BitStream!1968)

(declare-fun readBits!0 (BitStream!1968 (_ BitVec 64)) tuple2!4800)

(assert (=> b!52765 (= lt!81769 (readBits!0 lt!81768 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1968) tuple2!4798)

(assert (=> b!52765 (= lt!81762 (readBitPure!0 lt!81768))))

(declare-fun readerFrom!0 (BitStream!1968 (_ BitVec 32) (_ BitVec 32)) BitStream!1968)

(assert (=> b!52765 (= lt!81768 (readerFrom!0 (_2!2502 lt!81758) (currentBit!3032 thiss!1379) (currentByte!3037 thiss!1379)))))

(declare-fun b!52766 () Bool)

(assert (=> b!52766 (= e!35139 e!35138)))

(declare-fun res!44057 () Bool)

(assert (=> b!52766 (=> (not res!44057) (not e!35138))))

(assert (=> b!52766 (= res!44057 (and (= (_2!2504 lt!81760) lt!81763) (= (_1!2504 lt!81760) (_2!2502 lt!81766))))))

(assert (=> b!52766 (= lt!81760 (readBitPure!0 (readerFrom!0 (_2!2502 lt!81766) (currentBit!3032 thiss!1379) (currentByte!3037 thiss!1379))))))

(assert (= (and d!16694 res!44052) b!52763))

(assert (= (and b!52763 res!44056) b!52762))

(assert (= (and b!52762 res!44053) b!52766))

(assert (= (and b!52766 res!44057) b!52761))

(assert (= (and d!16694 res!44058) b!52759))

(assert (= (and b!52759 res!44055) b!52760))

(assert (= (and b!52760 res!44051) b!52765))

(assert (= (and b!52765 res!44054) b!52764))

(declare-fun m!83169 () Bool)

(assert (=> b!52766 m!83169))

(assert (=> b!52766 m!83169))

(declare-fun m!83171 () Bool)

(assert (=> b!52766 m!83171))

(declare-fun m!83173 () Bool)

(assert (=> b!52765 m!83173))

(declare-fun m!83175 () Bool)

(assert (=> b!52765 m!83175))

(declare-fun m!83177 () Bool)

(assert (=> b!52765 m!83177))

(declare-fun m!83179 () Bool)

(assert (=> b!52760 m!83179))

(declare-fun m!83181 () Bool)

(assert (=> b!52761 m!83181))

(declare-fun m!83183 () Bool)

(assert (=> b!52761 m!83183))

(declare-fun m!83185 () Bool)

(assert (=> b!52762 m!83185))

(declare-fun m!83187 () Bool)

(assert (=> b!52759 m!83187))

(assert (=> b!52759 m!83139))

(assert (=> b!52763 m!83183))

(assert (=> b!52763 m!83139))

(declare-fun m!83189 () Bool)

(assert (=> b!52764 m!83189))

(assert (=> b!52764 m!83187))

(declare-fun m!83191 () Bool)

(assert (=> d!16694 m!83191))

(declare-fun m!83193 () Bool)

(assert (=> d!16694 m!83193))

(declare-fun m!83195 () Bool)

(assert (=> d!16694 m!83195))

(assert (=> b!52720 d!16694))

(declare-fun d!16706 () Bool)

(declare-fun e!35144 () Bool)

(assert (=> d!16706 e!35144))

(declare-fun res!44063 () Bool)

(assert (=> d!16706 (=> (not res!44063) (not e!35144))))

(declare-fun lt!81784 () (_ BitVec 64))

(declare-fun lt!81785 () (_ BitVec 64))

(declare-fun lt!81783 () (_ BitVec 64))

(assert (=> d!16706 (= res!44063 (= lt!81785 (bvsub lt!81783 lt!81784)))))

(assert (=> d!16706 (or (= (bvand lt!81783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81783 lt!81784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16706 (= lt!81784 (remainingBits!0 ((_ sign_extend 32) (size!1138 (buf!1488 (_2!2502 lt!81706)))) ((_ sign_extend 32) (currentByte!3037 (_2!2502 lt!81706))) ((_ sign_extend 32) (currentBit!3032 (_2!2502 lt!81706)))))))

(declare-fun lt!81787 () (_ BitVec 64))

(declare-fun lt!81782 () (_ BitVec 64))

(assert (=> d!16706 (= lt!81783 (bvmul lt!81787 lt!81782))))

(assert (=> d!16706 (or (= lt!81787 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81782 (bvsdiv (bvmul lt!81787 lt!81782) lt!81787)))))

(assert (=> d!16706 (= lt!81782 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16706 (= lt!81787 ((_ sign_extend 32) (size!1138 (buf!1488 (_2!2502 lt!81706)))))))

(assert (=> d!16706 (= lt!81785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3037 (_2!2502 lt!81706))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3032 (_2!2502 lt!81706)))))))

(assert (=> d!16706 (invariant!0 (currentBit!3032 (_2!2502 lt!81706)) (currentByte!3037 (_2!2502 lt!81706)) (size!1138 (buf!1488 (_2!2502 lt!81706))))))

(assert (=> d!16706 (= (bitIndex!0 (size!1138 (buf!1488 (_2!2502 lt!81706))) (currentByte!3037 (_2!2502 lt!81706)) (currentBit!3032 (_2!2502 lt!81706))) lt!81785)))

(declare-fun b!52771 () Bool)

(declare-fun res!44064 () Bool)

(assert (=> b!52771 (=> (not res!44064) (not e!35144))))

(assert (=> b!52771 (= res!44064 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81785))))

(declare-fun b!52772 () Bool)

(declare-fun lt!81786 () (_ BitVec 64))

(assert (=> b!52772 (= e!35144 (bvsle lt!81785 (bvmul lt!81786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52772 (or (= lt!81786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81786)))))

(assert (=> b!52772 (= lt!81786 ((_ sign_extend 32) (size!1138 (buf!1488 (_2!2502 lt!81706)))))))

(assert (= (and d!16706 res!44063) b!52771))

(assert (= (and b!52771 res!44064) b!52772))

(declare-fun m!83197 () Bool)

(assert (=> d!16706 m!83197))

(declare-fun m!83199 () Bool)

(assert (=> d!16706 m!83199))

(assert (=> b!52716 d!16706))

(declare-fun d!16708 () Bool)

(assert (=> d!16708 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1138 (buf!1488 thiss!1379))) ((_ sign_extend 32) (currentByte!3037 thiss!1379)) ((_ sign_extend 32) (currentBit!3032 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1138 (buf!1488 thiss!1379))) ((_ sign_extend 32) (currentByte!3037 thiss!1379)) ((_ sign_extend 32) (currentBit!3032 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4235 () Bool)

(assert (= bs!4235 d!16708))

(declare-fun m!83201 () Bool)

(assert (=> bs!4235 m!83201))

(assert (=> b!52717 d!16708))

(declare-fun d!16710 () Bool)

(declare-fun res!44072 () Bool)

(declare-fun e!35150 () Bool)

(assert (=> d!16710 (=> (not res!44072) (not e!35150))))

(assert (=> d!16710 (= res!44072 (= (size!1138 (buf!1488 thiss!1379)) (size!1138 (buf!1488 thiss!1379))))))

(assert (=> d!16710 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35150)))

(declare-fun b!52779 () Bool)

(declare-fun res!44073 () Bool)

(assert (=> b!52779 (=> (not res!44073) (not e!35150))))

(assert (=> b!52779 (= res!44073 (bvsle (bitIndex!0 (size!1138 (buf!1488 thiss!1379)) (currentByte!3037 thiss!1379) (currentBit!3032 thiss!1379)) (bitIndex!0 (size!1138 (buf!1488 thiss!1379)) (currentByte!3037 thiss!1379) (currentBit!3032 thiss!1379))))))

(declare-fun b!52780 () Bool)

(declare-fun e!35149 () Bool)

(assert (=> b!52780 (= e!35150 e!35149)))

(declare-fun res!44071 () Bool)

(assert (=> b!52780 (=> res!44071 e!35149)))

(assert (=> b!52780 (= res!44071 (= (size!1138 (buf!1488 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52781 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2490 array!2490 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52781 (= e!35149 (arrayBitRangesEq!0 (buf!1488 thiss!1379) (buf!1488 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1138 (buf!1488 thiss!1379)) (currentByte!3037 thiss!1379) (currentBit!3032 thiss!1379))))))

(assert (= (and d!16710 res!44072) b!52779))

(assert (= (and b!52779 res!44073) b!52780))

(assert (= (and b!52780 (not res!44071)) b!52781))

(assert (=> b!52779 m!83139))

(assert (=> b!52779 m!83139))

(assert (=> b!52781 m!83139))

(assert (=> b!52781 m!83139))

(declare-fun m!83203 () Bool)

(assert (=> b!52781 m!83203))

(assert (=> b!52718 d!16710))

(declare-fun d!16712 () Bool)

(assert (=> d!16712 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81790 () Unit!3680)

(declare-fun choose!11 (BitStream!1968) Unit!3680)

(assert (=> d!16712 (= lt!81790 (choose!11 thiss!1379))))

(assert (=> d!16712 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81790)))

(declare-fun bs!4237 () Bool)

(assert (= bs!4237 d!16712))

(assert (=> bs!4237 m!83135))

(declare-fun m!83205 () Bool)

(assert (=> bs!4237 m!83205))

(assert (=> b!52718 d!16712))

(declare-fun d!16714 () Bool)

(declare-fun e!35151 () Bool)

(assert (=> d!16714 e!35151))

(declare-fun res!44074 () Bool)

(assert (=> d!16714 (=> (not res!44074) (not e!35151))))

(declare-fun lt!81793 () (_ BitVec 64))

(declare-fun lt!81794 () (_ BitVec 64))

(declare-fun lt!81792 () (_ BitVec 64))

(assert (=> d!16714 (= res!44074 (= lt!81794 (bvsub lt!81792 lt!81793)))))

(assert (=> d!16714 (or (= (bvand lt!81792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81792 lt!81793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16714 (= lt!81793 (remainingBits!0 ((_ sign_extend 32) (size!1138 (buf!1488 thiss!1379))) ((_ sign_extend 32) (currentByte!3037 thiss!1379)) ((_ sign_extend 32) (currentBit!3032 thiss!1379))))))

(declare-fun lt!81796 () (_ BitVec 64))

(declare-fun lt!81791 () (_ BitVec 64))

(assert (=> d!16714 (= lt!81792 (bvmul lt!81796 lt!81791))))

(assert (=> d!16714 (or (= lt!81796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81791 (bvsdiv (bvmul lt!81796 lt!81791) lt!81796)))))

(assert (=> d!16714 (= lt!81791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16714 (= lt!81796 ((_ sign_extend 32) (size!1138 (buf!1488 thiss!1379))))))

(assert (=> d!16714 (= lt!81794 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3037 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3032 thiss!1379))))))

(assert (=> d!16714 (invariant!0 (currentBit!3032 thiss!1379) (currentByte!3037 thiss!1379) (size!1138 (buf!1488 thiss!1379)))))

(assert (=> d!16714 (= (bitIndex!0 (size!1138 (buf!1488 thiss!1379)) (currentByte!3037 thiss!1379) (currentBit!3032 thiss!1379)) lt!81794)))

(declare-fun b!52782 () Bool)

(declare-fun res!44075 () Bool)

(assert (=> b!52782 (=> (not res!44075) (not e!35151))))

(assert (=> b!52782 (= res!44075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81794))))

(declare-fun b!52783 () Bool)

(declare-fun lt!81795 () (_ BitVec 64))

(assert (=> b!52783 (= e!35151 (bvsle lt!81794 (bvmul lt!81795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52783 (or (= lt!81795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81795)))))

(assert (=> b!52783 (= lt!81795 ((_ sign_extend 32) (size!1138 (buf!1488 thiss!1379))))))

(assert (= (and d!16714 res!44074) b!52782))

(assert (= (and b!52782 res!44075) b!52783))

(assert (=> d!16714 m!83201))

(assert (=> d!16714 m!83161))

(assert (=> b!52718 d!16714))

(declare-fun d!16716 () Bool)

(assert (=> d!16716 (= (array_inv!1043 (buf!1488 thiss!1379)) (bvsge (size!1138 (buf!1488 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52719 d!16716))

(check-sat (not b!52764) (not d!16714) (not d!16694) (not b!52765) (not b!52762) (not b!52781) (not b!52761) (not b!52766) (not d!16708) (not b!52763) (not b!52760) (not b!52779) (not d!16706) (not b!52759) (not d!16692) (not d!16712))
(check-sat)
