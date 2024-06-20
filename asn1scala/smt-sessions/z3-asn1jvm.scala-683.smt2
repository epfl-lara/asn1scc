; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19138 () Bool)

(assert start!19138)

(declare-fun b!95822 () Bool)

(declare-fun res!78844 () Bool)

(declare-fun e!62783 () Bool)

(assert (=> b!95822 (=> (not res!78844) (not e!62783))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-datatypes ((array!4478 0))(
  ( (array!4479 (arr!2644 (Array (_ BitVec 32) (_ BitVec 8))) (size!2045 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3576 0))(
  ( (BitStream!3577 (buf!2397 array!4478) (currentByte!4775 (_ BitVec 32)) (currentBit!4770 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3576)

(declare-datatypes ((List!894 0))(
  ( (Nil!891) (Cons!890 (h!1009 Bool) (t!1644 List!894)) )
))
(declare-fun listBits!13 () List!894)

(declare-fun thiss!1534 () BitStream!3576)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3576 BitStream!3576 (_ BitVec 64)) List!894)

(assert (=> b!95822 (= res!78844 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!95823 () Bool)

(declare-fun res!78836 () Bool)

(assert (=> b!95823 (=> (not res!78836) (not e!62783))))

(declare-fun bitStream2!8 () BitStream!3576)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95823 (= res!78836 (validate_offset_bits!1 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))) ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) ((_ sign_extend 32) (currentBit!4770 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95824 () Bool)

(declare-fun res!78841 () Bool)

(assert (=> b!95824 (=> (not res!78841) (not e!62783))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95824 (= res!78841 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))) (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8))))))

(declare-fun b!95825 () Bool)

(declare-fun res!78837 () Bool)

(assert (=> b!95825 (=> (not res!78837) (not e!62783))))

(assert (=> b!95825 (= res!78837 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!95826 () Bool)

(declare-fun res!78835 () Bool)

(assert (=> b!95826 (=> (not res!78835) (not e!62783))))

(declare-fun base!8 () BitStream!3576)

(assert (=> b!95826 (= res!78835 (bvslt (bitIndex!0 (size!2045 (buf!2397 base!8)) (currentByte!4775 base!8) (currentBit!4770 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95827 () Bool)

(declare-fun res!78840 () Bool)

(assert (=> b!95827 (=> (not res!78840) (not e!62783))))

(declare-fun isPrefixOf!0 (BitStream!3576 BitStream!3576) Bool)

(assert (=> b!95827 (= res!78840 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95828 () Bool)

(declare-fun res!78846 () Bool)

(assert (=> b!95828 (=> (not res!78846) (not e!62783))))

(assert (=> b!95828 (= res!78846 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95829 () Bool)

(declare-fun tail!373 (List!894) List!894)

(assert (=> b!95829 (= e!62783 (not (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!373 listBits!13))))))

(declare-fun b!95830 () Bool)

(declare-fun res!78839 () Bool)

(assert (=> b!95830 (=> (not res!78839) (not e!62783))))

(declare-fun length!485 (List!894) Int)

(assert (=> b!95830 (= res!78839 (> (length!485 listBits!13) 0))))

(declare-fun b!95831 () Bool)

(declare-fun e!62780 () Bool)

(declare-fun array_inv!1853 (array!4478) Bool)

(assert (=> b!95831 (= e!62780 (array_inv!1853 (buf!2397 bitStream2!8)))))

(declare-fun b!95832 () Bool)

(declare-fun e!62787 () Bool)

(assert (=> b!95832 (= e!62787 (array_inv!1853 (buf!2397 base!8)))))

(declare-fun res!78843 () Bool)

(assert (=> start!19138 (=> (not res!78843) (not e!62783))))

(assert (=> start!19138 (= res!78843 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19138 e!62783))

(assert (=> start!19138 true))

(declare-fun e!62785 () Bool)

(declare-fun inv!12 (BitStream!3576) Bool)

(assert (=> start!19138 (and (inv!12 bitStream1!8) e!62785)))

(assert (=> start!19138 (and (inv!12 bitStream2!8) e!62780)))

(assert (=> start!19138 (and (inv!12 base!8) e!62787)))

(declare-fun e!62784 () Bool)

(assert (=> start!19138 (and (inv!12 thiss!1534) e!62784)))

(declare-fun b!95833 () Bool)

(declare-fun res!78838 () Bool)

(assert (=> b!95833 (=> (not res!78838) (not e!62783))))

(assert (=> b!95833 (= res!78838 (validate_offset_bits!1 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))) ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) ((_ sign_extend 32) (currentBit!4770 bitStream1!8)) nBits!484))))

(declare-fun b!95834 () Bool)

(assert (=> b!95834 (= e!62785 (array_inv!1853 (buf!2397 bitStream1!8)))))

(declare-fun b!95835 () Bool)

(declare-fun res!78845 () Bool)

(assert (=> b!95835 (=> (not res!78845) (not e!62783))))

(assert (=> b!95835 (= res!78845 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95836 () Bool)

(declare-fun res!78842 () Bool)

(assert (=> b!95836 (=> (not res!78842) (not e!62783))))

(assert (=> b!95836 (= res!78842 (and (= (buf!2397 bitStream1!8) (buf!2397 bitStream2!8)) (= (buf!2397 bitStream1!8) (buf!2397 base!8))))))

(declare-fun b!95837 () Bool)

(assert (=> b!95837 (= e!62784 (array_inv!1853 (buf!2397 thiss!1534)))))

(assert (= (and start!19138 res!78843) b!95830))

(assert (= (and b!95830 res!78839) b!95835))

(assert (= (and b!95835 res!78845) b!95827))

(assert (= (and b!95827 res!78840) b!95828))

(assert (= (and b!95828 res!78846) b!95836))

(assert (= (and b!95836 res!78842) b!95826))

(assert (= (and b!95826 res!78835) b!95824))

(assert (= (and b!95824 res!78841) b!95833))

(assert (= (and b!95833 res!78838) b!95823))

(assert (= (and b!95823 res!78836) b!95822))

(assert (= (and b!95822 res!78844) b!95825))

(assert (= (and b!95825 res!78837) b!95829))

(assert (= start!19138 b!95834))

(assert (= start!19138 b!95831))

(assert (= start!19138 b!95832))

(assert (= start!19138 b!95837))

(declare-fun m!139149 () Bool)

(assert (=> b!95837 m!139149))

(declare-fun m!139151 () Bool)

(assert (=> b!95829 m!139151))

(declare-fun m!139153 () Bool)

(assert (=> b!95829 m!139153))

(declare-fun m!139155 () Bool)

(assert (=> b!95834 m!139155))

(declare-fun m!139157 () Bool)

(assert (=> b!95823 m!139157))

(declare-fun m!139159 () Bool)

(assert (=> b!95826 m!139159))

(declare-fun m!139161 () Bool)

(assert (=> b!95824 m!139161))

(declare-fun m!139163 () Bool)

(assert (=> b!95824 m!139163))

(declare-fun m!139165 () Bool)

(assert (=> b!95835 m!139165))

(declare-fun m!139167 () Bool)

(assert (=> b!95831 m!139167))

(declare-fun m!139169 () Bool)

(assert (=> b!95833 m!139169))

(declare-fun m!139171 () Bool)

(assert (=> start!19138 m!139171))

(declare-fun m!139173 () Bool)

(assert (=> start!19138 m!139173))

(declare-fun m!139175 () Bool)

(assert (=> start!19138 m!139175))

(declare-fun m!139177 () Bool)

(assert (=> start!19138 m!139177))

(declare-fun m!139179 () Bool)

(assert (=> b!95822 m!139179))

(declare-fun m!139181 () Bool)

(assert (=> b!95827 m!139181))

(declare-fun m!139183 () Bool)

(assert (=> b!95832 m!139183))

(declare-fun m!139185 () Bool)

(assert (=> b!95830 m!139185))

(declare-fun m!139187 () Bool)

(assert (=> b!95828 m!139187))

(check-sat (not b!95827) (not b!95831) (not b!95824) (not b!95832) (not b!95823) (not b!95830) (not b!95828) (not b!95833) (not start!19138) (not b!95826) (not b!95834) (not b!95829) (not b!95835) (not b!95837) (not b!95822))
(check-sat)
(get-model)

(declare-fun d!29762 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))) ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) ((_ sign_extend 32) (currentBit!4770 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))) ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) ((_ sign_extend 32) (currentBit!4770 bitStream1!8))) nBits!484))))

