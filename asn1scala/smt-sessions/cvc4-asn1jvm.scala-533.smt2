; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15592 () Bool)

(assert start!15592)

(declare-fun res!65399 () Bool)

(declare-fun e!51863 () Bool)

(assert (=> start!15592 (=> (not res!65399) (not e!51863))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15592 (= res!65399 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15592 e!51863))

(assert (=> start!15592 true))

(declare-datatypes ((array!3371 0))(
  ( (array!3372 (arr!2159 (Array (_ BitVec 32) (_ BitVec 8))) (size!1558 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2678 0))(
  ( (BitStream!2679 (buf!1948 array!3371) (currentByte!3810 (_ BitVec 32)) (currentBit!3805 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2678)

(declare-fun e!51864 () Bool)

(declare-fun inv!12 (BitStream!2678) Bool)

(assert (=> start!15592 (and (inv!12 thiss!1107) e!51864)))

(declare-fun b!79035 () Bool)

(declare-fun e!51861 () Bool)

(declare-datatypes ((tuple2!7048 0))(
  ( (tuple2!7049 (_1!3661 BitStream!2678) (_2!3661 Bool)) )
))
(declare-fun lt!125896 () tuple2!7048)

(declare-fun lt!125897 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79035 (= e!51861 (= (bitIndex!0 (size!1558 (buf!1948 (_1!3661 lt!125896))) (currentByte!3810 (_1!3661 lt!125896)) (currentBit!3805 (_1!3661 lt!125896))) lt!125897))))

(declare-fun b!79036 () Bool)

(declare-fun e!51859 () Bool)

(declare-fun e!51858 () Bool)

(assert (=> b!79036 (= e!51859 e!51858)))

(declare-fun res!65403 () Bool)

(assert (=> b!79036 (=> (not res!65403) (not e!51858))))

(declare-fun lt!125898 () (_ BitVec 64))

(assert (=> b!79036 (= res!65403 (= lt!125897 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125898)))))

(declare-datatypes ((Unit!5201 0))(
  ( (Unit!5202) )
))
(declare-datatypes ((tuple2!7050 0))(
  ( (tuple2!7051 (_1!3662 Unit!5201) (_2!3662 BitStream!2678)) )
))
(declare-fun lt!125901 () tuple2!7050)

(assert (=> b!79036 (= lt!125897 (bitIndex!0 (size!1558 (buf!1948 (_2!3662 lt!125901))) (currentByte!3810 (_2!3662 lt!125901)) (currentBit!3805 (_2!3662 lt!125901))))))

(assert (=> b!79036 (= lt!125898 (bitIndex!0 (size!1558 (buf!1948 thiss!1107)) (currentByte!3810 thiss!1107) (currentBit!3805 thiss!1107)))))

(declare-fun b!79037 () Bool)

(assert (=> b!79037 (= e!51858 e!51861)))

(declare-fun res!65406 () Bool)

(assert (=> b!79037 (=> (not res!65406) (not e!51861))))

(declare-fun lt!125899 () Bool)

(assert (=> b!79037 (= res!65406 (and (= (_2!3661 lt!125896) lt!125899) (= (_1!3661 lt!125896) (_2!3662 lt!125901))))))

(declare-fun readBitPure!0 (BitStream!2678) tuple2!7048)

(declare-fun readerFrom!0 (BitStream!2678 (_ BitVec 32) (_ BitVec 32)) BitStream!2678)

(assert (=> b!79037 (= lt!125896 (readBitPure!0 (readerFrom!0 (_2!3662 lt!125901) (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107))))))

(declare-fun b!79038 () Bool)

(declare-fun e!51862 () Bool)

(declare-fun lt!125900 () BitStream!2678)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79038 (= e!51862 (validate_offset_bits!1 ((_ sign_extend 32) (size!1558 (buf!1948 lt!125900))) ((_ sign_extend 32) (currentByte!3810 lt!125900)) ((_ sign_extend 32) (currentBit!3805 lt!125900)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!125895 () tuple2!7048)

(assert (=> b!79038 (= lt!125895 (readBitPure!0 lt!125900))))

(assert (=> b!79038 (= lt!125900 (readerFrom!0 (_2!3662 lt!125901) (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107)))))

(declare-fun b!79039 () Bool)

(assert (=> b!79039 (= e!51863 (not e!51862))))

(declare-fun res!65407 () Bool)

(assert (=> b!79039 (=> res!65407 e!51862)))

(assert (=> b!79039 (= res!65407 (not (= (size!1558 (buf!1948 (_2!3662 lt!125901))) (size!1558 (buf!1948 thiss!1107)))))))

(assert (=> b!79039 e!51859))

(declare-fun res!65405 () Bool)

(assert (=> b!79039 (=> (not res!65405) (not e!51859))))

(assert (=> b!79039 (= res!65405 (= (size!1558 (buf!1948 thiss!1107)) (size!1558 (buf!1948 (_2!3662 lt!125901)))))))

(declare-fun appendBit!0 (BitStream!2678 Bool) tuple2!7050)

(assert (=> b!79039 (= lt!125901 (appendBit!0 thiss!1107 lt!125899))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!79039 (= lt!125899 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79040 () Bool)

(declare-fun res!65400 () Bool)

(assert (=> b!79040 (=> res!65400 e!51862)))

(assert (=> b!79040 (= res!65400 (not (= (bitIndex!0 (size!1558 (buf!1948 (_2!3662 lt!125901))) (currentByte!3810 (_2!3662 lt!125901)) (currentBit!3805 (_2!3662 lt!125901))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1558 (buf!1948 thiss!1107)) (currentByte!3810 thiss!1107) (currentBit!3805 thiss!1107))))))))

(declare-fun b!79041 () Bool)

(declare-fun array_inv!1404 (array!3371) Bool)

(assert (=> b!79041 (= e!51864 (array_inv!1404 (buf!1948 thiss!1107)))))

(declare-fun b!79042 () Bool)

(declare-fun res!65402 () Bool)

(assert (=> b!79042 (=> (not res!65402) (not e!51858))))

(declare-fun isPrefixOf!0 (BitStream!2678 BitStream!2678) Bool)

(assert (=> b!79042 (= res!65402 (isPrefixOf!0 thiss!1107 (_2!3662 lt!125901)))))

(declare-fun b!79043 () Bool)

(declare-fun res!65404 () Bool)

(assert (=> b!79043 (=> res!65404 e!51862)))

(assert (=> b!79043 (= res!65404 (not (isPrefixOf!0 thiss!1107 (_2!3662 lt!125901))))))

(declare-fun b!79044 () Bool)

(declare-fun res!65401 () Bool)

(assert (=> b!79044 (=> (not res!65401) (not e!51863))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79044 (= res!65401 (validate_offset_bit!0 ((_ sign_extend 32) (size!1558 (buf!1948 thiss!1107))) ((_ sign_extend 32) (currentByte!3810 thiss!1107)) ((_ sign_extend 32) (currentBit!3805 thiss!1107))))))

(assert (= (and start!15592 res!65399) b!79044))

(assert (= (and b!79044 res!65401) b!79039))

(assert (= (and b!79039 res!65405) b!79036))

(assert (= (and b!79036 res!65403) b!79042))

(assert (= (and b!79042 res!65402) b!79037))

(assert (= (and b!79037 res!65406) b!79035))

(assert (= (and b!79039 (not res!65407)) b!79040))

(assert (= (and b!79040 (not res!65400)) b!79043))

(assert (= (and b!79043 (not res!65404)) b!79038))

(assert (= start!15592 b!79041))

(declare-fun m!124465 () Bool)

(assert (=> b!79038 m!124465))

(declare-fun m!124467 () Bool)

(assert (=> b!79038 m!124467))

(declare-fun m!124469 () Bool)

(assert (=> b!79038 m!124469))

(declare-fun m!124471 () Bool)

(assert (=> b!79043 m!124471))

(declare-fun m!124473 () Bool)

(assert (=> b!79040 m!124473))

(declare-fun m!124475 () Bool)

(assert (=> b!79040 m!124475))

(declare-fun m!124477 () Bool)

(assert (=> b!79035 m!124477))

(declare-fun m!124479 () Bool)

(assert (=> start!15592 m!124479))

(declare-fun m!124481 () Bool)

(assert (=> b!79039 m!124481))

(declare-fun m!124483 () Bool)

(assert (=> b!79039 m!124483))

(declare-fun m!124485 () Bool)

(assert (=> b!79041 m!124485))

(assert (=> b!79036 m!124473))

(assert (=> b!79036 m!124475))

(assert (=> b!79042 m!124471))

(assert (=> b!79037 m!124469))

(assert (=> b!79037 m!124469))

(declare-fun m!124487 () Bool)

(assert (=> b!79037 m!124487))

(declare-fun m!124489 () Bool)

(assert (=> b!79044 m!124489))

(push 1)

(assert (not b!79041))

(assert (not b!79037))

(assert (not start!15592))

(assert (not b!79035))

(assert (not b!79042))

(assert (not b!79040))

(assert (not b!79039))

(assert (not b!79044))

(assert (not b!79036))

(assert (not b!79038))

(assert (not b!79043))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24954 () Bool)

(declare-fun e!51890 () Bool)

(assert (=> d!24954 e!51890))

(declare-fun res!65449 () Bool)

(assert (=> d!24954 (=> (not res!65449) (not e!51890))))

(declare-fun lt!125951 () (_ BitVec 64))

(declare-fun lt!125956 () (_ BitVec 64))

(declare-fun lt!125955 () (_ BitVec 64))

(assert (=> d!24954 (= res!65449 (= lt!125955 (bvsub lt!125951 lt!125956)))))

(assert (=> d!24954 (or (= (bvand lt!125951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125951 lt!125956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24954 (= lt!125956 (remainingBits!0 ((_ sign_extend 32) (size!1558 (buf!1948 (_1!3661 lt!125896)))) ((_ sign_extend 32) (currentByte!3810 (_1!3661 lt!125896))) ((_ sign_extend 32) (currentBit!3805 (_1!3661 lt!125896)))))))

(declare-fun lt!125953 () (_ BitVec 64))

(declare-fun lt!125952 () (_ BitVec 64))

(assert (=> d!24954 (= lt!125951 (bvmul lt!125953 lt!125952))))

(assert (=> d!24954 (or (= lt!125953 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125952 (bvsdiv (bvmul lt!125953 lt!125952) lt!125953)))))

(assert (=> d!24954 (= lt!125952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24954 (= lt!125953 ((_ sign_extend 32) (size!1558 (buf!1948 (_1!3661 lt!125896)))))))

(assert (=> d!24954 (= lt!125955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3810 (_1!3661 lt!125896))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3805 (_1!3661 lt!125896)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24954 (invariant!0 (currentBit!3805 (_1!3661 lt!125896)) (currentByte!3810 (_1!3661 lt!125896)) (size!1558 (buf!1948 (_1!3661 lt!125896))))))

(assert (=> d!24954 (= (bitIndex!0 (size!1558 (buf!1948 (_1!3661 lt!125896))) (currentByte!3810 (_1!3661 lt!125896)) (currentBit!3805 (_1!3661 lt!125896))) lt!125955)))

(declare-fun b!79083 () Bool)

(declare-fun res!65448 () Bool)

(assert (=> b!79083 (=> (not res!65448) (not e!51890))))

(assert (=> b!79083 (= res!65448 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125955))))

(declare-fun b!79084 () Bool)

(declare-fun lt!125954 () (_ BitVec 64))

(assert (=> b!79084 (= e!51890 (bvsle lt!125955 (bvmul lt!125954 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79084 (or (= lt!125954 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125954 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125954)))))

(assert (=> b!79084 (= lt!125954 ((_ sign_extend 32) (size!1558 (buf!1948 (_1!3661 lt!125896)))))))

(assert (= (and d!24954 res!65449) b!79083))

(assert (= (and b!79083 res!65448) b!79084))

(declare-fun m!124525 () Bool)

(assert (=> d!24954 m!124525))

(declare-fun m!124527 () Bool)

(assert (=> d!24954 m!124527))

(assert (=> b!79035 d!24954))

(declare-fun d!24968 () Bool)

(assert (=> d!24968 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1558 (buf!1948 thiss!1107))) ((_ sign_extend 32) (currentByte!3810 thiss!1107)) ((_ sign_extend 32) (currentBit!3805 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1558 (buf!1948 thiss!1107))) ((_ sign_extend 32) (currentByte!3810 thiss!1107)) ((_ sign_extend 32) (currentBit!3805 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6050 () Bool)

(assert (= bs!6050 d!24968))

(declare-fun m!124529 () Bool)

(assert (=> bs!6050 m!124529))

(assert (=> b!79044 d!24968))

(declare-fun d!24970 () Bool)

(declare-datatypes ((tuple2!7056 0))(
  ( (tuple2!7057 (_1!3665 Bool) (_2!3665 BitStream!2678)) )
))
(declare-fun lt!125977 () tuple2!7056)

(declare-fun readBit!0 (BitStream!2678) tuple2!7056)

(assert (=> d!24970 (= lt!125977 (readBit!0 (readerFrom!0 (_2!3662 lt!125901) (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107))))))

(assert (=> d!24970 (= (readBitPure!0 (readerFrom!0 (_2!3662 lt!125901) (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107))) (tuple2!7049 (_2!3665 lt!125977) (_1!3665 lt!125977)))))

(declare-fun bs!6051 () Bool)

(assert (= bs!6051 d!24970))

(assert (=> bs!6051 m!124469))

(declare-fun m!124535 () Bool)

(assert (=> bs!6051 m!124535))

(assert (=> b!79037 d!24970))

(declare-fun d!24974 () Bool)

(declare-fun e!51902 () Bool)

(assert (=> d!24974 e!51902))

(declare-fun res!65471 () Bool)

(assert (=> d!24974 (=> (not res!65471) (not e!51902))))

(assert (=> d!24974 (= res!65471 (invariant!0 (currentBit!3805 (_2!3662 lt!125901)) (currentByte!3810 (_2!3662 lt!125901)) (size!1558 (buf!1948 (_2!3662 lt!125901)))))))

(assert (=> d!24974 (= (readerFrom!0 (_2!3662 lt!125901) (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107)) (BitStream!2679 (buf!1948 (_2!3662 lt!125901)) (currentByte!3810 thiss!1107) (currentBit!3805 thiss!1107)))))

(declare-fun b!79106 () Bool)

(assert (=> b!79106 (= e!51902 (invariant!0 (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107) (size!1558 (buf!1948 (_2!3662 lt!125901)))))))

(assert (= (and d!24974 res!65471) b!79106))

(declare-fun m!124543 () Bool)

(assert (=> d!24974 m!124543))

(declare-fun m!124545 () Bool)

(assert (=> b!79106 m!124545))

(assert (=> b!79037 d!24974))

(declare-fun d!24984 () Bool)

(declare-fun e!51903 () Bool)

(assert (=> d!24984 e!51903))

(declare-fun res!65473 () Bool)

(assert (=> d!24984 (=> (not res!65473) (not e!51903))))

(declare-fun lt!126003 () (_ BitVec 64))

(declare-fun lt!126004 () (_ BitVec 64))

(declare-fun lt!125999 () (_ BitVec 64))

(assert (=> d!24984 (= res!65473 (= lt!126003 (bvsub lt!125999 lt!126004)))))

(assert (=> d!24984 (or (= (bvand lt!125999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126004 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125999 lt!126004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24984 (= lt!126004 (remainingBits!0 ((_ sign_extend 32) (size!1558 (buf!1948 (_2!3662 lt!125901)))) ((_ sign_extend 32) (currentByte!3810 (_2!3662 lt!125901))) ((_ sign_extend 32) (currentBit!3805 (_2!3662 lt!125901)))))))

(declare-fun lt!126001 () (_ BitVec 64))

(declare-fun lt!126000 () (_ BitVec 64))

(assert (=> d!24984 (= lt!125999 (bvmul lt!126001 lt!126000))))

(assert (=> d!24984 (or (= lt!126001 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126000 (bvsdiv (bvmul lt!126001 lt!126000) lt!126001)))))

(assert (=> d!24984 (= lt!126000 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24984 (= lt!126001 ((_ sign_extend 32) (size!1558 (buf!1948 (_2!3662 lt!125901)))))))

(assert (=> d!24984 (= lt!126003 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3810 (_2!3662 lt!125901))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3805 (_2!3662 lt!125901)))))))

(assert (=> d!24984 (invariant!0 (currentBit!3805 (_2!3662 lt!125901)) (currentByte!3810 (_2!3662 lt!125901)) (size!1558 (buf!1948 (_2!3662 lt!125901))))))

(assert (=> d!24984 (= (bitIndex!0 (size!1558 (buf!1948 (_2!3662 lt!125901))) (currentByte!3810 (_2!3662 lt!125901)) (currentBit!3805 (_2!3662 lt!125901))) lt!126003)))

(declare-fun b!79107 () Bool)

(declare-fun res!65472 () Bool)

(assert (=> b!79107 (=> (not res!65472) (not e!51903))))

(assert (=> b!79107 (= res!65472 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126003))))

(declare-fun b!79108 () Bool)

(declare-fun lt!126002 () (_ BitVec 64))

(assert (=> b!79108 (= e!51903 (bvsle lt!126003 (bvmul lt!126002 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79108 (or (= lt!126002 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126002 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126002)))))

(assert (=> b!79108 (= lt!126002 ((_ sign_extend 32) (size!1558 (buf!1948 (_2!3662 lt!125901)))))))

(assert (= (and d!24984 res!65473) b!79107))

(assert (= (and b!79107 res!65472) b!79108))

(declare-fun m!124547 () Bool)

(assert (=> d!24984 m!124547))

(assert (=> d!24984 m!124543))

(assert (=> b!79036 d!24984))

(declare-fun d!24986 () Bool)

(declare-fun e!51904 () Bool)

(assert (=> d!24986 e!51904))

(declare-fun res!65475 () Bool)

(assert (=> d!24986 (=> (not res!65475) (not e!51904))))

(declare-fun lt!126009 () (_ BitVec 64))

(declare-fun lt!126005 () (_ BitVec 64))

(declare-fun lt!126010 () (_ BitVec 64))

(assert (=> d!24986 (= res!65475 (= lt!126009 (bvsub lt!126005 lt!126010)))))

(assert (=> d!24986 (or (= (bvand lt!126005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126010 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126005 lt!126010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24986 (= lt!126010 (remainingBits!0 ((_ sign_extend 32) (size!1558 (buf!1948 thiss!1107))) ((_ sign_extend 32) (currentByte!3810 thiss!1107)) ((_ sign_extend 32) (currentBit!3805 thiss!1107))))))

(declare-fun lt!126007 () (_ BitVec 64))

(declare-fun lt!126006 () (_ BitVec 64))

(assert (=> d!24986 (= lt!126005 (bvmul lt!126007 lt!126006))))

(assert (=> d!24986 (or (= lt!126007 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126006 (bvsdiv (bvmul lt!126007 lt!126006) lt!126007)))))

(assert (=> d!24986 (= lt!126006 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24986 (= lt!126007 ((_ sign_extend 32) (size!1558 (buf!1948 thiss!1107))))))

(assert (=> d!24986 (= lt!126009 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3810 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3805 thiss!1107))))))

(assert (=> d!24986 (invariant!0 (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107) (size!1558 (buf!1948 thiss!1107)))))

(assert (=> d!24986 (= (bitIndex!0 (size!1558 (buf!1948 thiss!1107)) (currentByte!3810 thiss!1107) (currentBit!3805 thiss!1107)) lt!126009)))

(declare-fun b!79109 () Bool)

(declare-fun res!65474 () Bool)

(assert (=> b!79109 (=> (not res!65474) (not e!51904))))

(assert (=> b!79109 (= res!65474 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126009))))

(declare-fun b!79110 () Bool)

(declare-fun lt!126008 () (_ BitVec 64))

(assert (=> b!79110 (= e!51904 (bvsle lt!126009 (bvmul lt!126008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79110 (or (= lt!126008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126008)))))

(assert (=> b!79110 (= lt!126008 ((_ sign_extend 32) (size!1558 (buf!1948 thiss!1107))))))

(assert (= (and d!24986 res!65475) b!79109))

(assert (= (and b!79109 res!65474) b!79110))

(assert (=> d!24986 m!124529))

(declare-fun m!124549 () Bool)

(assert (=> d!24986 m!124549))

(assert (=> b!79036 d!24986))

(assert (=> b!79040 d!24984))

(assert (=> b!79040 d!24986))

(declare-fun d!24988 () Bool)

(assert (=> d!24988 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1558 (buf!1948 lt!125900))) ((_ sign_extend 32) (currentByte!3810 lt!125900)) ((_ sign_extend 32) (currentBit!3805 lt!125900)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1558 (buf!1948 lt!125900))) ((_ sign_extend 32) (currentByte!3810 lt!125900)) ((_ sign_extend 32) (currentBit!3805 lt!125900))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6054 () Bool)

(assert (= bs!6054 d!24988))

(declare-fun m!124551 () Bool)

(assert (=> bs!6054 m!124551))

(assert (=> b!79038 d!24988))

(declare-fun d!24990 () Bool)

(declare-fun lt!126011 () tuple2!7056)

(assert (=> d!24990 (= lt!126011 (readBit!0 lt!125900))))

(assert (=> d!24990 (= (readBitPure!0 lt!125900) (tuple2!7049 (_2!3665 lt!126011) (_1!3665 lt!126011)))))

(declare-fun bs!6055 () Bool)

(assert (= bs!6055 d!24990))

(declare-fun m!124553 () Bool)

(assert (=> bs!6055 m!124553))

(assert (=> b!79038 d!24990))

(assert (=> b!79038 d!24974))

(declare-fun b!79138 () Bool)

(declare-fun res!65501 () Bool)

(declare-fun e!51918 () Bool)

(assert (=> b!79138 (=> (not res!65501) (not e!51918))))

(declare-fun lt!126039 () tuple2!7050)

(assert (=> b!79138 (= res!65501 (isPrefixOf!0 thiss!1107 (_2!3662 lt!126039)))))

(declare-fun b!79140 () Bool)

(declare-fun e!51917 () Bool)

(declare-fun lt!126037 () tuple2!7048)

(assert (=> b!79140 (= e!51917 (= (bitIndex!0 (size!1558 (buf!1948 (_1!3661 lt!126037))) (currentByte!3810 (_1!3661 lt!126037)) (currentBit!3805 (_1!3661 lt!126037))) (bitIndex!0 (size!1558 (buf!1948 (_2!3662 lt!126039))) (currentByte!3810 (_2!3662 lt!126039)) (currentBit!3805 (_2!3662 lt!126039)))))))

(declare-fun d!24992 () Bool)

(assert (=> d!24992 e!51918))

(declare-fun res!65500 () Bool)

(assert (=> d!24992 (=> (not res!65500) (not e!51918))))

(assert (=> d!24992 (= res!65500 (= (size!1558 (buf!1948 thiss!1107)) (size!1558 (buf!1948 (_2!3662 lt!126039)))))))

(declare-fun choose!16 (BitStream!2678 Bool) tuple2!7050)

(assert (=> d!24992 (= lt!126039 (choose!16 thiss!1107 lt!125899))))

(assert (=> d!24992 (validate_offset_bit!0 ((_ sign_extend 32) (size!1558 (buf!1948 thiss!1107))) ((_ sign_extend 32) (currentByte!3810 thiss!1107)) ((_ sign_extend 32) (currentBit!3805 thiss!1107)))))

(assert (=> d!24992 (= (appendBit!0 thiss!1107 lt!125899) lt!126039)))

(declare-fun b!79139 () Bool)

(assert (=> b!79139 (= e!51918 e!51917)))

(declare-fun res!65502 () Bool)

(assert (=> b!79139 (=> (not res!65502) (not e!51917))))

(assert (=> b!79139 (= res!65502 (and (= (_2!3661 lt!126037) lt!125899) (= (_1!3661 lt!126037) (_2!3662 lt!126039))))))

(assert (=> b!79139 (= lt!126037 (readBitPure!0 (readerFrom!0 (_2!3662 lt!126039) (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107))))))

(declare-fun b!79137 () Bool)

(declare-fun res!65503 () Bool)

(assert (=> b!79137 (=> (not res!65503) (not e!51918))))

(declare-fun lt!126038 () (_ BitVec 64))

(declare-fun lt!126036 () (_ BitVec 64))

(assert (=> b!79137 (= res!65503 (= (bitIndex!0 (size!1558 (buf!1948 (_2!3662 lt!126039))) (currentByte!3810 (_2!3662 lt!126039)) (currentBit!3805 (_2!3662 lt!126039))) (bvadd lt!126036 lt!126038)))))

(assert (=> b!79137 (or (not (= (bvand lt!126036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126038 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!126036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!126036 lt!126038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!79137 (= lt!126038 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!79137 (= lt!126036 (bitIndex!0 (size!1558 (buf!1948 thiss!1107)) (currentByte!3810 thiss!1107) (currentBit!3805 thiss!1107)))))

(assert (= (and d!24992 res!65500) b!79137))

(assert (= (and b!79137 res!65503) b!79138))

(assert (= (and b!79138 res!65501) b!79139))

(assert (= (and b!79139 res!65502) b!79140))

(declare-fun m!124579 () Bool)

(assert (=> b!79139 m!124579))

(assert (=> b!79139 m!124579))

(declare-fun m!124581 () Bool)

(assert (=> b!79139 m!124581))

(declare-fun m!124583 () Bool)

(assert (=> b!79140 m!124583))

(declare-fun m!124585 () Bool)

(assert (=> b!79140 m!124585))

(declare-fun m!124587 () Bool)

(assert (=> d!24992 m!124587))

(assert (=> d!24992 m!124489))

(assert (=> b!79137 m!124585))

(assert (=> b!79137 m!124475))

(declare-fun m!124589 () Bool)

(assert (=> b!79138 m!124589))

(assert (=> b!79039 d!24992))

(declare-fun d!24994 () Bool)

(declare-fun res!65511 () Bool)

(declare-fun e!51924 () Bool)

(assert (=> d!24994 (=> (not res!65511) (not e!51924))))

(assert (=> d!24994 (= res!65511 (= (size!1558 (buf!1948 thiss!1107)) (size!1558 (buf!1948 (_2!3662 lt!125901)))))))

(assert (=> d!24994 (= (isPrefixOf!0 thiss!1107 (_2!3662 lt!125901)) e!51924)))

(declare-fun b!79147 () Bool)

(declare-fun res!65510 () Bool)

(assert (=> b!79147 (=> (not res!65510) (not e!51924))))

(assert (=> b!79147 (= res!65510 (bvsle (bitIndex!0 (size!1558 (buf!1948 thiss!1107)) (currentByte!3810 thiss!1107) (currentBit!3805 thiss!1107)) (bitIndex!0 (size!1558 (buf!1948 (_2!3662 lt!125901))) (currentByte!3810 (_2!3662 lt!125901)) (currentBit!3805 (_2!3662 lt!125901)))))))

(declare-fun b!79148 () Bool)

(declare-fun e!51923 () Bool)

(assert (=> b!79148 (= e!51924 e!51923)))

(declare-fun res!65512 () Bool)

(assert (=> b!79148 (=> res!65512 e!51923)))

(assert (=> b!79148 (= res!65512 (= (size!1558 (buf!1948 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!79149 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3371 array!3371 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79149 (= e!51923 (arrayBitRangesEq!0 (buf!1948 thiss!1107) (buf!1948 (_2!3662 lt!125901)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1558 (buf!1948 thiss!1107)) (currentByte!3810 thiss!1107) (currentBit!3805 thiss!1107))))))

(assert (= (and d!24994 res!65511) b!79147))

(assert (= (and b!79147 res!65510) b!79148))

(assert (= (and b!79148 (not res!65512)) b!79149))

(assert (=> b!79147 m!124475))

(assert (=> b!79147 m!124473))

(assert (=> b!79149 m!124475))

(assert (=> b!79149 m!124475))

(declare-fun m!124591 () Bool)

(assert (=> b!79149 m!124591))

(assert (=> b!79042 d!24994))

(assert (=> b!79043 d!24994))

(declare-fun d!24996 () Bool)

(assert (=> d!24996 (= (array_inv!1404 (buf!1948 thiss!1107)) (bvsge (size!1558 (buf!1948 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!79041 d!24996))

(declare-fun d!24998 () Bool)

(assert (=> d!24998 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3805 thiss!1107) (currentByte!3810 thiss!1107) (size!1558 (buf!1948 thiss!1107))))))

(declare-fun bs!6056 () Bool)

(assert (= bs!6056 d!24998))

(assert (=> bs!6056 m!124549))

(assert (=> start!15592 d!24998))

(push 1)

(assert (not d!24990))

(assert (not d!24984))

(assert (not d!24968))

(assert (not d!24998))

(assert (not b!79139))

(assert (not d!24970))

(assert (not b!79106))

(assert (not b!79147))

(assert (not b!79138))

(assert (not d!24988))

(assert (not d!24974))

(assert (not b!79137))

(assert (not d!24986))

(assert (not d!24992))

(assert (not d!24954))

(assert (not b!79149))

(assert (not b!79140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

