; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55182 () Bool)

(assert start!55182)

(declare-fun b!257613 () Bool)

(declare-fun e!178656 () Bool)

(declare-fun e!178655 () Bool)

(assert (=> b!257613 (= e!178656 e!178655)))

(declare-fun res!215894 () Bool)

(assert (=> b!257613 (=> (not res!215894) (not e!178655))))

(declare-datatypes ((array!14018 0))(
  ( (array!14019 (arr!7136 (Array (_ BitVec 32) (_ BitVec 8))) (size!6149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11220 0))(
  ( (BitStream!11221 (buf!6671 array!14018) (currentByte!12216 (_ BitVec 32)) (currentBit!12211 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22048 0))(
  ( (tuple2!22049 (_1!11960 Bool) (_2!11960 BitStream!11220)) )
))
(declare-fun lt!398797 () tuple2!22048)

(declare-fun expected!109 () Bool)

(assert (=> b!257613 (= res!215894 (= (_1!11960 lt!398797) expected!109))))

(declare-fun thiss!1754 () BitStream!11220)

(declare-fun readBit!0 (BitStream!11220) tuple2!22048)

(assert (=> b!257613 (= lt!398797 (readBit!0 thiss!1754))))

(declare-fun b!257614 () Bool)

(declare-fun e!178654 () Bool)

(declare-fun array_inv!5890 (array!14018) Bool)

(assert (=> b!257614 (= e!178654 (array_inv!5890 (buf!6671 thiss!1754)))))

(declare-fun b!257615 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257615 (= e!178655 (not (invariant!0 (currentBit!12211 thiss!1754) (currentByte!12216 thiss!1754) (size!6149 (buf!6671 thiss!1754)))))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun lt!398796 () tuple2!22048)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun checkBitsLoop!0 (BitStream!11220 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22048)

(assert (=> b!257615 (= lt!398796 (checkBitsLoop!0 (_2!11960 lt!398797) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257615 (validate_offset_bits!1 ((_ sign_extend 32) (size!6149 (buf!6671 (_2!11960 lt!398797)))) ((_ sign_extend 32) (currentByte!12216 (_2!11960 lt!398797))) ((_ sign_extend 32) (currentBit!12211 (_2!11960 lt!398797))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18401 0))(
  ( (Unit!18402) )
))
(declare-fun lt!398798 () Unit!18401)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11220 BitStream!11220 (_ BitVec 64) (_ BitVec 64)) Unit!18401)

(assert (=> b!257615 (= lt!398798 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11960 lt!398797) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257616 () Bool)

(declare-fun res!215893 () Bool)

(assert (=> b!257616 (=> (not res!215893) (not e!178656))))

(assert (=> b!257616 (= res!215893 (not (= from!526 nBits!535)))))

(declare-fun res!215896 () Bool)

(assert (=> start!55182 (=> (not res!215896) (not e!178656))))

(assert (=> start!55182 (= res!215896 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55182 e!178656))

(assert (=> start!55182 true))

(declare-fun inv!12 (BitStream!11220) Bool)

(assert (=> start!55182 (and (inv!12 thiss!1754) e!178654)))

(declare-fun b!257617 () Bool)

(declare-fun res!215895 () Bool)

(assert (=> b!257617 (=> (not res!215895) (not e!178656))))

(assert (=> b!257617 (= res!215895 (validate_offset_bits!1 ((_ sign_extend 32) (size!6149 (buf!6671 thiss!1754))) ((_ sign_extend 32) (currentByte!12216 thiss!1754)) ((_ sign_extend 32) (currentBit!12211 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55182 res!215896) b!257617))

(assert (= (and b!257617 res!215895) b!257616))

(assert (= (and b!257616 res!215893) b!257613))

(assert (= (and b!257613 res!215894) b!257615))

(assert (= start!55182 b!257614))

(declare-fun m!387087 () Bool)

(assert (=> b!257614 m!387087))

(declare-fun m!387089 () Bool)

(assert (=> start!55182 m!387089))

(declare-fun m!387091 () Bool)

(assert (=> b!257613 m!387091))

(declare-fun m!387093 () Bool)

(assert (=> b!257615 m!387093))

(declare-fun m!387095 () Bool)

(assert (=> b!257615 m!387095))

(declare-fun m!387097 () Bool)

(assert (=> b!257615 m!387097))

(declare-fun m!387099 () Bool)

(assert (=> b!257615 m!387099))

(declare-fun m!387101 () Bool)

(assert (=> b!257617 m!387101))

(check-sat (not b!257614) (not b!257613) (not b!257615) (not b!257617) (not start!55182))
(check-sat)
(get-model)

(declare-fun d!86372 () Bool)

(assert (=> d!86372 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12211 thiss!1754) (currentByte!12216 thiss!1754) (size!6149 (buf!6671 thiss!1754))))))

(declare-fun bs!21867 () Bool)

(assert (= bs!21867 d!86372))

(assert (=> bs!21867 m!387093))

(assert (=> start!55182 d!86372))

(declare-fun d!86374 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86374 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6149 (buf!6671 thiss!1754))) ((_ sign_extend 32) (currentByte!12216 thiss!1754)) ((_ sign_extend 32) (currentBit!12211 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6149 (buf!6671 thiss!1754))) ((_ sign_extend 32) (currentByte!12216 thiss!1754)) ((_ sign_extend 32) (currentBit!12211 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21868 () Bool)

(assert (= bs!21868 d!86374))

(declare-fun m!387119 () Bool)

(assert (=> bs!21868 m!387119))

(assert (=> b!257617 d!86374))

(declare-fun d!86376 () Bool)

(declare-fun e!178684 () Bool)

(assert (=> d!86376 e!178684))

(declare-fun res!215911 () Bool)

(assert (=> d!86376 (=> (not res!215911) (not e!178684))))

(declare-datatypes ((tuple2!22052 0))(
  ( (tuple2!22053 (_1!11962 Unit!18401) (_2!11962 BitStream!11220)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11220) tuple2!22052)

(assert (=> d!86376 (= res!215911 (= (buf!6671 (_2!11962 (increaseBitIndex!0 thiss!1754))) (buf!6671 thiss!1754)))))

(declare-fun lt!398824 () Bool)

(assert (=> d!86376 (= lt!398824 (not (= (bvand ((_ sign_extend 24) (select (arr!7136 (buf!6671 thiss!1754)) (currentByte!12216 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12211 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398826 () tuple2!22048)

(assert (=> d!86376 (= lt!398826 (tuple2!22049 (not (= (bvand ((_ sign_extend 24) (select (arr!7136 (buf!6671 thiss!1754)) (currentByte!12216 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12211 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11962 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86376 (validate_offset_bit!0 ((_ sign_extend 32) (size!6149 (buf!6671 thiss!1754))) ((_ sign_extend 32) (currentByte!12216 thiss!1754)) ((_ sign_extend 32) (currentBit!12211 thiss!1754)))))

(assert (=> d!86376 (= (readBit!0 thiss!1754) lt!398826)))

(declare-fun lt!398827 () (_ BitVec 64))

(declare-fun b!257635 () Bool)

(declare-fun lt!398823 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257635 (= e!178684 (= (bitIndex!0 (size!6149 (buf!6671 (_2!11962 (increaseBitIndex!0 thiss!1754)))) (currentByte!12216 (_2!11962 (increaseBitIndex!0 thiss!1754))) (currentBit!12211 (_2!11962 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!398827 lt!398823)))))

(assert (=> b!257635 (or (not (= (bvand lt!398827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398823 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398827 lt!398823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257635 (= lt!398823 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257635 (= lt!398827 (bitIndex!0 (size!6149 (buf!6671 thiss!1754)) (currentByte!12216 thiss!1754) (currentBit!12211 thiss!1754)))))

(declare-fun lt!398828 () Bool)

(assert (=> b!257635 (= lt!398828 (not (= (bvand ((_ sign_extend 24) (select (arr!7136 (buf!6671 thiss!1754)) (currentByte!12216 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12211 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398822 () Bool)

(assert (=> b!257635 (= lt!398822 (not (= (bvand ((_ sign_extend 24) (select (arr!7136 (buf!6671 thiss!1754)) (currentByte!12216 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12211 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!398825 () Bool)

(assert (=> b!257635 (= lt!398825 (not (= (bvand ((_ sign_extend 24) (select (arr!7136 (buf!6671 thiss!1754)) (currentByte!12216 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12211 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86376 res!215911) b!257635))

(declare-fun m!387125 () Bool)

(assert (=> d!86376 m!387125))

(declare-fun m!387127 () Bool)

(assert (=> d!86376 m!387127))

(declare-fun m!387129 () Bool)

(assert (=> d!86376 m!387129))

(declare-fun m!387131 () Bool)

(assert (=> d!86376 m!387131))

(assert (=> b!257635 m!387127))

(assert (=> b!257635 m!387125))

(declare-fun m!387133 () Bool)

(assert (=> b!257635 m!387133))

(assert (=> b!257635 m!387129))

(declare-fun m!387135 () Bool)

(assert (=> b!257635 m!387135))

(assert (=> b!257613 d!86376))

(declare-fun d!86390 () Bool)

(assert (=> d!86390 (= (invariant!0 (currentBit!12211 thiss!1754) (currentByte!12216 thiss!1754) (size!6149 (buf!6671 thiss!1754))) (and (bvsge (currentBit!12211 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12211 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12216 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12216 thiss!1754) (size!6149 (buf!6671 thiss!1754))) (and (= (currentBit!12211 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12216 thiss!1754) (size!6149 (buf!6671 thiss!1754)))))))))

(assert (=> b!257615 d!86390))

(declare-fun b!257661 () Bool)

(declare-fun e!178704 () tuple2!22048)

(assert (=> b!257661 (= e!178704 (tuple2!22049 true (_2!11960 lt!398797)))))

(declare-fun b!257662 () Bool)

(declare-fun res!215929 () Bool)

(declare-fun e!178705 () Bool)

(assert (=> b!257662 (=> (not res!215929) (not e!178705))))

(declare-fun e!178702 () Bool)

(assert (=> b!257662 (= res!215929 e!178702)))

(declare-fun res!215931 () Bool)

(assert (=> b!257662 (=> res!215931 e!178702)))

(declare-fun lt!398900 () tuple2!22048)

(assert (=> b!257662 (= res!215931 (not (_1!11960 lt!398900)))))

(declare-fun b!257663 () Bool)

(declare-fun res!215930 () Bool)

(assert (=> b!257663 (=> (not res!215930) (not e!178705))))

(assert (=> b!257663 (= res!215930 (and (= (buf!6671 (_2!11960 lt!398797)) (buf!6671 (_2!11960 lt!398900))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11960 lt!398900))))))

(declare-fun b!257660 () Bool)

(declare-fun lt!398898 () tuple2!22048)

(declare-fun lt!398897 () tuple2!22048)

(assert (=> b!257660 (= lt!398898 (checkBitsLoop!0 (_2!11960 lt!398897) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!398902 () Unit!18401)

(declare-fun lt!398903 () Unit!18401)

(assert (=> b!257660 (= lt!398902 lt!398903)))

(declare-fun lt!398893 () (_ BitVec 64))

(declare-fun lt!398899 () (_ BitVec 64))

(assert (=> b!257660 (validate_offset_bits!1 ((_ sign_extend 32) (size!6149 (buf!6671 (_2!11960 lt!398897)))) ((_ sign_extend 32) (currentByte!12216 (_2!11960 lt!398897))) ((_ sign_extend 32) (currentBit!12211 (_2!11960 lt!398897))) (bvsub lt!398893 lt!398899))))

(assert (=> b!257660 (= lt!398903 (validateOffsetBitsIneqLemma!0 (_2!11960 lt!398797) (_2!11960 lt!398897) lt!398893 lt!398899))))

(assert (=> b!257660 (= lt!398899 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257660 (= lt!398893 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun e!178701 () tuple2!22048)

(assert (=> b!257660 (= e!178701 (tuple2!22049 (_1!11960 lt!398898) (_2!11960 lt!398898)))))

(declare-fun d!86392 () Bool)

(assert (=> d!86392 e!178705))

(declare-fun res!215928 () Bool)

(assert (=> d!86392 (=> (not res!215928) (not e!178705))))

(declare-fun lt!398894 () (_ BitVec 64))

(assert (=> d!86392 (= res!215928 (bvsge (bvsub lt!398894 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6149 (buf!6671 (_2!11960 lt!398900))) (currentByte!12216 (_2!11960 lt!398900)) (currentBit!12211 (_2!11960 lt!398900)))))))

(assert (=> d!86392 (or (= (bvand lt!398894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398894 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398895 () (_ BitVec 64))

(assert (=> d!86392 (= lt!398894 (bvadd lt!398895 nBits!535))))

(assert (=> d!86392 (or (not (= (bvand lt!398895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398895 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86392 (= lt!398895 (bitIndex!0 (size!6149 (buf!6671 (_2!11960 lt!398797))) (currentByte!12216 (_2!11960 lt!398797)) (currentBit!12211 (_2!11960 lt!398797))))))

(assert (=> d!86392 (= lt!398900 e!178704)))

(declare-fun c!11805 () Bool)

(assert (=> d!86392 (= c!11805 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86392 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86392 (= (checkBitsLoop!0 (_2!11960 lt!398797) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!398900)))

(declare-fun b!257664 () Bool)

(declare-fun lt!398901 () (_ BitVec 64))

(assert (=> b!257664 (= e!178702 (= (bvsub lt!398901 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6149 (buf!6671 (_2!11960 lt!398900))) (currentByte!12216 (_2!11960 lt!398900)) (currentBit!12211 (_2!11960 lt!398900)))))))

(assert (=> b!257664 (or (= (bvand lt!398901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398901 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!398896 () (_ BitVec 64))

(assert (=> b!257664 (= lt!398901 (bvadd lt!398896 nBits!535))))

(assert (=> b!257664 (or (not (= (bvand lt!398896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!398896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!398896 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257664 (= lt!398896 (bitIndex!0 (size!6149 (buf!6671 (_2!11960 lt!398797))) (currentByte!12216 (_2!11960 lt!398797)) (currentBit!12211 (_2!11960 lt!398797))))))

(declare-fun b!257665 () Bool)

(assert (=> b!257665 (= e!178701 (tuple2!22049 false (_2!11960 lt!398897)))))

(declare-fun b!257666 () Bool)

(declare-fun e!178703 () Bool)

(declare-datatypes ((tuple2!22058 0))(
  ( (tuple2!22059 (_1!11965 BitStream!11220) (_2!11965 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11220) tuple2!22058)

(assert (=> b!257666 (= e!178703 (= expected!109 (_2!11965 (readBitPure!0 (_2!11960 lt!398797)))))))

(declare-fun b!257667 () Bool)

(assert (=> b!257667 (= e!178705 e!178703)))

(declare-fun res!215932 () Bool)

(assert (=> b!257667 (=> res!215932 e!178703)))

(assert (=> b!257667 (= res!215932 (or (not (_1!11960 lt!398900)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!257668 () Bool)

(assert (=> b!257668 (= e!178704 e!178701)))

(assert (=> b!257668 (= lt!398897 (readBit!0 (_2!11960 lt!398797)))))

(declare-fun c!11804 () Bool)

(assert (=> b!257668 (= c!11804 (not (= (_1!11960 lt!398897) expected!109)))))

(assert (= (and d!86392 c!11805) b!257661))

(assert (= (and d!86392 (not c!11805)) b!257668))

(assert (= (and b!257668 c!11804) b!257665))

(assert (= (and b!257668 (not c!11804)) b!257660))

(assert (= (and d!86392 res!215928) b!257663))

(assert (= (and b!257663 res!215930) b!257662))

(assert (= (and b!257662 (not res!215931)) b!257664))

(assert (= (and b!257662 res!215929) b!257667))

(assert (= (and b!257667 (not res!215932)) b!257666))

(declare-fun m!387161 () Bool)

(assert (=> d!86392 m!387161))

(declare-fun m!387163 () Bool)

(assert (=> d!86392 m!387163))

(declare-fun m!387165 () Bool)

(assert (=> b!257660 m!387165))

(declare-fun m!387167 () Bool)

(assert (=> b!257660 m!387167))

(declare-fun m!387169 () Bool)

(assert (=> b!257660 m!387169))

(declare-fun m!387171 () Bool)

(assert (=> b!257666 m!387171))

(assert (=> b!257664 m!387161))

(assert (=> b!257664 m!387163))

(declare-fun m!387173 () Bool)

(assert (=> b!257668 m!387173))

(assert (=> b!257615 d!86392))

(declare-fun d!86406 () Bool)

(assert (=> d!86406 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6149 (buf!6671 (_2!11960 lt!398797)))) ((_ sign_extend 32) (currentByte!12216 (_2!11960 lt!398797))) ((_ sign_extend 32) (currentBit!12211 (_2!11960 lt!398797))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6149 (buf!6671 (_2!11960 lt!398797)))) ((_ sign_extend 32) (currentByte!12216 (_2!11960 lt!398797))) ((_ sign_extend 32) (currentBit!12211 (_2!11960 lt!398797)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21873 () Bool)

(assert (= bs!21873 d!86406))

(declare-fun m!387175 () Bool)

(assert (=> bs!21873 m!387175))

(assert (=> b!257615 d!86406))

(declare-fun d!86408 () Bool)

(declare-fun e!178724 () Bool)

(assert (=> d!86408 e!178724))

(declare-fun res!215947 () Bool)

(assert (=> d!86408 (=> (not res!215947) (not e!178724))))

(assert (=> d!86408 (= res!215947 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!398946 () Unit!18401)

(declare-fun choose!27 (BitStream!11220 BitStream!11220 (_ BitVec 64) (_ BitVec 64)) Unit!18401)

(assert (=> d!86408 (= lt!398946 (choose!27 thiss!1754 (_2!11960 lt!398797) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86408 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86408 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11960 lt!398797) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!398946)))

(declare-fun b!257697 () Bool)

(assert (=> b!257697 (= e!178724 (validate_offset_bits!1 ((_ sign_extend 32) (size!6149 (buf!6671 (_2!11960 lt!398797)))) ((_ sign_extend 32) (currentByte!12216 (_2!11960 lt!398797))) ((_ sign_extend 32) (currentBit!12211 (_2!11960 lt!398797))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86408 res!215947) b!257697))

(declare-fun m!387177 () Bool)

(assert (=> d!86408 m!387177))

(assert (=> b!257697 m!387097))

(assert (=> b!257615 d!86408))

(declare-fun d!86410 () Bool)

(assert (=> d!86410 (= (array_inv!5890 (buf!6671 thiss!1754)) (bvsge (size!6149 (buf!6671 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257614 d!86410))

(check-sat (not d!86376) (not d!86406) (not b!257666) (not d!86408) (not d!86372) (not b!257635) (not b!257697) (not d!86392) (not d!86374) (not b!257660) (not b!257668) (not b!257664))
(check-sat)