(declare-fun bs!7325 () Bool)

(assert (= bs!7325 d!29762))

(declare-fun m!139229 () Bool)

(assert (=> bs!7325 m!139229))

(assert (=> b!95833 d!29762))

(declare-fun b!95896 () Bool)

(declare-fun e!62820 () Bool)

(declare-fun lt!139199 () List!894)

(declare-fun isEmpty!262 (List!894) Bool)

(assert (=> b!95896 (= e!62820 (isEmpty!262 lt!139199))))

(declare-fun b!95894 () Bool)

(declare-datatypes ((tuple2!7702 0))(
  ( (tuple2!7703 (_1!4098 List!894) (_2!4098 BitStream!3576)) )
))
(declare-fun e!62819 () tuple2!7702)

(assert (=> b!95894 (= e!62819 (tuple2!7703 Nil!891 bitStream1!8))))

(declare-fun b!95897 () Bool)

(assert (=> b!95897 (= e!62820 (> (length!485 lt!139199) 0))))

(declare-fun d!29764 () Bool)

(assert (=> d!29764 e!62820))

(declare-fun c!5997 () Bool)

(assert (=> d!29764 (= c!5997 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29764 (= lt!139199 (_1!4098 e!62819))))

(declare-fun c!5996 () Bool)

(assert (=> d!29764 (= c!5996 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29764 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29764 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139199)))

(declare-datatypes ((tuple2!7704 0))(
  ( (tuple2!7705 (_1!4099 Bool) (_2!4099 BitStream!3576)) )
))
(declare-fun lt!139198 () tuple2!7704)

(declare-fun b!95895 () Bool)

(declare-fun lt!139200 () (_ BitVec 64))

(assert (=> b!95895 (= e!62819 (tuple2!7703 (Cons!890 (_1!4099 lt!139198) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4099 lt!139198) (bvsub nBits!484 lt!139200))) (_2!4099 lt!139198)))))

(declare-fun readBit!0 (BitStream!3576) tuple2!7704)

(assert (=> b!95895 (= lt!139198 (readBit!0 bitStream1!8))))

(assert (=> b!95895 (= lt!139200 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!29764 c!5996) b!95894))

(assert (= (and d!29764 (not c!5996)) b!95895))

(assert (= (and d!29764 c!5997) b!95896))

(assert (= (and d!29764 (not c!5997)) b!95897))

(declare-fun m!139231 () Bool)

(assert (=> b!95896 m!139231))

(declare-fun m!139233 () Bool)

(assert (=> b!95897 m!139233))

(declare-fun m!139235 () Bool)

(assert (=> b!95895 m!139235))

(declare-fun m!139237 () Bool)

(assert (=> b!95895 m!139237))

(assert (=> b!95822 d!29764))

(declare-fun d!29768 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29768 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4770 bitStream1!8) (currentByte!4775 bitStream1!8) (size!2045 (buf!2397 bitStream1!8))))))

(declare-fun bs!7327 () Bool)

(assert (= bs!7327 d!29768))

(declare-fun m!139241 () Bool)

(assert (=> bs!7327 m!139241))

(assert (=> start!19138 d!29768))

(declare-fun d!29772 () Bool)

(assert (=> d!29772 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4770 bitStream2!8) (currentByte!4775 bitStream2!8) (size!2045 (buf!2397 bitStream2!8))))))

(declare-fun bs!7328 () Bool)

(assert (= bs!7328 d!29772))

(declare-fun m!139243 () Bool)

(assert (=> bs!7328 m!139243))

(assert (=> start!19138 d!29772))

(declare-fun d!29774 () Bool)

(assert (=> d!29774 (= (inv!12 base!8) (invariant!0 (currentBit!4770 base!8) (currentByte!4775 base!8) (size!2045 (buf!2397 base!8))))))

(declare-fun bs!7329 () Bool)

(assert (= bs!7329 d!29774))

(declare-fun m!139245 () Bool)

(assert (=> bs!7329 m!139245))

(assert (=> start!19138 d!29774))

(declare-fun d!29776 () Bool)

(assert (=> d!29776 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4770 thiss!1534) (currentByte!4775 thiss!1534) (size!2045 (buf!2397 thiss!1534))))))

(declare-fun bs!7330 () Bool)

(assert (= bs!7330 d!29776))

(declare-fun m!139247 () Bool)

(assert (=> bs!7330 m!139247))

(assert (=> start!19138 d!29776))

(declare-fun d!29778 () Bool)

