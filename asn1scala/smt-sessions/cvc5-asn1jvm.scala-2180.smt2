; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55180 () Bool)

(assert start!55180)

(declare-fun b!257599 () Bool)

(declare-fun res!215882 () Bool)

(declare-fun e!178645 () Bool)

(assert (=> b!257599 (=> (not res!215882) (not e!178645))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14016 0))(
  ( (array!14017 (arr!7135 (Array (_ BitVec 32) (_ BitVec 8))) (size!6148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11218 0))(
  ( (BitStream!11219 (buf!6670 array!14016) (currentByte!12215 (_ BitVec 32)) (currentBit!12210 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11218)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257599 (= res!215882 (validate_offset_bits!1 ((_ sign_extend 32) (size!6148 (buf!6670 thiss!1754))) ((_ sign_extend 32) (currentByte!12215 thiss!1754)) ((_ sign_extend 32) (currentBit!12210 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257600 () Bool)

(declare-fun e!178643 () Bool)

(assert (=> b!257600 (= e!178645 e!178643)))

(declare-fun res!215881 () Bool)

(assert (=> b!257600 (=> (not res!215881) (not e!178643))))

(declare-datatypes ((tuple2!22046 0))(
  ( (tuple2!22047 (_1!11959 Bool) (_2!11959 BitStream!11218)) )
))
(declare-fun lt!398787 () tuple2!22046)

(declare-fun expected!109 () Bool)

(assert (=> b!257600 (= res!215881 (= (_1!11959 lt!398787) expected!109))))

(declare-fun readBit!0 (BitStream!11218) tuple2!22046)

(assert (=> b!257600 (= lt!398787 (readBit!0 thiss!1754))))

(declare-fun b!257601 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257601 (= e!178643 (not (invariant!0 (currentBit!12210 thiss!1754) (currentByte!12215 thiss!1754) (size!6148 (buf!6670 thiss!1754)))))))

(declare-fun lt!398789 () tuple2!22046)

(declare-fun checkBitsLoop!0 (BitStream!11218 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22046)

(assert (=> b!257601 (= lt!398789 (checkBitsLoop!0 (_2!11959 lt!398787) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!257601 (validate_offset_bits!1 ((_ sign_extend 32) (size!6148 (buf!6670 (_2!11959 lt!398787)))) ((_ sign_extend 32) (currentByte!12215 (_2!11959 lt!398787))) ((_ sign_extend 32) (currentBit!12210 (_2!11959 lt!398787))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18399 0))(
  ( (Unit!18400) )
))
(declare-fun lt!398788 () Unit!18399)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11218 BitStream!11218 (_ BitVec 64) (_ BitVec 64)) Unit!18399)

(assert (=> b!257601 (= lt!398788 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11959 lt!398787) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257602 () Bool)

(declare-fun e!178642 () Bool)

(declare-fun array_inv!5889 (array!14016) Bool)

(assert (=> b!257602 (= e!178642 (array_inv!5889 (buf!6670 thiss!1754)))))

(declare-fun b!257598 () Bool)

(declare-fun res!215884 () Bool)

(assert (=> b!257598 (=> (not res!215884) (not e!178645))))

(assert (=> b!257598 (= res!215884 (not (= from!526 nBits!535)))))

(declare-fun res!215883 () Bool)

(assert (=> start!55180 (=> (not res!215883) (not e!178645))))

(assert (=> start!55180 (= res!215883 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55180 e!178645))

(assert (=> start!55180 true))

(declare-fun inv!12 (BitStream!11218) Bool)

(assert (=> start!55180 (and (inv!12 thiss!1754) e!178642)))

(assert (= (and start!55180 res!215883) b!257599))

(assert (= (and b!257599 res!215882) b!257598))

(assert (= (and b!257598 res!215884) b!257600))

(assert (= (and b!257600 res!215881) b!257601))

(assert (= start!55180 b!257602))

(declare-fun m!387071 () Bool)

(assert (=> b!257599 m!387071))

(declare-fun m!387073 () Bool)

(assert (=> start!55180 m!387073))

(declare-fun m!387075 () Bool)

(assert (=> b!257602 m!387075))

(declare-fun m!387077 () Bool)

(assert (=> b!257600 m!387077))

(declare-fun m!387079 () Bool)

(assert (=> b!257601 m!387079))

(declare-fun m!387081 () Bool)

(assert (=> b!257601 m!387081))

(declare-fun m!387083 () Bool)

(assert (=> b!257601 m!387083))

(declare-fun m!387085 () Bool)

(assert (=> b!257601 m!387085))

(push 1)

(assert (not start!55180))

(assert (not b!257599))

(assert (not b!257601))

(assert (not b!257600))

(assert (not b!257602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86378 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86378 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6148 (buf!6670 thiss!1754))) ((_ sign_extend 32) (currentByte!12215 thiss!1754)) ((_ sign_extend 32) (currentBit!12210 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6148 (buf!6670 thiss!1754))) ((_ sign_extend 32) (currentByte!12215 thiss!1754)) ((_ sign_extend 32) (currentBit!12210 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21869 () Bool)

(assert (= bs!21869 d!86378))

(declare-fun m!387121 () Bool)

(assert (=> bs!21869 m!387121))

(assert (=> b!257599 d!86378))

(declare-fun d!86380 () Bool)

(declare-fun e!178687 () Bool)

(assert (=> d!86380 e!178687))

(declare-fun res!215914 () Bool)

(assert (=> d!86380 (=> (not res!215914) (not e!178687))))

(declare-datatypes ((tuple2!22054 0))(
  ( (tuple2!22055 (_1!11963 Unit!18399) (_2!11963 BitStream!11218)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11218) tuple2!22054)

(assert (=> d!86380 (= res!215914 (= (buf!6670 (_2!11963 (increaseBitIndex!0 thiss!1754))) (buf!6670 thiss!1754)))))

(declare-fun lt!398843 () Bool)

(assert (=> d!86380 (= lt!398843 (not (= (bvand ((_ sign_extend 24) (select (arr!7135 (buf!6670 thiss!1754)) (currentByte!12215 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12210 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398848 () tuple2!22046)

(assert (=> d!86380 (= lt!398848 (tuple2!22047 (not (= (bvand ((_ sign_extend 24) (select (arr!7135 (buf!6670 thiss!1754)) (currentByte!12215 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12210 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11963 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86380 (validate_offset_bit!0 ((_ sign_extend 32) (size!6148 (buf!6670 thiss!1754))) ((_ sign_extend 32) (currentByte!12215 thiss!1754)) ((_ sign_extend 32) (currentBit!12210 thiss!1754)))))

(assert (=> d!86380 (= (readBit!0 thiss!1754) lt!398848)))

(declare-fun lt!398844 () (_ BitVec 64))

(declare-fun lt!398847 () (_ BitVec 64))

(declare-fun b!257638 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257638 (= e!178687 (= (bitIndex!0 (size!6148 (buf!6670 (_2!11963 (increaseBitIndex!0 thiss!1754)))) (currentByte!12215 (_2!11963 (increaseBitIndex!0 thiss!1754))) (currentBit!12210 (_2!11963 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398844 lt!398847)))))

(assert (=> b!257638 (or (not (= (bvand lt!398844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398847 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398844 lt!398847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257638 (= lt!398847 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257638 (= lt!398844 (bitIndex!0 (size!6148 (buf!6670 thiss!1754)) (currentByte!12215 thiss!1754) (currentBit!12210 thiss!1754)))))

(declare-fun lt!398845 () Bool)

(assert (=> b!257638 (= lt!398845 (not (= (bvand ((_ sign_extend 24) (select (arr!7135 (buf!6670 thiss!1754)) (currentByte!12215 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12210 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398849 () Bool)

(assert (=> b!257638 (= lt!398849 (not (= (bvand ((_ sign_extend 24) (select (arr!7135 (buf!6670 thiss!1754)) (currentByte!12215 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12210 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398846 () Bool)

(assert (=> b!257638 (= lt!398846 (not (= (bvand ((_ sign_extend 24) (select (arr!7135 (buf!6670 thiss!1754)) (currentByte!12215 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12210 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86380 res!215914) b!257638))

(declare-fun m!387137 () Bool)

(assert (=> d!86380 m!387137))

(declare-fun m!387139 () Bool)

(assert (=> d!86380 m!387139))

(declare-fun m!387141 () Bool)

(assert (=> d!86380 m!387141))

(declare-fun m!387143 () Bool)

(assert (=> d!86380 m!387143))

(assert (=> b!257638 m!387137))

(declare-fun m!387145 () Bool)

(assert (=> b!257638 m!387145))

(assert (=> b!257638 m!387139))

(declare-fun m!387147 () Bool)

(assert (=> b!257638 m!387147))

(assert (=> b!257638 m!387141))

(assert (=> b!257600 d!86380))

(declare-fun d!86394 () Bool)

(assert (=> d!86394 (= (array_inv!5889 (buf!6670 thiss!1754)) (bvsge (size!6148 (buf!6670 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257602 d!86394))

(declare-fun d!86396 () Bool)

(assert (=> d!86396 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12210 thiss!1754) (currentByte!12215 thiss!1754) (size!6148 (buf!6670 thiss!1754))))))

(declare-fun bs!21872 () Bool)

(assert (= bs!21872 d!86396))

(assert (=> bs!21872 m!387079))

(assert (=> start!55180 d!86396))

(declare-fun d!86398 () Bool)

(assert (=> d!86398 (= (invariant!0 (currentBit!12210 thiss!1754) (currentByte!12215 thiss!1754) (size!6148 (buf!6670 thiss!1754))) (and (bvsge (currentBit!12210 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12210 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12215 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12215 thiss!1754) (size!6148 (buf!6670 thiss!1754))) (and (= (currentBit!12210 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12215 thiss!1754) (size!6148 (buf!6670 thiss!1754)))))))))

(assert (=> b!257601 d!86398))

(declare-fun b!257708 () Bool)

(declare-fun e!178729 () Bool)

(declare-fun e!178732 () Bool)

(assert (=> b!257708 (= e!178729 e!178732)))

(declare-fun res!215960 () Bool)

(assert (=> b!257708 (=> res!215960 e!178732)))

(declare-fun lt!398960 () tuple2!22046)

(assert (=> b!257708 (= res!215960 (or (not (_1!11959 lt!398960)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun lt!398958 () (_ BitVec 64))

(declare-fun e!178733 () Bool)

(declare-fun b!257710 () Bool)

(assert (=> b!257710 (= e!178733 (= (bvsub lt!398958 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6148 (buf!6670 (_2!11959 lt!398960))) (currentByte!12215 (_2!11959 lt!398960)) (currentBit!12210 (_2!11959 lt!398960)))))))

(assert (=> b!257710 (or (= (bvand lt!398958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398958 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398959 () (_ BitVec 64))

(assert (=> b!257710 (= lt!398958 (bvadd lt!398959 nBits!535))))

(assert (=> b!257710 (or (not (= (bvand lt!398959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398959 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257710 (= lt!398959 (bitIndex!0 (size!6148 (buf!6670 (_2!11959 lt!398787))) (currentByte!12215 (_2!11959 lt!398787)) (currentBit!12210 (_2!11959 lt!398787))))))

(declare-fun b!257711 () Bool)

(declare-fun e!178731 () tuple2!22046)

(assert (=> b!257711 (= e!178731 (tuple2!22047 true (_2!11959 lt!398787)))))

(declare-fun b!257712 () Bool)

(declare-fun e!178730 () tuple2!22046)

(declare-fun lt!398957 () tuple2!22046)

(assert (=> b!257712 (= e!178730 (tuple2!22047 false (_2!11959 lt!398957)))))

(declare-fun b!257713 () Bool)

(declare-fun res!215958 () Bool)

(assert (=> b!257713 (=> (not res!215958) (not e!178729))))

(assert (=> b!257713 (= res!215958 e!178733)))

(declare-fun res!215956 () Bool)

(assert (=> b!257713 (=> res!215956 e!178733)))

(assert (=> b!257713 (= res!215956 (not (_1!11959 lt!398960)))))

(declare-fun b!257714 () Bool)

(assert (=> b!257714 (= e!178731 e!178730)))

(assert (=> b!257714 (= lt!398957 (readBit!0 (_2!11959 lt!398787)))))

(declare-fun c!11814 () Bool)

(assert (=> b!257714 (= c!11814 (not (= (_1!11959 lt!398957) expected!109)))))

(declare-fun b!257715 () Bool)

(declare-fun res!215957 () Bool)

(assert (=> b!257715 (=> (not res!215957) (not e!178729))))

(assert (=> b!257715 (= res!215957 (and (= (buf!6670 (_2!11959 lt!398787)) (buf!6670 (_2!11959 lt!398960))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11959 lt!398960))))))

(declare-fun b!257716 () Bool)

(declare-fun lt!398955 () tuple2!22046)

(assert (=> b!257716 (= lt!398955 (checkBitsLoop!0 (_2!11959 lt!398957) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!398956 () Unit!18399)

(declare-fun lt!398953 () Unit!18399)

(assert (=> b!257716 (= lt!398956 lt!398953)))

(declare-fun lt!398952 () (_ BitVec 64))

(declare-fun lt!398961 () (_ BitVec 64))

(assert (=> b!257716 (validate_offset_bits!1 ((_ sign_extend 32) (size!6148 (buf!6670 (_2!11959 lt!398957)))) ((_ sign_extend 32) (currentByte!12215 (_2!11959 lt!398957))) ((_ sign_extend 32) (currentBit!12210 (_2!11959 lt!398957))) (bvsub lt!398952 lt!398961))))

(assert (=> b!257716 (= lt!398953 (validateOffsetBitsIneqLemma!0 (_2!11959 lt!398787) (_2!11959 lt!398957) lt!398952 lt!398961))))

(assert (=> b!257716 (= lt!398961 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257716 (= lt!398952 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!257716 (= e!178730 (tuple2!22047 (_1!11959 lt!398955) (_2!11959 lt!398955)))))

(declare-fun d!86400 () Bool)

(assert (=> d!86400 e!178729))

(declare-fun res!215959 () Bool)

(assert (=> d!86400 (=> (not res!215959) (not e!178729))))

(declare-fun lt!398954 () (_ BitVec 64))

(assert (=> d!86400 (= res!215959 (bvsge (bvsub lt!398954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6148 (buf!6670 (_2!11959 lt!398960))) (currentByte!12215 (_2!11959 lt!398960)) (currentBit!12210 (_2!11959 lt!398960)))))))

(assert (=> d!86400 (or (= (bvand lt!398954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398951 () (_ BitVec 64))

(assert (=> d!86400 (= lt!398954 (bvadd lt!398951 nBits!535))))

(assert (=> d!86400 (or (not (= (bvand lt!398951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398951 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86400 (= lt!398951 (bitIndex!0 (size!6148 (buf!6670 (_2!11959 lt!398787))) (currentByte!12215 (_2!11959 lt!398787)) (currentBit!12210 (_2!11959 lt!398787))))))

(assert (=> d!86400 (= lt!398960 e!178731)))

(declare-fun c!11815 () Bool)

(assert (=> d!86400 (= c!11815 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86400 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86400 (= (checkBitsLoop!0 (_2!11959 lt!398787) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!398960)))

(declare-fun b!257709 () Bool)

(declare-datatypes ((tuple2!22060 0))(
  ( (tuple2!22061 (_1!11966 BitStream!11218) (_2!11966 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11218) tuple2!22060)

(assert (=> b!257709 (= e!178732 (= expected!109 (_2!11966 (readBitPure!0 (_2!11959 lt!398787)))))))

(assert (= (and d!86400 c!11815) b!257711))

(assert (= (and d!86400 (not c!11815)) b!257714))

(assert (= (and b!257714 c!11814) b!257712))

(assert (= (and b!257714 (not c!11814)) b!257716))

(assert (= (and d!86400 res!215959) b!257715))

(assert (= (and b!257715 res!215957) b!257713))

(assert (= (and b!257713 (not res!215956)) b!257710))

(assert (= (and b!257713 res!215958) b!257708))

(assert (= (and b!257708 (not res!215960)) b!257709))

(declare-fun m!387179 () Bool)

(assert (=> b!257716 m!387179))

(declare-fun m!387181 () Bool)

(assert (=> b!257716 m!387181))

(declare-fun m!387183 () Bool)

(assert (=> b!257716 m!387183))

(declare-fun m!387185 () Bool)

(assert (=> d!86400 m!387185))

(declare-fun m!387187 () Bool)

(assert (=> d!86400 m!387187))

(declare-fun m!387189 () Bool)

(assert (=> b!257709 m!387189))

(assert (=> b!257710 m!387185))

(assert (=> b!257710 m!387187))

(declare-fun m!387191 () Bool)

(assert (=> b!257714 m!387191))

(assert (=> b!257601 d!86400))

(declare-fun d!86412 () Bool)

(assert (=> d!86412 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6148 (buf!6670 (_2!11959 lt!398787)))) ((_ sign_extend 32) (currentByte!12215 (_2!11959 lt!398787))) ((_ sign_extend 32) (currentBit!12210 (_2!11959 lt!398787))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6148 (buf!6670 (_2!11959 lt!398787)))) ((_ sign_extend 32) (currentByte!12215 (_2!11959 lt!398787))) ((_ sign_extend 32) (currentBit!12210 (_2!11959 lt!398787)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21874 () Bool)

(assert (= bs!21874 d!86412))

(declare-fun m!387193 () Bool)

(assert (=> bs!21874 m!387193))

(assert (=> b!257601 d!86412))

(declare-fun d!86414 () Bool)

(declare-fun e!178741 () Bool)

(assert (=> d!86414 e!178741))

(declare-fun res!215968 () Bool)

(assert (=> d!86414 (=> (not res!215968) (not e!178741))))

(assert (=> d!86414 (= res!215968 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!398975 () Unit!18399)

(declare-fun choose!27 (BitStream!11218 BitStream!11218 (_ BitVec 64) (_ BitVec 64)) Unit!18399)

(assert (=> d!86414 (= lt!398975 (choose!27 thiss!1754 (_2!11959 lt!398787) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86414 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86414 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11959 lt!398787) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!398975)))

(declare-fun b!257728 () Bool)

(assert (=> b!257728 (= e!178741 (validate_offset_bits!1 ((_ sign_extend 32) (size!6148 (buf!6670 (_2!11959 lt!398787)))) ((_ sign_extend 32) (currentByte!12215 (_2!11959 lt!398787))) ((_ sign_extend 32) (currentBit!12210 (_2!11959 lt!398787))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86414 res!215968) b!257728))

(declare-fun m!387211 () Bool)

(assert (=> d!86414 m!387211))

(assert (=> b!257728 m!387083))

(assert (=> b!257601 d!86414))

(push 1)

(assert (not b!257710))

