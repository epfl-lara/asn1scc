; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55184 () Bool)

(assert start!55184)

(declare-fun b!257628 () Bool)

(declare-fun e!178667 () Bool)

(declare-datatypes ((array!14020 0))(
  ( (array!14021 (arr!7137 (Array (_ BitVec 32) (_ BitVec 8))) (size!6150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11222 0))(
  ( (BitStream!11223 (buf!6672 array!14020) (currentByte!12217 (_ BitVec 32)) (currentBit!12212 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11222)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257628 (= e!178667 (not (invariant!0 (currentBit!12212 thiss!1754) (currentByte!12217 thiss!1754) (size!6150 (buf!6672 thiss!1754)))))))

(declare-fun expected!109 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((tuple2!22050 0))(
  ( (tuple2!22051 (_1!11961 Bool) (_2!11961 BitStream!11222)) )
))
(declare-fun lt!398805 () tuple2!22050)

(declare-fun lt!398807 () tuple2!22050)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun checkBitsLoop!0 (BitStream!11222 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22050)

(assert (=> b!257628 (= lt!398805 (checkBitsLoop!0 (_2!11961 lt!398807) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257628 (validate_offset_bits!1 ((_ sign_extend 32) (size!6150 (buf!6672 (_2!11961 lt!398807)))) ((_ sign_extend 32) (currentByte!12217 (_2!11961 lt!398807))) ((_ sign_extend 32) (currentBit!12212 (_2!11961 lt!398807))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18403 0))(
  ( (Unit!18404) )
))
(declare-fun lt!398806 () Unit!18403)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11222 BitStream!11222 (_ BitVec 64) (_ BitVec 64)) Unit!18403)

(assert (=> b!257628 (= lt!398806 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11961 lt!398807) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257629 () Bool)

(declare-fun res!215906 () Bool)

(declare-fun e!178669 () Bool)

(assert (=> b!257629 (=> (not res!215906) (not e!178669))))

(assert (=> b!257629 (= res!215906 (validate_offset_bits!1 ((_ sign_extend 32) (size!6150 (buf!6672 thiss!1754))) ((_ sign_extend 32) (currentByte!12217 thiss!1754)) ((_ sign_extend 32) (currentBit!12212 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257630 () Bool)

(declare-fun res!215908 () Bool)

(assert (=> b!257630 (=> (not res!215908) (not e!178669))))

(assert (=> b!257630 (= res!215908 (not (= from!526 nBits!535)))))

(declare-fun b!257631 () Bool)

(assert (=> b!257631 (= e!178669 e!178667)))

(declare-fun res!215907 () Bool)

(assert (=> b!257631 (=> (not res!215907) (not e!178667))))

(assert (=> b!257631 (= res!215907 (= (_1!11961 lt!398807) expected!109))))

(declare-fun readBit!0 (BitStream!11222) tuple2!22050)

(assert (=> b!257631 (= lt!398807 (readBit!0 thiss!1754))))

(declare-fun res!215905 () Bool)

(assert (=> start!55184 (=> (not res!215905) (not e!178669))))

(assert (=> start!55184 (= res!215905 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55184 e!178669))

(assert (=> start!55184 true))

(declare-fun e!178666 () Bool)

(declare-fun inv!12 (BitStream!11222) Bool)

(assert (=> start!55184 (and (inv!12 thiss!1754) e!178666)))

(declare-fun b!257632 () Bool)

(declare-fun array_inv!5891 (array!14020) Bool)

(assert (=> b!257632 (= e!178666 (array_inv!5891 (buf!6672 thiss!1754)))))

(assert (= (and start!55184 res!215905) b!257629))

(assert (= (and b!257629 res!215906) b!257630))

(assert (= (and b!257630 res!215908) b!257631))

(assert (= (and b!257631 res!215907) b!257628))

(assert (= start!55184 b!257632))

(declare-fun m!387103 () Bool)

(assert (=> b!257628 m!387103))

(declare-fun m!387105 () Bool)

(assert (=> b!257628 m!387105))

(declare-fun m!387107 () Bool)

(assert (=> b!257628 m!387107))

(declare-fun m!387109 () Bool)

(assert (=> b!257628 m!387109))

(declare-fun m!387111 () Bool)

(assert (=> b!257629 m!387111))

(declare-fun m!387113 () Bool)

(assert (=> b!257632 m!387113))

(declare-fun m!387115 () Bool)

(assert (=> b!257631 m!387115))

(declare-fun m!387117 () Bool)

(assert (=> start!55184 m!387117))

(push 1)

(assert (not b!257632))

(assert (not b!257629))

(assert (not b!257631))

(assert (not b!257628))

(assert (not start!55184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86382 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86382 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6150 (buf!6672 thiss!1754))) ((_ sign_extend 32) (currentByte!12217 thiss!1754)) ((_ sign_extend 32) (currentBit!12212 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6150 (buf!6672 thiss!1754))) ((_ sign_extend 32) (currentByte!12217 thiss!1754)) ((_ sign_extend 32) (currentBit!12212 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21870 () Bool)

(assert (= bs!21870 d!86382))

(declare-fun m!387123 () Bool)

(assert (=> bs!21870 m!387123))

(assert (=> b!257629 d!86382))

(declare-fun d!86384 () Bool)

(assert (=> d!86384 (= (array_inv!5891 (buf!6672 thiss!1754)) (bvsge (size!6150 (buf!6672 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257632 d!86384))

(declare-fun d!86386 () Bool)

(assert (=> d!86386 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12212 thiss!1754) (currentByte!12217 thiss!1754) (size!6150 (buf!6672 thiss!1754))))))

(declare-fun bs!21871 () Bool)

(assert (= bs!21871 d!86386))

(assert (=> bs!21871 m!387103))

(assert (=> start!55184 d!86386))

(declare-fun d!86388 () Bool)

(declare-fun e!178690 () Bool)

(assert (=> d!86388 e!178690))

(declare-fun res!215917 () Bool)

(assert (=> d!86388 (=> (not res!215917) (not e!178690))))

(declare-datatypes ((tuple2!22056 0))(
  ( (tuple2!22057 (_1!11964 Unit!18403) (_2!11964 BitStream!11222)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11222) tuple2!22056)

(assert (=> d!86388 (= res!215917 (= (buf!6672 (_2!11964 (increaseBitIndex!0 thiss!1754))) (buf!6672 thiss!1754)))))

(declare-fun lt!398866 () Bool)

(assert (=> d!86388 (= lt!398866 (not (= (bvand ((_ sign_extend 24) (select (arr!7137 (buf!6672 thiss!1754)) (currentByte!12217 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12212 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398868 () tuple2!22050)

(assert (=> d!86388 (= lt!398868 (tuple2!22051 (not (= (bvand ((_ sign_extend 24) (select (arr!7137 (buf!6672 thiss!1754)) (currentByte!12217 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12212 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11964 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86388 (validate_offset_bit!0 ((_ sign_extend 32) (size!6150 (buf!6672 thiss!1754))) ((_ sign_extend 32) (currentByte!12217 thiss!1754)) ((_ sign_extend 32) (currentBit!12212 thiss!1754)))))

(assert (=> d!86388 (= (readBit!0 thiss!1754) lt!398868)))

(declare-fun lt!398869 () (_ BitVec 64))

(declare-fun lt!398864 () (_ BitVec 64))

(declare-fun b!257641 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257641 (= e!178690 (= (bitIndex!0 (size!6150 (buf!6672 (_2!11964 (increaseBitIndex!0 thiss!1754)))) (currentByte!12217 (_2!11964 (increaseBitIndex!0 thiss!1754))) (currentBit!12212 (_2!11964 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398864 lt!398869)))))

(assert (=> b!257641 (or (not (= (bvand lt!398864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398869 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398864 lt!398869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257641 (= lt!398869 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257641 (= lt!398864 (bitIndex!0 (size!6150 (buf!6672 thiss!1754)) (currentByte!12217 thiss!1754) (currentBit!12212 thiss!1754)))))

(declare-fun lt!398865 () Bool)

(assert (=> b!257641 (= lt!398865 (not (= (bvand ((_ sign_extend 24) (select (arr!7137 (buf!6672 thiss!1754)) (currentByte!12217 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12212 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398870 () Bool)

(assert (=> b!257641 (= lt!398870 (not (= (bvand ((_ sign_extend 24) (select (arr!7137 (buf!6672 thiss!1754)) (currentByte!12217 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12212 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398867 () Bool)

(assert (=> b!257641 (= lt!398867 (not (= (bvand ((_ sign_extend 24) (select (arr!7137 (buf!6672 thiss!1754)) (currentByte!12217 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12212 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86388 res!215917) b!257641))

(declare-fun m!387149 () Bool)

(assert (=> d!86388 m!387149))

(declare-fun m!387151 () Bool)

(assert (=> d!86388 m!387151))

(declare-fun m!387153 () Bool)

(assert (=> d!86388 m!387153))

(declare-fun m!387155 () Bool)

(assert (=> d!86388 m!387155))

(declare-fun m!387157 () Bool)

(assert (=> b!257641 m!387157))

(assert (=> b!257641 m!387153))

(assert (=> b!257641 m!387149))

(assert (=> b!257641 m!387151))

(declare-fun m!387159 () Bool)

(assert (=> b!257641 m!387159))

(assert (=> b!257631 d!86388))

(declare-fun d!86402 () Bool)

(assert (=> d!86402 (= (invariant!0 (currentBit!12212 thiss!1754) (currentByte!12217 thiss!1754) (size!6150 (buf!6672 thiss!1754))) (and (bvsge (currentBit!12212 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12212 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12217 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12217 thiss!1754) (size!6150 (buf!6672 thiss!1754))) (and (= (currentBit!12212 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12217 thiss!1754) (size!6150 (buf!6672 thiss!1754)))))))))

(assert (=> b!257628 d!86402))

(declare-fun b!257717 () Bool)

(declare-fun e!178735 () tuple2!22050)

(declare-fun lt!398963 () tuple2!22050)

(assert (=> b!257717 (= e!178735 (tuple2!22051 false (_2!11961 lt!398963)))))

(declare-fun b!257718 () Bool)

(declare-fun e!178737 () tuple2!22050)

(assert (=> b!257718 (= e!178737 (tuple2!22051 true (_2!11961 lt!398807)))))

(declare-fun b!257719 () Bool)

(declare-fun res!215963 () Bool)

(declare-fun e!178738 () Bool)

(assert (=> b!257719 (=> (not res!215963) (not e!178738))))

(declare-fun e!178736 () Bool)

(assert (=> b!257719 (= res!215963 e!178736)))

(declare-fun res!215965 () Bool)

(assert (=> b!257719 (=> res!215965 e!178736)))

(declare-fun lt!398962 () tuple2!22050)

(assert (=> b!257719 (= res!215965 (not (_1!11961 lt!398962)))))

(declare-fun b!257720 () Bool)

(declare-fun e!178734 () Bool)

(declare-datatypes ((tuple2!22062 0))(
  ( (tuple2!22063 (_1!11967 BitStream!11222) (_2!11967 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11222) tuple2!22062)

(assert (=> b!257720 (= e!178734 (= expected!109 (_2!11967 (readBitPure!0 (_2!11961 lt!398807)))))))

(declare-fun b!257721 () Bool)

(declare-fun lt!398967 () tuple2!22050)

(assert (=> b!257721 (= lt!398967 (checkBitsLoop!0 (_2!11961 lt!398963) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!398970 () Unit!18403)

(declare-fun lt!398971 () Unit!18403)

(assert (=> b!257721 (= lt!398970 lt!398971)))

(declare-fun lt!398972 () (_ BitVec 64))

(declare-fun lt!398965 () (_ BitVec 64))

(assert (=> b!257721 (validate_offset_bits!1 ((_ sign_extend 32) (size!6150 (buf!6672 (_2!11961 lt!398963)))) ((_ sign_extend 32) (currentByte!12217 (_2!11961 lt!398963))) ((_ sign_extend 32) (currentBit!12212 (_2!11961 lt!398963))) (bvsub lt!398972 lt!398965))))

(assert (=> b!257721 (= lt!398971 (validateOffsetBitsIneqLemma!0 (_2!11961 lt!398807) (_2!11961 lt!398963) lt!398972 lt!398965))))

(assert (=> b!257721 (= lt!398965 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257721 (= lt!398972 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!257721 (= e!178735 (tuple2!22051 (_1!11961 lt!398967) (_2!11961 lt!398967)))))

(declare-fun b!257722 () Bool)

(assert (=> b!257722 (= e!178738 e!178734)))

(declare-fun res!215961 () Bool)

(assert (=> b!257722 (=> res!215961 e!178734)))

(assert (=> b!257722 (= res!215961 (or (not (_1!11961 lt!398962)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!257723 () Bool)

(assert (=> b!257723 (= e!178737 e!178735)))

(assert (=> b!257723 (= lt!398963 (readBit!0 (_2!11961 lt!398807)))))

(declare-fun c!11816 () Bool)

(assert (=> b!257723 (= c!11816 (not (= (_1!11961 lt!398963) expected!109)))))

(declare-fun b!257725 () Bool)

(declare-fun lt!398964 () (_ BitVec 64))

(assert (=> b!257725 (= e!178736 (= (bvsub lt!398964 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6150 (buf!6672 (_2!11961 lt!398962))) (currentByte!12217 (_2!11961 lt!398962)) (currentBit!12212 (_2!11961 lt!398962)))))))

(assert (=> b!257725 (or (= (bvand lt!398964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398964 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398969 () (_ BitVec 64))

(assert (=> b!257725 (= lt!398964 (bvadd lt!398969 nBits!535))))

(assert (=> b!257725 (or (not (= (bvand lt!398969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398969 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257725 (= lt!398969 (bitIndex!0 (size!6150 (buf!6672 (_2!11961 lt!398807))) (currentByte!12217 (_2!11961 lt!398807)) (currentBit!12212 (_2!11961 lt!398807))))))

(declare-fun d!86404 () Bool)

(assert (=> d!86404 e!178738))

(declare-fun res!215964 () Bool)

(assert (=> d!86404 (=> (not res!215964) (not e!178738))))

(declare-fun lt!398966 () (_ BitVec 64))

(assert (=> d!86404 (= res!215964 (bvsge (bvsub lt!398966 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6150 (buf!6672 (_2!11961 lt!398962))) (currentByte!12217 (_2!11961 lt!398962)) (currentBit!12212 (_2!11961 lt!398962)))))))

(assert (=> d!86404 (or (= (bvand lt!398966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398966 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398968 () (_ BitVec 64))

(assert (=> d!86404 (= lt!398966 (bvadd lt!398968 nBits!535))))

(assert (=> d!86404 (or (not (= (bvand lt!398968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398968 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86404 (= lt!398968 (bitIndex!0 (size!6150 (buf!6672 (_2!11961 lt!398807))) (currentByte!12217 (_2!11961 lt!398807)) (currentBit!12212 (_2!11961 lt!398807))))))

(assert (=> d!86404 (= lt!398962 e!178737)))

(declare-fun c!11817 () Bool)

(assert (=> d!86404 (= c!11817 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86404 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86404 (= (checkBitsLoop!0 (_2!11961 lt!398807) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!398962)))

(declare-fun b!257724 () Bool)

(declare-fun res!215962 () Bool)

(assert (=> b!257724 (=> (not res!215962) (not e!178738))))

(assert (=> b!257724 (= res!215962 (and (= (buf!6672 (_2!11961 lt!398807)) (buf!6672 (_2!11961 lt!398962))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11961 lt!398962))))))

(assert (= (and d!86404 c!11817) b!257718))

(assert (= (and d!86404 (not c!11817)) b!257723))

(assert (= (and b!257723 c!11816) b!257717))

(assert (= (and b!257723 (not c!11816)) b!257721))

(assert (= (and d!86404 res!215964) b!257724))

(assert (= (and b!257724 res!215962) b!257719))

(assert (= (and b!257719 (not res!215965)) b!257725))

(assert (= (and b!257719 res!215963) b!257722))

(assert (= (and b!257722 (not res!215961)) b!257720))

(declare-fun m!387195 () Bool)

(assert (=> b!257720 m!387195))

(declare-fun m!387197 () Bool)

(assert (=> b!257721 m!387197))

(declare-fun m!387199 () Bool)

(assert (=> b!257721 m!387199))

(declare-fun m!387201 () Bool)

(assert (=> b!257721 m!387201))

(declare-fun m!387203 () Bool)

(assert (=> d!86404 m!387203))

(declare-fun m!387205 () Bool)

(assert (=> d!86404 m!387205))

(declare-fun m!387207 () Bool)

(assert (=> b!257723 m!387207))

(assert (=> b!257725 m!387203))

(assert (=> b!257725 m!387205))

(assert (=> b!257628 d!86404))

(declare-fun d!86416 () Bool)

(assert (=> d!86416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6150 (buf!6672 (_2!11961 lt!398807)))) ((_ sign_extend 32) (currentByte!12217 (_2!11961 lt!398807))) ((_ sign_extend 32) (currentBit!12212 (_2!11961 lt!398807))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6150 (buf!6672 (_2!11961 lt!398807)))) ((_ sign_extend 32) (currentByte!12217 (_2!11961 lt!398807))) ((_ sign_extend 32) (currentBit!12212 (_2!11961 lt!398807)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21875 () Bool)

(assert (= bs!21875 d!86416))

(declare-fun m!387209 () Bool)

(assert (=> bs!21875 m!387209))

(assert (=> b!257628 d!86416))

(declare-fun d!86418 () Bool)

(declare-fun e!178744 () Bool)

(assert (=> d!86418 e!178744))

(declare-fun res!215971 () Bool)

(assert (=> d!86418 (=> (not res!215971) (not e!178744))))

(assert (=> d!86418 (= res!215971 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!398978 () Unit!18403)