(assert (=> d!29778 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))) ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) ((_ sign_extend 32) (currentBit!4770 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))) ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) ((_ sign_extend 32) (currentBit!4770 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7331 () Bool)

(assert (= bs!7331 d!29778))

(declare-fun m!139249 () Bool)

(assert (=> bs!7331 m!139249))

(assert (=> b!95823 d!29778))

(declare-fun d!29780 () Bool)

(assert (=> d!29780 (= (array_inv!1853 (buf!2397 base!8)) (bvsge (size!2045 (buf!2397 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95832 d!29780))

(declare-fun d!29782 () Bool)

(declare-fun size!2047 (List!894) Int)

(assert (=> d!29782 (= (length!485 listBits!13) (size!2047 listBits!13))))

(declare-fun bs!7332 () Bool)

(assert (= bs!7332 d!29782))

(declare-fun m!139251 () Bool)

(assert (=> bs!7332 m!139251))

(assert (=> b!95830 d!29782))

(declare-fun d!29784 () Bool)

(assert (=> d!29784 (= (array_inv!1853 (buf!2397 bitStream2!8)) (bvsge (size!2045 (buf!2397 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95831 d!29784))

(declare-fun b!95900 () Bool)

(declare-fun e!62822 () Bool)

(declare-fun lt!139202 () List!894)

(assert (=> b!95900 (= e!62822 (isEmpty!262 lt!139202))))

(declare-fun b!95898 () Bool)

(declare-fun e!62821 () tuple2!7702)

(assert (=> b!95898 (= e!62821 (tuple2!7703 Nil!891 bitStream2!8))))

(declare-fun b!95901 () Bool)

(assert (=> b!95901 (= e!62822 (> (length!485 lt!139202) 0))))

(declare-fun d!29786 () Bool)

(assert (=> d!29786 e!62822))

(declare-fun c!5999 () Bool)

(assert (=> d!29786 (= c!5999 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29786 (= lt!139202 (_1!4098 e!62821))))

(declare-fun c!5998 () Bool)

(assert (=> d!29786 (= c!5998 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29786 (bvsge (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29786 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!139202)))

(declare-fun lt!139201 () tuple2!7704)

(declare-fun b!95899 () Bool)

(declare-fun lt!139203 () (_ BitVec 64))

(assert (=> b!95899 (= e!62821 (tuple2!7703 (Cons!890 (_1!4099 lt!139201) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4099 lt!139201) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139203))) (_2!4099 lt!139201)))))

(assert (=> b!95899 (= lt!139201 (readBit!0 bitStream2!8))))

(assert (=> b!95899 (= lt!139203 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!29786 c!5998) b!95898))

(assert (= (and d!29786 (not c!5998)) b!95899))

(assert (= (and d!29786 c!5999) b!95900))

(assert (= (and d!29786 (not c!5999)) b!95901))

(declare-fun m!139253 () Bool)

(assert (=> b!95900 m!139253))

(declare-fun m!139255 () Bool)

(assert (=> b!95901 m!139255))

(declare-fun m!139257 () Bool)

(assert (=> b!95899 m!139257))

(declare-fun m!139259 () Bool)

(assert (=> b!95899 m!139259))

(assert (=> b!95829 d!29786))

(declare-fun d!29788 () Bool)

(assert (=> d!29788 (= (tail!373 listBits!13) (t!1644 listBits!13))))

(assert (=> b!95829 d!29788))

(declare-fun d!29790 () Bool)

(declare-fun res!78899 () Bool)

(declare-fun e!62833 () Bool)

(assert (=> d!29790 (=> (not res!78899) (not e!62833))))

(assert (=> d!29790 (= res!78899 (= (size!2045 (buf!2397 bitStream1!8)) (size!2045 (buf!2397 bitStream2!8))))))

(assert (=> d!29790 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62833)))

(declare-fun b!95917 () Bool)

(declare-fun res!78898 () Bool)

(assert (=> b!95917 (=> (not res!78898) (not e!62833))))

(assert (=> b!95917 (= res!78898 (bvsle (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8)) (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8))))))

(declare-fun b!95918 () Bool)

(declare-fun e!62834 () Bool)

(assert (=> b!95918 (= e!62833 e!62834)))

(declare-fun res!78900 () Bool)

(assert (=> b!95918 (=> res!78900 e!62834)))

(assert (=> b!95918 (= res!78900 (= (size!2045 (buf!2397 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95919 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4478 array!4478 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95919 (= e!62834 (arrayBitRangesEq!0 (buf!2397 bitStream1!8) (buf!2397 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))))))

(assert (= (and d!29790 res!78899) b!95917))

(assert (= (and b!95917 res!78898) b!95918))

(assert (= (and b!95918 (not res!78900)) b!95919))

(assert (=> b!95917 m!139161))

(assert (=> b!95917 m!139163))

(assert (=> b!95919 m!139161))

(assert (=> b!95919 m!139161))

(declare-fun m!139271 () Bool)

(assert (=> b!95919 m!139271))

(assert (=> b!95828 d!29790))

(declare-fun d!29808 () Bool)

(assert (=> d!29808 (= (array_inv!1853 (buf!2397 thiss!1534)) (bvsge (size!2045 (buf!2397 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!95837 d!29808))

(declare-fun d!29810 () Bool)

(declare-fun e!62848 () Bool)

(assert (=> d!29810 e!62848))

(declare-fun res!78923 () Bool)

(assert (=> d!29810 (=> (not res!78923) (not e!62848))))

(declare-fun lt!139234 () (_ BitVec 64))

(declare-fun lt!139239 () (_ BitVec 64))

(declare-fun lt!139237 () (_ BitVec 64))

(assert (=> d!29810 (= res!78923 (= lt!139237 (bvsub lt!139234 lt!139239)))))

(assert (=> d!29810 (or (= (bvand lt!139234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139234 lt!139239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29810 (= lt!139239 (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 base!8))) ((_ sign_extend 32) (currentByte!4775 base!8)) ((_ sign_extend 32) (currentBit!4770 base!8))))))

(declare-fun lt!139235 () (_ BitVec 64))

(declare-fun lt!139238 () (_ BitVec 64))

(assert (=> d!29810 (= lt!139234 (bvmul lt!139235 lt!139238))))

(assert (=> d!29810 (or (= lt!139235 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139238 (bvsdiv (bvmul lt!139235 lt!139238) lt!139235)))))

(assert (=> d!29810 (= lt!139238 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29810 (= lt!139235 ((_ sign_extend 32) (size!2045 (buf!2397 base!8))))))

(assert (=> d!29810 (= lt!139237 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4775 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4770 base!8))))))

(assert (=> d!29810 (invariant!0 (currentBit!4770 base!8) (currentByte!4775 base!8) (size!2045 (buf!2397 base!8)))))

(assert (=> d!29810 (= (bitIndex!0 (size!2045 (buf!2397 base!8)) (currentByte!4775 base!8) (currentBit!4770 base!8)) lt!139237)))

(declare-fun b!95942 () Bool)

(declare-fun res!78924 () Bool)

(assert (=> b!95942 (=> (not res!78924) (not e!62848))))

(assert (=> b!95942 (= res!78924 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139237))))

(declare-fun b!95943 () Bool)

(declare-fun lt!139236 () (_ BitVec 64))

(assert (=> b!95943 (= e!62848 (bvsle lt!139237 (bvmul lt!139236 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95943 (or (= lt!139236 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139236 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139236)))))

(assert (=> b!95943 (= lt!139236 ((_ sign_extend 32) (size!2045 (buf!2397 base!8))))))

(assert (= (and d!29810 res!78923) b!95942))

(assert (= (and b!95942 res!78924) b!95943))

(declare-fun m!139293 () Bool)

(assert (=> d!29810 m!139293))

(assert (=> d!29810 m!139245))

(assert (=> b!95826 d!29810))

(declare-fun d!29838 () Bool)

(declare-fun res!78926 () Bool)

(declare-fun e!62849 () Bool)

(assert (=> d!29838 (=> (not res!78926) (not e!62849))))

(assert (=> d!29838 (= res!78926 (= (size!2045 (buf!2397 bitStream2!8)) (size!2045 (buf!2397 base!8))))))

(assert (=> d!29838 (= (isPrefixOf!0 bitStream2!8 base!8) e!62849)))

(declare-fun b!95944 () Bool)

(declare-fun res!78925 () Bool)

(assert (=> b!95944 (=> (not res!78925) (not e!62849))))

(assert (=> b!95944 (= res!78925 (bvsle (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8)) (bitIndex!0 (size!2045 (buf!2397 base!8)) (currentByte!4775 base!8) (currentBit!4770 base!8))))))

(declare-fun b!95945 () Bool)

(declare-fun e!62850 () Bool)

(assert (=> b!95945 (= e!62849 e!62850)))

(declare-fun res!78927 () Bool)

(assert (=> b!95945 (=> res!78927 e!62850)))

(assert (=> b!95945 (= res!78927 (= (size!2045 (buf!2397 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95946 () Bool)

(assert (=> b!95946 (= e!62850 (arrayBitRangesEq!0 (buf!2397 bitStream2!8) (buf!2397 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8))))))

(assert (= (and d!29838 res!78926) b!95944))

(assert (= (and b!95944 res!78925) b!95945))

(assert (= (and b!95945 (not res!78927)) b!95946))

(assert (=> b!95944 m!139163))

(assert (=> b!95944 m!139159))

(assert (=> b!95946 m!139163))

(assert (=> b!95946 m!139163))

(declare-fun m!139295 () Bool)

(assert (=> b!95946 m!139295))

(assert (=> b!95827 d!29838))

(declare-fun d!29840 () Bool)

(assert (=> d!29840 (= (array_inv!1853 (buf!2397 bitStream1!8)) (bvsge (size!2045 (buf!2397 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95834 d!29840))

(declare-fun d!29842 () Bool)

(declare-fun res!78929 () Bool)

(declare-fun e!62851 () Bool)

(assert (=> d!29842 (=> (not res!78929) (not e!62851))))

(assert (=> d!29842 (= res!78929 (= (size!2045 (buf!2397 bitStream1!8)) (size!2045 (buf!2397 base!8))))))

(assert (=> d!29842 (= (isPrefixOf!0 bitStream1!8 base!8) e!62851)))

(declare-fun b!95947 () Bool)

(declare-fun res!78928 () Bool)

(assert (=> b!95947 (=> (not res!78928) (not e!62851))))

(assert (=> b!95947 (= res!78928 (bvsle (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8)) (bitIndex!0 (size!2045 (buf!2397 base!8)) (currentByte!4775 base!8) (currentBit!4770 base!8))))))

(declare-fun b!95948 () Bool)

(declare-fun e!62852 () Bool)

(assert (=> b!95948 (= e!62851 e!62852)))

(declare-fun res!78930 () Bool)

(assert (=> b!95948 (=> res!78930 e!62852)))

(assert (=> b!95948 (= res!78930 (= (size!2045 (buf!2397 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95949 () Bool)

(assert (=> b!95949 (= e!62852 (arrayBitRangesEq!0 (buf!2397 bitStream1!8) (buf!2397 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))))))

(assert (= (and d!29842 res!78929) b!95947))

(assert (= (and b!95947 res!78928) b!95948))

(assert (= (and b!95948 (not res!78930)) b!95949))

(assert (=> b!95947 m!139161))

(assert (=> b!95947 m!139159))

(assert (=> b!95949 m!139161))

(assert (=> b!95949 m!139161))

(declare-fun m!139297 () Bool)

(assert (=> b!95949 m!139297))

(assert (=> b!95835 d!29842))

(declare-fun d!29844 () Bool)

(declare-fun e!62853 () Bool)

(assert (=> d!29844 e!62853))

(declare-fun res!78931 () Bool)

(assert (=> d!29844 (=> (not res!78931) (not e!62853))))

(declare-fun lt!139240 () (_ BitVec 64))

(declare-fun lt!139243 () (_ BitVec 64))

(declare-fun lt!139245 () (_ BitVec 64))

(assert (=> d!29844 (= res!78931 (= lt!139243 (bvsub lt!139240 lt!139245)))))

(assert (=> d!29844 (or (= (bvand lt!139240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139240 lt!139245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29844 (= lt!139245 (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))) ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) ((_ sign_extend 32) (currentBit!4770 bitStream1!8))))))

(declare-fun lt!139241 () (_ BitVec 64))

(declare-fun lt!139244 () (_ BitVec 64))

(assert (=> d!29844 (= lt!139240 (bvmul lt!139241 lt!139244))))

(assert (=> d!29844 (or (= lt!139241 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139244 (bvsdiv (bvmul lt!139241 lt!139244) lt!139241)))))

(assert (=> d!29844 (= lt!139244 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29844 (= lt!139241 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))))))

(assert (=> d!29844 (= lt!139243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4770 bitStream1!8))))))

(assert (=> d!29844 (invariant!0 (currentBit!4770 bitStream1!8) (currentByte!4775 bitStream1!8) (size!2045 (buf!2397 bitStream1!8)))))

(assert (=> d!29844 (= (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8)) lt!139243)))

(declare-fun b!95950 () Bool)

(declare-fun res!78932 () Bool)

(assert (=> b!95950 (=> (not res!78932) (not e!62853))))

(assert (=> b!95950 (= res!78932 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139243))))

(declare-fun b!95951 () Bool)

(declare-fun lt!139242 () (_ BitVec 64))

(assert (=> b!95951 (= e!62853 (bvsle lt!139243 (bvmul lt!139242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95951 (or (= lt!139242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139242)))))

(assert (=> b!95951 (= lt!139242 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))))))

(assert (= (and d!29844 res!78931) b!95950))

(assert (= (and b!95950 res!78932) b!95951))

(assert (=> d!29844 m!139229))

(assert (=> d!29844 m!139241))

(assert (=> b!95824 d!29844))

(declare-fun d!29846 () Bool)

(declare-fun e!62854 () Bool)

(assert (=> d!29846 e!62854))

(declare-fun res!78933 () Bool)

(assert (=> d!29846 (=> (not res!78933) (not e!62854))))

(declare-fun lt!139251 () (_ BitVec 64))

(declare-fun lt!139249 () (_ BitVec 64))

(declare-fun lt!139246 () (_ BitVec 64))

(assert (=> d!29846 (= res!78933 (= lt!139249 (bvsub lt!139246 lt!139251)))))

(assert (=> d!29846 (or (= (bvand lt!139246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139251 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139246 lt!139251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29846 (= lt!139251 (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))) ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) ((_ sign_extend 32) (currentBit!4770 bitStream2!8))))))

(declare-fun lt!139247 () (_ BitVec 64))

(declare-fun lt!139250 () (_ BitVec 64))

(assert (=> d!29846 (= lt!139246 (bvmul lt!139247 lt!139250))))

(assert (=> d!29846 (or (= lt!139247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139250 (bvsdiv (bvmul lt!139247 lt!139250) lt!139247)))))

(assert (=> d!29846 (= lt!139250 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29846 (= lt!139247 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))))))

(assert (=> d!29846 (= lt!139249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4770 bitStream2!8))))))

(assert (=> d!29846 (invariant!0 (currentBit!4770 bitStream2!8) (currentByte!4775 bitStream2!8) (size!2045 (buf!2397 bitStream2!8)))))

(assert (=> d!29846 (= (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8)) lt!139249)))

(declare-fun b!95952 () Bool)

(declare-fun res!78934 () Bool)

(assert (=> b!95952 (=> (not res!78934) (not e!62854))))

(assert (=> b!95952 (= res!78934 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139249))))

(declare-fun b!95953 () Bool)

(declare-fun lt!139248 () (_ BitVec 64))

(assert (=> b!95953 (= e!62854 (bvsle lt!139249 (bvmul lt!139248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95953 (or (= lt!139248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139248)))))

(assert (=> b!95953 (= lt!139248 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))))))

(assert (= (and d!29846 res!78933) b!95952))

(assert (= (and b!95952 res!78934) b!95953))

(assert (=> d!29846 m!139249))

(assert (=> d!29846 m!139243))

(assert (=> b!95824 d!29846))

(check-sat (not d!29762) (not b!95919) (not b!95900) (not b!95947) (not b!95895) (not b!95896) (not b!95944) (not b!95949) (not d!29810) (not d!29768) (not d!29782) (not b!95946) (not d!29844) (not d!29772) (not b!95899) (not d!29774) (not d!29778) (not b!95897) (not b!95917) (not d!29776) (not b!95901) (not d!29846))
(check-sat)
(get-model)

(declare-fun d!29920 () Bool)

(assert (=> d!29920 (= (length!485 lt!139202) (size!2047 lt!139202))))

(declare-fun bs!7348 () Bool)

(assert (= bs!7348 d!29920))

(declare-fun m!139431 () Bool)

(assert (=> bs!7348 m!139431))

(assert (=> b!95901 d!29920))

(assert (=> b!95944 d!29846))

(assert (=> b!95944 d!29810))

(declare-fun b!96064 () Bool)

(declare-fun e!62930 () Bool)

(declare-fun lt!139371 () List!894)

(assert (=> b!96064 (= e!62930 (isEmpty!262 lt!139371))))

(declare-fun b!96062 () Bool)

(declare-fun e!62929 () tuple2!7702)

(assert (=> b!96062 (= e!62929 (tuple2!7703 Nil!891 (_2!4099 lt!139201)))))

(declare-fun b!96065 () Bool)

(assert (=> b!96065 (= e!62930 (> (length!485 lt!139371) 0))))

(declare-fun d!29922 () Bool)

(assert (=> d!29922 e!62930))

(declare-fun c!6029 () Bool)

(assert (=> d!29922 (= c!6029 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29922 (= lt!139371 (_1!4098 e!62929))))

(declare-fun c!6028 () Bool)

(assert (=> d!29922 (= c!6028 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29922 (bvsge (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139203) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29922 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4099 lt!139201) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139203)) lt!139371)))

(declare-fun b!96063 () Bool)

(declare-fun lt!139372 () (_ BitVec 64))

(declare-fun lt!139370 () tuple2!7704)

(assert (=> b!96063 (= e!62929 (tuple2!7703 (Cons!890 (_1!4099 lt!139370) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4099 lt!139370) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139203) lt!139372))) (_2!4099 lt!139370)))))

