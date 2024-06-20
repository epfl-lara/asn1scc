; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8740 () Bool)

(assert start!8740)

(declare-fun b!43495 () Bool)

(declare-fun e!29044 () Bool)

(declare-datatypes ((array!2217 0))(
  ( (array!2218 (arr!1506 (Array (_ BitVec 32) (_ BitVec 8))) (size!1001 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1746 0))(
  ( (BitStream!1747 (buf!1338 array!2217) (currentByte!2807 (_ BitVec 32)) (currentBit!2802 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1746)

(declare-fun array_inv!926 (array!2217) Bool)

(assert (=> b!43495 (= e!29044 (array_inv!926 (buf!1338 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2217)

(declare-fun b!43496 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!4266 0))(
  ( (tuple2!4267 (_1!2226 BitStream!1746) (_2!2226 BitStream!1746)) )
))
(declare-fun lt!65899 () tuple2!4266)

(declare-fun e!29045 () Bool)

(declare-datatypes ((Unit!3096 0))(
  ( (Unit!3097) )
))
(declare-datatypes ((tuple2!4268 0))(
  ( (tuple2!4269 (_1!2227 Unit!3096) (_2!2227 BitStream!1746)) )
))
(declare-fun lt!65900 () tuple2!4268)

(declare-datatypes ((List!514 0))(
  ( (Nil!511) (Cons!510 (h!629 Bool) (t!1264 List!514)) )
))
(declare-fun head!333 (List!514) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1746 array!2217 (_ BitVec 64) (_ BitVec 64)) List!514)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1746 BitStream!1746 (_ BitVec 64)) List!514)

(assert (=> b!43496 (= e!29045 (= (head!333 (byteArrayBitContentToList!0 (_2!2227 lt!65900) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!333 (bitStreamReadBitsIntoList!0 (_2!2227 lt!65900) (_1!2226 lt!65899) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43497 () Bool)

(declare-fun e!29041 () Bool)

(declare-fun e!29043 () Bool)

(assert (=> b!43497 (= e!29041 (not e!29043))))

(declare-fun res!36915 () Bool)

(assert (=> b!43497 (=> res!36915 e!29043)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!43497 (= res!36915 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1746 BitStream!1746) Bool)

(assert (=> b!43497 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!65896 () Unit!3096)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1746) Unit!3096)

(assert (=> b!43497 (= lt!65896 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!65895 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43497 (= lt!65895 (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)))))

(declare-fun b!43498 () Bool)

(declare-fun res!36918 () Bool)

(declare-fun e!29042 () Bool)

(assert (=> b!43498 (=> res!36918 e!29042)))

(declare-fun lt!65901 () tuple2!4268)

(assert (=> b!43498 (= res!36918 (not (= (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65901))) (currentByte!2807 (_2!2227 lt!65901)) (currentBit!2802 (_2!2227 lt!65901))) (bvsub (bvadd lt!65895 to!314) i!635))))))

(declare-fun b!43499 () Bool)

(declare-fun e!29039 () Bool)

(assert (=> b!43499 (= e!29039 e!29042)))

(declare-fun res!36914 () Bool)

(assert (=> b!43499 (=> res!36914 e!29042)))

(assert (=> b!43499 (= res!36914 (not (isPrefixOf!0 (_2!2227 lt!65900) (_2!2227 lt!65901))))))

(assert (=> b!43499 (isPrefixOf!0 thiss!1379 (_2!2227 lt!65901))))

(declare-fun lt!65897 () Unit!3096)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1746 BitStream!1746 BitStream!1746) Unit!3096)

(assert (=> b!43499 (= lt!65897 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2227 lt!65900) (_2!2227 lt!65901)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1746 array!2217 (_ BitVec 64) (_ BitVec 64)) tuple2!4268)

(assert (=> b!43499 (= lt!65901 (appendBitsMSBFirstLoop!0 (_2!2227 lt!65900) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!43499 e!29045))

(declare-fun res!36916 () Bool)

(assert (=> b!43499 (=> (not res!36916) (not e!29045))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43499 (= res!36916 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65902 () Unit!3096)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1746 array!2217 (_ BitVec 64)) Unit!3096)

(assert (=> b!43499 (= lt!65902 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1338 (_2!2227 lt!65900)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1746 BitStream!1746) tuple2!4266)

(assert (=> b!43499 (= lt!65899 (reader!0 thiss!1379 (_2!2227 lt!65900)))))

(declare-fun b!43494 () Bool)

(assert (=> b!43494 (= e!29043 e!29039)))

(declare-fun res!36912 () Bool)

(assert (=> b!43494 (=> res!36912 e!29039)))

(assert (=> b!43494 (= res!36912 (not (isPrefixOf!0 thiss!1379 (_2!2227 lt!65900))))))

(assert (=> b!43494 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65898 () Unit!3096)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1746 BitStream!1746 (_ BitVec 64) (_ BitVec 64)) Unit!3096)

(assert (=> b!43494 (= lt!65898 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2227 lt!65900) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1746 (_ BitVec 8) (_ BitVec 32)) tuple2!4268)

(assert (=> b!43494 (= lt!65900 (appendBitFromByte!0 thiss!1379 (select (arr!1506 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!36917 () Bool)

(assert (=> start!8740 (=> (not res!36917) (not e!29041))))

(assert (=> start!8740 (= res!36917 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1001 srcBuffer!2))))))))

(assert (=> start!8740 e!29041))

(assert (=> start!8740 true))

(assert (=> start!8740 (array_inv!926 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1746) Bool)

(assert (=> start!8740 (and (inv!12 thiss!1379) e!29044)))

(declare-fun b!43500 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43500 (= e!29042 (invariant!0 (currentBit!2802 (_2!2227 lt!65901)) (currentByte!2807 (_2!2227 lt!65901)) (size!1001 (buf!1338 (_2!2227 lt!65901)))))))

(declare-fun b!43501 () Bool)

(declare-fun res!36913 () Bool)

(assert (=> b!43501 (=> (not res!36913) (not e!29041))))

(assert (=> b!43501 (= res!36913 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 thiss!1379))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8740 res!36917) b!43501))

(assert (= (and b!43501 res!36913) b!43497))

(assert (= (and b!43497 (not res!36915)) b!43494))

(assert (= (and b!43494 (not res!36912)) b!43499))

(assert (= (and b!43499 res!36916) b!43496))

(assert (= (and b!43499 (not res!36914)) b!43498))

(assert (= (and b!43498 (not res!36918)) b!43500))

(assert (= start!8740 b!43495))

(declare-fun m!66189 () Bool)

(assert (=> b!43496 m!66189))

(assert (=> b!43496 m!66189))

(declare-fun m!66191 () Bool)

(assert (=> b!43496 m!66191))

(declare-fun m!66193 () Bool)

(assert (=> b!43496 m!66193))

(assert (=> b!43496 m!66193))

(declare-fun m!66195 () Bool)

(assert (=> b!43496 m!66195))

(declare-fun m!66197 () Bool)

(assert (=> start!8740 m!66197))

(declare-fun m!66199 () Bool)

(assert (=> start!8740 m!66199))

(declare-fun m!66201 () Bool)

(assert (=> b!43499 m!66201))

(declare-fun m!66203 () Bool)

(assert (=> b!43499 m!66203))

(declare-fun m!66205 () Bool)

(assert (=> b!43499 m!66205))

(declare-fun m!66207 () Bool)

(assert (=> b!43499 m!66207))

(declare-fun m!66209 () Bool)

(assert (=> b!43499 m!66209))

(declare-fun m!66211 () Bool)

(assert (=> b!43499 m!66211))

(declare-fun m!66213 () Bool)

(assert (=> b!43499 m!66213))

(declare-fun m!66215 () Bool)

(assert (=> b!43497 m!66215))

(declare-fun m!66217 () Bool)

(assert (=> b!43497 m!66217))

(declare-fun m!66219 () Bool)

(assert (=> b!43497 m!66219))

(declare-fun m!66221 () Bool)

(assert (=> b!43501 m!66221))

(declare-fun m!66223 () Bool)

(assert (=> b!43495 m!66223))

(declare-fun m!66225 () Bool)

(assert (=> b!43498 m!66225))

(declare-fun m!66227 () Bool)

(assert (=> b!43494 m!66227))

(declare-fun m!66229 () Bool)

(assert (=> b!43494 m!66229))

(declare-fun m!66231 () Bool)

(assert (=> b!43494 m!66231))

(declare-fun m!66233 () Bool)

(assert (=> b!43494 m!66233))

(assert (=> b!43494 m!66227))

(declare-fun m!66235 () Bool)

(assert (=> b!43494 m!66235))

(declare-fun m!66237 () Bool)

(assert (=> b!43500 m!66237))

(check-sat (not b!43499) (not b!43500) (not b!43494) (not b!43501) (not b!43497) (not b!43495) (not b!43498) (not b!43496) (not start!8740))
(check-sat)
(get-model)

(declare-fun d!12604 () Bool)

(assert (=> d!12604 (= (head!333 (byteArrayBitContentToList!0 (_2!2227 lt!65900) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!629 (byteArrayBitContentToList!0 (_2!2227 lt!65900) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43496 d!12604))

(declare-fun d!12606 () Bool)

(declare-fun c!2871 () Bool)

(assert (=> d!12606 (= c!2871 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29072 () List!514)

(assert (=> d!12606 (= (byteArrayBitContentToList!0 (_2!2227 lt!65900) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29072)))

(declare-fun b!43530 () Bool)

(assert (=> b!43530 (= e!29072 Nil!511)))

(declare-fun b!43531 () Bool)

(assert (=> b!43531 (= e!29072 (Cons!510 (not (= (bvand ((_ sign_extend 24) (select (arr!1506 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2227 lt!65900) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12606 c!2871) b!43530))

(assert (= (and d!12606 (not c!2871)) b!43531))

(assert (=> b!43531 m!66227))

(declare-fun m!66289 () Bool)

(assert (=> b!43531 m!66289))

(declare-fun m!66291 () Bool)

(assert (=> b!43531 m!66291))

(assert (=> b!43496 d!12606))

(declare-fun d!12608 () Bool)

(assert (=> d!12608 (= (head!333 (bitStreamReadBitsIntoList!0 (_2!2227 lt!65900) (_1!2226 lt!65899) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!629 (bitStreamReadBitsIntoList!0 (_2!2227 lt!65900) (_1!2226 lt!65899) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43496 d!12608))

(declare-fun b!43542 () Bool)

(declare-fun e!29078 () Bool)

(declare-fun lt!65933 () List!514)

(declare-fun isEmpty!119 (List!514) Bool)

(assert (=> b!43542 (= e!29078 (isEmpty!119 lt!65933))))

(declare-fun b!43540 () Bool)

(declare-datatypes ((tuple2!4274 0))(
  ( (tuple2!4275 (_1!2230 List!514) (_2!2230 BitStream!1746)) )
))
(declare-fun e!29077 () tuple2!4274)

(assert (=> b!43540 (= e!29077 (tuple2!4275 Nil!511 (_1!2226 lt!65899)))))

(declare-datatypes ((tuple2!4276 0))(
  ( (tuple2!4277 (_1!2231 Bool) (_2!2231 BitStream!1746)) )
))
(declare-fun lt!65935 () tuple2!4276)

(declare-fun b!43541 () Bool)

(declare-fun lt!65934 () (_ BitVec 64))

(assert (=> b!43541 (= e!29077 (tuple2!4275 (Cons!510 (_1!2231 lt!65935) (bitStreamReadBitsIntoList!0 (_2!2227 lt!65900) (_2!2231 lt!65935) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!65934))) (_2!2231 lt!65935)))))

(declare-fun readBit!0 (BitStream!1746) tuple2!4276)

(assert (=> b!43541 (= lt!65935 (readBit!0 (_1!2226 lt!65899)))))

(assert (=> b!43541 (= lt!65934 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!43543 () Bool)

(declare-fun length!217 (List!514) Int)

(assert (=> b!43543 (= e!29078 (> (length!217 lt!65933) 0))))

(declare-fun d!12610 () Bool)

(assert (=> d!12610 e!29078))

(declare-fun c!2876 () Bool)

(assert (=> d!12610 (= c!2876 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12610 (= lt!65933 (_1!2230 e!29077))))

(declare-fun c!2877 () Bool)

(assert (=> d!12610 (= c!2877 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12610 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12610 (= (bitStreamReadBitsIntoList!0 (_2!2227 lt!65900) (_1!2226 lt!65899) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65933)))

(assert (= (and d!12610 c!2877) b!43540))

(assert (= (and d!12610 (not c!2877)) b!43541))

(assert (= (and d!12610 c!2876) b!43542))

(assert (= (and d!12610 (not c!2876)) b!43543))

(declare-fun m!66293 () Bool)

(assert (=> b!43542 m!66293))

(declare-fun m!66295 () Bool)

(assert (=> b!43541 m!66295))

(declare-fun m!66297 () Bool)

(assert (=> b!43541 m!66297))

(declare-fun m!66299 () Bool)

(assert (=> b!43543 m!66299))

(assert (=> b!43496 d!12610))

(declare-fun d!12612 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12612 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 thiss!1379))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1001 (buf!1338 thiss!1379))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3388 () Bool)

(assert (= bs!3388 d!12612))

(declare-fun m!66301 () Bool)

(assert (=> bs!3388 m!66301))

(assert (=> b!43501 d!12612))

(declare-fun d!12614 () Bool)

(assert (=> d!12614 (= (invariant!0 (currentBit!2802 (_2!2227 lt!65901)) (currentByte!2807 (_2!2227 lt!65901)) (size!1001 (buf!1338 (_2!2227 lt!65901)))) (and (bvsge (currentBit!2802 (_2!2227 lt!65901)) #b00000000000000000000000000000000) (bvslt (currentBit!2802 (_2!2227 lt!65901)) #b00000000000000000000000000001000) (bvsge (currentByte!2807 (_2!2227 lt!65901)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2807 (_2!2227 lt!65901)) (size!1001 (buf!1338 (_2!2227 lt!65901)))) (and (= (currentBit!2802 (_2!2227 lt!65901)) #b00000000000000000000000000000000) (= (currentByte!2807 (_2!2227 lt!65901)) (size!1001 (buf!1338 (_2!2227 lt!65901))))))))))

(assert (=> b!43500 d!12614))

(declare-fun d!12616 () Bool)

(assert (=> d!12616 (= (array_inv!926 (buf!1338 thiss!1379)) (bvsge (size!1001 (buf!1338 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43495 d!12616))

(declare-fun d!12618 () Bool)

(assert (=> d!12618 (= (array_inv!926 srcBuffer!2) (bvsge (size!1001 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8740 d!12618))

(declare-fun d!12620 () Bool)

(assert (=> d!12620 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2802 thiss!1379) (currentByte!2807 thiss!1379) (size!1001 (buf!1338 thiss!1379))))))

(declare-fun bs!3389 () Bool)

(assert (= bs!3389 d!12620))

(declare-fun m!66303 () Bool)

(assert (=> bs!3389 m!66303))

(assert (=> start!8740 d!12620))

(declare-fun d!12622 () Bool)

(declare-fun res!36947 () Bool)

(declare-fun e!29084 () Bool)

(assert (=> d!12622 (=> (not res!36947) (not e!29084))))

(assert (=> d!12622 (= res!36947 (= (size!1001 (buf!1338 thiss!1379)) (size!1001 (buf!1338 (_2!2227 lt!65900)))))))

(assert (=> d!12622 (= (isPrefixOf!0 thiss!1379 (_2!2227 lt!65900)) e!29084)))

(declare-fun b!43550 () Bool)

(declare-fun res!36948 () Bool)

(assert (=> b!43550 (=> (not res!36948) (not e!29084))))

(assert (=> b!43550 (= res!36948 (bvsle (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)) (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65900))) (currentByte!2807 (_2!2227 lt!65900)) (currentBit!2802 (_2!2227 lt!65900)))))))

(declare-fun b!43551 () Bool)

(declare-fun e!29083 () Bool)

(assert (=> b!43551 (= e!29084 e!29083)))

(declare-fun res!36946 () Bool)

(assert (=> b!43551 (=> res!36946 e!29083)))

(assert (=> b!43551 (= res!36946 (= (size!1001 (buf!1338 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43552 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2217 array!2217 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43552 (= e!29083 (arrayBitRangesEq!0 (buf!1338 thiss!1379) (buf!1338 (_2!2227 lt!65900)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379))))))

(assert (= (and d!12622 res!36947) b!43550))

(assert (= (and b!43550 res!36948) b!43551))

(assert (= (and b!43551 (not res!36946)) b!43552))

(assert (=> b!43550 m!66219))

(declare-fun m!66305 () Bool)

(assert (=> b!43550 m!66305))

(assert (=> b!43552 m!66219))

(assert (=> b!43552 m!66219))

(declare-fun m!66307 () Bool)

(assert (=> b!43552 m!66307))

(assert (=> b!43494 d!12622))

(declare-fun d!12624 () Bool)

(assert (=> d!12624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3390 () Bool)

(assert (= bs!3390 d!12624))

(declare-fun m!66309 () Bool)

(assert (=> bs!3390 m!66309))

(assert (=> b!43494 d!12624))

(declare-fun d!12626 () Bool)

(declare-fun e!29087 () Bool)

(assert (=> d!12626 e!29087))

(declare-fun res!36951 () Bool)

(assert (=> d!12626 (=> (not res!36951) (not e!29087))))

(assert (=> d!12626 (= res!36951 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!65938 () Unit!3096)

(declare-fun choose!27 (BitStream!1746 BitStream!1746 (_ BitVec 64) (_ BitVec 64)) Unit!3096)

(assert (=> d!12626 (= lt!65938 (choose!27 thiss!1379 (_2!2227 lt!65900) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12626 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12626 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2227 lt!65900) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65938)))

(declare-fun b!43555 () Bool)

(assert (=> b!43555 (= e!29087 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12626 res!36951) b!43555))

(declare-fun m!66311 () Bool)

(assert (=> d!12626 m!66311))

(assert (=> b!43555 m!66233))

(assert (=> b!43494 d!12626))

(declare-fun d!12628 () Bool)

(declare-fun e!29128 () Bool)

(assert (=> d!12628 e!29128))

(declare-fun res!37001 () Bool)

(assert (=> d!12628 (=> (not res!37001) (not e!29128))))

(declare-fun lt!66056 () tuple2!4268)

(assert (=> d!12628 (= res!37001 (= (size!1001 (buf!1338 (_2!2227 lt!66056))) (size!1001 (buf!1338 thiss!1379))))))

(declare-fun lt!66053 () (_ BitVec 8))

(declare-fun lt!66058 () array!2217)

(assert (=> d!12628 (= lt!66053 (select (arr!1506 lt!66058) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12628 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1001 lt!66058)))))

(assert (=> d!12628 (= lt!66058 (array!2218 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!66055 () tuple2!4268)

(assert (=> d!12628 (= lt!66056 (tuple2!4269 (_1!2227 lt!66055) (_2!2227 lt!66055)))))

(declare-fun lt!66051 () tuple2!4268)

(assert (=> d!12628 (= lt!66055 lt!66051)))

(declare-fun e!29126 () Bool)

(assert (=> d!12628 e!29126))

(declare-fun res!37008 () Bool)

(assert (=> d!12628 (=> (not res!37008) (not e!29126))))

(assert (=> d!12628 (= res!37008 (= (size!1001 (buf!1338 thiss!1379)) (size!1001 (buf!1338 (_2!2227 lt!66051)))))))

(declare-fun lt!66054 () Bool)

(declare-fun appendBit!0 (BitStream!1746 Bool) tuple2!4268)

(assert (=> d!12628 (= lt!66051 (appendBit!0 thiss!1379 lt!66054))))

(assert (=> d!12628 (= lt!66054 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1506 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12628 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12628 (= (appendBitFromByte!0 thiss!1379 (select (arr!1506 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!66056)))

(declare-fun b!43630 () Bool)

(declare-fun e!29129 () Bool)

(declare-datatypes ((tuple2!4278 0))(
  ( (tuple2!4279 (_1!2232 BitStream!1746) (_2!2232 Bool)) )
))
(declare-fun lt!66050 () tuple2!4278)

(assert (=> b!43630 (= e!29129 (= (bitIndex!0 (size!1001 (buf!1338 (_1!2232 lt!66050))) (currentByte!2807 (_1!2232 lt!66050)) (currentBit!2802 (_1!2232 lt!66050))) (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66056))) (currentByte!2807 (_2!2227 lt!66056)) (currentBit!2802 (_2!2227 lt!66056)))))))

(declare-fun b!43631 () Bool)

(assert (=> b!43631 (= e!29128 e!29129)))

(declare-fun res!37006 () Bool)

(assert (=> b!43631 (=> (not res!37006) (not e!29129))))

(assert (=> b!43631 (= res!37006 (and (= (_2!2232 lt!66050) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1506 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!66053)) #b00000000000000000000000000000000))) (= (_1!2232 lt!66050) (_2!2227 lt!66056))))))

(declare-datatypes ((tuple2!4280 0))(
  ( (tuple2!4281 (_1!2233 array!2217) (_2!2233 BitStream!1746)) )
))
(declare-fun lt!66061 () tuple2!4280)

(declare-fun lt!66059 () BitStream!1746)

(declare-fun readBits!0 (BitStream!1746 (_ BitVec 64)) tuple2!4280)

(assert (=> b!43631 (= lt!66061 (readBits!0 lt!66059 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1746) tuple2!4278)

(assert (=> b!43631 (= lt!66050 (readBitPure!0 lt!66059))))

(declare-fun readerFrom!0 (BitStream!1746 (_ BitVec 32) (_ BitVec 32)) BitStream!1746)

(assert (=> b!43631 (= lt!66059 (readerFrom!0 (_2!2227 lt!66056) (currentBit!2802 thiss!1379) (currentByte!2807 thiss!1379)))))

(declare-fun b!43632 () Bool)

(declare-fun e!29127 () Bool)

(declare-fun lt!66052 () tuple2!4278)

(assert (=> b!43632 (= e!29127 (= (bitIndex!0 (size!1001 (buf!1338 (_1!2232 lt!66052))) (currentByte!2807 (_1!2232 lt!66052)) (currentBit!2802 (_1!2232 lt!66052))) (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66051))) (currentByte!2807 (_2!2227 lt!66051)) (currentBit!2802 (_2!2227 lt!66051)))))))

(declare-fun b!43633 () Bool)

(declare-fun res!37004 () Bool)

(assert (=> b!43633 (=> (not res!37004) (not e!29126))))

(assert (=> b!43633 (= res!37004 (= (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66051))) (currentByte!2807 (_2!2227 lt!66051)) (currentBit!2802 (_2!2227 lt!66051))) (bvadd (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!43634 () Bool)

(assert (=> b!43634 (= e!29126 e!29127)))

(declare-fun res!37007 () Bool)

(assert (=> b!43634 (=> (not res!37007) (not e!29127))))

(assert (=> b!43634 (= res!37007 (and (= (_2!2232 lt!66052) lt!66054) (= (_1!2232 lt!66052) (_2!2227 lt!66051))))))

(assert (=> b!43634 (= lt!66052 (readBitPure!0 (readerFrom!0 (_2!2227 lt!66051) (currentBit!2802 thiss!1379) (currentByte!2807 thiss!1379))))))

(declare-fun b!43635 () Bool)

(declare-fun res!37003 () Bool)

(assert (=> b!43635 (=> (not res!37003) (not e!29128))))

(assert (=> b!43635 (= res!37003 (isPrefixOf!0 thiss!1379 (_2!2227 lt!66056)))))

(declare-fun b!43636 () Bool)

(declare-fun res!37005 () Bool)

(assert (=> b!43636 (=> (not res!37005) (not e!29128))))

(declare-fun lt!66057 () (_ BitVec 64))

(declare-fun lt!66060 () (_ BitVec 64))

(assert (=> b!43636 (= res!37005 (= (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66056))) (currentByte!2807 (_2!2227 lt!66056)) (currentBit!2802 (_2!2227 lt!66056))) (bvadd lt!66060 lt!66057)))))

(assert (=> b!43636 (or (not (= (bvand lt!66060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66057 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!66060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!66060 lt!66057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43636 (= lt!66057 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!43636 (= lt!66060 (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)))))

(declare-fun b!43637 () Bool)

(declare-fun res!37002 () Bool)

(assert (=> b!43637 (=> (not res!37002) (not e!29126))))

(assert (=> b!43637 (= res!37002 (isPrefixOf!0 thiss!1379 (_2!2227 lt!66051)))))

(assert (= (and d!12628 res!37008) b!43633))

(assert (= (and b!43633 res!37004) b!43637))

(assert (= (and b!43637 res!37002) b!43634))

(assert (= (and b!43634 res!37007) b!43632))

(assert (= (and d!12628 res!37001) b!43636))

(assert (= (and b!43636 res!37005) b!43635))

(assert (= (and b!43635 res!37003) b!43631))

(assert (= (and b!43631 res!37006) b!43630))

(declare-fun m!66363 () Bool)

(assert (=> b!43630 m!66363))

(declare-fun m!66365 () Bool)

(assert (=> b!43630 m!66365))

(declare-fun m!66367 () Bool)

(assert (=> d!12628 m!66367))

(declare-fun m!66369 () Bool)

(assert (=> d!12628 m!66369))

(assert (=> d!12628 m!66289))

(assert (=> b!43636 m!66365))

(assert (=> b!43636 m!66219))

(declare-fun m!66371 () Bool)

(assert (=> b!43637 m!66371))

(declare-fun m!66373 () Bool)

(assert (=> b!43634 m!66373))

(assert (=> b!43634 m!66373))

(declare-fun m!66375 () Bool)

(assert (=> b!43634 m!66375))

(declare-fun m!66377 () Bool)

(assert (=> b!43635 m!66377))

(declare-fun m!66379 () Bool)

(assert (=> b!43633 m!66379))

(assert (=> b!43633 m!66219))

(declare-fun m!66383 () Bool)

(assert (=> b!43631 m!66383))

(declare-fun m!66385 () Bool)

(assert (=> b!43631 m!66385))

(declare-fun m!66387 () Bool)

(assert (=> b!43631 m!66387))

(declare-fun m!66389 () Bool)

(assert (=> b!43632 m!66389))

(assert (=> b!43632 m!66379))

(assert (=> b!43494 d!12628))

(declare-fun d!12656 () Bool)

(assert (=> d!12656 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66067 () Unit!3096)

(declare-fun choose!9 (BitStream!1746 array!2217 (_ BitVec 64) BitStream!1746) Unit!3096)

(assert (=> d!12656 (= lt!66067 (choose!9 thiss!1379 (buf!1338 (_2!2227 lt!65900)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1747 (buf!1338 (_2!2227 lt!65900)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379))))))

(assert (=> d!12656 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1338 (_2!2227 lt!65900)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66067)))

(declare-fun bs!3392 () Bool)

(assert (= bs!3392 d!12656))

(assert (=> bs!3392 m!66203))

(declare-fun m!66391 () Bool)

(assert (=> bs!3392 m!66391))

(assert (=> b!43499 d!12656))

(declare-fun d!12658 () Bool)

(declare-fun res!37013 () Bool)

(declare-fun e!29134 () Bool)

(assert (=> d!12658 (=> (not res!37013) (not e!29134))))

(assert (=> d!12658 (= res!37013 (= (size!1001 (buf!1338 thiss!1379)) (size!1001 (buf!1338 (_2!2227 lt!65901)))))))

(assert (=> d!12658 (= (isPrefixOf!0 thiss!1379 (_2!2227 lt!65901)) e!29134)))

(declare-fun b!43641 () Bool)

(declare-fun res!37014 () Bool)

(assert (=> b!43641 (=> (not res!37014) (not e!29134))))

(assert (=> b!43641 (= res!37014 (bvsle (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)) (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65901))) (currentByte!2807 (_2!2227 lt!65901)) (currentBit!2802 (_2!2227 lt!65901)))))))

(declare-fun b!43642 () Bool)

(declare-fun e!29133 () Bool)

(assert (=> b!43642 (= e!29134 e!29133)))

(declare-fun res!37012 () Bool)

(assert (=> b!43642 (=> res!37012 e!29133)))

(assert (=> b!43642 (= res!37012 (= (size!1001 (buf!1338 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43643 () Bool)

(assert (=> b!43643 (= e!29133 (arrayBitRangesEq!0 (buf!1338 thiss!1379) (buf!1338 (_2!2227 lt!65901)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379))))))

(assert (= (and d!12658 res!37013) b!43641))

(assert (= (and b!43641 res!37014) b!43642))

(assert (= (and b!43642 (not res!37012)) b!43643))

(assert (=> b!43641 m!66219))

(assert (=> b!43641 m!66225))

(assert (=> b!43643 m!66219))

(assert (=> b!43643 m!66219))

(declare-fun m!66393 () Bool)

(assert (=> b!43643 m!66393))

(assert (=> b!43499 d!12658))

(declare-fun d!12660 () Bool)

(declare-fun res!37016 () Bool)

(declare-fun e!29136 () Bool)

(assert (=> d!12660 (=> (not res!37016) (not e!29136))))

(assert (=> d!12660 (= res!37016 (= (size!1001 (buf!1338 (_2!2227 lt!65900))) (size!1001 (buf!1338 (_2!2227 lt!65901)))))))

(assert (=> d!12660 (= (isPrefixOf!0 (_2!2227 lt!65900) (_2!2227 lt!65901)) e!29136)))

(declare-fun b!43644 () Bool)

(declare-fun res!37017 () Bool)

(assert (=> b!43644 (=> (not res!37017) (not e!29136))))

(assert (=> b!43644 (= res!37017 (bvsle (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65900))) (currentByte!2807 (_2!2227 lt!65900)) (currentBit!2802 (_2!2227 lt!65900))) (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65901))) (currentByte!2807 (_2!2227 lt!65901)) (currentBit!2802 (_2!2227 lt!65901)))))))

(declare-fun b!43645 () Bool)

(declare-fun e!29135 () Bool)

(assert (=> b!43645 (= e!29136 e!29135)))

(declare-fun res!37015 () Bool)

(assert (=> b!43645 (=> res!37015 e!29135)))

(assert (=> b!43645 (= res!37015 (= (size!1001 (buf!1338 (_2!2227 lt!65900))) #b00000000000000000000000000000000))))

(declare-fun b!43646 () Bool)

(assert (=> b!43646 (= e!29135 (arrayBitRangesEq!0 (buf!1338 (_2!2227 lt!65900)) (buf!1338 (_2!2227 lt!65901)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65900))) (currentByte!2807 (_2!2227 lt!65900)) (currentBit!2802 (_2!2227 lt!65900)))))))

(assert (= (and d!12660 res!37016) b!43644))

(assert (= (and b!43644 res!37017) b!43645))

(assert (= (and b!43645 (not res!37015)) b!43646))

(assert (=> b!43644 m!66305))

(assert (=> b!43644 m!66225))

(assert (=> b!43646 m!66305))

(assert (=> b!43646 m!66305))

(declare-fun m!66395 () Bool)

(assert (=> b!43646 m!66395))

(assert (=> b!43499 d!12660))

(declare-fun b!43730 () Bool)

(declare-fun res!37089 () Bool)

(declare-fun e!29172 () Bool)

(assert (=> b!43730 (=> (not res!37089) (not e!29172))))

(declare-fun lt!66415 () tuple2!4268)

(assert (=> b!43730 (= res!37089 (= (size!1001 (buf!1338 (_2!2227 lt!66415))) (size!1001 (buf!1338 (_2!2227 lt!65900)))))))

(declare-fun lt!66396 () tuple2!4266)

(declare-fun b!43731 () Bool)

(assert (=> b!43731 (= e!29172 (= (bitStreamReadBitsIntoList!0 (_2!2227 lt!66415) (_1!2226 lt!66396) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2227 lt!66415) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!43731 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43731 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!66434 () Unit!3096)

(declare-fun lt!66425 () Unit!3096)

(assert (=> b!43731 (= lt!66434 lt!66425)))

(declare-fun lt!66426 () (_ BitVec 64))

(assert (=> b!43731 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!66415)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900))) lt!66426)))

(assert (=> b!43731 (= lt!66425 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2227 lt!65900) (buf!1338 (_2!2227 lt!66415)) lt!66426))))

(declare-fun e!29173 () Bool)

(assert (=> b!43731 e!29173))

(declare-fun res!37088 () Bool)

(assert (=> b!43731 (=> (not res!37088) (not e!29173))))

(assert (=> b!43731 (= res!37088 (and (= (size!1001 (buf!1338 (_2!2227 lt!65900))) (size!1001 (buf!1338 (_2!2227 lt!66415)))) (bvsge lt!66426 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43731 (= lt!66426 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!43731 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43731 (= lt!66396 (reader!0 (_2!2227 lt!65900) (_2!2227 lt!66415)))))

(declare-fun b!43732 () Bool)

(declare-fun res!37087 () Bool)

(assert (=> b!43732 (=> (not res!37087) (not e!29172))))

(assert (=> b!43732 (= res!37087 (= (size!1001 (buf!1338 (_2!2227 lt!65900))) (size!1001 (buf!1338 (_2!2227 lt!66415)))))))

(declare-fun b!43733 () Bool)

(declare-fun res!37086 () Bool)

(assert (=> b!43733 (=> (not res!37086) (not e!29172))))

(assert (=> b!43733 (= res!37086 (isPrefixOf!0 (_2!2227 lt!65900) (_2!2227 lt!66415)))))

(declare-fun d!12662 () Bool)

(assert (=> d!12662 e!29172))

(declare-fun res!37085 () Bool)

(assert (=> d!12662 (=> (not res!37085) (not e!29172))))

(declare-fun lt!66406 () (_ BitVec 64))

(assert (=> d!12662 (= res!37085 (= (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66415))) (currentByte!2807 (_2!2227 lt!66415)) (currentBit!2802 (_2!2227 lt!66415))) (bvsub lt!66406 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12662 (or (= (bvand lt!66406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66406 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!66412 () (_ BitVec 64))

(assert (=> d!12662 (= lt!66406 (bvadd lt!66412 to!314))))

(assert (=> d!12662 (or (not (= (bvand lt!66412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!66412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!66412 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12662 (= lt!66412 (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65900))) (currentByte!2807 (_2!2227 lt!65900)) (currentBit!2802 (_2!2227 lt!65900))))))

(declare-fun e!29174 () tuple2!4268)

(assert (=> d!12662 (= lt!66415 e!29174)))

(declare-fun c!2898 () Bool)

(assert (=> d!12662 (= c!2898 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!66393 () Unit!3096)

(declare-fun lt!66401 () Unit!3096)

(assert (=> d!12662 (= lt!66393 lt!66401)))

(assert (=> d!12662 (isPrefixOf!0 (_2!2227 lt!65900) (_2!2227 lt!65900))))

(assert (=> d!12662 (= lt!66401 (lemmaIsPrefixRefl!0 (_2!2227 lt!65900)))))

(declare-fun lt!66429 () (_ BitVec 64))

(assert (=> d!12662 (= lt!66429 (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65900))) (currentByte!2807 (_2!2227 lt!65900)) (currentBit!2802 (_2!2227 lt!65900))))))

(assert (=> d!12662 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12662 (= (appendBitsMSBFirstLoop!0 (_2!2227 lt!65900) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!66415)))

(declare-fun b!43734 () Bool)

(declare-fun Unit!3100 () Unit!3096)

(assert (=> b!43734 (= e!29174 (tuple2!4269 Unit!3100 (_2!2227 lt!65900)))))

(assert (=> b!43734 (= (size!1001 (buf!1338 (_2!2227 lt!65900))) (size!1001 (buf!1338 (_2!2227 lt!65900))))))

(declare-fun lt!66435 () Unit!3096)

(declare-fun Unit!3101 () Unit!3096)

(assert (=> b!43734 (= lt!66435 Unit!3101)))

(declare-fun call!514 () tuple2!4266)

(declare-fun checkByteArrayBitContent!0 (BitStream!1746 array!2217 array!2217 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43734 (checkByteArrayBitContent!0 (_2!2227 lt!65900) srcBuffer!2 (_1!2233 (readBits!0 (_1!2226 call!514) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!43735 () Bool)

(declare-fun res!37084 () Bool)

(assert (=> b!43735 (=> (not res!37084) (not e!29172))))

(assert (=> b!43735 (= res!37084 (invariant!0 (currentBit!2802 (_2!2227 lt!66415)) (currentByte!2807 (_2!2227 lt!66415)) (size!1001 (buf!1338 (_2!2227 lt!66415)))))))

(declare-fun b!43736 () Bool)

(declare-fun lt!66409 () tuple2!4268)

(declare-fun Unit!3102 () Unit!3096)

(assert (=> b!43736 (= e!29174 (tuple2!4269 Unit!3102 (_2!2227 lt!66409)))))

(declare-fun lt!66399 () tuple2!4268)

(assert (=> b!43736 (= lt!66399 (appendBitFromByte!0 (_2!2227 lt!65900) (select (arr!1506 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!66407 () (_ BitVec 64))

(assert (=> b!43736 (= lt!66407 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66414 () (_ BitVec 64))

(assert (=> b!43736 (= lt!66414 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66421 () Unit!3096)

(assert (=> b!43736 (= lt!66421 (validateOffsetBitsIneqLemma!0 (_2!2227 lt!65900) (_2!2227 lt!66399) lt!66407 lt!66414))))

(assert (=> b!43736 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!66399)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!66399))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!66399))) (bvsub lt!66407 lt!66414))))

(declare-fun lt!66432 () Unit!3096)

(assert (=> b!43736 (= lt!66432 lt!66421)))

(declare-fun lt!66408 () tuple2!4266)

(assert (=> b!43736 (= lt!66408 call!514)))

(declare-fun lt!66433 () (_ BitVec 64))

(assert (=> b!43736 (= lt!66433 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66400 () Unit!3096)

(assert (=> b!43736 (= lt!66400 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2227 lt!65900) (buf!1338 (_2!2227 lt!66399)) lt!66433))))

(assert (=> b!43736 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!66399)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900))) lt!66433)))

(declare-fun lt!66430 () Unit!3096)

(assert (=> b!43736 (= lt!66430 lt!66400)))

(assert (=> b!43736 (= (head!333 (byteArrayBitContentToList!0 (_2!2227 lt!66399) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!333 (bitStreamReadBitsIntoList!0 (_2!2227 lt!66399) (_1!2226 lt!66408) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66417 () Unit!3096)

(declare-fun Unit!3103 () Unit!3096)

(assert (=> b!43736 (= lt!66417 Unit!3103)))

(assert (=> b!43736 (= lt!66409 (appendBitsMSBFirstLoop!0 (_2!2227 lt!66399) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!66397 () Unit!3096)

(assert (=> b!43736 (= lt!66397 (lemmaIsPrefixTransitive!0 (_2!2227 lt!65900) (_2!2227 lt!66399) (_2!2227 lt!66409)))))

(assert (=> b!43736 (isPrefixOf!0 (_2!2227 lt!65900) (_2!2227 lt!66409))))

(declare-fun lt!66413 () Unit!3096)

(assert (=> b!43736 (= lt!66413 lt!66397)))

(assert (=> b!43736 (= (size!1001 (buf!1338 (_2!2227 lt!66409))) (size!1001 (buf!1338 (_2!2227 lt!65900))))))

(declare-fun lt!66392 () Unit!3096)

(declare-fun Unit!3104 () Unit!3096)

(assert (=> b!43736 (= lt!66392 Unit!3104)))

(assert (=> b!43736 (= (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66409))) (currentByte!2807 (_2!2227 lt!66409)) (currentBit!2802 (_2!2227 lt!66409))) (bvsub (bvadd (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65900))) (currentByte!2807 (_2!2227 lt!65900)) (currentBit!2802 (_2!2227 lt!65900))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66431 () Unit!3096)

(declare-fun Unit!3105 () Unit!3096)

(assert (=> b!43736 (= lt!66431 Unit!3105)))

(assert (=> b!43736 (= (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66409))) (currentByte!2807 (_2!2227 lt!66409)) (currentBit!2802 (_2!2227 lt!66409))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66399))) (currentByte!2807 (_2!2227 lt!66399)) (currentBit!2802 (_2!2227 lt!66399))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66428 () Unit!3096)

(declare-fun Unit!3106 () Unit!3096)

(assert (=> b!43736 (= lt!66428 Unit!3106)))

(declare-fun lt!66398 () tuple2!4266)

(assert (=> b!43736 (= lt!66398 (reader!0 (_2!2227 lt!65900) (_2!2227 lt!66409)))))

(declare-fun lt!66419 () (_ BitVec 64))

(assert (=> b!43736 (= lt!66419 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66423 () Unit!3096)

(assert (=> b!43736 (= lt!66423 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2227 lt!65900) (buf!1338 (_2!2227 lt!66409)) lt!66419))))

(assert (=> b!43736 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!66409)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900))) lt!66419)))

(declare-fun lt!66404 () Unit!3096)

(assert (=> b!43736 (= lt!66404 lt!66423)))

(declare-fun lt!66402 () tuple2!4266)

(assert (=> b!43736 (= lt!66402 (reader!0 (_2!2227 lt!66399) (_2!2227 lt!66409)))))

(declare-fun lt!66411 () (_ BitVec 64))

(assert (=> b!43736 (= lt!66411 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66418 () Unit!3096)

(assert (=> b!43736 (= lt!66418 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2227 lt!66399) (buf!1338 (_2!2227 lt!66409)) lt!66411))))

(assert (=> b!43736 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!66409)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!66399))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!66399))) lt!66411)))

(declare-fun lt!66410 () Unit!3096)

(assert (=> b!43736 (= lt!66410 lt!66418)))

(declare-fun lt!66403 () List!514)

(assert (=> b!43736 (= lt!66403 (byteArrayBitContentToList!0 (_2!2227 lt!66409) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!66405 () List!514)

(assert (=> b!43736 (= lt!66405 (byteArrayBitContentToList!0 (_2!2227 lt!66409) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66424 () List!514)

(assert (=> b!43736 (= lt!66424 (bitStreamReadBitsIntoList!0 (_2!2227 lt!66409) (_1!2226 lt!66398) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!66416 () List!514)

(assert (=> b!43736 (= lt!66416 (bitStreamReadBitsIntoList!0 (_2!2227 lt!66409) (_1!2226 lt!66402) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66420 () (_ BitVec 64))

(assert (=> b!43736 (= lt!66420 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66427 () Unit!3096)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1746 BitStream!1746 BitStream!1746 BitStream!1746 (_ BitVec 64) List!514) Unit!3096)

(assert (=> b!43736 (= lt!66427 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2227 lt!66409) (_2!2227 lt!66409) (_1!2226 lt!66398) (_1!2226 lt!66402) lt!66420 lt!66424))))

(declare-fun tail!208 (List!514) List!514)

(assert (=> b!43736 (= (bitStreamReadBitsIntoList!0 (_2!2227 lt!66409) (_1!2226 lt!66402) (bvsub lt!66420 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!208 lt!66424))))

(declare-fun lt!66422 () Unit!3096)

(assert (=> b!43736 (= lt!66422 lt!66427)))

(declare-fun lt!66395 () Unit!3096)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2217 array!2217 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3096)

(assert (=> b!43736 (= lt!66395 (arrayBitRangesEqImpliesEq!0 (buf!1338 (_2!2227 lt!66399)) (buf!1338 (_2!2227 lt!66409)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!66429 (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!66399))) (currentByte!2807 (_2!2227 lt!66399)) (currentBit!2802 (_2!2227 lt!66399)))))))

(declare-fun bitAt!0 (array!2217 (_ BitVec 64)) Bool)

(assert (=> b!43736 (= (bitAt!0 (buf!1338 (_2!2227 lt!66399)) lt!66429) (bitAt!0 (buf!1338 (_2!2227 lt!66409)) lt!66429))))

(declare-fun lt!66394 () Unit!3096)

(assert (=> b!43736 (= lt!66394 lt!66395)))

(declare-fun bm!511 () Bool)

(assert (=> bm!511 (= call!514 (reader!0 (_2!2227 lt!65900) (ite c!2898 (_2!2227 lt!66399) (_2!2227 lt!65900))))))

(declare-fun b!43737 () Bool)

(assert (=> b!43737 (= e!29173 (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65900))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65900))) lt!66426))))

(assert (= (and d!12662 c!2898) b!43736))

(assert (= (and d!12662 (not c!2898)) b!43734))

(assert (= (or b!43736 b!43734) bm!511))

(assert (= (and d!12662 res!37085) b!43735))

(assert (= (and b!43735 res!37084) b!43732))

(assert (= (and b!43732 res!37087) b!43733))

(assert (= (and b!43733 res!37086) b!43730))

(assert (= (and b!43730 res!37089) b!43731))

(assert (= (and b!43731 res!37088) b!43737))

(declare-fun m!66549 () Bool)

(assert (=> b!43734 m!66549))

(declare-fun m!66551 () Bool)

(assert (=> b!43734 m!66551))

(declare-fun m!66553 () Bool)

(assert (=> b!43735 m!66553))

(declare-fun m!66555 () Bool)

(assert (=> b!43737 m!66555))

(declare-fun m!66557 () Bool)

(assert (=> b!43731 m!66557))

(declare-fun m!66559 () Bool)

(assert (=> b!43731 m!66559))

(declare-fun m!66561 () Bool)

(assert (=> b!43731 m!66561))

(declare-fun m!66563 () Bool)

(assert (=> b!43731 m!66563))

(declare-fun m!66565 () Bool)

(assert (=> b!43731 m!66565))

(declare-fun m!66567 () Bool)

(assert (=> d!12662 m!66567))

(assert (=> d!12662 m!66305))

(declare-fun m!66569 () Bool)

(assert (=> d!12662 m!66569))

(declare-fun m!66571 () Bool)

(assert (=> d!12662 m!66571))

(declare-fun m!66573 () Bool)

(assert (=> bm!511 m!66573))

(declare-fun m!66575 () Bool)

(assert (=> b!43736 m!66575))

(declare-fun m!66577 () Bool)

(assert (=> b!43736 m!66577))

(declare-fun m!66579 () Bool)

(assert (=> b!43736 m!66579))

(declare-fun m!66581 () Bool)

(assert (=> b!43736 m!66581))

(declare-fun m!66583 () Bool)

(assert (=> b!43736 m!66583))

(declare-fun m!66585 () Bool)

(assert (=> b!43736 m!66585))

(assert (=> b!43736 m!66583))

(declare-fun m!66587 () Bool)

(assert (=> b!43736 m!66587))

(declare-fun m!66589 () Bool)

(assert (=> b!43736 m!66589))

(declare-fun m!66591 () Bool)

(assert (=> b!43736 m!66591))

(declare-fun m!66593 () Bool)

(assert (=> b!43736 m!66593))

(declare-fun m!66595 () Bool)

(assert (=> b!43736 m!66595))

(declare-fun m!66597 () Bool)

(assert (=> b!43736 m!66597))

(declare-fun m!66599 () Bool)

(assert (=> b!43736 m!66599))

(declare-fun m!66601 () Bool)

(assert (=> b!43736 m!66601))

(declare-fun m!66603 () Bool)

(assert (=> b!43736 m!66603))

(declare-fun m!66605 () Bool)

(assert (=> b!43736 m!66605))

(declare-fun m!66607 () Bool)

(assert (=> b!43736 m!66607))

(declare-fun m!66609 () Bool)

(assert (=> b!43736 m!66609))

(assert (=> b!43736 m!66601))

(declare-fun m!66611 () Bool)

(assert (=> b!43736 m!66611))

(declare-fun m!66613 () Bool)

(assert (=> b!43736 m!66613))

(declare-fun m!66615 () Bool)

(assert (=> b!43736 m!66615))

(declare-fun m!66617 () Bool)

(assert (=> b!43736 m!66617))

(declare-fun m!66619 () Bool)

(assert (=> b!43736 m!66619))

(declare-fun m!66621 () Bool)

(assert (=> b!43736 m!66621))

(declare-fun m!66623 () Bool)

(assert (=> b!43736 m!66623))

(declare-fun m!66625 () Bool)

(assert (=> b!43736 m!66625))

(assert (=> b!43736 m!66593))

(declare-fun m!66627 () Bool)

(assert (=> b!43736 m!66627))

(assert (=> b!43736 m!66305))

(assert (=> b!43736 m!66613))

(declare-fun m!66629 () Bool)

(assert (=> b!43736 m!66629))

(declare-fun m!66631 () Bool)

(assert (=> b!43736 m!66631))

(declare-fun m!66633 () Bool)

(assert (=> b!43736 m!66633))

(declare-fun m!66635 () Bool)

(assert (=> b!43736 m!66635))

(declare-fun m!66637 () Bool)

(assert (=> b!43733 m!66637))

(assert (=> b!43499 d!12662))

(declare-fun d!12684 () Bool)

(assert (=> d!12684 (isPrefixOf!0 thiss!1379 (_2!2227 lt!65901))))

(declare-fun lt!66439 () Unit!3096)

(declare-fun choose!30 (BitStream!1746 BitStream!1746 BitStream!1746) Unit!3096)

(assert (=> d!12684 (= lt!66439 (choose!30 thiss!1379 (_2!2227 lt!65900) (_2!2227 lt!65901)))))

(assert (=> d!12684 (isPrefixOf!0 thiss!1379 (_2!2227 lt!65900))))

(assert (=> d!12684 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2227 lt!65900) (_2!2227 lt!65901)) lt!66439)))

(declare-fun bs!3398 () Bool)

(assert (= bs!3398 d!12684))

(assert (=> bs!3398 m!66207))

(declare-fun m!66639 () Bool)

(assert (=> bs!3398 m!66639))

(assert (=> bs!3398 m!66231))

(assert (=> b!43499 d!12684))

(declare-fun d!12686 () Bool)

(assert (=> d!12686 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65900)))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3399 () Bool)

(assert (= bs!3399 d!12686))

(declare-fun m!66641 () Bool)

(assert (=> bs!3399 m!66641))

(assert (=> b!43499 d!12686))

(declare-fun b!43763 () Bool)

(declare-fun res!37112 () Bool)

(declare-fun e!29190 () Bool)

(assert (=> b!43763 (=> (not res!37112) (not e!29190))))

(declare-fun lt!66506 () tuple2!4266)

(assert (=> b!43763 (= res!37112 (isPrefixOf!0 (_2!2226 lt!66506) (_2!2227 lt!65900)))))

(declare-fun b!43764 () Bool)

(declare-fun e!29189 () Unit!3096)

(declare-fun Unit!3107 () Unit!3096)

(assert (=> b!43764 (= e!29189 Unit!3107)))

(declare-fun b!43765 () Bool)

(declare-fun res!37111 () Bool)

(assert (=> b!43765 (=> (not res!37111) (not e!29190))))

(assert (=> b!43765 (= res!37111 (isPrefixOf!0 (_1!2226 lt!66506) thiss!1379))))

(declare-fun b!43766 () Bool)

(declare-fun lt!66513 () (_ BitVec 64))

(declare-fun lt!66519 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1746 (_ BitVec 64)) BitStream!1746)

(assert (=> b!43766 (= e!29190 (= (_1!2226 lt!66506) (withMovedBitIndex!0 (_2!2226 lt!66506) (bvsub lt!66519 lt!66513))))))

(assert (=> b!43766 (or (= (bvand lt!66519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66519 lt!66513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43766 (= lt!66513 (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65900))) (currentByte!2807 (_2!2227 lt!65900)) (currentBit!2802 (_2!2227 lt!65900))))))

(assert (=> b!43766 (= lt!66519 (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)))))

(declare-fun b!43767 () Bool)

(declare-fun lt!66509 () Unit!3096)

(assert (=> b!43767 (= e!29189 lt!66509)))

(declare-fun lt!66517 () (_ BitVec 64))

(assert (=> b!43767 (= lt!66517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66503 () (_ BitVec 64))

(assert (=> b!43767 (= lt!66503 (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2217 array!2217 (_ BitVec 64) (_ BitVec 64)) Unit!3096)

(assert (=> b!43767 (= lt!66509 (arrayBitRangesEqSymmetric!0 (buf!1338 thiss!1379) (buf!1338 (_2!2227 lt!65900)) lt!66517 lt!66503))))

(assert (=> b!43767 (arrayBitRangesEq!0 (buf!1338 (_2!2227 lt!65900)) (buf!1338 thiss!1379) lt!66517 lt!66503)))

(declare-fun d!12688 () Bool)

(assert (=> d!12688 e!29190))

(declare-fun res!37113 () Bool)

(assert (=> d!12688 (=> (not res!37113) (not e!29190))))

(assert (=> d!12688 (= res!37113 (isPrefixOf!0 (_1!2226 lt!66506) (_2!2226 lt!66506)))))

(declare-fun lt!66512 () BitStream!1746)

(assert (=> d!12688 (= lt!66506 (tuple2!4267 lt!66512 (_2!2227 lt!65900)))))

(declare-fun lt!66507 () Unit!3096)

(declare-fun lt!66501 () Unit!3096)

(assert (=> d!12688 (= lt!66507 lt!66501)))

(assert (=> d!12688 (isPrefixOf!0 lt!66512 (_2!2227 lt!65900))))

(assert (=> d!12688 (= lt!66501 (lemmaIsPrefixTransitive!0 lt!66512 (_2!2227 lt!65900) (_2!2227 lt!65900)))))

(declare-fun lt!66502 () Unit!3096)

(declare-fun lt!66505 () Unit!3096)

(assert (=> d!12688 (= lt!66502 lt!66505)))

(assert (=> d!12688 (isPrefixOf!0 lt!66512 (_2!2227 lt!65900))))

(assert (=> d!12688 (= lt!66505 (lemmaIsPrefixTransitive!0 lt!66512 thiss!1379 (_2!2227 lt!65900)))))

(declare-fun lt!66515 () Unit!3096)

(assert (=> d!12688 (= lt!66515 e!29189)))

(declare-fun c!2901 () Bool)

(assert (=> d!12688 (= c!2901 (not (= (size!1001 (buf!1338 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!66516 () Unit!3096)

(declare-fun lt!66511 () Unit!3096)

(assert (=> d!12688 (= lt!66516 lt!66511)))

(assert (=> d!12688 (isPrefixOf!0 (_2!2227 lt!65900) (_2!2227 lt!65900))))

(assert (=> d!12688 (= lt!66511 (lemmaIsPrefixRefl!0 (_2!2227 lt!65900)))))

(declare-fun lt!66520 () Unit!3096)

(declare-fun lt!66514 () Unit!3096)

(assert (=> d!12688 (= lt!66520 lt!66514)))

(assert (=> d!12688 (= lt!66514 (lemmaIsPrefixRefl!0 (_2!2227 lt!65900)))))

(declare-fun lt!66504 () Unit!3096)

(declare-fun lt!66510 () Unit!3096)

(assert (=> d!12688 (= lt!66504 lt!66510)))

(assert (=> d!12688 (isPrefixOf!0 lt!66512 lt!66512)))

(assert (=> d!12688 (= lt!66510 (lemmaIsPrefixRefl!0 lt!66512))))

(declare-fun lt!66518 () Unit!3096)

(declare-fun lt!66508 () Unit!3096)

(assert (=> d!12688 (= lt!66518 lt!66508)))

(assert (=> d!12688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12688 (= lt!66508 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12688 (= lt!66512 (BitStream!1747 (buf!1338 (_2!2227 lt!65900)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)))))

(assert (=> d!12688 (isPrefixOf!0 thiss!1379 (_2!2227 lt!65900))))

(assert (=> d!12688 (= (reader!0 thiss!1379 (_2!2227 lt!65900)) lt!66506)))

(assert (= (and d!12688 c!2901) b!43767))

(assert (= (and d!12688 (not c!2901)) b!43764))

(assert (= (and d!12688 res!37113) b!43765))

(assert (= (and b!43765 res!37111) b!43763))

(assert (= (and b!43763 res!37112) b!43766))

(declare-fun m!66651 () Bool)

(assert (=> b!43765 m!66651))

(declare-fun m!66653 () Bool)

(assert (=> b!43766 m!66653))

(assert (=> b!43766 m!66305))

(assert (=> b!43766 m!66219))

(declare-fun m!66655 () Bool)

(assert (=> d!12688 m!66655))

(declare-fun m!66657 () Bool)

(assert (=> d!12688 m!66657))

(assert (=> d!12688 m!66569))

(declare-fun m!66659 () Bool)

(assert (=> d!12688 m!66659))

(declare-fun m!66661 () Bool)

(assert (=> d!12688 m!66661))

(declare-fun m!66663 () Bool)

(assert (=> d!12688 m!66663))

(assert (=> d!12688 m!66571))

(assert (=> d!12688 m!66215))

(assert (=> d!12688 m!66231))

(assert (=> d!12688 m!66217))

(declare-fun m!66665 () Bool)

(assert (=> d!12688 m!66665))

(assert (=> b!43767 m!66219))

(declare-fun m!66667 () Bool)

(assert (=> b!43767 m!66667))

(declare-fun m!66669 () Bool)

(assert (=> b!43767 m!66669))

(declare-fun m!66671 () Bool)

(assert (=> b!43763 m!66671))

(assert (=> b!43499 d!12688))

(declare-fun d!12698 () Bool)

(declare-fun res!37115 () Bool)

(declare-fun e!29192 () Bool)

(assert (=> d!12698 (=> (not res!37115) (not e!29192))))

(assert (=> d!12698 (= res!37115 (= (size!1001 (buf!1338 thiss!1379)) (size!1001 (buf!1338 thiss!1379))))))

(assert (=> d!12698 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29192)))

(declare-fun b!43768 () Bool)

(declare-fun res!37116 () Bool)

(assert (=> b!43768 (=> (not res!37116) (not e!29192))))

(assert (=> b!43768 (= res!37116 (bvsle (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)) (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379))))))

(declare-fun b!43769 () Bool)

(declare-fun e!29191 () Bool)

(assert (=> b!43769 (= e!29192 e!29191)))

(declare-fun res!37114 () Bool)

(assert (=> b!43769 (=> res!37114 e!29191)))

(assert (=> b!43769 (= res!37114 (= (size!1001 (buf!1338 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43770 () Bool)

(assert (=> b!43770 (= e!29191 (arrayBitRangesEq!0 (buf!1338 thiss!1379) (buf!1338 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379))))))

(assert (= (and d!12698 res!37115) b!43768))

(assert (= (and b!43768 res!37116) b!43769))

(assert (= (and b!43769 (not res!37114)) b!43770))

(assert (=> b!43768 m!66219))

(assert (=> b!43768 m!66219))

(assert (=> b!43770 m!66219))

(assert (=> b!43770 m!66219))

(declare-fun m!66673 () Bool)

(assert (=> b!43770 m!66673))

(assert (=> b!43497 d!12698))

(declare-fun d!12700 () Bool)

(assert (=> d!12700 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!66523 () Unit!3096)

(declare-fun choose!11 (BitStream!1746) Unit!3096)

(assert (=> d!12700 (= lt!66523 (choose!11 thiss!1379))))

(assert (=> d!12700 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!66523)))

(declare-fun bs!3402 () Bool)

(assert (= bs!3402 d!12700))

(assert (=> bs!3402 m!66215))

(declare-fun m!66675 () Bool)

(assert (=> bs!3402 m!66675))

(assert (=> b!43497 d!12700))

(declare-fun d!12702 () Bool)

(declare-fun e!29195 () Bool)

(assert (=> d!12702 e!29195))

(declare-fun res!37122 () Bool)

(assert (=> d!12702 (=> (not res!37122) (not e!29195))))

(declare-fun lt!66537 () (_ BitVec 64))

(declare-fun lt!66540 () (_ BitVec 64))

(declare-fun lt!66538 () (_ BitVec 64))

(assert (=> d!12702 (= res!37122 (= lt!66537 (bvsub lt!66538 lt!66540)))))

(assert (=> d!12702 (or (= (bvand lt!66538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66538 lt!66540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12702 (= lt!66540 (remainingBits!0 ((_ sign_extend 32) (size!1001 (buf!1338 thiss!1379))) ((_ sign_extend 32) (currentByte!2807 thiss!1379)) ((_ sign_extend 32) (currentBit!2802 thiss!1379))))))

(declare-fun lt!66536 () (_ BitVec 64))

(declare-fun lt!66539 () (_ BitVec 64))

(assert (=> d!12702 (= lt!66538 (bvmul lt!66536 lt!66539))))

(assert (=> d!12702 (or (= lt!66536 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66539 (bvsdiv (bvmul lt!66536 lt!66539) lt!66536)))))

(assert (=> d!12702 (= lt!66539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12702 (= lt!66536 ((_ sign_extend 32) (size!1001 (buf!1338 thiss!1379))))))

(assert (=> d!12702 (= lt!66537 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2807 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2802 thiss!1379))))))

(assert (=> d!12702 (invariant!0 (currentBit!2802 thiss!1379) (currentByte!2807 thiss!1379) (size!1001 (buf!1338 thiss!1379)))))

(assert (=> d!12702 (= (bitIndex!0 (size!1001 (buf!1338 thiss!1379)) (currentByte!2807 thiss!1379) (currentBit!2802 thiss!1379)) lt!66537)))

(declare-fun b!43775 () Bool)

(declare-fun res!37121 () Bool)

(assert (=> b!43775 (=> (not res!37121) (not e!29195))))

(assert (=> b!43775 (= res!37121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66537))))

(declare-fun b!43776 () Bool)

(declare-fun lt!66541 () (_ BitVec 64))

(assert (=> b!43776 (= e!29195 (bvsle lt!66537 (bvmul lt!66541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43776 (or (= lt!66541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66541)))))

(assert (=> b!43776 (= lt!66541 ((_ sign_extend 32) (size!1001 (buf!1338 thiss!1379))))))

(assert (= (and d!12702 res!37122) b!43775))

(assert (= (and b!43775 res!37121) b!43776))

(assert (=> d!12702 m!66301))

(assert (=> d!12702 m!66303))

(assert (=> b!43497 d!12702))

(declare-fun d!12704 () Bool)

(declare-fun e!29196 () Bool)

(assert (=> d!12704 e!29196))

(declare-fun res!37124 () Bool)

(assert (=> d!12704 (=> (not res!37124) (not e!29196))))

(declare-fun lt!66543 () (_ BitVec 64))

(declare-fun lt!66546 () (_ BitVec 64))

(declare-fun lt!66544 () (_ BitVec 64))

(assert (=> d!12704 (= res!37124 (= lt!66543 (bvsub lt!66544 lt!66546)))))

(assert (=> d!12704 (or (= (bvand lt!66544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66544 lt!66546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12704 (= lt!66546 (remainingBits!0 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65901)))) ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65901))) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65901)))))))

(declare-fun lt!66542 () (_ BitVec 64))

(declare-fun lt!66545 () (_ BitVec 64))

(assert (=> d!12704 (= lt!66544 (bvmul lt!66542 lt!66545))))

(assert (=> d!12704 (or (= lt!66542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66545 (bvsdiv (bvmul lt!66542 lt!66545) lt!66542)))))

(assert (=> d!12704 (= lt!66545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12704 (= lt!66542 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65901)))))))

(assert (=> d!12704 (= lt!66543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2807 (_2!2227 lt!65901))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2802 (_2!2227 lt!65901)))))))

(assert (=> d!12704 (invariant!0 (currentBit!2802 (_2!2227 lt!65901)) (currentByte!2807 (_2!2227 lt!65901)) (size!1001 (buf!1338 (_2!2227 lt!65901))))))

(assert (=> d!12704 (= (bitIndex!0 (size!1001 (buf!1338 (_2!2227 lt!65901))) (currentByte!2807 (_2!2227 lt!65901)) (currentBit!2802 (_2!2227 lt!65901))) lt!66543)))

(declare-fun b!43777 () Bool)

(declare-fun res!37123 () Bool)

(assert (=> b!43777 (=> (not res!37123) (not e!29196))))

(assert (=> b!43777 (= res!37123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66543))))

(declare-fun b!43778 () Bool)

(declare-fun lt!66547 () (_ BitVec 64))

(assert (=> b!43778 (= e!29196 (bvsle lt!66543 (bvmul lt!66547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43778 (or (= lt!66547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66547)))))

(assert (=> b!43778 (= lt!66547 ((_ sign_extend 32) (size!1001 (buf!1338 (_2!2227 lt!65901)))))))

(assert (= (and d!12704 res!37124) b!43777))

(assert (= (and b!43777 res!37123) b!43778))

(declare-fun m!66677 () Bool)

(assert (=> d!12704 m!66677))

(assert (=> d!12704 m!66237))

(assert (=> b!43498 d!12704))

(check-sat (not b!43644) (not b!43633) (not b!43550) (not d!12620) (not b!43765) (not d!12684) (not b!43555) (not b!43635) (not b!43768) (not b!43646) (not b!43641) (not b!43636) (not b!43767) (not b!43736) (not b!43731) (not b!43766) (not b!43543) (not b!43735) (not b!43733) (not b!43737) (not b!43552) (not d!12626) (not b!43630) (not d!12688) (not b!43770) (not d!12702) (not b!43631) (not b!43632) (not b!43634) (not d!12624) (not b!43637) (not d!12628) (not d!12704) (not b!43531) (not b!43541) (not d!12612) (not b!43763) (not b!43542) (not d!12700) (not d!12662) (not b!43643) (not d!12686) (not b!43734) (not bm!511) (not d!12656))
