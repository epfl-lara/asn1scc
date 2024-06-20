; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55366 () Bool)

(assert start!55366)

(declare-fun b!258163 () Bool)

(declare-fun e!179048 () Bool)

(declare-datatypes ((array!14043 0))(
  ( (array!14044 (arr!7144 (Array (_ BitVec 32) (_ BitVec 8))) (size!6157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11236 0))(
  ( (BitStream!11237 (buf!6679 array!14043) (currentByte!12254 (_ BitVec 32)) (currentBit!12249 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22100 0))(
  ( (tuple2!22101 (_1!11986 Bool) (_2!11986 BitStream!11236)) )
))
(declare-fun lt!399673 () tuple2!22100)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258163 (= e!179048 (invariant!0 (currentBit!12249 (_2!11986 lt!399673)) (currentByte!12254 (_2!11986 lt!399673)) (size!6157 (buf!6679 (_2!11986 lt!399673)))))))

(declare-fun b!258164 () Bool)

(declare-fun res!216302 () Bool)

(declare-fun e!179047 () Bool)

(assert (=> b!258164 (=> (not res!216302) (not e!179047))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun thiss!1754 () BitStream!11236)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258164 (= res!216302 (validate_offset_bits!1 ((_ sign_extend 32) (size!6157 (buf!6679 thiss!1754))) ((_ sign_extend 32) (currentByte!12254 thiss!1754)) ((_ sign_extend 32) (currentBit!12249 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258165 () Bool)

(declare-fun e!179046 () Bool)

(assert (=> b!258165 (= e!179046 (not e!179048))))

(declare-fun res!216300 () Bool)

(assert (=> b!258165 (=> res!216300 e!179048)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258165 (= res!216300 (bvslt (bvsub (bvadd (bitIndex!0 (size!6157 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754) (currentBit!12249 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6157 (buf!6679 (_2!11986 lt!399673))) (currentByte!12254 (_2!11986 lt!399673)) (currentBit!12249 (_2!11986 lt!399673)))))))

(declare-fun expected!109 () Bool)

(declare-fun lt!399674 () tuple2!22100)

(declare-fun checkBitsLoop!0 (BitStream!11236 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22100)

(assert (=> b!258165 (= lt!399673 (checkBitsLoop!0 (_2!11986 lt!399674) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258165 (validate_offset_bits!1 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399674)))) ((_ sign_extend 32) (currentByte!12254 (_2!11986 lt!399674))) ((_ sign_extend 32) (currentBit!12249 (_2!11986 lt!399674))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18423 0))(
  ( (Unit!18424) )
))
(declare-fun lt!399672 () Unit!18423)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11236 BitStream!11236 (_ BitVec 64) (_ BitVec 64)) Unit!18423)

(assert (=> b!258165 (= lt!399672 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11986 lt!399674) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!258166 () Bool)

(declare-fun e!179049 () Bool)

(declare-fun array_inv!5898 (array!14043) Bool)

(assert (=> b!258166 (= e!179049 (array_inv!5898 (buf!6679 thiss!1754)))))

(declare-fun b!258167 () Bool)

(assert (=> b!258167 (= e!179047 e!179046)))

(declare-fun res!216303 () Bool)

(assert (=> b!258167 (=> (not res!216303) (not e!179046))))

(assert (=> b!258167 (= res!216303 (= (_1!11986 lt!399674) expected!109))))

(declare-fun readBit!0 (BitStream!11236) tuple2!22100)

(assert (=> b!258167 (= lt!399674 (readBit!0 thiss!1754))))

(declare-fun b!258168 () Bool)

(declare-fun res!216301 () Bool)

(assert (=> b!258168 (=> (not res!216301) (not e!179047))))

(assert (=> b!258168 (= res!216301 (not (= from!526 nBits!535)))))

(declare-fun b!258169 () Bool)

(declare-fun res!216304 () Bool)

(assert (=> b!258169 (=> res!216304 e!179048)))

(assert (=> b!258169 (= res!216304 (or (not (= (buf!6679 thiss!1754) (buf!6679 (_2!11986 lt!399673)))) (not (_1!11986 lt!399673))))))

(declare-fun res!216299 () Bool)

(assert (=> start!55366 (=> (not res!216299) (not e!179047))))

(assert (=> start!55366 (= res!216299 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55366 e!179047))

(assert (=> start!55366 true))

(declare-fun inv!12 (BitStream!11236) Bool)

(assert (=> start!55366 (and (inv!12 thiss!1754) e!179049)))

(assert (= (and start!55366 res!216299) b!258164))

(assert (= (and b!258164 res!216302) b!258168))

(assert (= (and b!258168 res!216301) b!258167))

(assert (= (and b!258167 res!216303) b!258165))

(assert (= (and b!258165 (not res!216300)) b!258169))

(assert (= (and b!258169 (not res!216304)) b!258163))

(assert (= start!55366 b!258166))

(declare-fun m!387653 () Bool)

(assert (=> b!258165 m!387653))

(declare-fun m!387655 () Bool)

(assert (=> b!258165 m!387655))

(declare-fun m!387657 () Bool)

(assert (=> b!258165 m!387657))

(declare-fun m!387659 () Bool)

(assert (=> b!258165 m!387659))

(declare-fun m!387661 () Bool)

(assert (=> b!258165 m!387661))

(declare-fun m!387663 () Bool)

(assert (=> b!258163 m!387663))

(declare-fun m!387665 () Bool)

(assert (=> b!258164 m!387665))

(declare-fun m!387667 () Bool)

(assert (=> b!258167 m!387667))

(declare-fun m!387669 () Bool)

(assert (=> b!258166 m!387669))

(declare-fun m!387671 () Bool)

(assert (=> start!55366 m!387671))

(push 1)

(assert (not b!258165))

(assert (not b!258166))

(assert (not b!258164))

(assert (not start!55366))

(assert (not b!258167))

(assert (not b!258163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86628 () Bool)

(declare-fun e!179101 () Bool)

(assert (=> d!86628 e!179101))

(declare-fun res!216352 () Bool)

(assert (=> d!86628 (=> (not res!216352) (not e!179101))))

(declare-datatypes ((tuple2!22108 0))(
  ( (tuple2!22109 (_1!11990 Unit!18423) (_2!11990 BitStream!11236)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11236) tuple2!22108)

(assert (=> d!86628 (= res!216352 (= (buf!6679 (_2!11990 (increaseBitIndex!0 thiss!1754))) (buf!6679 thiss!1754)))))

(declare-fun lt!399747 () Bool)

(assert (=> d!86628 (= lt!399747 (not (= (bvand ((_ sign_extend 24) (select (arr!7144 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12249 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399752 () tuple2!22100)

(assert (=> d!86628 (= lt!399752 (tuple2!22101 (not (= (bvand ((_ sign_extend 24) (select (arr!7144 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12249 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11990 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86628 (validate_offset_bit!0 ((_ sign_extend 32) (size!6157 (buf!6679 thiss!1754))) ((_ sign_extend 32) (currentByte!12254 thiss!1754)) ((_ sign_extend 32) (currentBit!12249 thiss!1754)))))

(assert (=> d!86628 (= (readBit!0 thiss!1754) lt!399752)))

(declare-fun b!258223 () Bool)

(declare-fun lt!399748 () (_ BitVec 64))

(declare-fun lt!399746 () (_ BitVec 64))

(assert (=> b!258223 (= e!179101 (= (bitIndex!0 (size!6157 (buf!6679 (_2!11990 (increaseBitIndex!0 thiss!1754)))) (currentByte!12254 (_2!11990 (increaseBitIndex!0 thiss!1754))) (currentBit!12249 (_2!11990 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399748 lt!399746)))))

(assert (=> b!258223 (or (not (= (bvand lt!399748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399746 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399748 lt!399746) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258223 (= lt!399746 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258223 (= lt!399748 (bitIndex!0 (size!6157 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754) (currentBit!12249 thiss!1754)))))

(declare-fun lt!399749 () Bool)

(assert (=> b!258223 (= lt!399749 (not (= (bvand ((_ sign_extend 24) (select (arr!7144 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12249 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399751 () Bool)

(assert (=> b!258223 (= lt!399751 (not (= (bvand ((_ sign_extend 24) (select (arr!7144 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12249 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399750 () Bool)

(assert (=> b!258223 (= lt!399750 (not (= (bvand ((_ sign_extend 24) (select (arr!7144 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12249 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86628 res!216352) b!258223))

(declare-fun m!387727 () Bool)

(assert (=> d!86628 m!387727))

(declare-fun m!387729 () Bool)

(assert (=> d!86628 m!387729))

(declare-fun m!387731 () Bool)

(assert (=> d!86628 m!387731))

(declare-fun m!387733 () Bool)

(assert (=> d!86628 m!387733))

(assert (=> b!258223 m!387731))

(assert (=> b!258223 m!387727))

(declare-fun m!387735 () Bool)

(assert (=> b!258223 m!387735))

(assert (=> b!258223 m!387729))

(assert (=> b!258223 m!387659))

(assert (=> b!258167 d!86628))

(declare-fun d!86638 () Bool)

(assert (=> d!86638 (= (array_inv!5898 (buf!6679 thiss!1754)) (bvsge (size!6157 (buf!6679 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258166 d!86638))

(declare-fun b!258275 () Bool)

(declare-fun res!216392 () Bool)

(declare-fun e!179137 () Bool)

(assert (=> b!258275 (=> (not res!216392) (not e!179137))))

(declare-fun lt!399849 () tuple2!22100)

(assert (=> b!258275 (= res!216392 (and (= (buf!6679 (_2!11986 lt!399674)) (buf!6679 (_2!11986 lt!399849))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11986 lt!399849))))))

(declare-fun d!86640 () Bool)

(assert (=> d!86640 e!179137))

(declare-fun res!216389 () Bool)

(assert (=> d!86640 (=> (not res!216389) (not e!179137))))

(declare-fun lt!399844 () (_ BitVec 64))

(assert (=> d!86640 (= res!216389 (bvsge (bvsub lt!399844 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6157 (buf!6679 (_2!11986 lt!399849))) (currentByte!12254 (_2!11986 lt!399849)) (currentBit!12249 (_2!11986 lt!399849)))))))

(assert (=> d!86640 (or (= (bvand lt!399844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399844 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399848 () (_ BitVec 64))

(assert (=> d!86640 (= lt!399844 (bvadd lt!399848 nBits!535))))

(assert (=> d!86640 (or (not (= (bvand lt!399848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399848 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86640 (= lt!399848 (bitIndex!0 (size!6157 (buf!6679 (_2!11986 lt!399674))) (currentByte!12254 (_2!11986 lt!399674)) (currentBit!12249 (_2!11986 lt!399674))))))

(declare-fun e!179138 () tuple2!22100)

(assert (=> d!86640 (= lt!399849 e!179138)))

(declare-fun c!11868 () Bool)

(assert (=> d!86640 (= c!11868 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86640 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86640 (= (checkBitsLoop!0 (_2!11986 lt!399674) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399849)))

(declare-fun b!258276 () Bool)

(declare-fun e!179134 () Bool)

(assert (=> b!258276 (= e!179137 e!179134)))

(declare-fun res!216390 () Bool)

(assert (=> b!258276 (=> res!216390 e!179134)))

(assert (=> b!258276 (= res!216390 (or (not (_1!11986 lt!399849)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!258277 () Bool)

(declare-fun e!179136 () tuple2!22100)

(assert (=> b!258277 (= e!179138 e!179136)))

(declare-fun lt!399842 () tuple2!22100)

(assert (=> b!258277 (= lt!399842 (readBit!0 (_2!11986 lt!399674)))))

(declare-fun c!11869 () Bool)

(assert (=> b!258277 (= c!11869 (not (= (_1!11986 lt!399842) expected!109)))))

(declare-fun b!258278 () Bool)

(declare-fun lt!399845 () (_ BitVec 64))

(declare-fun e!179135 () Bool)

(assert (=> b!258278 (= e!179135 (= (bvsub lt!399845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6157 (buf!6679 (_2!11986 lt!399849))) (currentByte!12254 (_2!11986 lt!399849)) (currentBit!12249 (_2!11986 lt!399849)))))))

(assert (=> b!258278 (or (= (bvand lt!399845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399847 () (_ BitVec 64))

(assert (=> b!258278 (= lt!399845 (bvadd lt!399847 nBits!535))))

(assert (=> b!258278 (or (not (= (bvand lt!399847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399847 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258278 (= lt!399847 (bitIndex!0 (size!6157 (buf!6679 (_2!11986 lt!399674))) (currentByte!12254 (_2!11986 lt!399674)) (currentBit!12249 (_2!11986 lt!399674))))))

(declare-fun b!258279 () Bool)

(declare-fun res!216388 () Bool)

(assert (=> b!258279 (=> (not res!216388) (not e!179137))))

(assert (=> b!258279 (= res!216388 e!179135)))

(declare-fun res!216391 () Bool)

(assert (=> b!258279 (=> res!216391 e!179135)))

(assert (=> b!258279 (= res!216391 (not (_1!11986 lt!399849)))))

(declare-fun b!258280 () Bool)

(declare-datatypes ((tuple2!22114 0))(
  ( (tuple2!22115 (_1!11993 BitStream!11236) (_2!11993 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11236) tuple2!22114)

(assert (=> b!258280 (= e!179134 (= expected!109 (_2!11993 (readBitPure!0 (_2!11986 lt!399674)))))))

(declare-fun b!258281 () Bool)

(assert (=> b!258281 (= e!179138 (tuple2!22101 true (_2!11986 lt!399674)))))

(declare-fun b!258282 () Bool)

(declare-fun lt!399852 () tuple2!22100)

(assert (=> b!258282 (= lt!399852 (checkBitsLoop!0 (_2!11986 lt!399842) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399850 () Unit!18423)

(declare-fun lt!399843 () Unit!18423)

(assert (=> b!258282 (= lt!399850 lt!399843)))

(declare-fun lt!399851 () (_ BitVec 64))

(declare-fun lt!399846 () (_ BitVec 64))

(assert (=> b!258282 (validate_offset_bits!1 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399842)))) ((_ sign_extend 32) (currentByte!12254 (_2!11986 lt!399842))) ((_ sign_extend 32) (currentBit!12249 (_2!11986 lt!399842))) (bvsub lt!399851 lt!399846))))

(assert (=> b!258282 (= lt!399843 (validateOffsetBitsIneqLemma!0 (_2!11986 lt!399674) (_2!11986 lt!399842) lt!399851 lt!399846))))

(assert (=> b!258282 (= lt!399846 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258282 (= lt!399851 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258282 (= e!179136 (tuple2!22101 (_1!11986 lt!399852) (_2!11986 lt!399852)))))

(declare-fun b!258283 () Bool)

(assert (=> b!258283 (= e!179136 (tuple2!22101 false (_2!11986 lt!399842)))))

(assert (= (and d!86640 c!11868) b!258281))

(assert (= (and d!86640 (not c!11868)) b!258277))

(assert (= (and b!258277 c!11869) b!258283))

(assert (= (and b!258277 (not c!11869)) b!258282))

(assert (= (and d!86640 res!216389) b!258275))

(assert (= (and b!258275 res!216392) b!258279))

(assert (= (and b!258279 (not res!216391)) b!258278))

(assert (= (and b!258279 res!216388) b!258276))

(assert (= (and b!258276 (not res!216390)) b!258280))

(declare-fun m!387757 () Bool)

(assert (=> b!258282 m!387757))

(declare-fun m!387759 () Bool)

(assert (=> b!258282 m!387759))

(declare-fun m!387761 () Bool)

(assert (=> b!258282 m!387761))

(declare-fun m!387763 () Bool)

(assert (=> b!258280 m!387763))

(declare-fun m!387765 () Bool)

(assert (=> d!86640 m!387765))

(declare-fun m!387767 () Bool)

(assert (=> d!86640 m!387767))

(declare-fun m!387769 () Bool)

(assert (=> b!258277 m!387769))

(assert (=> b!258278 m!387765))

(assert (=> b!258278 m!387767))

(assert (=> b!258165 d!86640))

(declare-fun d!86652 () Bool)

(declare-fun e!179147 () Bool)

(assert (=> d!86652 e!179147))

(declare-fun res!216404 () Bool)

(assert (=> d!86652 (=> (not res!216404) (not e!179147))))

(declare-fun lt!399884 () (_ BitVec 64))

(declare-fun lt!399887 () (_ BitVec 64))

(declare-fun lt!399885 () (_ BitVec 64))

(assert (=> d!86652 (= res!216404 (= lt!399884 (bvsub lt!399887 lt!399885)))))

(assert (=> d!86652 (or (= (bvand lt!399887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399887 lt!399885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86652 (= lt!399885 (remainingBits!0 ((_ sign_extend 32) (size!6157 (buf!6679 thiss!1754))) ((_ sign_extend 32) (currentByte!12254 thiss!1754)) ((_ sign_extend 32) (currentBit!12249 thiss!1754))))))

(declare-fun lt!399886 () (_ BitVec 64))

(declare-fun lt!399883 () (_ BitVec 64))

(assert (=> d!86652 (= lt!399887 (bvmul lt!399886 lt!399883))))

(assert (=> d!86652 (or (= lt!399886 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399883 (bvsdiv (bvmul lt!399886 lt!399883) lt!399886)))))

(assert (=> d!86652 (= lt!399883 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86652 (= lt!399886 ((_ sign_extend 32) (size!6157 (buf!6679 thiss!1754))))))

(assert (=> d!86652 (= lt!399884 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12254 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12249 thiss!1754))))))

(assert (=> d!86652 (invariant!0 (currentBit!12249 thiss!1754) (currentByte!12254 thiss!1754) (size!6157 (buf!6679 thiss!1754)))))

(assert (=> d!86652 (= (bitIndex!0 (size!6157 (buf!6679 thiss!1754)) (currentByte!12254 thiss!1754) (currentBit!12249 thiss!1754)) lt!399884)))

(declare-fun b!258299 () Bool)

(declare-fun res!216405 () Bool)

(assert (=> b!258299 (=> (not res!216405) (not e!179147))))

(assert (=> b!258299 (= res!216405 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399884))))

(declare-fun b!258300 () Bool)

(declare-fun lt!399882 () (_ BitVec 64))

(assert (=> b!258300 (= e!179147 (bvsle lt!399884 (bvmul lt!399882 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258300 (or (= lt!399882 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399882 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399882)))))

(assert (=> b!258300 (= lt!399882 ((_ sign_extend 32) (size!6157 (buf!6679 thiss!1754))))))

(assert (= (and d!86652 res!216404) b!258299))

(assert (= (and b!258299 res!216405) b!258300))

(declare-fun m!387787 () Bool)

(assert (=> d!86652 m!387787))

(declare-fun m!387789 () Bool)

(assert (=> d!86652 m!387789))

(assert (=> b!258165 d!86652))

(declare-fun d!86660 () Bool)

(assert (=> d!86660 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399674)))) ((_ sign_extend 32) (currentByte!12254 (_2!11986 lt!399674))) ((_ sign_extend 32) (currentBit!12249 (_2!11986 lt!399674))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399674)))) ((_ sign_extend 32) (currentByte!12254 (_2!11986 lt!399674))) ((_ sign_extend 32) (currentBit!12249 (_2!11986 lt!399674)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21918 () Bool)

(assert (= bs!21918 d!86660))

(declare-fun m!387791 () Bool)

(assert (=> bs!21918 m!387791))

(assert (=> b!258165 d!86660))

(declare-fun d!86662 () Bool)

(declare-fun e!179158 () Bool)

(assert (=> d!86662 e!179158))

(declare-fun res!216416 () Bool)

(assert (=> d!86662 (=> (not res!216416) (not e!179158))))

(assert (=> d!86662 (= res!216416 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399912 () Unit!18423)

(declare-fun choose!27 (BitStream!11236 BitStream!11236 (_ BitVec 64) (_ BitVec 64)) Unit!18423)

(assert (=> d!86662 (= lt!399912 (choose!27 thiss!1754 (_2!11986 lt!399674) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86662 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86662 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11986 lt!399674) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399912)))

(declare-fun b!258317 () Bool)

(assert (=> b!258317 (= e!179158 (validate_offset_bits!1 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399674)))) ((_ sign_extend 32) (currentByte!12254 (_2!11986 lt!399674))) ((_ sign_extend 32) (currentBit!12249 (_2!11986 lt!399674))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86662 res!216416) b!258317))

(declare-fun m!387793 () Bool)

(assert (=> d!86662 m!387793))

(assert (=> b!258317 m!387661))

(assert (=> b!258165 d!86662))

(declare-fun d!86664 () Bool)

(declare-fun e!179161 () Bool)

(assert (=> d!86664 e!179161))

(declare-fun res!216419 () Bool)

(assert (=> d!86664 (=> (not res!216419) (not e!179161))))

(declare-fun lt!399918 () (_ BitVec 64))

(declare-fun lt!399915 () (_ BitVec 64))

(declare-fun lt!399916 () (_ BitVec 64))

(assert (=> d!86664 (= res!216419 (= lt!399915 (bvsub lt!399918 lt!399916)))))

(assert (=> d!86664 (or (= (bvand lt!399918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399916 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399918 lt!399916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86664 (= lt!399916 (remainingBits!0 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399673)))) ((_ sign_extend 32) (currentByte!12254 (_2!11986 lt!399673))) ((_ sign_extend 32) (currentBit!12249 (_2!11986 lt!399673)))))))

(declare-fun lt!399917 () (_ BitVec 64))

(declare-fun lt!399914 () (_ BitVec 64))

(assert (=> d!86664 (= lt!399918 (bvmul lt!399917 lt!399914))))

(assert (=> d!86664 (or (= lt!399917 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399914 (bvsdiv (bvmul lt!399917 lt!399914) lt!399917)))))

(assert (=> d!86664 (= lt!399914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86664 (= lt!399917 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399673)))))))

(assert (=> d!86664 (= lt!399915 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12254 (_2!11986 lt!399673))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12249 (_2!11986 lt!399673)))))))

(assert (=> d!86664 (invariant!0 (currentBit!12249 (_2!11986 lt!399673)) (currentByte!12254 (_2!11986 lt!399673)) (size!6157 (buf!6679 (_2!11986 lt!399673))))))

(assert (=> d!86664 (= (bitIndex!0 (size!6157 (buf!6679 (_2!11986 lt!399673))) (currentByte!12254 (_2!11986 lt!399673)) (currentBit!12249 (_2!11986 lt!399673))) lt!399915)))

(declare-fun b!258322 () Bool)

(declare-fun res!216420 () Bool)

(assert (=> b!258322 (=> (not res!216420) (not e!179161))))

(assert (=> b!258322 (= res!216420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399915))))

(declare-fun b!258323 () Bool)

(declare-fun lt!399913 () (_ BitVec 64))

(assert (=> b!258323 (= e!179161 (bvsle lt!399915 (bvmul lt!399913 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258323 (or (= lt!399913 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399913 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399913)))))

(assert (=> b!258323 (= lt!399913 ((_ sign_extend 32) (size!6157 (buf!6679 (_2!11986 lt!399673)))))))

(assert (= (and d!86664 res!216419) b!258322))

(assert (= (and b!258322 res!216420) b!258323))

(declare-fun m!387795 () Bool)

(assert (=> d!86664 m!387795))

(assert (=> d!86664 m!387663))

(assert (=> b!258165 d!86664))

(declare-fun d!86666 () Bool)

(assert (=> d!86666 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12249 thiss!1754) (currentByte!12254 thiss!1754) (size!6157 (buf!6679 thiss!1754))))))

(declare-fun bs!21919 () Bool)

(assert (= bs!21919 d!86666))

(assert (=> bs!21919 m!387789))

(assert (=> start!55366 d!86666))

(declare-fun d!86668 () Bool)

(assert (=> d!86668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6157 (buf!6679 thiss!1754))) ((_ sign_extend 32) (currentByte!12254 thiss!1754)) ((_ sign_extend 32) (currentBit!12249 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6157 (buf!6679 thiss!1754))) ((_ sign_extend 32) (currentByte!12254 thiss!1754)) ((_ sign_extend 32) (currentBit!12249 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21920 () Bool)

(assert (= bs!21920 d!86668))

(assert (=> bs!21920 m!387787))

(assert (=> b!258164 d!86668))

(declare-fun d!86670 () Bool)

(assert (=> d!86670 (= (invariant!0 (currentBit!12249 (_2!11986 lt!399673)) (currentByte!12254 (_2!11986 lt!399673)) (size!6157 (buf!6679 (_2!11986 lt!399673)))) (and (bvsge (currentBit!12249 (_2!11986 lt!399673)) #b00000000000000000000000000000000) (bvslt (currentBit!12249 (_2!11986 lt!399673)) #b00000000000000000000000000001000) (bvsge (currentByte!12254 (_2!11986 lt!399673)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12254 (_2!11986 lt!399673)) (size!6157 (buf!6679 (_2!11986 lt!399673)))) (and (= (currentBit!12249 (_2!11986 lt!399673)) #b00000000000000000000000000000000) (= (currentByte!12254 (_2!11986 lt!399673)) (size!6157 (buf!6679 (_2!11986 lt!399673))))))))))

(assert (=> b!258163 d!86670))

(push 1)

(assert (not d!86668))

(assert (not b!258223))

(assert (not b!258282))

(assert (not d!86652))

(assert (not d!86628))

(assert (not b!258317))

(assert (not d!86664))

(assert (not d!86660))

(assert (not b!258280))

(assert (not d!86666))

(assert (not d!86640))

(assert (not b!258277))

(assert (not b!258278))

(assert (not d!86662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