(assert (=> b!96063 (= lt!139370 (readBit!0 (_2!4099 lt!139201)))))

(assert (=> b!96063 (= lt!139372 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!29922 c!6028) b!96062))

(assert (= (and d!29922 (not c!6028)) b!96063))

(assert (= (and d!29922 c!6029) b!96064))

(assert (= (and d!29922 (not c!6029)) b!96065))

(declare-fun m!139433 () Bool)

(assert (=> b!96064 m!139433))

(declare-fun m!139435 () Bool)

(assert (=> b!96065 m!139435))

(declare-fun m!139437 () Bool)

(assert (=> b!96063 m!139437))

(declare-fun m!139439 () Bool)

(assert (=> b!96063 m!139439))

(assert (=> b!95899 d!29922))

(declare-fun d!29924 () Bool)

(declare-fun e!62937 () Bool)

(assert (=> d!29924 e!62937))

(declare-fun res!78989 () Bool)

(assert (=> d!29924 (=> (not res!78989) (not e!62937))))

(declare-datatypes ((Unit!5850 0))(
  ( (Unit!5851) )
))
(declare-datatypes ((tuple2!7716 0))(
  ( (tuple2!7717 (_1!4106 Unit!5850) (_2!4106 BitStream!3576)) )
))
(declare-fun increaseBitIndex!0 (BitStream!3576) tuple2!7716)

