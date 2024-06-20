; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55312 () Bool)

(assert start!55312)

(declare-fun b!257977 () Bool)

(declare-fun res!216163 () Bool)

(declare-fun e!178914 () Bool)

(assert (=> b!257977 (=> (not res!216163) (not e!178914))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257977 (= res!216163 (not (= from!526 nBits!535)))))

(declare-fun b!257978 () Bool)

(declare-fun e!178918 () Bool)

(declare-datatypes ((array!14034 0))(
  ( (array!14035 (arr!7141 (Array (_ BitVec 32) (_ BitVec 8))) (size!6154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11230 0))(
  ( (BitStream!11231 (buf!6676 array!14034) (currentByte!12242 (_ BitVec 32)) (currentBit!12237 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11230)

(declare-fun array_inv!5895 (array!14034) Bool)

(assert (=> b!257978 (= e!178918 (array_inv!5895 (buf!6676 thiss!1754)))))

(declare-fun b!257979 () Bool)

(declare-fun e!178915 () Bool)

(declare-fun e!178916 () Bool)

(assert (=> b!257979 (= e!178915 (not e!178916))))

(declare-fun res!216159 () Bool)

(assert (=> b!257979 (=> res!216159 e!178916)))

(declare-datatypes ((tuple2!22082 0))(
  ( (tuple2!22083 (_1!11977 Bool) (_2!11977 BitStream!11230)) )
))
(declare-fun lt!399402 () tuple2!22082)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257979 (= res!216159 (bvslt (bvsub (bvadd (bitIndex!0 (size!6154 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754) (currentBit!12237 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6154 (buf!6676 (_2!11977 lt!399402))) (currentByte!12242 (_2!11977 lt!399402)) (currentBit!12237 (_2!11977 lt!399402)))))))

(declare-fun expected!109 () Bool)

(declare-fun lt!399403 () tuple2!22082)

(declare-fun checkBitsLoop!0 (BitStream!11230 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22082)

(assert (=> b!257979 (= lt!399402 (checkBitsLoop!0 (_2!11977 lt!399403) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257979 (validate_offset_bits!1 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399403)))) ((_ sign_extend 32) (currentByte!12242 (_2!11977 lt!399403))) ((_ sign_extend 32) (currentBit!12237 (_2!11977 lt!399403))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18417 0))(
  ( (Unit!18418) )
))
(declare-fun lt!399404 () Unit!18417)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11230 BitStream!11230 (_ BitVec 64) (_ BitVec 64)) Unit!18417)

(assert (=> b!257979 (= lt!399404 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11977 lt!399403) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257980 () Bool)

(assert (=> b!257980 (= e!178914 e!178915)))

(declare-fun res!216158 () Bool)

(assert (=> b!257980 (=> (not res!216158) (not e!178915))))

(assert (=> b!257980 (= res!216158 (= (_1!11977 lt!399403) expected!109))))

(declare-fun readBit!0 (BitStream!11230) tuple2!22082)

(assert (=> b!257980 (= lt!399403 (readBit!0 thiss!1754))))

(declare-fun b!257981 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257981 (= e!178916 (invariant!0 (currentBit!12237 thiss!1754) (currentByte!12242 thiss!1754) (size!6154 (buf!6676 thiss!1754))))))

(declare-fun b!257982 () Bool)

(declare-fun res!216160 () Bool)

(assert (=> b!257982 (=> res!216160 e!178916)))

(assert (=> b!257982 (= res!216160 (or (not (= (buf!6676 thiss!1754) (buf!6676 (_2!11977 lt!399402)))) (not (_1!11977 lt!399402))))))

(declare-fun res!216161 () Bool)

(assert (=> start!55312 (=> (not res!216161) (not e!178914))))

(assert (=> start!55312 (= res!216161 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55312 e!178914))

(assert (=> start!55312 true))

(declare-fun inv!12 (BitStream!11230) Bool)

(assert (=> start!55312 (and (inv!12 thiss!1754) e!178918)))

(declare-fun b!257983 () Bool)

(declare-fun res!216162 () Bool)

(assert (=> b!257983 (=> (not res!216162) (not e!178914))))

(assert (=> b!257983 (= res!216162 (validate_offset_bits!1 ((_ sign_extend 32) (size!6154 (buf!6676 thiss!1754))) ((_ sign_extend 32) (currentByte!12242 thiss!1754)) ((_ sign_extend 32) (currentBit!12237 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55312 res!216161) b!257983))

(assert (= (and b!257983 res!216162) b!257977))

(assert (= (and b!257977 res!216163) b!257980))

(assert (= (and b!257980 res!216158) b!257979))

(assert (= (and b!257979 (not res!216159)) b!257982))

(assert (= (and b!257982 (not res!216160)) b!257981))

(assert (= start!55312 b!257978))

(declare-fun m!387491 () Bool)

(assert (=> b!257978 m!387491))

(declare-fun m!387493 () Bool)

(assert (=> b!257979 m!387493))

(declare-fun m!387495 () Bool)

(assert (=> b!257979 m!387495))

(declare-fun m!387497 () Bool)

(assert (=> b!257979 m!387497))

(declare-fun m!387499 () Bool)

(assert (=> b!257979 m!387499))

(declare-fun m!387501 () Bool)

(assert (=> b!257979 m!387501))

(declare-fun m!387503 () Bool)

(assert (=> b!257980 m!387503))

(declare-fun m!387505 () Bool)

(assert (=> start!55312 m!387505))

(declare-fun m!387507 () Bool)

(assert (=> b!257983 m!387507))

(declare-fun m!387509 () Bool)

(assert (=> b!257981 m!387509))

(push 1)

(assert (not b!257983))

(assert (not b!257980))

(assert (not start!55312))

(assert (not b!257979))

(assert (not b!257981))

(assert (not b!257978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86568 () Bool)

(assert (=> d!86568 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12237 thiss!1754) (currentByte!12242 thiss!1754) (size!6154 (buf!6676 thiss!1754))))))

(declare-fun bs!21904 () Bool)

(assert (= bs!21904 d!86568))

(assert (=> bs!21904 m!387509))

(assert (=> start!55312 d!86568))

(declare-fun d!86570 () Bool)

(assert (=> d!86570 (= (invariant!0 (currentBit!12237 thiss!1754) (currentByte!12242 thiss!1754) (size!6154 (buf!6676 thiss!1754))) (and (bvsge (currentBit!12237 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12237 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12242 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12242 thiss!1754) (size!6154 (buf!6676 thiss!1754))) (and (= (currentBit!12237 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12242 thiss!1754) (size!6154 (buf!6676 thiss!1754)))))))))

(assert (=> b!257981 d!86570))

(declare-fun d!86572 () Bool)

(declare-fun e!178963 () Bool)

(assert (=> d!86572 e!178963))

(declare-fun res!216202 () Bool)

(assert (=> d!86572 (=> (not res!216202) (not e!178963))))

(declare-datatypes ((tuple2!22090 0))(
  ( (tuple2!22091 (_1!11981 Unit!18417) (_2!11981 BitStream!11230)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11230) tuple2!22090)

(assert (=> d!86572 (= res!216202 (= (buf!6676 (_2!11981 (increaseBitIndex!0 thiss!1754))) (buf!6676 thiss!1754)))))

(declare-fun lt!399456 () Bool)

(assert (=> d!86572 (= lt!399456 (not (= (bvand ((_ sign_extend 24) (select (arr!7141 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12237 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399454 () tuple2!22082)

(assert (=> d!86572 (= lt!399454 (tuple2!22083 (not (= (bvand ((_ sign_extend 24) (select (arr!7141 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12237 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11981 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86572 (validate_offset_bit!0 ((_ sign_extend 32) (size!6154 (buf!6676 thiss!1754))) ((_ sign_extend 32) (currentByte!12242 thiss!1754)) ((_ sign_extend 32) (currentBit!12237 thiss!1754)))))

(assert (=> d!86572 (= (readBit!0 thiss!1754) lt!399454)))

(declare-fun lt!399457 () (_ BitVec 64))

(declare-fun b!258036 () Bool)

(declare-fun lt!399452 () (_ BitVec 64))

(assert (=> b!258036 (= e!178963 (= (bitIndex!0 (size!6154 (buf!6676 (_2!11981 (increaseBitIndex!0 thiss!1754)))) (currentByte!12242 (_2!11981 (increaseBitIndex!0 thiss!1754))) (currentBit!12237 (_2!11981 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399452 lt!399457)))))

(assert (=> b!258036 (or (not (= (bvand lt!399452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399457 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399452 lt!399457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258036 (= lt!399457 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258036 (= lt!399452 (bitIndex!0 (size!6154 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754) (currentBit!12237 thiss!1754)))))

(declare-fun lt!399455 () Bool)

(assert (=> b!258036 (= lt!399455 (not (= (bvand ((_ sign_extend 24) (select (arr!7141 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12237 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399453 () Bool)

(assert (=> b!258036 (= lt!399453 (not (= (bvand ((_ sign_extend 24) (select (arr!7141 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12237 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399451 () Bool)

(assert (=> b!258036 (= lt!399451 (not (= (bvand ((_ sign_extend 24) (select (arr!7141 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12237 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86572 res!216202) b!258036))

(declare-fun m!387553 () Bool)

(assert (=> d!86572 m!387553))

(declare-fun m!387555 () Bool)

(assert (=> d!86572 m!387555))

(declare-fun m!387557 () Bool)

(assert (=> d!86572 m!387557))

(declare-fun m!387559 () Bool)

(assert (=> d!86572 m!387559))

(declare-fun m!387561 () Bool)

(assert (=> b!258036 m!387561))

(assert (=> b!258036 m!387501))

(assert (=> b!258036 m!387553))

(assert (=> b!258036 m!387557))

(assert (=> b!258036 m!387555))

(assert (=> b!257980 d!86572))

(declare-fun b!258098 () Bool)

(declare-fun e!179006 () tuple2!22082)

(assert (=> b!258098 (= e!179006 (tuple2!22083 true (_2!11977 lt!399403)))))

(declare-fun b!258100 () Bool)

(declare-fun e!179005 () Bool)

(declare-datatypes ((tuple2!22094 0))(
  ( (tuple2!22095 (_1!11983 BitStream!11230) (_2!11983 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11230) tuple2!22094)

(assert (=> b!258100 (= e!179005 (= expected!109 (_2!11983 (readBitPure!0 (_2!11977 lt!399403)))))))

(declare-fun lt!399591 () tuple2!22082)

(declare-fun lt!399595 () (_ BitVec 64))

(declare-fun b!258101 () Bool)

(declare-fun e!179009 () Bool)

(assert (=> b!258101 (= e!179009 (= (bvsub lt!399595 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6154 (buf!6676 (_2!11977 lt!399591))) (currentByte!12242 (_2!11977 lt!399591)) (currentBit!12237 (_2!11977 lt!399591)))))))

(assert (=> b!258101 (or (= (bvand lt!399595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399595 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399593 () (_ BitVec 64))

(assert (=> b!258101 (= lt!399595 (bvadd lt!399593 nBits!535))))

(assert (=> b!258101 (or (not (= (bvand lt!399593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399593 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258101 (= lt!399593 (bitIndex!0 (size!6154 (buf!6676 (_2!11977 lt!399403))) (currentByte!12242 (_2!11977 lt!399403)) (currentBit!12237 (_2!11977 lt!399403))))))

(declare-fun b!258102 () Bool)

(declare-fun e!179008 () tuple2!22082)

(declare-fun lt!399590 () tuple2!22082)

(assert (=> b!258102 (= e!179008 (tuple2!22083 false (_2!11977 lt!399590)))))

(declare-fun b!258103 () Bool)

(declare-fun res!216256 () Bool)

(declare-fun e!179007 () Bool)

(assert (=> b!258103 (=> (not res!216256) (not e!179007))))

(assert (=> b!258103 (= res!216256 (and (= (buf!6676 (_2!11977 lt!399403)) (buf!6676 (_2!11977 lt!399591))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11977 lt!399591))))))

(declare-fun lt!399586 () tuple2!22082)

(declare-fun b!258104 () Bool)

(assert (=> b!258104 (= lt!399586 (checkBitsLoop!0 (_2!11977 lt!399590) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399592 () Unit!18417)

(declare-fun lt!399587 () Unit!18417)

(assert (=> b!258104 (= lt!399592 lt!399587)))

(declare-fun lt!399594 () (_ BitVec 64))

(declare-fun lt!399585 () (_ BitVec 64))

(assert (=> b!258104 (validate_offset_bits!1 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399590)))) ((_ sign_extend 32) (currentByte!12242 (_2!11977 lt!399590))) ((_ sign_extend 32) (currentBit!12237 (_2!11977 lt!399590))) (bvsub lt!399594 lt!399585))))

(assert (=> b!258104 (= lt!399587 (validateOffsetBitsIneqLemma!0 (_2!11977 lt!399403) (_2!11977 lt!399590) lt!399594 lt!399585))))

(assert (=> b!258104 (= lt!399585 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258104 (= lt!399594 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258104 (= e!179008 (tuple2!22083 (_1!11977 lt!399586) (_2!11977 lt!399586)))))

(declare-fun d!86576 () Bool)

(assert (=> d!86576 e!179007))

(declare-fun res!216253 () Bool)

(assert (=> d!86576 (=> (not res!216253) (not e!179007))))

(declare-fun lt!399589 () (_ BitVec 64))

(assert (=> d!86576 (= res!216253 (bvsge (bvsub lt!399589 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6154 (buf!6676 (_2!11977 lt!399591))) (currentByte!12242 (_2!11977 lt!399591)) (currentBit!12237 (_2!11977 lt!399591)))))))

(assert (=> d!86576 (or (= (bvand lt!399589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399589 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399588 () (_ BitVec 64))

(assert (=> d!86576 (= lt!399589 (bvadd lt!399588 nBits!535))))

(assert (=> d!86576 (or (not (= (bvand lt!399588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399588 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86576 (= lt!399588 (bitIndex!0 (size!6154 (buf!6676 (_2!11977 lt!399403))) (currentByte!12242 (_2!11977 lt!399403)) (currentBit!12237 (_2!11977 lt!399403))))))

(assert (=> d!86576 (= lt!399591 e!179006)))

(declare-fun c!11852 () Bool)

(assert (=> d!86576 (= c!11852 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86576 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86576 (= (checkBitsLoop!0 (_2!11977 lt!399403) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399591)))

(declare-fun b!258099 () Bool)

(assert (=> b!258099 (= e!179007 e!179005)))

(declare-fun res!216252 () Bool)

(assert (=> b!258099 (=> res!216252 e!179005)))

(assert (=> b!258099 (= res!216252 (or (not (_1!11977 lt!399591)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!258105 () Bool)

(declare-fun res!216255 () Bool)

(assert (=> b!258105 (=> (not res!216255) (not e!179007))))

(assert (=> b!258105 (= res!216255 e!179009)))

(declare-fun res!216254 () Bool)

(assert (=> b!258105 (=> res!216254 e!179009)))

(assert (=> b!258105 (= res!216254 (not (_1!11977 lt!399591)))))

(declare-fun b!258106 () Bool)

(assert (=> b!258106 (= e!179006 e!179008)))

(assert (=> b!258106 (= lt!399590 (readBit!0 (_2!11977 lt!399403)))))

(declare-fun c!11853 () Bool)

(assert (=> b!258106 (= c!11853 (not (= (_1!11977 lt!399590) expected!109)))))

(assert (= (and d!86576 c!11852) b!258098))

(assert (= (and d!86576 (not c!11852)) b!258106))

(assert (= (and b!258106 c!11853) b!258102))

(assert (= (and b!258106 (not c!11853)) b!258104))

(assert (= (and d!86576 res!216253) b!258103))

(assert (= (and b!258103 res!216256) b!258105))

(assert (= (and b!258105 (not res!216254)) b!258101))

(assert (= (and b!258105 res!216255) b!258099))

(assert (= (and b!258099 (not res!216252)) b!258100))

(declare-fun m!387603 () Bool)

(assert (=> b!258104 m!387603))

(declare-fun m!387605 () Bool)

(assert (=> b!258104 m!387605))

(declare-fun m!387607 () Bool)

(assert (=> b!258104 m!387607))

(declare-fun m!387609 () Bool)

(assert (=> d!86576 m!387609))

(declare-fun m!387611 () Bool)

(assert (=> d!86576 m!387611))

(declare-fun m!387613 () Bool)

(assert (=> b!258100 m!387613))

(assert (=> b!258101 m!387609))

(assert (=> b!258101 m!387611))

(declare-fun m!387615 () Bool)

(assert (=> b!258106 m!387615))

(assert (=> b!257979 d!86576))

(declare-fun d!86602 () Bool)

(declare-fun e!179013 () Bool)

(assert (=> d!86602 e!179013))

(declare-fun res!216263 () Bool)

(assert (=> d!86602 (=> (not res!216263) (not e!179013))))

(declare-fun lt!399618 () (_ BitVec 64))

(declare-fun lt!399620 () (_ BitVec 64))

(declare-fun lt!399619 () (_ BitVec 64))

(assert (=> d!86602 (= res!216263 (= lt!399618 (bvsub lt!399619 lt!399620)))))

(assert (=> d!86602 (or (= (bvand lt!399619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399619 lt!399620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86602 (= lt!399620 (remainingBits!0 ((_ sign_extend 32) (size!6154 (buf!6676 thiss!1754))) ((_ sign_extend 32) (currentByte!12242 thiss!1754)) ((_ sign_extend 32) (currentBit!12237 thiss!1754))))))

(declare-fun lt!399617 () (_ BitVec 64))

(declare-fun lt!399615 () (_ BitVec 64))

(assert (=> d!86602 (= lt!399619 (bvmul lt!399617 lt!399615))))

(assert (=> d!86602 (or (= lt!399617 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399615 (bvsdiv (bvmul lt!399617 lt!399615) lt!399617)))))

(assert (=> d!86602 (= lt!399615 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86602 (= lt!399617 ((_ sign_extend 32) (size!6154 (buf!6676 thiss!1754))))))

(assert (=> d!86602 (= lt!399618 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12242 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12237 thiss!1754))))))

(assert (=> d!86602 (invariant!0 (currentBit!12237 thiss!1754) (currentByte!12242 thiss!1754) (size!6154 (buf!6676 thiss!1754)))))

(assert (=> d!86602 (= (bitIndex!0 (size!6154 (buf!6676 thiss!1754)) (currentByte!12242 thiss!1754) (currentBit!12237 thiss!1754)) lt!399618)))

(declare-fun b!258112 () Bool)

(declare-fun res!216262 () Bool)

(assert (=> b!258112 (=> (not res!216262) (not e!179013))))

(assert (=> b!258112 (= res!216262 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399618))))

(declare-fun b!258113 () Bool)

(declare-fun lt!399616 () (_ BitVec 64))

(assert (=> b!258113 (= e!179013 (bvsle lt!399618 (bvmul lt!399616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258113 (or (= lt!399616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399616)))))

(assert (=> b!258113 (= lt!399616 ((_ sign_extend 32) (size!6154 (buf!6676 thiss!1754))))))

(assert (= (and d!86602 res!216263) b!258112))

(assert (= (and b!258112 res!216262) b!258113))

(declare-fun m!387627 () Bool)

(assert (=> d!86602 m!387627))

(assert (=> d!86602 m!387509))

(assert (=> b!257979 d!86602))

(declare-fun d!86604 () Bool)

(assert (=> d!86604 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399403)))) ((_ sign_extend 32) (currentByte!12242 (_2!11977 lt!399403))) ((_ sign_extend 32) (currentBit!12237 (_2!11977 lt!399403))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399403)))) ((_ sign_extend 32) (currentByte!12242 (_2!11977 lt!399403))) ((_ sign_extend 32) (currentBit!12237 (_2!11977 lt!399403)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21908 () Bool)

(assert (= bs!21908 d!86604))

(declare-fun m!387629 () Bool)

(assert (=> bs!21908 m!387629))

(assert (=> b!257979 d!86604))

(declare-fun d!86606 () Bool)

(declare-fun e!179026 () Bool)

(assert (=> d!86606 e!179026))

(declare-fun res!216276 () Bool)

(assert (=> d!86606 (=> (not res!216276) (not e!179026))))

(assert (=> d!86606 (= res!216276 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399645 () Unit!18417)

(declare-fun choose!27 (BitStream!11230 BitStream!11230 (_ BitVec 64) (_ BitVec 64)) Unit!18417)

(assert (=> d!86606 (= lt!399645 (choose!27 thiss!1754 (_2!11977 lt!399403) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86606 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86606 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11977 lt!399403) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399645)))

(declare-fun b!258134 () Bool)

(assert (=> b!258134 (= e!179026 (validate_offset_bits!1 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399403)))) ((_ sign_extend 32) (currentByte!12242 (_2!11977 lt!399403))) ((_ sign_extend 32) (currentBit!12237 (_2!11977 lt!399403))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86606 res!216276) b!258134))

(declare-fun m!387631 () Bool)

(assert (=> d!86606 m!387631))

(assert (=> b!258134 m!387495))

(assert (=> b!257979 d!86606))

(declare-fun d!86608 () Bool)

(declare-fun e!179027 () Bool)

(assert (=> d!86608 e!179027))

(declare-fun res!216278 () Bool)

(assert (=> d!86608 (=> (not res!216278) (not e!179027))))

(declare-fun lt!399651 () (_ BitVec 64))

(declare-fun lt!399649 () (_ BitVec 64))

(declare-fun lt!399650 () (_ BitVec 64))

(assert (=> d!86608 (= res!216278 (= lt!399649 (bvsub lt!399650 lt!399651)))))

(assert (=> d!86608 (or (= (bvand lt!399650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399651 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399650 lt!399651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86608 (= lt!399651 (remainingBits!0 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399402)))) ((_ sign_extend 32) (currentByte!12242 (_2!11977 lt!399402))) ((_ sign_extend 32) (currentBit!12237 (_2!11977 lt!399402)))))))

(declare-fun lt!399648 () (_ BitVec 64))

(declare-fun lt!399646 () (_ BitVec 64))

(assert (=> d!86608 (= lt!399650 (bvmul lt!399648 lt!399646))))

(assert (=> d!86608 (or (= lt!399648 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399646 (bvsdiv (bvmul lt!399648 lt!399646) lt!399648)))))

(assert (=> d!86608 (= lt!399646 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86608 (= lt!399648 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399402)))))))

(assert (=> d!86608 (= lt!399649 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12242 (_2!11977 lt!399402))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12237 (_2!11977 lt!399402)))))))

(assert (=> d!86608 (invariant!0 (currentBit!12237 (_2!11977 lt!399402)) (currentByte!12242 (_2!11977 lt!399402)) (size!6154 (buf!6676 (_2!11977 lt!399402))))))

(assert (=> d!86608 (= (bitIndex!0 (size!6154 (buf!6676 (_2!11977 lt!399402))) (currentByte!12242 (_2!11977 lt!399402)) (currentBit!12237 (_2!11977 lt!399402))) lt!399649)))

(declare-fun b!258135 () Bool)

(declare-fun res!216277 () Bool)

(assert (=> b!258135 (=> (not res!216277) (not e!179027))))

(assert (=> b!258135 (= res!216277 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399649))))

(declare-fun b!258136 () Bool)

(declare-fun lt!399647 () (_ BitVec 64))

(assert (=> b!258136 (= e!179027 (bvsle lt!399649 (bvmul lt!399647 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258136 (or (= lt!399647 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399647 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399647)))))

(assert (=> b!258136 (= lt!399647 ((_ sign_extend 32) (size!6154 (buf!6676 (_2!11977 lt!399402)))))))

(assert (= (and d!86608 res!216278) b!258135))

(assert (= (and b!258135 res!216277) b!258136))

(declare-fun m!387633 () Bool)

(assert (=> d!86608 m!387633))

(declare-fun m!387635 () Bool)

(assert (=> d!86608 m!387635))

(assert (=> b!257979 d!86608))

(declare-fun d!86610 () Bool)

(assert (=> d!86610 (= (array_inv!5895 (buf!6676 thiss!1754)) (bvsge (size!6154 (buf!6676 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257978 d!86610))

(declare-fun d!86612 () Bool)

(assert (=> d!86612 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6154 (buf!6676 thiss!1754))) ((_ sign_extend 32) (currentByte!12242 thiss!1754)) ((_ sign_extend 32) (currentBit!12237 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6154 (buf!6676 thiss!1754))) ((_ sign_extend 32) (currentByte!12242 thiss!1754)) ((_ sign_extend 32) (currentBit!12237 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21909 () Bool)

(assert (= bs!21909 d!86612))

(assert (=> bs!21909 m!387627))

(assert (=> b!257983 d!86612))

(push 1)

(assert (not b!258106))

(assert (not b!258101))

(assert (not d!86608))

(assert (not b!258104))

(assert (not d!86576))

(assert (not d!86604))

(assert (not d!86572))

(assert (not b!258036))

(assert (not d!86606))

(assert (not d!86602))

(assert (not d!86612))

(assert (not b!258100))

(assert (not d!86568))

(assert (not b!258134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