(assert (=> d!29924 (= res!78989 (= (buf!2397 (_2!4106 (increaseBitIndex!0 bitStream2!8))) (buf!2397 bitStream2!8)))))

(declare-fun lt!139387 () Bool)

(assert (=> d!29924 (= lt!139387 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139391 () tuple2!7704)

(assert (=> d!29924 (= lt!139391 (tuple2!7705 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream2!8)))) #b00000000000000000000000000000000)) (_2!4106 (increaseBitIndex!0 bitStream2!8))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!29924 (validate_offset_bit!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))) ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) ((_ sign_extend 32) (currentBit!4770 bitStream2!8)))))

(assert (=> d!29924 (= (readBit!0 bitStream2!8) lt!139391)))

(declare-fun lt!139393 () (_ BitVec 64))

(declare-fun lt!139389 () (_ BitVec 64))

(declare-fun b!96068 () Bool)

(assert (=> b!96068 (= e!62937 (= (bitIndex!0 (size!2045 (buf!2397 (_2!4106 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4775 (_2!4106 (increaseBitIndex!0 bitStream2!8))) (currentBit!4770 (_2!4106 (increaseBitIndex!0 bitStream2!8)))) (bvadd lt!139393 lt!139389)))))

(assert (=> b!96068 (or (not (= (bvand lt!139393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139389 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139393 lt!139389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96068 (= lt!139389 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96068 (= lt!139393 (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8)))))

(declare-fun lt!139392 () Bool)

(assert (=> b!96068 (= lt!139392 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139390 () Bool)

(assert (=> b!96068 (= lt!139390 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139388 () Bool)

(assert (=> b!96068 (= lt!139388 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream2!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!29924 res!78989) b!96068))

(declare-fun m!139441 () Bool)

(assert (=> d!29924 m!139441))

(declare-fun m!139443 () Bool)

(assert (=> d!29924 m!139443))

(declare-fun m!139445 () Bool)

(assert (=> d!29924 m!139445))

(declare-fun m!139447 () Bool)

(assert (=> d!29924 m!139447))

(declare-fun m!139449 () Bool)

(assert (=> b!96068 m!139449))

(assert (=> b!96068 m!139441))

(assert (=> b!96068 m!139163))

(assert (=> b!96068 m!139445))

(assert (=> b!96068 m!139443))

(assert (=> b!95899 d!29924))

(declare-fun d!29926 () Bool)

(assert (=> d!29926 (= (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))) ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) ((_ sign_extend 32) (currentBit!4770 bitStream1!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4770 bitStream1!8)))))))

(assert (=> d!29762 d!29926))

(assert (=> d!29844 d!29926))

(declare-fun d!29928 () Bool)

(assert (=> d!29928 (= (invariant!0 (currentBit!4770 bitStream1!8) (currentByte!4775 bitStream1!8) (size!2045 (buf!2397 bitStream1!8))) (and (bvsge (currentBit!4770 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4770 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4775 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4775 bitStream1!8) (size!2045 (buf!2397 bitStream1!8))) (and (= (currentBit!4770 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4775 bitStream1!8) (size!2045 (buf!2397 bitStream1!8)))))))))

(assert (=> d!29844 d!29928))

(declare-fun d!29930 () Bool)

(get-info :version)

(assert (=> d!29930 (= (isEmpty!262 lt!139202) ((_ is Nil!891) lt!139202))))

(assert (=> b!95900 d!29930))

(declare-fun d!29932 () Bool)

(assert (=> d!29932 (= (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))) ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) ((_ sign_extend 32) (currentBit!4770 bitStream2!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2045 (buf!2397 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4775 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4770 bitStream2!8)))))))

(assert (=> d!29778 d!29932))

(declare-fun d!29934 () Bool)

(assert (=> d!29934 (= (invariant!0 (currentBit!4770 base!8) (currentByte!4775 base!8) (size!2045 (buf!2397 base!8))) (and (bvsge (currentBit!4770 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4770 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4775 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4775 base!8) (size!2045 (buf!2397 base!8))) (and (= (currentBit!4770 base!8) #b00000000000000000000000000000000) (= (currentByte!4775 base!8) (size!2045 (buf!2397 base!8)))))))))

(assert (=> d!29774 d!29934))

(declare-fun d!29936 () Bool)

(assert (=> d!29936 (= (length!485 lt!139199) (size!2047 lt!139199))))

(declare-fun bs!7349 () Bool)

(assert (= bs!7349 d!29936))

(declare-fun m!139451 () Bool)

(assert (=> bs!7349 m!139451))

(assert (=> b!95897 d!29936))

(declare-fun d!29938 () Bool)

(declare-fun lt!139396 () Int)

(assert (=> d!29938 (>= lt!139396 0)))

(declare-fun e!62940 () Int)

(assert (=> d!29938 (= lt!139396 e!62940)))

(declare-fun c!6032 () Bool)

(assert (=> d!29938 (= c!6032 ((_ is Nil!891) listBits!13))))

(assert (=> d!29938 (= (size!2047 listBits!13) lt!139396)))

(declare-fun b!96073 () Bool)

(assert (=> b!96073 (= e!62940 0)))

(declare-fun b!96074 () Bool)

(assert (=> b!96074 (= e!62940 (+ 1 (size!2047 (t!1644 listBits!13))))))

(assert (= (and d!29938 c!6032) b!96073))

(assert (= (and d!29938 (not c!6032)) b!96074))

(declare-fun m!139453 () Bool)

(assert (=> b!96074 m!139453))

(assert (=> d!29782 d!29938))

(declare-datatypes ((tuple4!54 0))(
  ( (tuple4!55 (_1!4107 (_ BitVec 32)) (_2!4107 (_ BitVec 32)) (_3!248 (_ BitVec 32)) (_4!27 (_ BitVec 32))) )
))
(declare-fun lt!139403 () tuple4!54)

(declare-fun c!6035 () Bool)

(declare-fun call!1167 () Bool)

(declare-fun lt!139405 () (_ BitVec 32))

(declare-fun bm!1164 () Bool)

(declare-fun lt!139404 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1164 (= call!1167 (byteRangesEq!0 (select (arr!2644 (buf!2397 bitStream1!8)) (_3!248 lt!139403)) (select (arr!2644 (buf!2397 bitStream2!8)) (_3!248 lt!139403)) lt!139404 (ite c!6035 lt!139405 #b00000000000000000000000000001000)))))

(declare-fun b!96089 () Bool)

(declare-fun res!79002 () Bool)

(assert (=> b!96089 (= res!79002 (= lt!139405 #b00000000000000000000000000000000))))

(declare-fun e!62953 () Bool)

(assert (=> b!96089 (=> res!79002 e!62953)))

(declare-fun e!62955 () Bool)

(assert (=> b!96089 (= e!62955 e!62953)))

(declare-fun b!96090 () Bool)

(declare-fun e!62956 () Bool)

(declare-fun arrayRangesEq!28 (array!4478 array!4478 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96090 (= e!62956 (arrayRangesEq!28 (buf!2397 bitStream1!8) (buf!2397 bitStream2!8) (_1!4107 lt!139403) (_2!4107 lt!139403)))))

(declare-fun b!96091 () Bool)

(assert (=> b!96091 (= e!62953 (byteRangesEq!0 (select (arr!2644 (buf!2397 bitStream1!8)) (_4!27 lt!139403)) (select (arr!2644 (buf!2397 bitStream2!8)) (_4!27 lt!139403)) #b00000000000000000000000000000000 lt!139405))))

(declare-fun b!96092 () Bool)

(declare-fun e!62954 () Bool)

(assert (=> b!96092 (= e!62954 call!1167)))

(declare-fun d!29940 () Bool)

(declare-fun res!79003 () Bool)

(declare-fun e!62957 () Bool)

(assert (=> d!29940 (=> res!79003 e!62957)))

(assert (=> d!29940 (= res!79003 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))))))

(assert (=> d!29940 (= (arrayBitRangesEq!0 (buf!2397 bitStream1!8) (buf!2397 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))) e!62957)))

(declare-fun b!96093 () Bool)

(assert (=> b!96093 (= e!62954 e!62955)))

(declare-fun res!79004 () Bool)

(assert (=> b!96093 (= res!79004 call!1167)))

(assert (=> b!96093 (=> (not res!79004) (not e!62955))))

(declare-fun b!96094 () Bool)

(declare-fun e!62958 () Bool)

(assert (=> b!96094 (= e!62957 e!62958)))

(declare-fun res!79000 () Bool)

(assert (=> b!96094 (=> (not res!79000) (not e!62958))))

(assert (=> b!96094 (= res!79000 e!62956)))

(declare-fun res!79001 () Bool)

(assert (=> b!96094 (=> res!79001 e!62956)))

(assert (=> b!96094 (= res!79001 (bvsge (_1!4107 lt!139403) (_2!4107 lt!139403)))))

(assert (=> b!96094 (= lt!139405 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96094 (= lt!139404 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!54)

(assert (=> b!96094 (= lt!139403 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))))))

(declare-fun b!96095 () Bool)

(assert (=> b!96095 (= e!62958 e!62954)))

(assert (=> b!96095 (= c!6035 (= (_3!248 lt!139403) (_4!27 lt!139403)))))

(assert (= (and d!29940 (not res!79003)) b!96094))

(assert (= (and b!96094 (not res!79001)) b!96090))

(assert (= (and b!96094 res!79000) b!96095))

(assert (= (and b!96095 c!6035) b!96092))

(assert (= (and b!96095 (not c!6035)) b!96093))

(assert (= (and b!96093 res!79004) b!96089))

(assert (= (and b!96089 (not res!79002)) b!96091))

(assert (= (or b!96092 b!96093) bm!1164))

(declare-fun m!139455 () Bool)

(assert (=> bm!1164 m!139455))

(declare-fun m!139457 () Bool)

(assert (=> bm!1164 m!139457))

(assert (=> bm!1164 m!139455))

(assert (=> bm!1164 m!139457))

(declare-fun m!139459 () Bool)

(assert (=> bm!1164 m!139459))

(declare-fun m!139461 () Bool)

(assert (=> b!96090 m!139461))

(declare-fun m!139463 () Bool)

(assert (=> b!96091 m!139463))

(declare-fun m!139465 () Bool)

(assert (=> b!96091 m!139465))

(assert (=> b!96091 m!139463))

(assert (=> b!96091 m!139465))

(declare-fun m!139467 () Bool)

(assert (=> b!96091 m!139467))

(assert (=> b!96094 m!139161))

(declare-fun m!139469 () Bool)

(assert (=> b!96094 m!139469))

(assert (=> b!95919 d!29940))

(assert (=> b!95919 d!29844))

(declare-fun d!29942 () Bool)

(assert (=> d!29942 (= (isEmpty!262 lt!139199) ((_ is Nil!891) lt!139199))))

(assert (=> b!95896 d!29942))

(declare-fun lt!139406 () tuple4!54)

(declare-fun bm!1165 () Bool)

(declare-fun lt!139408 () (_ BitVec 32))

(declare-fun c!6036 () Bool)

(declare-fun call!1168 () Bool)

(declare-fun lt!139407 () (_ BitVec 32))

(assert (=> bm!1165 (= call!1168 (byteRangesEq!0 (select (arr!2644 (buf!2397 bitStream1!8)) (_3!248 lt!139406)) (select (arr!2644 (buf!2397 base!8)) (_3!248 lt!139406)) lt!139407 (ite c!6036 lt!139408 #b00000000000000000000000000001000)))))

(declare-fun b!96096 () Bool)

(declare-fun res!79007 () Bool)

(assert (=> b!96096 (= res!79007 (= lt!139408 #b00000000000000000000000000000000))))

(declare-fun e!62959 () Bool)

(assert (=> b!96096 (=> res!79007 e!62959)))

(declare-fun e!62961 () Bool)

(assert (=> b!96096 (= e!62961 e!62959)))

(declare-fun e!62962 () Bool)

(declare-fun b!96097 () Bool)

(assert (=> b!96097 (= e!62962 (arrayRangesEq!28 (buf!2397 bitStream1!8) (buf!2397 base!8) (_1!4107 lt!139406) (_2!4107 lt!139406)))))

(declare-fun b!96098 () Bool)

(assert (=> b!96098 (= e!62959 (byteRangesEq!0 (select (arr!2644 (buf!2397 bitStream1!8)) (_4!27 lt!139406)) (select (arr!2644 (buf!2397 base!8)) (_4!27 lt!139406)) #b00000000000000000000000000000000 lt!139408))))

(declare-fun b!96099 () Bool)

(declare-fun e!62960 () Bool)

(assert (=> b!96099 (= e!62960 call!1168)))

(declare-fun d!29944 () Bool)

(declare-fun res!79008 () Bool)

(declare-fun e!62963 () Bool)

(assert (=> d!29944 (=> res!79008 e!62963)))

(assert (=> d!29944 (= res!79008 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))))))

(assert (=> d!29944 (= (arrayBitRangesEq!0 (buf!2397 bitStream1!8) (buf!2397 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))) e!62963)))

(declare-fun b!96100 () Bool)

(assert (=> b!96100 (= e!62960 e!62961)))

(declare-fun res!79009 () Bool)

(assert (=> b!96100 (= res!79009 call!1168)))

(assert (=> b!96100 (=> (not res!79009) (not e!62961))))

(declare-fun b!96101 () Bool)

(declare-fun e!62964 () Bool)

(assert (=> b!96101 (= e!62963 e!62964)))

(declare-fun res!79005 () Bool)

(assert (=> b!96101 (=> (not res!79005) (not e!62964))))

(assert (=> b!96101 (= res!79005 e!62962)))

(declare-fun res!79006 () Bool)

(assert (=> b!96101 (=> res!79006 e!62962)))

(assert (=> b!96101 (= res!79006 (bvsge (_1!4107 lt!139406) (_2!4107 lt!139406)))))

(assert (=> b!96101 (= lt!139408 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96101 (= lt!139407 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96101 (= lt!139406 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8))))))

(declare-fun b!96102 () Bool)

(assert (=> b!96102 (= e!62964 e!62960)))

(assert (=> b!96102 (= c!6036 (= (_3!248 lt!139406) (_4!27 lt!139406)))))

(assert (= (and d!29944 (not res!79008)) b!96101))

(assert (= (and b!96101 (not res!79006)) b!96097))

(assert (= (and b!96101 res!79005) b!96102))

(assert (= (and b!96102 c!6036) b!96099))

(assert (= (and b!96102 (not c!6036)) b!96100))

(assert (= (and b!96100 res!79009) b!96096))

(assert (= (and b!96096 (not res!79007)) b!96098))

(assert (= (or b!96099 b!96100) bm!1165))

(declare-fun m!139471 () Bool)

(assert (=> bm!1165 m!139471))

(declare-fun m!139473 () Bool)

(assert (=> bm!1165 m!139473))

(assert (=> bm!1165 m!139471))

(assert (=> bm!1165 m!139473))

(declare-fun m!139475 () Bool)

(assert (=> bm!1165 m!139475))

(declare-fun m!139477 () Bool)

(assert (=> b!96097 m!139477))

(declare-fun m!139479 () Bool)

(assert (=> b!96098 m!139479))

(declare-fun m!139481 () Bool)

(assert (=> b!96098 m!139481))

(assert (=> b!96098 m!139479))

(assert (=> b!96098 m!139481))

(declare-fun m!139483 () Bool)

(assert (=> b!96098 m!139483))

(assert (=> b!96101 m!139161))

(assert (=> b!96101 m!139469))

(assert (=> b!95949 d!29944))

(assert (=> b!95949 d!29844))

(declare-fun d!29946 () Bool)

(assert (=> d!29946 (= (invariant!0 (currentBit!4770 bitStream2!8) (currentByte!4775 bitStream2!8) (size!2045 (buf!2397 bitStream2!8))) (and (bvsge (currentBit!4770 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4770 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4775 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4775 bitStream2!8) (size!2045 (buf!2397 bitStream2!8))) (and (= (currentBit!4770 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4775 bitStream2!8) (size!2045 (buf!2397 bitStream2!8)))))))))

(assert (=> d!29772 d!29946))

(assert (=> b!95947 d!29844))

(assert (=> b!95947 d!29810))

(declare-fun b!96105 () Bool)

(declare-fun e!62966 () Bool)

(declare-fun lt!139410 () List!894)

(assert (=> b!96105 (= e!62966 (isEmpty!262 lt!139410))))

(declare-fun b!96103 () Bool)

(declare-fun e!62965 () tuple2!7702)

(assert (=> b!96103 (= e!62965 (tuple2!7703 Nil!891 (_2!4099 lt!139198)))))

(declare-fun b!96106 () Bool)

(assert (=> b!96106 (= e!62966 (> (length!485 lt!139410) 0))))

(declare-fun d!29948 () Bool)

(assert (=> d!29948 e!62966))

(declare-fun c!6038 () Bool)

(assert (=> d!29948 (= c!6038 (= (bvsub nBits!484 lt!139200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29948 (= lt!139410 (_1!4098 e!62965))))

(declare-fun c!6037 () Bool)

(assert (=> d!29948 (= c!6037 (= (bvsub nBits!484 lt!139200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29948 (bvsge (bvsub nBits!484 lt!139200) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29948 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4099 lt!139198) (bvsub nBits!484 lt!139200)) lt!139410)))

(declare-fun lt!139411 () (_ BitVec 64))

(declare-fun lt!139409 () tuple2!7704)

(declare-fun b!96104 () Bool)

(assert (=> b!96104 (= e!62965 (tuple2!7703 (Cons!890 (_1!4099 lt!139409) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4099 lt!139409) (bvsub (bvsub nBits!484 lt!139200) lt!139411))) (_2!4099 lt!139409)))))

(assert (=> b!96104 (= lt!139409 (readBit!0 (_2!4099 lt!139198)))))

(assert (=> b!96104 (= lt!139411 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!29948 c!6037) b!96103))

(assert (= (and d!29948 (not c!6037)) b!96104))

(assert (= (and d!29948 c!6038) b!96105))

(assert (= (and d!29948 (not c!6038)) b!96106))

(declare-fun m!139485 () Bool)

(assert (=> b!96105 m!139485))

(declare-fun m!139487 () Bool)

(assert (=> b!96106 m!139487))

(declare-fun m!139489 () Bool)

(assert (=> b!96104 m!139489))

(declare-fun m!139491 () Bool)

(assert (=> b!96104 m!139491))

(assert (=> b!95895 d!29948))

(declare-fun d!29950 () Bool)

(declare-fun e!62967 () Bool)

(assert (=> d!29950 e!62967))

(declare-fun res!79010 () Bool)

(assert (=> d!29950 (=> (not res!79010) (not e!62967))))

(assert (=> d!29950 (= res!79010 (= (buf!2397 (_2!4106 (increaseBitIndex!0 bitStream1!8))) (buf!2397 bitStream1!8)))))

(declare-fun lt!139412 () Bool)

(assert (=> d!29950 (= lt!139412 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139416 () tuple2!7704)

(assert (=> d!29950 (= lt!139416 (tuple2!7705 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream1!8)))) #b00000000000000000000000000000000)) (_2!4106 (increaseBitIndex!0 bitStream1!8))))))

(assert (=> d!29950 (validate_offset_bit!0 ((_ sign_extend 32) (size!2045 (buf!2397 bitStream1!8))) ((_ sign_extend 32) (currentByte!4775 bitStream1!8)) ((_ sign_extend 32) (currentBit!4770 bitStream1!8)))))

(assert (=> d!29950 (= (readBit!0 bitStream1!8) lt!139416)))

(declare-fun lt!139414 () (_ BitVec 64))

(declare-fun b!96107 () Bool)

(declare-fun lt!139418 () (_ BitVec 64))

(assert (=> b!96107 (= e!62967 (= (bitIndex!0 (size!2045 (buf!2397 (_2!4106 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4775 (_2!4106 (increaseBitIndex!0 bitStream1!8))) (currentBit!4770 (_2!4106 (increaseBitIndex!0 bitStream1!8)))) (bvadd lt!139418 lt!139414)))))

(assert (=> b!96107 (or (not (= (bvand lt!139418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139414 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139418 lt!139414) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96107 (= lt!139414 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96107 (= lt!139418 (bitIndex!0 (size!2045 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8) (currentBit!4770 bitStream1!8)))))

(declare-fun lt!139417 () Bool)

(assert (=> b!96107 (= lt!139417 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139415 () Bool)

(assert (=> b!96107 (= lt!139415 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139413 () Bool)

(assert (=> b!96107 (= lt!139413 (not (= (bvand ((_ sign_extend 24) (select (arr!2644 (buf!2397 bitStream1!8)) (currentByte!4775 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4770 bitStream1!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!29950 res!79010) b!96107))

(declare-fun m!139493 () Bool)

(assert (=> d!29950 m!139493))

(declare-fun m!139495 () Bool)

(assert (=> d!29950 m!139495))

(declare-fun m!139497 () Bool)

(assert (=> d!29950 m!139497))

(declare-fun m!139499 () Bool)

(assert (=> d!29950 m!139499))

(declare-fun m!139501 () Bool)

(assert (=> b!96107 m!139501))

(assert (=> b!96107 m!139493))

(assert (=> b!96107 m!139161))

(assert (=> b!96107 m!139497))

(assert (=> b!96107 m!139495))

(assert (=> b!95895 d!29950))

(declare-fun call!1169 () Bool)

(declare-fun bm!1166 () Bool)

(declare-fun c!6039 () Bool)

(declare-fun lt!139421 () (_ BitVec 32))

(declare-fun lt!139420 () (_ BitVec 32))

(declare-fun lt!139419 () tuple4!54)

(assert (=> bm!1166 (= call!1169 (byteRangesEq!0 (select (arr!2644 (buf!2397 bitStream2!8)) (_3!248 lt!139419)) (select (arr!2644 (buf!2397 base!8)) (_3!248 lt!139419)) lt!139420 (ite c!6039 lt!139421 #b00000000000000000000000000001000)))))

(declare-fun b!96108 () Bool)

(declare-fun res!79013 () Bool)

(assert (=> b!96108 (= res!79013 (= lt!139421 #b00000000000000000000000000000000))))

(declare-fun e!62968 () Bool)

(assert (=> b!96108 (=> res!79013 e!62968)))

(declare-fun e!62970 () Bool)

(assert (=> b!96108 (= e!62970 e!62968)))

(declare-fun b!96109 () Bool)

(declare-fun e!62971 () Bool)

(assert (=> b!96109 (= e!62971 (arrayRangesEq!28 (buf!2397 bitStream2!8) (buf!2397 base!8) (_1!4107 lt!139419) (_2!4107 lt!139419)))))

(declare-fun b!96110 () Bool)

(assert (=> b!96110 (= e!62968 (byteRangesEq!0 (select (arr!2644 (buf!2397 bitStream2!8)) (_4!27 lt!139419)) (select (arr!2644 (buf!2397 base!8)) (_4!27 lt!139419)) #b00000000000000000000000000000000 lt!139421))))

(declare-fun b!96111 () Bool)

(declare-fun e!62969 () Bool)

(assert (=> b!96111 (= e!62969 call!1169)))

(declare-fun d!29952 () Bool)

(declare-fun res!79014 () Bool)

(declare-fun e!62972 () Bool)

(assert (=> d!29952 (=> res!79014 e!62972)))

(assert (=> d!29952 (= res!79014 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8))))))

(assert (=> d!29952 (= (arrayBitRangesEq!0 (buf!2397 bitStream2!8) (buf!2397 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8))) e!62972)))

(declare-fun b!96112 () Bool)

(assert (=> b!96112 (= e!62969 e!62970)))

(declare-fun res!79015 () Bool)

(assert (=> b!96112 (= res!79015 call!1169)))

(assert (=> b!96112 (=> (not res!79015) (not e!62970))))

(declare-fun b!96113 () Bool)

(declare-fun e!62973 () Bool)

(assert (=> b!96113 (= e!62972 e!62973)))

(declare-fun res!79011 () Bool)

(assert (=> b!96113 (=> (not res!79011) (not e!62973))))

(assert (=> b!96113 (= res!79011 e!62971)))

(declare-fun res!79012 () Bool)

(assert (=> b!96113 (=> res!79012 e!62971)))

(assert (=> b!96113 (= res!79012 (bvsge (_1!4107 lt!139419) (_2!4107 lt!139419)))))

(assert (=> b!96113 (= lt!139421 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96113 (= lt!139420 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96113 (= lt!139419 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2045 (buf!2397 bitStream2!8)) (currentByte!4775 bitStream2!8) (currentBit!4770 bitStream2!8))))))

(declare-fun b!96114 () Bool)

(assert (=> b!96114 (= e!62973 e!62969)))

(assert (=> b!96114 (= c!6039 (= (_3!248 lt!139419) (_4!27 lt!139419)))))

(assert (= (and d!29952 (not res!79014)) b!96113))

(assert (= (and b!96113 (not res!79012)) b!96109))

(assert (= (and b!96113 res!79011) b!96114))

(assert (= (and b!96114 c!6039) b!96111))

(assert (= (and b!96114 (not c!6039)) b!96112))

(assert (= (and b!96112 res!79015) b!96108))

(assert (= (and b!96108 (not res!79013)) b!96110))

(assert (= (or b!96111 b!96112) bm!1166))

(declare-fun m!139503 () Bool)

(assert (=> bm!1166 m!139503))

(declare-fun m!139505 () Bool)

(assert (=> bm!1166 m!139505))

(assert (=> bm!1166 m!139503))

(assert (=> bm!1166 m!139505))

(declare-fun m!139507 () Bool)

(assert (=> bm!1166 m!139507))

(declare-fun m!139509 () Bool)

(assert (=> b!96109 m!139509))

(declare-fun m!139511 () Bool)

(assert (=> b!96110 m!139511))

(declare-fun m!139513 () Bool)

(assert (=> b!96110 m!139513))

(assert (=> b!96110 m!139511))

(assert (=> b!96110 m!139513))

(declare-fun m!139515 () Bool)

(assert (=> b!96110 m!139515))

(assert (=> b!96113 m!139163))

(declare-fun m!139517 () Bool)

(assert (=> b!96113 m!139517))

(assert (=> b!95946 d!29952))

(assert (=> b!95946 d!29846))

(declare-fun d!29954 () Bool)

(assert (=> d!29954 (= (remainingBits!0 ((_ sign_extend 32) (size!2045 (buf!2397 base!8))) ((_ sign_extend 32) (currentByte!4775 base!8)) ((_ sign_extend 32) (currentBit!4770 base!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2045 (buf!2397 base!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4775 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4770 base!8)))))))

(assert (=> d!29810 d!29954))

(assert (=> d!29810 d!29934))

(declare-fun d!29956 () Bool)

(assert (=> d!29956 (= (invariant!0 (currentBit!4770 thiss!1534) (currentByte!4775 thiss!1534) (size!2045 (buf!2397 thiss!1534))) (and (bvsge (currentBit!4770 thiss!1534) #b00000000000000000000000000000000) (bvslt (currentBit!4770 thiss!1534) #b00000000000000000000000000001000) (bvsge (currentByte!4775 thiss!1534) #b00000000000000000000000000000000) (or (bvslt (currentByte!4775 thiss!1534) (size!2045 (buf!2397 thiss!1534))) (and (= (currentBit!4770 thiss!1534) #b00000000000000000000000000000000) (= (currentByte!4775 thiss!1534) (size!2045 (buf!2397 thiss!1534)))))))))

(assert (=> d!29776 d!29956))

(assert (=> b!95917 d!29844))

(assert (=> b!95917 d!29846))

(assert (=> d!29768 d!29928))

(assert (=> d!29846 d!29932))

(assert (=> d!29846 d!29946))

(check-sat (not b!96090) (not b!96074) (not d!29950) (not bm!1164) (not b!96107) (not b!96091) (not d!29920) (not b!96063) (not b!96097) (not b!96064) (not b!96094) (not d!29924) (not b!96113) (not b!96104) (not b!96105) (not b!96068) (not b!96106) (not b!96101) (not b!96065) (not bm!1165) (not bm!1166) (not d!29936) (not b!96109) (not b!96098) (not b!96110))
(check-sat)
