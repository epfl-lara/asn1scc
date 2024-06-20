; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12884 () Bool)

(assert start!12884)

(declare-fun b!66204 () Bool)

(declare-fun e!43500 () Bool)

(declare-datatypes ((array!2850 0))(
  ( (array!2851 (arr!1878 (Array (_ BitVec 32) (_ BitVec 8))) (size!1314 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2262 0))(
  ( (BitStream!2263 (buf!1695 array!2850) (currentByte!3367 (_ BitVec 32)) (currentBit!3362 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2262)

(declare-fun array_inv!1190 (array!2850) Bool)

(assert (=> b!66204 (= e!43500 (array_inv!1190 (buf!1695 thiss!1379)))))

(declare-fun b!66205 () Bool)

(declare-fun res!54904 () Bool)

(declare-fun e!43504 () Bool)

(assert (=> b!66205 (=> res!54904 e!43504)))

(declare-datatypes ((Unit!4465 0))(
  ( (Unit!4466) )
))
(declare-datatypes ((tuple2!5860 0))(
  ( (tuple2!5861 (_1!3041 Unit!4465) (_2!3041 BitStream!2262)) )
))
(declare-fun lt!104999 () tuple2!5860)

(assert (=> b!66205 (= res!54904 (not (= (size!1314 (buf!1695 thiss!1379)) (size!1314 (buf!1695 (_2!3041 lt!104999))))))))

(declare-fun b!66206 () Bool)

(declare-fun e!43496 () Bool)

(declare-fun e!43499 () Bool)

(assert (=> b!66206 (= e!43496 e!43499)))

(declare-fun res!54905 () Bool)

(assert (=> b!66206 (=> res!54905 e!43499)))

(declare-datatypes ((tuple2!5862 0))(
  ( (tuple2!5863 (_1!3042 BitStream!2262) (_2!3042 BitStream!2262)) )
))
(declare-fun lt!105002 () tuple2!5862)

(declare-fun lt!104996 () (_ BitVec 64))

(declare-fun lt!105000 () Bool)

(declare-fun bitAt!0 (array!2850 (_ BitVec 64)) Bool)

(assert (=> b!66206 (= res!54905 (not (= lt!105000 (bitAt!0 (buf!1695 (_1!3042 lt!105002)) lt!104996))))))

(declare-fun lt!105003 () tuple2!5862)

(assert (=> b!66206 (= lt!105000 (bitAt!0 (buf!1695 (_1!3042 lt!105003)) lt!104996))))

(declare-fun b!66207 () Bool)

(declare-fun res!54910 () Bool)

(declare-fun e!43505 () Bool)

(assert (=> b!66207 (=> res!54910 e!43505)))

(declare-fun lt!105009 () tuple2!5860)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66207 (= res!54910 (not (invariant!0 (currentBit!3362 (_2!3041 lt!105009)) (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!105009))))))))

(declare-fun b!66208 () Bool)

(declare-fun e!43493 () Bool)

(assert (=> b!66208 (= e!43493 e!43496)))

(declare-fun res!54894 () Bool)

(assert (=> b!66208 (=> res!54894 e!43496)))

(declare-datatypes ((List!706 0))(
  ( (Nil!703) (Cons!702 (h!821 Bool) (t!1456 List!706)) )
))
(declare-fun lt!105004 () List!706)

(declare-fun lt!104991 () List!706)

(assert (=> b!66208 (= res!54894 (not (= lt!105004 lt!104991)))))

(assert (=> b!66208 (= lt!104991 lt!105004)))

(declare-fun lt!105006 () List!706)

(declare-fun tail!310 (List!706) List!706)

(assert (=> b!66208 (= lt!105004 (tail!310 lt!105006))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!105012 () Unit!4465)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2262 BitStream!2262 BitStream!2262 BitStream!2262 (_ BitVec 64) List!706) Unit!4465)

(assert (=> b!66208 (= lt!105012 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3041 lt!104999) (_2!3041 lt!104999) (_1!3042 lt!105003) (_1!3042 lt!105002) (bvsub to!314 i!635) lt!105006))))

(declare-fun b!66209 () Bool)

(declare-fun e!43503 () Bool)

(assert (=> b!66209 (= e!43503 e!43504)))

(declare-fun res!54899 () Bool)

(assert (=> b!66209 (=> res!54899 e!43504)))

(declare-fun lt!104993 () (_ BitVec 64))

(assert (=> b!66209 (= res!54899 (not (= lt!104993 (bvsub (bvadd lt!104996 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66209 (= lt!104993 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!104999))) (currentByte!3367 (_2!3041 lt!104999)) (currentBit!3362 (_2!3041 lt!104999))))))

(declare-fun b!66210 () Bool)

(declare-fun res!54898 () Bool)

(assert (=> b!66210 (=> res!54898 e!43505)))

(assert (=> b!66210 (= res!54898 (not (invariant!0 (currentBit!3362 (_2!3041 lt!105009)) (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!104999))))))))

(declare-fun b!66211 () Bool)

(declare-fun res!54906 () Bool)

(declare-fun e!43494 () Bool)

(assert (=> b!66211 (=> res!54906 e!43494)))

(declare-fun lt!105005 () Bool)

(assert (=> b!66211 (= res!54906 (not (= (bitAt!0 (buf!1695 (_2!3041 lt!105009)) lt!104996) lt!105005)))))

(declare-fun b!66212 () Bool)

(declare-fun res!54896 () Bool)

(assert (=> b!66212 (=> res!54896 e!43504)))

(assert (=> b!66212 (= res!54896 (not (invariant!0 (currentBit!3362 (_2!3041 lt!104999)) (currentByte!3367 (_2!3041 lt!104999)) (size!1314 (buf!1695 (_2!3041 lt!104999))))))))

(declare-fun b!66213 () Bool)

(declare-fun e!43501 () Bool)

(declare-fun e!43497 () Bool)

(assert (=> b!66213 (= e!43501 (not e!43497))))

(declare-fun res!54901 () Bool)

(assert (=> b!66213 (=> res!54901 e!43497)))

(assert (=> b!66213 (= res!54901 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2262 BitStream!2262) Bool)

(assert (=> b!66213 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!105001 () Unit!4465)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2262) Unit!4465)

(assert (=> b!66213 (= lt!105001 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!66213 (= lt!104996 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(declare-fun b!66214 () Bool)

(declare-fun res!54909 () Bool)

(assert (=> b!66214 (=> (not res!54909) (not e!43501))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66214 (= res!54909 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 thiss!1379))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!54900 () Bool)

(assert (=> start!12884 (=> (not res!54900) (not e!43501))))

(declare-fun srcBuffer!2 () array!2850)

(assert (=> start!12884 (= res!54900 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1314 srcBuffer!2))))))))

(assert (=> start!12884 e!43501))

(assert (=> start!12884 true))

(assert (=> start!12884 (array_inv!1190 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2262) Bool)

(assert (=> start!12884 (and (inv!12 thiss!1379) e!43500)))

(declare-fun b!66215 () Bool)

(declare-fun res!54897 () Bool)

(assert (=> b!66215 (=> res!54897 e!43499)))

(declare-fun head!525 (List!706) Bool)

(assert (=> b!66215 (= res!54897 (not (= (head!525 lt!105006) lt!105000)))))

(declare-fun b!66216 () Bool)

(assert (=> b!66216 (= e!43499 e!43494)))

(declare-fun res!54903 () Bool)

(assert (=> b!66216 (=> res!54903 e!43494)))

(declare-fun byteArrayBitContentToList!0 (BitStream!2262 array!2850 (_ BitVec 64) (_ BitVec 64)) List!706)

(assert (=> b!66216 (= res!54903 (not (= (head!525 (byteArrayBitContentToList!0 (_2!3041 lt!104999) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!105005)))))

(assert (=> b!66216 (= lt!105005 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!66217 () Bool)

(assert (=> b!66217 (= e!43504 e!43505)))

(declare-fun res!54902 () Bool)

(assert (=> b!66217 (=> res!54902 e!43505)))

(assert (=> b!66217 (= res!54902 (not (= (size!1314 (buf!1695 (_2!3041 lt!105009))) (size!1314 (buf!1695 (_2!3041 lt!104999))))))))

(declare-fun lt!104994 () (_ BitVec 64))

(assert (=> b!66217 (= lt!104993 (bvsub (bvsub lt!104994 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105011 () (_ BitVec 64))

(assert (=> b!66217 (= lt!104994 (bvadd lt!105011 to!314))))

(assert (=> b!66217 (= lt!105011 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))))))

(assert (=> b!66217 (= (size!1314 (buf!1695 (_2!3041 lt!104999))) (size!1314 (buf!1695 thiss!1379)))))

(declare-fun b!66218 () Bool)

(assert (=> b!66218 (= e!43505 e!43493)))

(declare-fun res!54907 () Bool)

(assert (=> b!66218 (=> res!54907 e!43493)))

(assert (=> b!66218 (= res!54907 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!105008 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2262 BitStream!2262 (_ BitVec 64)) List!706)

(assert (=> b!66218 (= lt!104991 (bitStreamReadBitsIntoList!0 (_2!3041 lt!104999) (_1!3042 lt!105002) lt!105008))))

(assert (=> b!66218 (= lt!105006 (bitStreamReadBitsIntoList!0 (_2!3041 lt!104999) (_1!3042 lt!105003) (bvsub to!314 i!635)))))

(assert (=> b!66218 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105008)))

(declare-fun lt!105007 () Unit!4465)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2262 array!2850 (_ BitVec 64)) Unit!4465)

(assert (=> b!66218 (= lt!105007 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3041 lt!105009) (buf!1695 (_2!3041 lt!104999)) lt!105008))))

(declare-fun reader!0 (BitStream!2262 BitStream!2262) tuple2!5862)

(assert (=> b!66218 (= lt!105002 (reader!0 (_2!3041 lt!105009) (_2!3041 lt!104999)))))

(assert (=> b!66218 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!105010 () Unit!4465)

(assert (=> b!66218 (= lt!105010 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1695 (_2!3041 lt!104999)) (bvsub to!314 i!635)))))

(assert (=> b!66218 (= lt!105003 (reader!0 thiss!1379 (_2!3041 lt!104999)))))

(declare-fun b!66219 () Bool)

(declare-fun e!43498 () Bool)

(assert (=> b!66219 (= e!43498 e!43503)))

(declare-fun res!54895 () Bool)

(assert (=> b!66219 (=> res!54895 e!43503)))

(assert (=> b!66219 (= res!54895 (not (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!104999))))))

(assert (=> b!66219 (isPrefixOf!0 thiss!1379 (_2!3041 lt!104999))))

(declare-fun lt!104995 () Unit!4465)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2262 BitStream!2262 BitStream!2262) Unit!4465)

(assert (=> b!66219 (= lt!104995 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3041 lt!105009) (_2!3041 lt!104999)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2262 array!2850 (_ BitVec 64) (_ BitVec 64)) tuple2!5860)

(assert (=> b!66219 (= lt!104999 (appendBitsMSBFirstLoop!0 (_2!3041 lt!105009) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43502 () Bool)

(assert (=> b!66219 e!43502))

(declare-fun res!54911 () Bool)

(assert (=> b!66219 (=> (not res!54911) (not e!43502))))

(assert (=> b!66219 (= res!54911 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105013 () Unit!4465)

(assert (=> b!66219 (= lt!105013 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1695 (_2!3041 lt!105009)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104997 () tuple2!5862)

(assert (=> b!66219 (= lt!104997 (reader!0 thiss!1379 (_2!3041 lt!105009)))))

(declare-fun b!66220 () Bool)

(assert (=> b!66220 (= e!43502 (= (head!525 (byteArrayBitContentToList!0 (_2!3041 lt!105009) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!525 (bitStreamReadBitsIntoList!0 (_2!3041 lt!105009) (_1!3042 lt!104997) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!66221 () Bool)

(assert (=> b!66221 (= e!43497 e!43498)))

(declare-fun res!54908 () Bool)

(assert (=> b!66221 (=> res!54908 e!43498)))

(assert (=> b!66221 (= res!54908 (not (isPrefixOf!0 thiss!1379 (_2!3041 lt!105009))))))

(assert (=> b!66221 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105008)))

(assert (=> b!66221 (= lt!105008 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104992 () Unit!4465)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2262 BitStream!2262 (_ BitVec 64) (_ BitVec 64)) Unit!4465)

(assert (=> b!66221 (= lt!104992 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3041 lt!105009) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2262 (_ BitVec 8) (_ BitVec 32)) tuple2!5860)

(assert (=> b!66221 (= lt!105009 (appendBitFromByte!0 thiss!1379 (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!104998 () (_ BitVec 64))

(declare-fun b!66222 () Bool)

(assert (=> b!66222 (= e!43494 (or (not (= lt!104998 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!104998 (bvand lt!104994 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!66222 (= lt!104998 (bvand lt!105011 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66223 () Bool)

(declare-fun res!54912 () Bool)

(assert (=> b!66223 (=> res!54912 e!43493)))

(declare-fun length!334 (List!706) Int)

(assert (=> b!66223 (= res!54912 (<= (length!334 lt!105006) 0))))

(assert (= (and start!12884 res!54900) b!66214))

(assert (= (and b!66214 res!54909) b!66213))

(assert (= (and b!66213 (not res!54901)) b!66221))

(assert (= (and b!66221 (not res!54908)) b!66219))

(assert (= (and b!66219 res!54911) b!66220))

(assert (= (and b!66219 (not res!54895)) b!66209))

(assert (= (and b!66209 (not res!54899)) b!66212))

(assert (= (and b!66212 (not res!54896)) b!66205))

(assert (= (and b!66205 (not res!54904)) b!66217))

(assert (= (and b!66217 (not res!54902)) b!66207))

(assert (= (and b!66207 (not res!54910)) b!66210))

(assert (= (and b!66210 (not res!54898)) b!66218))

(assert (= (and b!66218 (not res!54907)) b!66223))

(assert (= (and b!66223 (not res!54912)) b!66208))

(assert (= (and b!66208 (not res!54894)) b!66206))

(assert (= (and b!66206 (not res!54905)) b!66215))

(assert (= (and b!66215 (not res!54897)) b!66216))

(assert (= (and b!66216 (not res!54903)) b!66211))

(assert (= (and b!66211 (not res!54906)) b!66222))

(assert (= start!12884 b!66204))

(declare-fun m!105165 () Bool)

(assert (=> b!66211 m!105165))

(declare-fun m!105167 () Bool)

(assert (=> b!66223 m!105167))

(declare-fun m!105169 () Bool)

(assert (=> b!66220 m!105169))

(assert (=> b!66220 m!105169))

(declare-fun m!105171 () Bool)

(assert (=> b!66220 m!105171))

(declare-fun m!105173 () Bool)

(assert (=> b!66220 m!105173))

(assert (=> b!66220 m!105173))

(declare-fun m!105175 () Bool)

(assert (=> b!66220 m!105175))

(declare-fun m!105177 () Bool)

(assert (=> b!66212 m!105177))

(declare-fun m!105179 () Bool)

(assert (=> b!66216 m!105179))

(assert (=> b!66216 m!105179))

(declare-fun m!105181 () Bool)

(assert (=> b!66216 m!105181))

(declare-fun m!105183 () Bool)

(assert (=> b!66216 m!105183))

(declare-fun m!105185 () Bool)

(assert (=> b!66207 m!105185))

(declare-fun m!105187 () Bool)

(assert (=> b!66219 m!105187))

(declare-fun m!105189 () Bool)

(assert (=> b!66219 m!105189))

(declare-fun m!105191 () Bool)

(assert (=> b!66219 m!105191))

(declare-fun m!105193 () Bool)

(assert (=> b!66219 m!105193))

(declare-fun m!105195 () Bool)

(assert (=> b!66219 m!105195))

(declare-fun m!105197 () Bool)

(assert (=> b!66219 m!105197))

(declare-fun m!105199 () Bool)

(assert (=> b!66219 m!105199))

(declare-fun m!105201 () Bool)

(assert (=> start!12884 m!105201))

(declare-fun m!105203 () Bool)

(assert (=> start!12884 m!105203))

(declare-fun m!105205 () Bool)

(assert (=> b!66217 m!105205))

(declare-fun m!105207 () Bool)

(assert (=> b!66213 m!105207))

(declare-fun m!105209 () Bool)

(assert (=> b!66213 m!105209))

(declare-fun m!105211 () Bool)

(assert (=> b!66213 m!105211))

(declare-fun m!105213 () Bool)

(assert (=> b!66221 m!105213))

(assert (=> b!66221 m!105213))

(declare-fun m!105215 () Bool)

(assert (=> b!66221 m!105215))

(declare-fun m!105217 () Bool)

(assert (=> b!66221 m!105217))

(declare-fun m!105219 () Bool)

(assert (=> b!66221 m!105219))

(declare-fun m!105221 () Bool)

(assert (=> b!66221 m!105221))

(declare-fun m!105223 () Bool)

(assert (=> b!66218 m!105223))

(declare-fun m!105225 () Bool)

(assert (=> b!66218 m!105225))

(declare-fun m!105227 () Bool)

(assert (=> b!66218 m!105227))

(declare-fun m!105229 () Bool)

(assert (=> b!66218 m!105229))

(declare-fun m!105231 () Bool)

(assert (=> b!66218 m!105231))

(declare-fun m!105233 () Bool)

(assert (=> b!66218 m!105233))

(declare-fun m!105235 () Bool)

(assert (=> b!66218 m!105235))

(declare-fun m!105237 () Bool)

(assert (=> b!66218 m!105237))

(declare-fun m!105239 () Bool)

(assert (=> b!66210 m!105239))

(declare-fun m!105241 () Bool)

(assert (=> b!66208 m!105241))

(declare-fun m!105243 () Bool)

(assert (=> b!66208 m!105243))

(declare-fun m!105245 () Bool)

(assert (=> b!66214 m!105245))

(declare-fun m!105247 () Bool)

(assert (=> b!66209 m!105247))

(declare-fun m!105249 () Bool)

(assert (=> b!66206 m!105249))

(declare-fun m!105251 () Bool)

(assert (=> b!66206 m!105251))

(declare-fun m!105253 () Bool)

(assert (=> b!66215 m!105253))

(declare-fun m!105255 () Bool)

(assert (=> b!66204 m!105255))

(check-sat (not b!66212) (not b!66221) (not b!66211) (not b!66223) (not b!66213) (not b!66219) (not b!66220) (not b!66215) (not b!66210) (not b!66209) (not b!66207) (not b!66217) (not b!66204) (not b!66206) (not b!66218) (not start!12884) (not b!66216) (not b!66214) (not b!66208))
(check-sat)
(get-model)

(declare-fun d!20754 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20754 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 thiss!1379))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 thiss!1379))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5055 () Bool)

(assert (= bs!5055 d!20754))

(declare-fun m!105349 () Bool)

(assert (=> bs!5055 m!105349))

(assert (=> b!66214 d!20754))

(declare-fun d!20756 () Bool)

(assert (=> d!20756 (= (array_inv!1190 (buf!1695 thiss!1379)) (bvsge (size!1314 (buf!1695 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!66204 d!20756))

(declare-fun d!20758 () Bool)

(assert (=> d!20758 (= (head!525 lt!105006) (h!821 lt!105006))))

(assert (=> b!66215 d!20758))

(declare-fun d!20760 () Bool)

(assert (=> d!20760 (= (head!525 (byteArrayBitContentToList!0 (_2!3041 lt!104999) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!821 (byteArrayBitContentToList!0 (_2!3041 lt!104999) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!66216 d!20760))

(declare-fun d!20762 () Bool)

(declare-fun c!4797 () Bool)

(assert (=> d!20762 (= c!4797 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43550 () List!706)

(assert (=> d!20762 (= (byteArrayBitContentToList!0 (_2!3041 lt!104999) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!43550)))

(declare-fun b!66288 () Bool)

(assert (=> b!66288 (= e!43550 Nil!703)))

(declare-fun b!66289 () Bool)

(assert (=> b!66289 (= e!43550 (Cons!702 (not (= (bvand ((_ sign_extend 24) (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3041 lt!104999) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20762 c!4797) b!66288))

(assert (= (and d!20762 (not c!4797)) b!66289))

(assert (=> b!66289 m!105213))

(declare-fun m!105351 () Bool)

(assert (=> b!66289 m!105351))

(declare-fun m!105353 () Bool)

(assert (=> b!66289 m!105353))

(assert (=> b!66216 d!20762))

(declare-fun d!20764 () Bool)

(assert (=> d!20764 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5056 () Bool)

(assert (= bs!5056 d!20764))

(assert (=> bs!5056 m!105213))

(assert (=> bs!5056 m!105351))

(assert (=> b!66216 d!20764))

(declare-fun d!20766 () Bool)

(assert (=> d!20766 (= (bitAt!0 (buf!1695 (_1!3042 lt!105002)) lt!104996) (not (= (bvand ((_ sign_extend 24) (select (arr!1878 (buf!1695 (_1!3042 lt!105002))) ((_ extract 31 0) (bvsdiv lt!104996 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!104996 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5057 () Bool)

(assert (= bs!5057 d!20766))

(declare-fun m!105355 () Bool)

(assert (=> bs!5057 m!105355))

(declare-fun m!105357 () Bool)

(assert (=> bs!5057 m!105357))

(assert (=> b!66206 d!20766))

(declare-fun d!20768 () Bool)

(assert (=> d!20768 (= (bitAt!0 (buf!1695 (_1!3042 lt!105003)) lt!104996) (not (= (bvand ((_ sign_extend 24) (select (arr!1878 (buf!1695 (_1!3042 lt!105003))) ((_ extract 31 0) (bvsdiv lt!104996 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!104996 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5058 () Bool)

(assert (= bs!5058 d!20768))

(declare-fun m!105359 () Bool)

(assert (=> bs!5058 m!105359))

(assert (=> bs!5058 m!105357))

(assert (=> b!66206 d!20768))

(declare-fun d!20770 () Bool)

(declare-fun e!43553 () Bool)

(assert (=> d!20770 e!43553))

(declare-fun res!54974 () Bool)

(assert (=> d!20770 (=> (not res!54974) (not e!43553))))

(declare-fun lt!105095 () (_ BitVec 64))

(declare-fun lt!105100 () (_ BitVec 64))

(declare-fun lt!105098 () (_ BitVec 64))

(assert (=> d!20770 (= res!54974 (= lt!105095 (bvsub lt!105098 lt!105100)))))

(assert (=> d!20770 (or (= (bvand lt!105098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105100 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105098 lt!105100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20770 (= lt!105100 (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009)))))))

(declare-fun lt!105096 () (_ BitVec 64))

(declare-fun lt!105097 () (_ BitVec 64))

(assert (=> d!20770 (= lt!105098 (bvmul lt!105096 lt!105097))))

(assert (=> d!20770 (or (= lt!105096 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105097 (bvsdiv (bvmul lt!105096 lt!105097) lt!105096)))))

(assert (=> d!20770 (= lt!105097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20770 (= lt!105096 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))))))

(assert (=> d!20770 (= lt!105095 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009)))))))

(assert (=> d!20770 (invariant!0 (currentBit!3362 (_2!3041 lt!105009)) (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!105009))))))

(assert (=> d!20770 (= (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))) lt!105095)))

(declare-fun b!66294 () Bool)

(declare-fun res!54975 () Bool)

(assert (=> b!66294 (=> (not res!54975) (not e!43553))))

(assert (=> b!66294 (= res!54975 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105095))))

(declare-fun b!66295 () Bool)

(declare-fun lt!105099 () (_ BitVec 64))

(assert (=> b!66295 (= e!43553 (bvsle lt!105095 (bvmul lt!105099 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66295 (or (= lt!105099 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105099 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105099)))))

(assert (=> b!66295 (= lt!105099 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))))))

(assert (= (and d!20770 res!54974) b!66294))

(assert (= (and b!66294 res!54975) b!66295))

(declare-fun m!105361 () Bool)

(assert (=> d!20770 m!105361))

(assert (=> d!20770 m!105185))

(assert (=> b!66217 d!20770))

(declare-datatypes ((tuple2!5868 0))(
  ( (tuple2!5869 (_1!3045 List!706) (_2!3045 BitStream!2262)) )
))
(declare-fun e!43558 () tuple2!5868)

(declare-datatypes ((tuple2!5870 0))(
  ( (tuple2!5871 (_1!3046 Bool) (_2!3046 BitStream!2262)) )
))
(declare-fun lt!105107 () tuple2!5870)

(declare-fun b!66305 () Bool)

(declare-fun lt!105108 () (_ BitVec 64))

(assert (=> b!66305 (= e!43558 (tuple2!5869 (Cons!702 (_1!3046 lt!105107) (bitStreamReadBitsIntoList!0 (_2!3041 lt!104999) (_2!3046 lt!105107) (bvsub lt!105008 lt!105108))) (_2!3046 lt!105107)))))

(declare-fun readBit!0 (BitStream!2262) tuple2!5870)

(assert (=> b!66305 (= lt!105107 (readBit!0 (_1!3042 lt!105002)))))

(assert (=> b!66305 (= lt!105108 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66307 () Bool)

(declare-fun e!43559 () Bool)

(declare-fun lt!105109 () List!706)

(assert (=> b!66307 (= e!43559 (> (length!334 lt!105109) 0))))

(declare-fun b!66306 () Bool)

(declare-fun isEmpty!207 (List!706) Bool)

(assert (=> b!66306 (= e!43559 (isEmpty!207 lt!105109))))

(declare-fun b!66304 () Bool)

(assert (=> b!66304 (= e!43558 (tuple2!5869 Nil!703 (_1!3042 lt!105002)))))

(declare-fun d!20772 () Bool)

(assert (=> d!20772 e!43559))

(declare-fun c!4803 () Bool)

(assert (=> d!20772 (= c!4803 (= lt!105008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20772 (= lt!105109 (_1!3045 e!43558))))

(declare-fun c!4802 () Bool)

(assert (=> d!20772 (= c!4802 (= lt!105008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20772 (bvsge lt!105008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20772 (= (bitStreamReadBitsIntoList!0 (_2!3041 lt!104999) (_1!3042 lt!105002) lt!105008) lt!105109)))

(assert (= (and d!20772 c!4802) b!66304))

(assert (= (and d!20772 (not c!4802)) b!66305))

(assert (= (and d!20772 c!4803) b!66306))

(assert (= (and d!20772 (not c!4803)) b!66307))

(declare-fun m!105363 () Bool)

(assert (=> b!66305 m!105363))

(declare-fun m!105365 () Bool)

(assert (=> b!66305 m!105365))

(declare-fun m!105367 () Bool)

(assert (=> b!66307 m!105367))

(declare-fun m!105369 () Bool)

(assert (=> b!66306 m!105369))

(assert (=> b!66218 d!20772))

(declare-fun d!20774 () Bool)

(assert (=> d!20774 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5059 () Bool)

(assert (= bs!5059 d!20774))

(declare-fun m!105371 () Bool)

(assert (=> bs!5059 m!105371))

(assert (=> b!66218 d!20774))

(declare-fun lt!105111 () (_ BitVec 64))

(declare-fun e!43560 () tuple2!5868)

(declare-fun lt!105110 () tuple2!5870)

(declare-fun b!66309 () Bool)

(assert (=> b!66309 (= e!43560 (tuple2!5869 (Cons!702 (_1!3046 lt!105110) (bitStreamReadBitsIntoList!0 (_2!3041 lt!104999) (_2!3046 lt!105110) (bvsub (bvsub to!314 i!635) lt!105111))) (_2!3046 lt!105110)))))

(assert (=> b!66309 (= lt!105110 (readBit!0 (_1!3042 lt!105003)))))

(assert (=> b!66309 (= lt!105111 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66311 () Bool)

(declare-fun e!43561 () Bool)

(declare-fun lt!105112 () List!706)

(assert (=> b!66311 (= e!43561 (> (length!334 lt!105112) 0))))

(declare-fun b!66310 () Bool)

(assert (=> b!66310 (= e!43561 (isEmpty!207 lt!105112))))

(declare-fun b!66308 () Bool)

(assert (=> b!66308 (= e!43560 (tuple2!5869 Nil!703 (_1!3042 lt!105003)))))

(declare-fun d!20776 () Bool)

(assert (=> d!20776 e!43561))

(declare-fun c!4805 () Bool)

(assert (=> d!20776 (= c!4805 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20776 (= lt!105112 (_1!3045 e!43560))))

(declare-fun c!4804 () Bool)

(assert (=> d!20776 (= c!4804 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20776 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20776 (= (bitStreamReadBitsIntoList!0 (_2!3041 lt!104999) (_1!3042 lt!105003) (bvsub to!314 i!635)) lt!105112)))

(assert (= (and d!20776 c!4804) b!66308))

(assert (= (and d!20776 (not c!4804)) b!66309))

(assert (= (and d!20776 c!4805) b!66310))

(assert (= (and d!20776 (not c!4805)) b!66311))

(declare-fun m!105373 () Bool)

(assert (=> b!66309 m!105373))

(declare-fun m!105375 () Bool)

(assert (=> b!66309 m!105375))

(declare-fun m!105377 () Bool)

(assert (=> b!66311 m!105377))

(declare-fun m!105379 () Bool)

(assert (=> b!66310 m!105379))

(assert (=> b!66218 d!20776))

(declare-fun d!20778 () Bool)

(assert (=> d!20778 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105008)))

(declare-fun lt!105115 () Unit!4465)

(declare-fun choose!9 (BitStream!2262 array!2850 (_ BitVec 64) BitStream!2262) Unit!4465)

(assert (=> d!20778 (= lt!105115 (choose!9 (_2!3041 lt!105009) (buf!1695 (_2!3041 lt!104999)) lt!105008 (BitStream!2263 (buf!1695 (_2!3041 lt!104999)) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009)))))))

(assert (=> d!20778 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3041 lt!105009) (buf!1695 (_2!3041 lt!104999)) lt!105008) lt!105115)))

(declare-fun bs!5060 () Bool)

(assert (= bs!5060 d!20778))

(assert (=> bs!5060 m!105237))

(declare-fun m!105381 () Bool)

(assert (=> bs!5060 m!105381))

(assert (=> b!66218 d!20778))

(declare-fun b!66322 () Bool)

(declare-fun e!43566 () Unit!4465)

(declare-fun Unit!4469 () Unit!4465)

(assert (=> b!66322 (= e!43566 Unit!4469)))

(declare-fun d!20780 () Bool)

(declare-fun e!43567 () Bool)

(assert (=> d!20780 e!43567))

(declare-fun res!54983 () Bool)

(assert (=> d!20780 (=> (not res!54983) (not e!43567))))

(declare-fun lt!105156 () tuple2!5862)

(assert (=> d!20780 (= res!54983 (isPrefixOf!0 (_1!3042 lt!105156) (_2!3042 lt!105156)))))

(declare-fun lt!105174 () BitStream!2262)

(assert (=> d!20780 (= lt!105156 (tuple2!5863 lt!105174 (_2!3041 lt!104999)))))

(declare-fun lt!105160 () Unit!4465)

(declare-fun lt!105167 () Unit!4465)

(assert (=> d!20780 (= lt!105160 lt!105167)))

(assert (=> d!20780 (isPrefixOf!0 lt!105174 (_2!3041 lt!104999))))

(assert (=> d!20780 (= lt!105167 (lemmaIsPrefixTransitive!0 lt!105174 (_2!3041 lt!104999) (_2!3041 lt!104999)))))

(declare-fun lt!105173 () Unit!4465)

(declare-fun lt!105169 () Unit!4465)

(assert (=> d!20780 (= lt!105173 lt!105169)))

(assert (=> d!20780 (isPrefixOf!0 lt!105174 (_2!3041 lt!104999))))

(assert (=> d!20780 (= lt!105169 (lemmaIsPrefixTransitive!0 lt!105174 (_2!3041 lt!105009) (_2!3041 lt!104999)))))

(declare-fun lt!105165 () Unit!4465)

(assert (=> d!20780 (= lt!105165 e!43566)))

(declare-fun c!4808 () Bool)

(assert (=> d!20780 (= c!4808 (not (= (size!1314 (buf!1695 (_2!3041 lt!105009))) #b00000000000000000000000000000000)))))

(declare-fun lt!105166 () Unit!4465)

(declare-fun lt!105171 () Unit!4465)

(assert (=> d!20780 (= lt!105166 lt!105171)))

(assert (=> d!20780 (isPrefixOf!0 (_2!3041 lt!104999) (_2!3041 lt!104999))))

(assert (=> d!20780 (= lt!105171 (lemmaIsPrefixRefl!0 (_2!3041 lt!104999)))))

(declare-fun lt!105158 () Unit!4465)

(declare-fun lt!105170 () Unit!4465)

(assert (=> d!20780 (= lt!105158 lt!105170)))

(assert (=> d!20780 (= lt!105170 (lemmaIsPrefixRefl!0 (_2!3041 lt!104999)))))

(declare-fun lt!105159 () Unit!4465)

(declare-fun lt!105172 () Unit!4465)

(assert (=> d!20780 (= lt!105159 lt!105172)))

(assert (=> d!20780 (isPrefixOf!0 lt!105174 lt!105174)))

(assert (=> d!20780 (= lt!105172 (lemmaIsPrefixRefl!0 lt!105174))))

(declare-fun lt!105175 () Unit!4465)

(declare-fun lt!105168 () Unit!4465)

(assert (=> d!20780 (= lt!105175 lt!105168)))

(assert (=> d!20780 (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!105009))))

(assert (=> d!20780 (= lt!105168 (lemmaIsPrefixRefl!0 (_2!3041 lt!105009)))))

(assert (=> d!20780 (= lt!105174 (BitStream!2263 (buf!1695 (_2!3041 lt!104999)) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))))))

(assert (=> d!20780 (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!104999))))

(assert (=> d!20780 (= (reader!0 (_2!3041 lt!105009) (_2!3041 lt!104999)) lt!105156)))

(declare-fun b!66323 () Bool)

(declare-fun lt!105163 () (_ BitVec 64))

(declare-fun lt!105161 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2262 (_ BitVec 64)) BitStream!2262)

(assert (=> b!66323 (= e!43567 (= (_1!3042 lt!105156) (withMovedBitIndex!0 (_2!3042 lt!105156) (bvsub lt!105163 lt!105161))))))

(assert (=> b!66323 (or (= (bvand lt!105163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105163 lt!105161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66323 (= lt!105161 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!104999))) (currentByte!3367 (_2!3041 lt!104999)) (currentBit!3362 (_2!3041 lt!104999))))))

(assert (=> b!66323 (= lt!105163 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))))))

(declare-fun b!66324 () Bool)

(declare-fun res!54984 () Bool)

(assert (=> b!66324 (=> (not res!54984) (not e!43567))))

(assert (=> b!66324 (= res!54984 (isPrefixOf!0 (_1!3042 lt!105156) (_2!3041 lt!105009)))))

(declare-fun b!66325 () Bool)

(declare-fun res!54982 () Bool)

(assert (=> b!66325 (=> (not res!54982) (not e!43567))))

(assert (=> b!66325 (= res!54982 (isPrefixOf!0 (_2!3042 lt!105156) (_2!3041 lt!104999)))))

(declare-fun b!66326 () Bool)

(declare-fun lt!105157 () Unit!4465)

(assert (=> b!66326 (= e!43566 lt!105157)))

(declare-fun lt!105164 () (_ BitVec 64))

(assert (=> b!66326 (= lt!105164 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105162 () (_ BitVec 64))

(assert (=> b!66326 (= lt!105162 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2850 array!2850 (_ BitVec 64) (_ BitVec 64)) Unit!4465)

(assert (=> b!66326 (= lt!105157 (arrayBitRangesEqSymmetric!0 (buf!1695 (_2!3041 lt!105009)) (buf!1695 (_2!3041 lt!104999)) lt!105164 lt!105162))))

(declare-fun arrayBitRangesEq!0 (array!2850 array!2850 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66326 (arrayBitRangesEq!0 (buf!1695 (_2!3041 lt!104999)) (buf!1695 (_2!3041 lt!105009)) lt!105164 lt!105162)))

(assert (= (and d!20780 c!4808) b!66326))

(assert (= (and d!20780 (not c!4808)) b!66322))

(assert (= (and d!20780 res!54983) b!66324))

(assert (= (and b!66324 res!54984) b!66325))

(assert (= (and b!66325 res!54982) b!66323))

(assert (=> b!66326 m!105205))

(declare-fun m!105383 () Bool)

(assert (=> b!66326 m!105383))

(declare-fun m!105385 () Bool)

(assert (=> b!66326 m!105385))

(declare-fun m!105387 () Bool)

(assert (=> d!20780 m!105387))

(declare-fun m!105389 () Bool)

(assert (=> d!20780 m!105389))

(declare-fun m!105391 () Bool)

(assert (=> d!20780 m!105391))

(declare-fun m!105393 () Bool)

(assert (=> d!20780 m!105393))

(declare-fun m!105395 () Bool)

(assert (=> d!20780 m!105395))

(declare-fun m!105397 () Bool)

(assert (=> d!20780 m!105397))

(declare-fun m!105399 () Bool)

(assert (=> d!20780 m!105399))

(declare-fun m!105401 () Bool)

(assert (=> d!20780 m!105401))

(declare-fun m!105403 () Bool)

(assert (=> d!20780 m!105403))

(assert (=> d!20780 m!105199))

(declare-fun m!105405 () Bool)

(assert (=> d!20780 m!105405))

(declare-fun m!105407 () Bool)

(assert (=> b!66323 m!105407))

(assert (=> b!66323 m!105247))

(assert (=> b!66323 m!105205))

(declare-fun m!105409 () Bool)

(assert (=> b!66325 m!105409))

(declare-fun m!105411 () Bool)

(assert (=> b!66324 m!105411))

(assert (=> b!66218 d!20780))

(declare-fun d!20782 () Bool)

(assert (=> d!20782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105008) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009)))) lt!105008))))

(declare-fun bs!5061 () Bool)

(assert (= bs!5061 d!20782))

(declare-fun m!105413 () Bool)

(assert (=> bs!5061 m!105413))

(assert (=> b!66218 d!20782))

(declare-fun d!20784 () Bool)

(assert (=> d!20784 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!105176 () Unit!4465)

(assert (=> d!20784 (= lt!105176 (choose!9 thiss!1379 (buf!1695 (_2!3041 lt!104999)) (bvsub to!314 i!635) (BitStream!2263 (buf!1695 (_2!3041 lt!104999)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379))))))

(assert (=> d!20784 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1695 (_2!3041 lt!104999)) (bvsub to!314 i!635)) lt!105176)))

(declare-fun bs!5062 () Bool)

(assert (= bs!5062 d!20784))

(assert (=> bs!5062 m!105229))

(declare-fun m!105415 () Bool)

(assert (=> bs!5062 m!105415))

(assert (=> b!66218 d!20784))

(declare-fun b!66327 () Bool)

(declare-fun e!43568 () Unit!4465)

(declare-fun Unit!4470 () Unit!4465)

(assert (=> b!66327 (= e!43568 Unit!4470)))

(declare-fun d!20786 () Bool)

(declare-fun e!43569 () Bool)

(assert (=> d!20786 e!43569))

(declare-fun res!54986 () Bool)

(assert (=> d!20786 (=> (not res!54986) (not e!43569))))

(declare-fun lt!105177 () tuple2!5862)

(assert (=> d!20786 (= res!54986 (isPrefixOf!0 (_1!3042 lt!105177) (_2!3042 lt!105177)))))

(declare-fun lt!105195 () BitStream!2262)

(assert (=> d!20786 (= lt!105177 (tuple2!5863 lt!105195 (_2!3041 lt!104999)))))

(declare-fun lt!105181 () Unit!4465)

(declare-fun lt!105188 () Unit!4465)

(assert (=> d!20786 (= lt!105181 lt!105188)))

(assert (=> d!20786 (isPrefixOf!0 lt!105195 (_2!3041 lt!104999))))

(assert (=> d!20786 (= lt!105188 (lemmaIsPrefixTransitive!0 lt!105195 (_2!3041 lt!104999) (_2!3041 lt!104999)))))

(declare-fun lt!105194 () Unit!4465)

(declare-fun lt!105190 () Unit!4465)

(assert (=> d!20786 (= lt!105194 lt!105190)))

(assert (=> d!20786 (isPrefixOf!0 lt!105195 (_2!3041 lt!104999))))

(assert (=> d!20786 (= lt!105190 (lemmaIsPrefixTransitive!0 lt!105195 thiss!1379 (_2!3041 lt!104999)))))

(declare-fun lt!105186 () Unit!4465)

(assert (=> d!20786 (= lt!105186 e!43568)))

(declare-fun c!4809 () Bool)

(assert (=> d!20786 (= c!4809 (not (= (size!1314 (buf!1695 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!105187 () Unit!4465)

(declare-fun lt!105192 () Unit!4465)

(assert (=> d!20786 (= lt!105187 lt!105192)))

(assert (=> d!20786 (isPrefixOf!0 (_2!3041 lt!104999) (_2!3041 lt!104999))))

(assert (=> d!20786 (= lt!105192 (lemmaIsPrefixRefl!0 (_2!3041 lt!104999)))))

(declare-fun lt!105179 () Unit!4465)

(declare-fun lt!105191 () Unit!4465)

(assert (=> d!20786 (= lt!105179 lt!105191)))

(assert (=> d!20786 (= lt!105191 (lemmaIsPrefixRefl!0 (_2!3041 lt!104999)))))

(declare-fun lt!105180 () Unit!4465)

(declare-fun lt!105193 () Unit!4465)

(assert (=> d!20786 (= lt!105180 lt!105193)))

(assert (=> d!20786 (isPrefixOf!0 lt!105195 lt!105195)))

(assert (=> d!20786 (= lt!105193 (lemmaIsPrefixRefl!0 lt!105195))))

(declare-fun lt!105196 () Unit!4465)

(declare-fun lt!105189 () Unit!4465)

(assert (=> d!20786 (= lt!105196 lt!105189)))

(assert (=> d!20786 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20786 (= lt!105189 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20786 (= lt!105195 (BitStream!2263 (buf!1695 (_2!3041 lt!104999)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(assert (=> d!20786 (isPrefixOf!0 thiss!1379 (_2!3041 lt!104999))))

(assert (=> d!20786 (= (reader!0 thiss!1379 (_2!3041 lt!104999)) lt!105177)))

(declare-fun b!66328 () Bool)

(declare-fun lt!105184 () (_ BitVec 64))

(declare-fun lt!105182 () (_ BitVec 64))

(assert (=> b!66328 (= e!43569 (= (_1!3042 lt!105177) (withMovedBitIndex!0 (_2!3042 lt!105177) (bvsub lt!105184 lt!105182))))))

(assert (=> b!66328 (or (= (bvand lt!105184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105184 lt!105182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66328 (= lt!105182 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!104999))) (currentByte!3367 (_2!3041 lt!104999)) (currentBit!3362 (_2!3041 lt!104999))))))

(assert (=> b!66328 (= lt!105184 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(declare-fun b!66329 () Bool)

(declare-fun res!54987 () Bool)

(assert (=> b!66329 (=> (not res!54987) (not e!43569))))

(assert (=> b!66329 (= res!54987 (isPrefixOf!0 (_1!3042 lt!105177) thiss!1379))))

(declare-fun b!66330 () Bool)

(declare-fun res!54985 () Bool)

(assert (=> b!66330 (=> (not res!54985) (not e!43569))))

(assert (=> b!66330 (= res!54985 (isPrefixOf!0 (_2!3042 lt!105177) (_2!3041 lt!104999)))))

(declare-fun b!66331 () Bool)

(declare-fun lt!105178 () Unit!4465)

(assert (=> b!66331 (= e!43568 lt!105178)))

(declare-fun lt!105185 () (_ BitVec 64))

(assert (=> b!66331 (= lt!105185 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105183 () (_ BitVec 64))

(assert (=> b!66331 (= lt!105183 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(assert (=> b!66331 (= lt!105178 (arrayBitRangesEqSymmetric!0 (buf!1695 thiss!1379) (buf!1695 (_2!3041 lt!104999)) lt!105185 lt!105183))))

(assert (=> b!66331 (arrayBitRangesEq!0 (buf!1695 (_2!3041 lt!104999)) (buf!1695 thiss!1379) lt!105185 lt!105183)))

(assert (= (and d!20786 c!4809) b!66331))

(assert (= (and d!20786 (not c!4809)) b!66327))

(assert (= (and d!20786 res!54986) b!66329))

(assert (= (and b!66329 res!54987) b!66330))

(assert (= (and b!66330 res!54985) b!66328))

(assert (=> b!66331 m!105211))

(declare-fun m!105417 () Bool)

(assert (=> b!66331 m!105417))

(declare-fun m!105419 () Bool)

(assert (=> b!66331 m!105419))

(declare-fun m!105421 () Bool)

(assert (=> d!20786 m!105421))

(declare-fun m!105423 () Bool)

(assert (=> d!20786 m!105423))

(declare-fun m!105425 () Bool)

(assert (=> d!20786 m!105425))

(assert (=> d!20786 m!105393))

(assert (=> d!20786 m!105207))

(declare-fun m!105427 () Bool)

(assert (=> d!20786 m!105427))

(assert (=> d!20786 m!105209))

(assert (=> d!20786 m!105401))

(declare-fun m!105429 () Bool)

(assert (=> d!20786 m!105429))

(assert (=> d!20786 m!105187))

(declare-fun m!105431 () Bool)

(assert (=> d!20786 m!105431))

(declare-fun m!105433 () Bool)

(assert (=> b!66328 m!105433))

(assert (=> b!66328 m!105247))

(assert (=> b!66328 m!105211))

(declare-fun m!105435 () Bool)

(assert (=> b!66330 m!105435))

(declare-fun m!105437 () Bool)

(assert (=> b!66329 m!105437))

(assert (=> b!66218 d!20786))

(declare-fun d!20788 () Bool)

(assert (=> d!20788 (= (invariant!0 (currentBit!3362 (_2!3041 lt!105009)) (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!105009)))) (and (bvsge (currentBit!3362 (_2!3041 lt!105009)) #b00000000000000000000000000000000) (bvslt (currentBit!3362 (_2!3041 lt!105009)) #b00000000000000000000000000001000) (bvsge (currentByte!3367 (_2!3041 lt!105009)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!105009)))) (and (= (currentBit!3362 (_2!3041 lt!105009)) #b00000000000000000000000000000000) (= (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!105009))))))))))

(assert (=> b!66207 d!20788))

(declare-fun d!20790 () Bool)

(assert (=> d!20790 (= (tail!310 lt!105006) (t!1456 lt!105006))))

(assert (=> b!66208 d!20790))

(declare-fun d!20792 () Bool)

(declare-fun e!43572 () Bool)

(assert (=> d!20792 e!43572))

(declare-fun res!54990 () Bool)

(assert (=> d!20792 (=> (not res!54990) (not e!43572))))

(declare-fun lt!105202 () (_ BitVec 64))

(assert (=> d!20792 (= res!54990 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105202 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!105202) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!20792 (= lt!105202 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105201 () Unit!4465)

(declare-fun choose!42 (BitStream!2262 BitStream!2262 BitStream!2262 BitStream!2262 (_ BitVec 64) List!706) Unit!4465)

(assert (=> d!20792 (= lt!105201 (choose!42 (_2!3041 lt!104999) (_2!3041 lt!104999) (_1!3042 lt!105003) (_1!3042 lt!105002) (bvsub to!314 i!635) lt!105006))))

(assert (=> d!20792 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20792 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3041 lt!104999) (_2!3041 lt!104999) (_1!3042 lt!105003) (_1!3042 lt!105002) (bvsub to!314 i!635) lt!105006) lt!105201)))

(declare-fun b!66334 () Bool)

(assert (=> b!66334 (= e!43572 (= (bitStreamReadBitsIntoList!0 (_2!3041 lt!104999) (_1!3042 lt!105002) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!310 lt!105006)))))

(assert (= (and d!20792 res!54990) b!66334))

(declare-fun m!105439 () Bool)

(assert (=> d!20792 m!105439))

(declare-fun m!105441 () Bool)

(assert (=> b!66334 m!105441))

(assert (=> b!66334 m!105241))

(assert (=> b!66208 d!20792))

(declare-fun d!20794 () Bool)

(declare-fun res!54998 () Bool)

(declare-fun e!43578 () Bool)

(assert (=> d!20794 (=> (not res!54998) (not e!43578))))

(assert (=> d!20794 (= res!54998 (= (size!1314 (buf!1695 thiss!1379)) (size!1314 (buf!1695 (_2!3041 lt!104999)))))))

(assert (=> d!20794 (= (isPrefixOf!0 thiss!1379 (_2!3041 lt!104999)) e!43578)))

(declare-fun b!66341 () Bool)

(declare-fun res!54997 () Bool)

(assert (=> b!66341 (=> (not res!54997) (not e!43578))))

(assert (=> b!66341 (= res!54997 (bvsle (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)) (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!104999))) (currentByte!3367 (_2!3041 lt!104999)) (currentBit!3362 (_2!3041 lt!104999)))))))

(declare-fun b!66342 () Bool)

(declare-fun e!43577 () Bool)

(assert (=> b!66342 (= e!43578 e!43577)))

(declare-fun res!54999 () Bool)

(assert (=> b!66342 (=> res!54999 e!43577)))

(assert (=> b!66342 (= res!54999 (= (size!1314 (buf!1695 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66343 () Bool)

(assert (=> b!66343 (= e!43577 (arrayBitRangesEq!0 (buf!1695 thiss!1379) (buf!1695 (_2!3041 lt!104999)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379))))))

(assert (= (and d!20794 res!54998) b!66341))

(assert (= (and b!66341 res!54997) b!66342))

(assert (= (and b!66342 (not res!54999)) b!66343))

(assert (=> b!66341 m!105211))

(assert (=> b!66341 m!105247))

(assert (=> b!66343 m!105211))

(assert (=> b!66343 m!105211))

(declare-fun m!105443 () Bool)

(assert (=> b!66343 m!105443))

(assert (=> b!66219 d!20794))

(declare-fun b!66344 () Bool)

(declare-fun e!43579 () Unit!4465)

(declare-fun Unit!4471 () Unit!4465)

(assert (=> b!66344 (= e!43579 Unit!4471)))

(declare-fun d!20796 () Bool)

(declare-fun e!43580 () Bool)

(assert (=> d!20796 e!43580))

(declare-fun res!55001 () Bool)

(assert (=> d!20796 (=> (not res!55001) (not e!43580))))

(declare-fun lt!105203 () tuple2!5862)

(assert (=> d!20796 (= res!55001 (isPrefixOf!0 (_1!3042 lt!105203) (_2!3042 lt!105203)))))

(declare-fun lt!105221 () BitStream!2262)

(assert (=> d!20796 (= lt!105203 (tuple2!5863 lt!105221 (_2!3041 lt!105009)))))

(declare-fun lt!105207 () Unit!4465)

(declare-fun lt!105214 () Unit!4465)

(assert (=> d!20796 (= lt!105207 lt!105214)))

(assert (=> d!20796 (isPrefixOf!0 lt!105221 (_2!3041 lt!105009))))

(assert (=> d!20796 (= lt!105214 (lemmaIsPrefixTransitive!0 lt!105221 (_2!3041 lt!105009) (_2!3041 lt!105009)))))

(declare-fun lt!105220 () Unit!4465)

(declare-fun lt!105216 () Unit!4465)

(assert (=> d!20796 (= lt!105220 lt!105216)))

(assert (=> d!20796 (isPrefixOf!0 lt!105221 (_2!3041 lt!105009))))

(assert (=> d!20796 (= lt!105216 (lemmaIsPrefixTransitive!0 lt!105221 thiss!1379 (_2!3041 lt!105009)))))

(declare-fun lt!105212 () Unit!4465)

(assert (=> d!20796 (= lt!105212 e!43579)))

(declare-fun c!4810 () Bool)

(assert (=> d!20796 (= c!4810 (not (= (size!1314 (buf!1695 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!105213 () Unit!4465)

(declare-fun lt!105218 () Unit!4465)

(assert (=> d!20796 (= lt!105213 lt!105218)))

(assert (=> d!20796 (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!105009))))

(assert (=> d!20796 (= lt!105218 (lemmaIsPrefixRefl!0 (_2!3041 lt!105009)))))

(declare-fun lt!105205 () Unit!4465)

(declare-fun lt!105217 () Unit!4465)

(assert (=> d!20796 (= lt!105205 lt!105217)))

(assert (=> d!20796 (= lt!105217 (lemmaIsPrefixRefl!0 (_2!3041 lt!105009)))))

(declare-fun lt!105206 () Unit!4465)

(declare-fun lt!105219 () Unit!4465)

(assert (=> d!20796 (= lt!105206 lt!105219)))

(assert (=> d!20796 (isPrefixOf!0 lt!105221 lt!105221)))

(assert (=> d!20796 (= lt!105219 (lemmaIsPrefixRefl!0 lt!105221))))

(declare-fun lt!105222 () Unit!4465)

(declare-fun lt!105215 () Unit!4465)

(assert (=> d!20796 (= lt!105222 lt!105215)))

(assert (=> d!20796 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20796 (= lt!105215 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20796 (= lt!105221 (BitStream!2263 (buf!1695 (_2!3041 lt!105009)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(assert (=> d!20796 (isPrefixOf!0 thiss!1379 (_2!3041 lt!105009))))

(assert (=> d!20796 (= (reader!0 thiss!1379 (_2!3041 lt!105009)) lt!105203)))

(declare-fun lt!105208 () (_ BitVec 64))

(declare-fun b!66345 () Bool)

(declare-fun lt!105210 () (_ BitVec 64))

(assert (=> b!66345 (= e!43580 (= (_1!3042 lt!105203) (withMovedBitIndex!0 (_2!3042 lt!105203) (bvsub lt!105210 lt!105208))))))

(assert (=> b!66345 (or (= (bvand lt!105210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105208 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105210 lt!105208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66345 (= lt!105208 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))))))

(assert (=> b!66345 (= lt!105210 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(declare-fun b!66346 () Bool)

(declare-fun res!55002 () Bool)

(assert (=> b!66346 (=> (not res!55002) (not e!43580))))

(assert (=> b!66346 (= res!55002 (isPrefixOf!0 (_1!3042 lt!105203) thiss!1379))))

(declare-fun b!66347 () Bool)

(declare-fun res!55000 () Bool)

(assert (=> b!66347 (=> (not res!55000) (not e!43580))))

(assert (=> b!66347 (= res!55000 (isPrefixOf!0 (_2!3042 lt!105203) (_2!3041 lt!105009)))))

(declare-fun b!66348 () Bool)

(declare-fun lt!105204 () Unit!4465)

(assert (=> b!66348 (= e!43579 lt!105204)))

(declare-fun lt!105211 () (_ BitVec 64))

(assert (=> b!66348 (= lt!105211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105209 () (_ BitVec 64))

(assert (=> b!66348 (= lt!105209 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(assert (=> b!66348 (= lt!105204 (arrayBitRangesEqSymmetric!0 (buf!1695 thiss!1379) (buf!1695 (_2!3041 lt!105009)) lt!105211 lt!105209))))

(assert (=> b!66348 (arrayBitRangesEq!0 (buf!1695 (_2!3041 lt!105009)) (buf!1695 thiss!1379) lt!105211 lt!105209)))

(assert (= (and d!20796 c!4810) b!66348))

(assert (= (and d!20796 (not c!4810)) b!66344))

(assert (= (and d!20796 res!55001) b!66346))

(assert (= (and b!66346 res!55002) b!66347))

(assert (= (and b!66347 res!55000) b!66345))

(assert (=> b!66348 m!105211))

(declare-fun m!105445 () Bool)

(assert (=> b!66348 m!105445))

(declare-fun m!105447 () Bool)

(assert (=> b!66348 m!105447))

(declare-fun m!105449 () Bool)

(assert (=> d!20796 m!105449))

(declare-fun m!105451 () Bool)

(assert (=> d!20796 m!105451))

(declare-fun m!105453 () Bool)

(assert (=> d!20796 m!105453))

(assert (=> d!20796 m!105399))

(assert (=> d!20796 m!105207))

(declare-fun m!105455 () Bool)

(assert (=> d!20796 m!105455))

(assert (=> d!20796 m!105209))

(assert (=> d!20796 m!105395))

(declare-fun m!105457 () Bool)

(assert (=> d!20796 m!105457))

(assert (=> d!20796 m!105219))

(declare-fun m!105459 () Bool)

(assert (=> d!20796 m!105459))

(declare-fun m!105461 () Bool)

(assert (=> b!66345 m!105461))

(assert (=> b!66345 m!105205))

(assert (=> b!66345 m!105211))

(declare-fun m!105463 () Bool)

(assert (=> b!66347 m!105463))

(declare-fun m!105465 () Bool)

(assert (=> b!66346 m!105465))

(assert (=> b!66219 d!20796))

(declare-fun d!20798 () Bool)

(declare-fun res!55004 () Bool)

(declare-fun e!43582 () Bool)

(assert (=> d!20798 (=> (not res!55004) (not e!43582))))

(assert (=> d!20798 (= res!55004 (= (size!1314 (buf!1695 (_2!3041 lt!105009))) (size!1314 (buf!1695 (_2!3041 lt!104999)))))))

(assert (=> d!20798 (= (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!104999)) e!43582)))

(declare-fun b!66349 () Bool)

(declare-fun res!55003 () Bool)

(assert (=> b!66349 (=> (not res!55003) (not e!43582))))

(assert (=> b!66349 (= res!55003 (bvsle (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))) (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!104999))) (currentByte!3367 (_2!3041 lt!104999)) (currentBit!3362 (_2!3041 lt!104999)))))))

(declare-fun b!66350 () Bool)

(declare-fun e!43581 () Bool)

(assert (=> b!66350 (= e!43582 e!43581)))

(declare-fun res!55005 () Bool)

(assert (=> b!66350 (=> res!55005 e!43581)))

(assert (=> b!66350 (= res!55005 (= (size!1314 (buf!1695 (_2!3041 lt!105009))) #b00000000000000000000000000000000))))

(declare-fun b!66351 () Bool)

(assert (=> b!66351 (= e!43581 (arrayBitRangesEq!0 (buf!1695 (_2!3041 lt!105009)) (buf!1695 (_2!3041 lt!104999)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009)))))))

(assert (= (and d!20798 res!55004) b!66349))

(assert (= (and b!66349 res!55003) b!66350))

(assert (= (and b!66350 (not res!55005)) b!66351))

(assert (=> b!66349 m!105205))

(assert (=> b!66349 m!105247))

(assert (=> b!66351 m!105205))

(assert (=> b!66351 m!105205))

(declare-fun m!105467 () Bool)

(assert (=> b!66351 m!105467))

(assert (=> b!66219 d!20798))

(declare-fun d!20800 () Bool)

(assert (=> d!20800 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5063 () Bool)

(assert (= bs!5063 d!20800))

(declare-fun m!105469 () Bool)

(assert (=> bs!5063 m!105469))

(assert (=> b!66219 d!20800))

(declare-fun d!20802 () Bool)

(assert (=> d!20802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105223 () Unit!4465)

(assert (=> d!20802 (= lt!105223 (choose!9 thiss!1379 (buf!1695 (_2!3041 lt!105009)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2263 (buf!1695 (_2!3041 lt!105009)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379))))))

(assert (=> d!20802 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1695 (_2!3041 lt!105009)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105223)))

(declare-fun bs!5064 () Bool)

(assert (= bs!5064 d!20802))

(assert (=> bs!5064 m!105195))

(declare-fun m!105471 () Bool)

(assert (=> bs!5064 m!105471))

(assert (=> b!66219 d!20802))

(declare-fun d!20804 () Bool)

(assert (=> d!20804 (isPrefixOf!0 thiss!1379 (_2!3041 lt!104999))))

(declare-fun lt!105226 () Unit!4465)

(declare-fun choose!30 (BitStream!2262 BitStream!2262 BitStream!2262) Unit!4465)

(assert (=> d!20804 (= lt!105226 (choose!30 thiss!1379 (_2!3041 lt!105009) (_2!3041 lt!104999)))))

(assert (=> d!20804 (isPrefixOf!0 thiss!1379 (_2!3041 lt!105009))))

(assert (=> d!20804 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3041 lt!105009) (_2!3041 lt!104999)) lt!105226)))

(declare-fun bs!5065 () Bool)

(assert (= bs!5065 d!20804))

(assert (=> bs!5065 m!105187))

(declare-fun m!105473 () Bool)

(assert (=> bs!5065 m!105473))

(assert (=> bs!5065 m!105219))

(assert (=> b!66219 d!20804))

(declare-fun b!66520 () Bool)

(declare-fun res!55100 () Bool)

(declare-fun e!43666 () Bool)

(assert (=> b!66520 (=> (not res!55100) (not e!43666))))

(declare-fun lt!105630 () tuple2!5860)

(assert (=> b!66520 (= res!55100 (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!105630)))))

(declare-fun call!847 () tuple2!5862)

(declare-fun lt!105622 () tuple2!5860)

(declare-fun c!4849 () Bool)

(declare-fun bm!844 () Bool)

(declare-fun lt!105627 () tuple2!5860)

(assert (=> bm!844 (= call!847 (reader!0 (ite c!4849 (_2!3041 lt!105622) (_2!3041 lt!105009)) (ite c!4849 (_2!3041 lt!105627) (_2!3041 lt!105009))))))

(declare-fun b!66521 () Bool)

(declare-fun res!55098 () Bool)

(assert (=> b!66521 (=> (not res!55098) (not e!43666))))

(assert (=> b!66521 (= res!55098 (= (size!1314 (buf!1695 (_2!3041 lt!105630))) (size!1314 (buf!1695 (_2!3041 lt!105009)))))))

(declare-fun d!20806 () Bool)

(assert (=> d!20806 e!43666))

(declare-fun res!55102 () Bool)

(assert (=> d!20806 (=> (not res!55102) (not e!43666))))

(declare-fun lt!105628 () (_ BitVec 64))

(assert (=> d!20806 (= res!55102 (= (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105630))) (currentByte!3367 (_2!3041 lt!105630)) (currentBit!3362 (_2!3041 lt!105630))) (bvsub lt!105628 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20806 (or (= (bvand lt!105628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105628 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!105625 () (_ BitVec 64))

(assert (=> d!20806 (= lt!105628 (bvadd lt!105625 to!314))))

(assert (=> d!20806 (or (not (= (bvand lt!105625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!105625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!105625 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20806 (= lt!105625 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))))))

(declare-fun e!43665 () tuple2!5860)

(assert (=> d!20806 (= lt!105630 e!43665)))

(assert (=> d!20806 (= c!4849 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!105651 () Unit!4465)

(declare-fun lt!105638 () Unit!4465)

(assert (=> d!20806 (= lt!105651 lt!105638)))

(assert (=> d!20806 (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!105009))))

(assert (=> d!20806 (= lt!105638 (lemmaIsPrefixRefl!0 (_2!3041 lt!105009)))))

(declare-fun lt!105631 () (_ BitVec 64))

(assert (=> d!20806 (= lt!105631 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))))))

(assert (=> d!20806 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20806 (= (appendBitsMSBFirstLoop!0 (_2!3041 lt!105009) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!105630)))

(declare-fun b!66522 () Bool)

(declare-fun res!55101 () Bool)

(assert (=> b!66522 (=> (not res!55101) (not e!43666))))

(assert (=> b!66522 (= res!55101 (invariant!0 (currentBit!3362 (_2!3041 lt!105630)) (currentByte!3367 (_2!3041 lt!105630)) (size!1314 (buf!1695 (_2!3041 lt!105630)))))))

(declare-fun b!66523 () Bool)

(declare-fun res!55099 () Bool)

(assert (=> b!66523 (=> (not res!55099) (not e!43666))))

(assert (=> b!66523 (= res!55099 (= (size!1314 (buf!1695 (_2!3041 lt!105009))) (size!1314 (buf!1695 (_2!3041 lt!105630)))))))

(declare-fun b!66524 () Bool)

(declare-fun Unit!4472 () Unit!4465)

(assert (=> b!66524 (= e!43665 (tuple2!5861 Unit!4472 (_2!3041 lt!105627)))))

(assert (=> b!66524 (= lt!105622 (appendBitFromByte!0 (_2!3041 lt!105009) (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!105618 () (_ BitVec 64))

(assert (=> b!66524 (= lt!105618 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105620 () (_ BitVec 64))

(assert (=> b!66524 (= lt!105620 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105637 () Unit!4465)

(assert (=> b!66524 (= lt!105637 (validateOffsetBitsIneqLemma!0 (_2!3041 lt!105009) (_2!3041 lt!105622) lt!105618 lt!105620))))

(assert (=> b!66524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105622)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105622))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105622))) (bvsub lt!105618 lt!105620))))

(declare-fun lt!105623 () Unit!4465)

(assert (=> b!66524 (= lt!105623 lt!105637)))

(declare-fun lt!105646 () tuple2!5862)

(assert (=> b!66524 (= lt!105646 (reader!0 (_2!3041 lt!105009) (_2!3041 lt!105622)))))

(declare-fun lt!105645 () (_ BitVec 64))

(assert (=> b!66524 (= lt!105645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105629 () Unit!4465)

(assert (=> b!66524 (= lt!105629 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3041 lt!105009) (buf!1695 (_2!3041 lt!105622)) lt!105645))))

(assert (=> b!66524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105622)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105645)))

(declare-fun lt!105635 () Unit!4465)

(assert (=> b!66524 (= lt!105635 lt!105629)))

(assert (=> b!66524 (= (head!525 (byteArrayBitContentToList!0 (_2!3041 lt!105622) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!525 (bitStreamReadBitsIntoList!0 (_2!3041 lt!105622) (_1!3042 lt!105646) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!105650 () Unit!4465)

(declare-fun Unit!4473 () Unit!4465)

(assert (=> b!66524 (= lt!105650 Unit!4473)))

(assert (=> b!66524 (= lt!105627 (appendBitsMSBFirstLoop!0 (_2!3041 lt!105622) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!105655 () Unit!4465)

(assert (=> b!66524 (= lt!105655 (lemmaIsPrefixTransitive!0 (_2!3041 lt!105009) (_2!3041 lt!105622) (_2!3041 lt!105627)))))

(assert (=> b!66524 (isPrefixOf!0 (_2!3041 lt!105009) (_2!3041 lt!105627))))

(declare-fun lt!105652 () Unit!4465)

(assert (=> b!66524 (= lt!105652 lt!105655)))

(assert (=> b!66524 (= (size!1314 (buf!1695 (_2!3041 lt!105627))) (size!1314 (buf!1695 (_2!3041 lt!105009))))))

(declare-fun lt!105639 () Unit!4465)

(declare-fun Unit!4474 () Unit!4465)

(assert (=> b!66524 (= lt!105639 Unit!4474)))

(assert (=> b!66524 (= (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105627))) (currentByte!3367 (_2!3041 lt!105627)) (currentBit!3362 (_2!3041 lt!105627))) (bvsub (bvadd (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105614 () Unit!4465)

(declare-fun Unit!4475 () Unit!4465)

(assert (=> b!66524 (= lt!105614 Unit!4475)))

(assert (=> b!66524 (= (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105627))) (currentByte!3367 (_2!3041 lt!105627)) (currentBit!3362 (_2!3041 lt!105627))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105622))) (currentByte!3367 (_2!3041 lt!105622)) (currentBit!3362 (_2!3041 lt!105622))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105619 () Unit!4465)

(declare-fun Unit!4476 () Unit!4465)

(assert (=> b!66524 (= lt!105619 Unit!4476)))

(declare-fun lt!105624 () tuple2!5862)

(assert (=> b!66524 (= lt!105624 (reader!0 (_2!3041 lt!105009) (_2!3041 lt!105627)))))

(declare-fun lt!105657 () (_ BitVec 64))

(assert (=> b!66524 (= lt!105657 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105634 () Unit!4465)

(assert (=> b!66524 (= lt!105634 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3041 lt!105009) (buf!1695 (_2!3041 lt!105627)) lt!105657))))

(assert (=> b!66524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105627)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105657)))

(declare-fun lt!105633 () Unit!4465)

(assert (=> b!66524 (= lt!105633 lt!105634)))

(declare-fun lt!105632 () tuple2!5862)

(assert (=> b!66524 (= lt!105632 call!847)))

(declare-fun lt!105621 () (_ BitVec 64))

(assert (=> b!66524 (= lt!105621 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105653 () Unit!4465)

(assert (=> b!66524 (= lt!105653 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3041 lt!105622) (buf!1695 (_2!3041 lt!105627)) lt!105621))))

(assert (=> b!66524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105627)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105622))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105622))) lt!105621)))

(declare-fun lt!105641 () Unit!4465)

(assert (=> b!66524 (= lt!105641 lt!105653)))

(declare-fun lt!105647 () List!706)

(assert (=> b!66524 (= lt!105647 (byteArrayBitContentToList!0 (_2!3041 lt!105627) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!105643 () List!706)

(assert (=> b!66524 (= lt!105643 (byteArrayBitContentToList!0 (_2!3041 lt!105627) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!105640 () List!706)

(assert (=> b!66524 (= lt!105640 (bitStreamReadBitsIntoList!0 (_2!3041 lt!105627) (_1!3042 lt!105624) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!105616 () List!706)

(assert (=> b!66524 (= lt!105616 (bitStreamReadBitsIntoList!0 (_2!3041 lt!105627) (_1!3042 lt!105632) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!105642 () (_ BitVec 64))

(assert (=> b!66524 (= lt!105642 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105626 () Unit!4465)

(assert (=> b!66524 (= lt!105626 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3041 lt!105627) (_2!3041 lt!105627) (_1!3042 lt!105624) (_1!3042 lt!105632) lt!105642 lt!105640))))

(assert (=> b!66524 (= (bitStreamReadBitsIntoList!0 (_2!3041 lt!105627) (_1!3042 lt!105632) (bvsub lt!105642 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!310 lt!105640))))

(declare-fun lt!105656 () Unit!4465)

(assert (=> b!66524 (= lt!105656 lt!105626)))

(declare-fun lt!105617 () Unit!4465)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2850 array!2850 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4465)

(assert (=> b!66524 (= lt!105617 (arrayBitRangesEqImpliesEq!0 (buf!1695 (_2!3041 lt!105622)) (buf!1695 (_2!3041 lt!105627)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!105631 (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105622))) (currentByte!3367 (_2!3041 lt!105622)) (currentBit!3362 (_2!3041 lt!105622)))))))

(assert (=> b!66524 (= (bitAt!0 (buf!1695 (_2!3041 lt!105622)) lt!105631) (bitAt!0 (buf!1695 (_2!3041 lt!105627)) lt!105631))))

(declare-fun lt!105649 () Unit!4465)

(assert (=> b!66524 (= lt!105649 lt!105617)))

(declare-fun b!66525 () Bool)

(declare-fun Unit!4477 () Unit!4465)

(assert (=> b!66525 (= e!43665 (tuple2!5861 Unit!4477 (_2!3041 lt!105009)))))

(assert (=> b!66525 (= (size!1314 (buf!1695 (_2!3041 lt!105009))) (size!1314 (buf!1695 (_2!3041 lt!105009))))))

(declare-fun lt!105644 () Unit!4465)

(declare-fun Unit!4478 () Unit!4465)

(assert (=> b!66525 (= lt!105644 Unit!4478)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2262 array!2850 array!2850 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5872 0))(
  ( (tuple2!5873 (_1!3047 array!2850) (_2!3047 BitStream!2262)) )
))
(declare-fun readBits!0 (BitStream!2262 (_ BitVec 64)) tuple2!5872)

(assert (=> b!66525 (checkByteArrayBitContent!0 (_2!3041 lt!105009) srcBuffer!2 (_1!3047 (readBits!0 (_1!3042 call!847) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105654 () tuple2!5862)

(declare-fun b!66526 () Bool)

(assert (=> b!66526 (= e!43666 (= (bitStreamReadBitsIntoList!0 (_2!3041 lt!105630) (_1!3042 lt!105654) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3041 lt!105630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!66526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!105615 () Unit!4465)

(declare-fun lt!105636 () Unit!4465)

(assert (=> b!66526 (= lt!105615 lt!105636)))

(declare-fun lt!105648 () (_ BitVec 64))

(assert (=> b!66526 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105630)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105648)))

(assert (=> b!66526 (= lt!105636 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3041 lt!105009) (buf!1695 (_2!3041 lt!105630)) lt!105648))))

(declare-fun e!43667 () Bool)

(assert (=> b!66526 e!43667))

(declare-fun res!55097 () Bool)

(assert (=> b!66526 (=> (not res!55097) (not e!43667))))

(assert (=> b!66526 (= res!55097 (and (= (size!1314 (buf!1695 (_2!3041 lt!105009))) (size!1314 (buf!1695 (_2!3041 lt!105630)))) (bvsge lt!105648 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66526 (= lt!105648 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!66526 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66526 (= lt!105654 (reader!0 (_2!3041 lt!105009) (_2!3041 lt!105630)))))

(declare-fun b!66527 () Bool)

(assert (=> b!66527 (= e!43667 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105648))))

(assert (= (and d!20806 c!4849) b!66524))

(assert (= (and d!20806 (not c!4849)) b!66525))

(assert (= (or b!66524 b!66525) bm!844))

(assert (= (and d!20806 res!55102) b!66522))

(assert (= (and b!66522 res!55101) b!66523))

(assert (= (and b!66523 res!55099) b!66520))

(assert (= (and b!66520 res!55100) b!66521))

(assert (= (and b!66521 res!55098) b!66526))

(assert (= (and b!66526 res!55097) b!66527))

(declare-fun m!105737 () Bool)

(assert (=> b!66526 m!105737))

(declare-fun m!105739 () Bool)

(assert (=> b!66526 m!105739))

(declare-fun m!105741 () Bool)

(assert (=> b!66526 m!105741))

(declare-fun m!105743 () Bool)

(assert (=> b!66526 m!105743))

(declare-fun m!105745 () Bool)

(assert (=> b!66526 m!105745))

(declare-fun m!105747 () Bool)

(assert (=> bm!844 m!105747))

(declare-fun m!105749 () Bool)

(assert (=> b!66520 m!105749))

(declare-fun m!105751 () Bool)

(assert (=> b!66524 m!105751))

(declare-fun m!105753 () Bool)

(assert (=> b!66524 m!105753))

(declare-fun m!105755 () Bool)

(assert (=> b!66524 m!105755))

(declare-fun m!105757 () Bool)

(assert (=> b!66524 m!105757))

(declare-fun m!105759 () Bool)

(assert (=> b!66524 m!105759))

(declare-fun m!105761 () Bool)

(assert (=> b!66524 m!105761))

(declare-fun m!105763 () Bool)

(assert (=> b!66524 m!105763))

(declare-fun m!105765 () Bool)

(assert (=> b!66524 m!105765))

(declare-fun m!105767 () Bool)

(assert (=> b!66524 m!105767))

(declare-fun m!105769 () Bool)

(assert (=> b!66524 m!105769))

(declare-fun m!105771 () Bool)

(assert (=> b!66524 m!105771))

(declare-fun m!105773 () Bool)

(assert (=> b!66524 m!105773))

(declare-fun m!105775 () Bool)

(assert (=> b!66524 m!105775))

(declare-fun m!105777 () Bool)

(assert (=> b!66524 m!105777))

(declare-fun m!105779 () Bool)

(assert (=> b!66524 m!105779))

(declare-fun m!105781 () Bool)

(assert (=> b!66524 m!105781))

(declare-fun m!105783 () Bool)

(assert (=> b!66524 m!105783))

(declare-fun m!105785 () Bool)

(assert (=> b!66524 m!105785))

(assert (=> b!66524 m!105773))

(declare-fun m!105787 () Bool)

(assert (=> b!66524 m!105787))

(declare-fun m!105789 () Bool)

(assert (=> b!66524 m!105789))

(declare-fun m!105791 () Bool)

(assert (=> b!66524 m!105791))

(declare-fun m!105793 () Bool)

(assert (=> b!66524 m!105793))

(assert (=> b!66524 m!105205))

(assert (=> b!66524 m!105757))

(declare-fun m!105795 () Bool)

(assert (=> b!66524 m!105795))

(declare-fun m!105797 () Bool)

(assert (=> b!66524 m!105797))

(declare-fun m!105799 () Bool)

(assert (=> b!66524 m!105799))

(assert (=> b!66524 m!105775))

(declare-fun m!105801 () Bool)

(assert (=> b!66524 m!105801))

(declare-fun m!105803 () Bool)

(assert (=> b!66524 m!105803))

(declare-fun m!105805 () Bool)

(assert (=> b!66524 m!105805))

(declare-fun m!105807 () Bool)

(assert (=> b!66524 m!105807))

(assert (=> b!66524 m!105785))

(declare-fun m!105809 () Bool)

(assert (=> b!66524 m!105809))

(declare-fun m!105811 () Bool)

(assert (=> b!66524 m!105811))

(declare-fun m!105813 () Bool)

(assert (=> b!66525 m!105813))

(declare-fun m!105815 () Bool)

(assert (=> b!66525 m!105815))

(declare-fun m!105817 () Bool)

(assert (=> d!20806 m!105817))

(assert (=> d!20806 m!105205))

(assert (=> d!20806 m!105395))

(assert (=> d!20806 m!105399))

(declare-fun m!105819 () Bool)

(assert (=> b!66527 m!105819))

(declare-fun m!105821 () Bool)

(assert (=> b!66522 m!105821))

(assert (=> b!66219 d!20806))

(declare-fun d!20914 () Bool)

(assert (=> d!20914 (= (array_inv!1190 srcBuffer!2) (bvsge (size!1314 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12884 d!20914))

(declare-fun d!20916 () Bool)

(assert (=> d!20916 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3362 thiss!1379) (currentByte!3367 thiss!1379) (size!1314 (buf!1695 thiss!1379))))))

(declare-fun bs!5086 () Bool)

(assert (= bs!5086 d!20916))

(declare-fun m!105823 () Bool)

(assert (=> bs!5086 m!105823))

(assert (=> start!12884 d!20916))

(declare-fun d!20918 () Bool)

(assert (=> d!20918 (= (head!525 (byteArrayBitContentToList!0 (_2!3041 lt!105009) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!821 (byteArrayBitContentToList!0 (_2!3041 lt!105009) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66220 d!20918))

(declare-fun d!20920 () Bool)

(declare-fun c!4850 () Bool)

(assert (=> d!20920 (= c!4850 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43668 () List!706)

(assert (=> d!20920 (= (byteArrayBitContentToList!0 (_2!3041 lt!105009) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!43668)))

(declare-fun b!66528 () Bool)

(assert (=> b!66528 (= e!43668 Nil!703)))

(declare-fun b!66529 () Bool)

(assert (=> b!66529 (= e!43668 (Cons!702 (not (= (bvand ((_ sign_extend 24) (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3041 lt!105009) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20920 c!4850) b!66528))

(assert (= (and d!20920 (not c!4850)) b!66529))

(assert (=> b!66529 m!105213))

(assert (=> b!66529 m!105351))

(declare-fun m!105825 () Bool)

(assert (=> b!66529 m!105825))

(assert (=> b!66220 d!20920))

(declare-fun d!20922 () Bool)

(assert (=> d!20922 (= (head!525 (bitStreamReadBitsIntoList!0 (_2!3041 lt!105009) (_1!3042 lt!104997) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!821 (bitStreamReadBitsIntoList!0 (_2!3041 lt!105009) (_1!3042 lt!104997) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66220 d!20922))

(declare-fun lt!105658 () tuple2!5870)

(declare-fun e!43669 () tuple2!5868)

(declare-fun b!66531 () Bool)

(declare-fun lt!105659 () (_ BitVec 64))

(assert (=> b!66531 (= e!43669 (tuple2!5869 (Cons!702 (_1!3046 lt!105658) (bitStreamReadBitsIntoList!0 (_2!3041 lt!105009) (_2!3046 lt!105658) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!105659))) (_2!3046 lt!105658)))))

(assert (=> b!66531 (= lt!105658 (readBit!0 (_1!3042 lt!104997)))))

(assert (=> b!66531 (= lt!105659 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66533 () Bool)

(declare-fun e!43670 () Bool)

(declare-fun lt!105660 () List!706)

(assert (=> b!66533 (= e!43670 (> (length!334 lt!105660) 0))))

(declare-fun b!66532 () Bool)

(assert (=> b!66532 (= e!43670 (isEmpty!207 lt!105660))))

(declare-fun b!66530 () Bool)

(assert (=> b!66530 (= e!43669 (tuple2!5869 Nil!703 (_1!3042 lt!104997)))))

(declare-fun d!20924 () Bool)

(assert (=> d!20924 e!43670))

(declare-fun c!4852 () Bool)

(assert (=> d!20924 (= c!4852 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20924 (= lt!105660 (_1!3045 e!43669))))

(declare-fun c!4851 () Bool)

(assert (=> d!20924 (= c!4851 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20924 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20924 (= (bitStreamReadBitsIntoList!0 (_2!3041 lt!105009) (_1!3042 lt!104997) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105660)))

(assert (= (and d!20924 c!4851) b!66530))

(assert (= (and d!20924 (not c!4851)) b!66531))

(assert (= (and d!20924 c!4852) b!66532))

(assert (= (and d!20924 (not c!4852)) b!66533))

(declare-fun m!105827 () Bool)

(assert (=> b!66531 m!105827))

(declare-fun m!105829 () Bool)

(assert (=> b!66531 m!105829))

(declare-fun m!105831 () Bool)

(assert (=> b!66533 m!105831))

(declare-fun m!105833 () Bool)

(assert (=> b!66532 m!105833))

(assert (=> b!66220 d!20924))

(declare-fun d!20926 () Bool)

(declare-fun e!43671 () Bool)

(assert (=> d!20926 e!43671))

(declare-fun res!55103 () Bool)

(assert (=> d!20926 (=> (not res!55103) (not e!43671))))

(declare-fun lt!105664 () (_ BitVec 64))

(declare-fun lt!105661 () (_ BitVec 64))

(declare-fun lt!105666 () (_ BitVec 64))

(assert (=> d!20926 (= res!55103 (= lt!105661 (bvsub lt!105664 lt!105666)))))

(assert (=> d!20926 (or (= (bvand lt!105664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105664 lt!105666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20926 (= lt!105666 (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!104999))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!104999)))))))

(declare-fun lt!105662 () (_ BitVec 64))

(declare-fun lt!105663 () (_ BitVec 64))

(assert (=> d!20926 (= lt!105664 (bvmul lt!105662 lt!105663))))

(assert (=> d!20926 (or (= lt!105662 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105663 (bvsdiv (bvmul lt!105662 lt!105663) lt!105662)))))

(assert (=> d!20926 (= lt!105663 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20926 (= lt!105662 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))))))

(assert (=> d!20926 (= lt!105661 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!104999))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!104999)))))))

(assert (=> d!20926 (invariant!0 (currentBit!3362 (_2!3041 lt!104999)) (currentByte!3367 (_2!3041 lt!104999)) (size!1314 (buf!1695 (_2!3041 lt!104999))))))

(assert (=> d!20926 (= (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!104999))) (currentByte!3367 (_2!3041 lt!104999)) (currentBit!3362 (_2!3041 lt!104999))) lt!105661)))

(declare-fun b!66534 () Bool)

(declare-fun res!55104 () Bool)

(assert (=> b!66534 (=> (not res!55104) (not e!43671))))

(assert (=> b!66534 (= res!55104 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105661))))

(declare-fun b!66535 () Bool)

(declare-fun lt!105665 () (_ BitVec 64))

(assert (=> b!66535 (= e!43671 (bvsle lt!105661 (bvmul lt!105665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66535 (or (= lt!105665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105665)))))

(assert (=> b!66535 (= lt!105665 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!104999)))))))

(assert (= (and d!20926 res!55103) b!66534))

(assert (= (and b!66534 res!55104) b!66535))

(declare-fun m!105835 () Bool)

(assert (=> d!20926 m!105835))

(assert (=> d!20926 m!105177))

(assert (=> b!66209 d!20926))

(declare-fun d!20928 () Bool)

(assert (=> d!20928 (= (invariant!0 (currentBit!3362 (_2!3041 lt!105009)) (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!104999)))) (and (bvsge (currentBit!3362 (_2!3041 lt!105009)) #b00000000000000000000000000000000) (bvslt (currentBit!3362 (_2!3041 lt!105009)) #b00000000000000000000000000001000) (bvsge (currentByte!3367 (_2!3041 lt!105009)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!104999)))) (and (= (currentBit!3362 (_2!3041 lt!105009)) #b00000000000000000000000000000000) (= (currentByte!3367 (_2!3041 lt!105009)) (size!1314 (buf!1695 (_2!3041 lt!104999))))))))))

(assert (=> b!66210 d!20928))

(declare-fun d!20930 () Bool)

(declare-fun res!55106 () Bool)

(declare-fun e!43673 () Bool)

(assert (=> d!20930 (=> (not res!55106) (not e!43673))))

(assert (=> d!20930 (= res!55106 (= (size!1314 (buf!1695 thiss!1379)) (size!1314 (buf!1695 (_2!3041 lt!105009)))))))

(assert (=> d!20930 (= (isPrefixOf!0 thiss!1379 (_2!3041 lt!105009)) e!43673)))

(declare-fun b!66536 () Bool)

(declare-fun res!55105 () Bool)

(assert (=> b!66536 (=> (not res!55105) (not e!43673))))

(assert (=> b!66536 (= res!55105 (bvsle (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)) (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105009))) (currentByte!3367 (_2!3041 lt!105009)) (currentBit!3362 (_2!3041 lt!105009)))))))

(declare-fun b!66537 () Bool)

(declare-fun e!43672 () Bool)

(assert (=> b!66537 (= e!43673 e!43672)))

(declare-fun res!55107 () Bool)

(assert (=> b!66537 (=> res!55107 e!43672)))

(assert (=> b!66537 (= res!55107 (= (size!1314 (buf!1695 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66538 () Bool)

(assert (=> b!66538 (= e!43672 (arrayBitRangesEq!0 (buf!1695 thiss!1379) (buf!1695 (_2!3041 lt!105009)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379))))))

(assert (= (and d!20930 res!55106) b!66536))

(assert (= (and b!66536 res!55105) b!66537))

(assert (= (and b!66537 (not res!55107)) b!66538))

(assert (=> b!66536 m!105211))

(assert (=> b!66536 m!105205))

(assert (=> b!66538 m!105211))

(assert (=> b!66538 m!105211))

(declare-fun m!105837 () Bool)

(assert (=> b!66538 m!105837))

(assert (=> b!66221 d!20930))

(declare-fun d!20932 () Bool)

(assert (=> d!20932 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) lt!105008) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009)))) lt!105008))))

(declare-fun bs!5087 () Bool)

(assert (= bs!5087 d!20932))

(assert (=> bs!5087 m!105361))

(assert (=> b!66221 d!20932))

(declare-fun d!20934 () Bool)

(declare-fun e!43676 () Bool)

(assert (=> d!20934 e!43676))

(declare-fun res!55110 () Bool)

(assert (=> d!20934 (=> (not res!55110) (not e!43676))))

(assert (=> d!20934 (= res!55110 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!105669 () Unit!4465)

(declare-fun choose!27 (BitStream!2262 BitStream!2262 (_ BitVec 64) (_ BitVec 64)) Unit!4465)

(assert (=> d!20934 (= lt!105669 (choose!27 thiss!1379 (_2!3041 lt!105009) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20934 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20934 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3041 lt!105009) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105669)))

(declare-fun b!66541 () Bool)

(assert (=> b!66541 (= e!43676 (validate_offset_bits!1 ((_ sign_extend 32) (size!1314 (buf!1695 (_2!3041 lt!105009)))) ((_ sign_extend 32) (currentByte!3367 (_2!3041 lt!105009))) ((_ sign_extend 32) (currentBit!3362 (_2!3041 lt!105009))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20934 res!55110) b!66541))

(declare-fun m!105839 () Bool)

(assert (=> d!20934 m!105839))

(declare-fun m!105841 () Bool)

(assert (=> b!66541 m!105841))

(assert (=> b!66221 d!20934))

(declare-fun b!66559 () Bool)

(declare-fun res!55133 () Bool)

(declare-fun e!43686 () Bool)

(assert (=> b!66559 (=> (not res!55133) (not e!43686))))

(declare-fun lt!105695 () tuple2!5860)

(assert (=> b!66559 (= res!55133 (= (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105695))) (currentByte!3367 (_2!3041 lt!105695)) (currentBit!3362 (_2!3041 lt!105695))) (bvadd (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!66560 () Bool)

(declare-fun e!43685 () Bool)

(declare-datatypes ((tuple2!5874 0))(
  ( (tuple2!5875 (_1!3048 BitStream!2262) (_2!3048 Bool)) )
))
(declare-fun lt!105703 () tuple2!5874)

(declare-fun lt!105697 () tuple2!5860)

(assert (=> b!66560 (= e!43685 (= (bitIndex!0 (size!1314 (buf!1695 (_1!3048 lt!105703))) (currentByte!3367 (_1!3048 lt!105703)) (currentBit!3362 (_1!3048 lt!105703))) (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105697))) (currentByte!3367 (_2!3041 lt!105697)) (currentBit!3362 (_2!3041 lt!105697)))))))

(declare-fun b!66561 () Bool)

(declare-fun res!55130 () Bool)

(declare-fun e!43687 () Bool)

(assert (=> b!66561 (=> (not res!55130) (not e!43687))))

(declare-fun lt!105698 () (_ BitVec 64))

(declare-fun lt!105699 () (_ BitVec 64))

(assert (=> b!66561 (= res!55130 (= (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105697))) (currentByte!3367 (_2!3041 lt!105697)) (currentBit!3362 (_2!3041 lt!105697))) (bvadd lt!105699 lt!105698)))))

(assert (=> b!66561 (or (not (= (bvand lt!105699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105698 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!105699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!105699 lt!105698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66561 (= lt!105698 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!66561 (= lt!105699 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)))))

(declare-fun b!66562 () Bool)

(declare-fun res!55131 () Bool)

(assert (=> b!66562 (=> (not res!55131) (not e!43687))))

(assert (=> b!66562 (= res!55131 (isPrefixOf!0 thiss!1379 (_2!3041 lt!105697)))))

(declare-fun b!66563 () Bool)

(declare-fun res!55128 () Bool)

(assert (=> b!66563 (=> (not res!55128) (not e!43686))))

(assert (=> b!66563 (= res!55128 (isPrefixOf!0 thiss!1379 (_2!3041 lt!105695)))))

(declare-fun b!66564 () Bool)

(declare-fun e!43688 () Bool)

(assert (=> b!66564 (= e!43686 e!43688)))

(declare-fun res!55132 () Bool)

(assert (=> b!66564 (=> (not res!55132) (not e!43688))))

(declare-fun lt!105705 () Bool)

(declare-fun lt!105696 () tuple2!5874)

(assert (=> b!66564 (= res!55132 (and (= (_2!3048 lt!105696) lt!105705) (= (_1!3048 lt!105696) (_2!3041 lt!105695))))))

(declare-fun readBitPure!0 (BitStream!2262) tuple2!5874)

(declare-fun readerFrom!0 (BitStream!2262 (_ BitVec 32) (_ BitVec 32)) BitStream!2262)

(assert (=> b!66564 (= lt!105696 (readBitPure!0 (readerFrom!0 (_2!3041 lt!105695) (currentBit!3362 thiss!1379) (currentByte!3367 thiss!1379))))))

(declare-fun d!20936 () Bool)

(assert (=> d!20936 e!43687))

(declare-fun res!55129 () Bool)

(assert (=> d!20936 (=> (not res!55129) (not e!43687))))

(assert (=> d!20936 (= res!55129 (= (size!1314 (buf!1695 (_2!3041 lt!105697))) (size!1314 (buf!1695 thiss!1379))))))

(declare-fun lt!105704 () (_ BitVec 8))

(declare-fun lt!105701 () array!2850)

(assert (=> d!20936 (= lt!105704 (select (arr!1878 lt!105701) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20936 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1314 lt!105701)))))

(assert (=> d!20936 (= lt!105701 (array!2851 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!105700 () tuple2!5860)

(assert (=> d!20936 (= lt!105697 (tuple2!5861 (_1!3041 lt!105700) (_2!3041 lt!105700)))))

(assert (=> d!20936 (= lt!105700 lt!105695)))

(assert (=> d!20936 e!43686))

(declare-fun res!55127 () Bool)

(assert (=> d!20936 (=> (not res!55127) (not e!43686))))

(assert (=> d!20936 (= res!55127 (= (size!1314 (buf!1695 thiss!1379)) (size!1314 (buf!1695 (_2!3041 lt!105695)))))))

(declare-fun appendBit!0 (BitStream!2262 Bool) tuple2!5860)

(assert (=> d!20936 (= lt!105695 (appendBit!0 thiss!1379 lt!105705))))

(assert (=> d!20936 (= lt!105705 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20936 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20936 (= (appendBitFromByte!0 thiss!1379 (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!105697)))

(declare-fun b!66565 () Bool)

(assert (=> b!66565 (= e!43688 (= (bitIndex!0 (size!1314 (buf!1695 (_1!3048 lt!105696))) (currentByte!3367 (_1!3048 lt!105696)) (currentBit!3362 (_1!3048 lt!105696))) (bitIndex!0 (size!1314 (buf!1695 (_2!3041 lt!105695))) (currentByte!3367 (_2!3041 lt!105695)) (currentBit!3362 (_2!3041 lt!105695)))))))

(declare-fun b!66566 () Bool)

(assert (=> b!66566 (= e!43687 e!43685)))

(declare-fun res!55134 () Bool)

(assert (=> b!66566 (=> (not res!55134) (not e!43685))))

(assert (=> b!66566 (= res!55134 (and (= (_2!3048 lt!105703) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1878 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!105704)) #b00000000000000000000000000000000))) (= (_1!3048 lt!105703) (_2!3041 lt!105697))))))

(declare-fun lt!105702 () tuple2!5872)

(declare-fun lt!105694 () BitStream!2262)

(assert (=> b!66566 (= lt!105702 (readBits!0 lt!105694 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!66566 (= lt!105703 (readBitPure!0 lt!105694))))

(assert (=> b!66566 (= lt!105694 (readerFrom!0 (_2!3041 lt!105697) (currentBit!3362 thiss!1379) (currentByte!3367 thiss!1379)))))

(assert (= (and d!20936 res!55127) b!66559))

(assert (= (and b!66559 res!55133) b!66563))

(assert (= (and b!66563 res!55128) b!66564))

(assert (= (and b!66564 res!55132) b!66565))

(assert (= (and d!20936 res!55129) b!66561))

(assert (= (and b!66561 res!55130) b!66562))

(assert (= (and b!66562 res!55131) b!66566))

(assert (= (and b!66566 res!55134) b!66560))

(declare-fun m!105843 () Bool)

(assert (=> d!20936 m!105843))

(declare-fun m!105845 () Bool)

(assert (=> d!20936 m!105845))

(assert (=> d!20936 m!105351))

(declare-fun m!105847 () Bool)

(assert (=> b!66564 m!105847))

(assert (=> b!66564 m!105847))

(declare-fun m!105849 () Bool)

(assert (=> b!66564 m!105849))

(declare-fun m!105851 () Bool)

(assert (=> b!66563 m!105851))

(declare-fun m!105853 () Bool)

(assert (=> b!66559 m!105853))

(assert (=> b!66559 m!105211))

(declare-fun m!105855 () Bool)

(assert (=> b!66560 m!105855))

(declare-fun m!105857 () Bool)

(assert (=> b!66560 m!105857))

(declare-fun m!105859 () Bool)

(assert (=> b!66566 m!105859))

(declare-fun m!105861 () Bool)

(assert (=> b!66566 m!105861))

(declare-fun m!105863 () Bool)

(assert (=> b!66566 m!105863))

(declare-fun m!105865 () Bool)

(assert (=> b!66565 m!105865))

(assert (=> b!66565 m!105853))

(declare-fun m!105867 () Bool)

(assert (=> b!66562 m!105867))

(assert (=> b!66561 m!105857))

(assert (=> b!66561 m!105211))

(assert (=> b!66221 d!20936))

(declare-fun d!20938 () Bool)

(assert (=> d!20938 (= (bitAt!0 (buf!1695 (_2!3041 lt!105009)) lt!104996) (not (= (bvand ((_ sign_extend 24) (select (arr!1878 (buf!1695 (_2!3041 lt!105009))) ((_ extract 31 0) (bvsdiv lt!104996 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!104996 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5088 () Bool)

(assert (= bs!5088 d!20938))

(declare-fun m!105869 () Bool)

(assert (=> bs!5088 m!105869))

(assert (=> bs!5088 m!105357))

(assert (=> b!66211 d!20938))

(declare-fun d!20940 () Bool)

(assert (=> d!20940 (= (invariant!0 (currentBit!3362 (_2!3041 lt!104999)) (currentByte!3367 (_2!3041 lt!104999)) (size!1314 (buf!1695 (_2!3041 lt!104999)))) (and (bvsge (currentBit!3362 (_2!3041 lt!104999)) #b00000000000000000000000000000000) (bvslt (currentBit!3362 (_2!3041 lt!104999)) #b00000000000000000000000000001000) (bvsge (currentByte!3367 (_2!3041 lt!104999)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3367 (_2!3041 lt!104999)) (size!1314 (buf!1695 (_2!3041 lt!104999)))) (and (= (currentBit!3362 (_2!3041 lt!104999)) #b00000000000000000000000000000000) (= (currentByte!3367 (_2!3041 lt!104999)) (size!1314 (buf!1695 (_2!3041 lt!104999))))))))))

(assert (=> b!66212 d!20940))

(declare-fun d!20942 () Bool)

(declare-fun size!1316 (List!706) Int)

(assert (=> d!20942 (= (length!334 lt!105006) (size!1316 lt!105006))))

(declare-fun bs!5089 () Bool)

(assert (= bs!5089 d!20942))

(declare-fun m!105871 () Bool)

(assert (=> bs!5089 m!105871))

(assert (=> b!66223 d!20942))

(declare-fun d!20944 () Bool)

(declare-fun res!55136 () Bool)

(declare-fun e!43690 () Bool)

(assert (=> d!20944 (=> (not res!55136) (not e!43690))))

(assert (=> d!20944 (= res!55136 (= (size!1314 (buf!1695 thiss!1379)) (size!1314 (buf!1695 thiss!1379))))))

(assert (=> d!20944 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43690)))

(declare-fun b!66567 () Bool)

(declare-fun res!55135 () Bool)

(assert (=> b!66567 (=> (not res!55135) (not e!43690))))

(assert (=> b!66567 (= res!55135 (bvsle (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)) (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379))))))

(declare-fun b!66568 () Bool)

(declare-fun e!43689 () Bool)

(assert (=> b!66568 (= e!43690 e!43689)))

(declare-fun res!55137 () Bool)

(assert (=> b!66568 (=> res!55137 e!43689)))

(assert (=> b!66568 (= res!55137 (= (size!1314 (buf!1695 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66569 () Bool)

(assert (=> b!66569 (= e!43689 (arrayBitRangesEq!0 (buf!1695 thiss!1379) (buf!1695 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379))))))

(assert (= (and d!20944 res!55136) b!66567))

(assert (= (and b!66567 res!55135) b!66568))

(assert (= (and b!66568 (not res!55137)) b!66569))

(assert (=> b!66567 m!105211))

(assert (=> b!66567 m!105211))

(assert (=> b!66569 m!105211))

(assert (=> b!66569 m!105211))

(declare-fun m!105873 () Bool)

(assert (=> b!66569 m!105873))

(assert (=> b!66213 d!20944))

(declare-fun d!20946 () Bool)

(assert (=> d!20946 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!105708 () Unit!4465)

(declare-fun choose!11 (BitStream!2262) Unit!4465)

(assert (=> d!20946 (= lt!105708 (choose!11 thiss!1379))))

(assert (=> d!20946 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!105708)))

(declare-fun bs!5091 () Bool)

(assert (= bs!5091 d!20946))

(assert (=> bs!5091 m!105207))

(declare-fun m!105875 () Bool)

(assert (=> bs!5091 m!105875))

(assert (=> b!66213 d!20946))

(declare-fun d!20948 () Bool)

(declare-fun e!43691 () Bool)

(assert (=> d!20948 e!43691))

(declare-fun res!55138 () Bool)

(assert (=> d!20948 (=> (not res!55138) (not e!43691))))

(declare-fun lt!105714 () (_ BitVec 64))

(declare-fun lt!105712 () (_ BitVec 64))

(declare-fun lt!105709 () (_ BitVec 64))

(assert (=> d!20948 (= res!55138 (= lt!105709 (bvsub lt!105712 lt!105714)))))

(assert (=> d!20948 (or (= (bvand lt!105712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105714 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105712 lt!105714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20948 (= lt!105714 (remainingBits!0 ((_ sign_extend 32) (size!1314 (buf!1695 thiss!1379))) ((_ sign_extend 32) (currentByte!3367 thiss!1379)) ((_ sign_extend 32) (currentBit!3362 thiss!1379))))))

(declare-fun lt!105710 () (_ BitVec 64))

(declare-fun lt!105711 () (_ BitVec 64))

(assert (=> d!20948 (= lt!105712 (bvmul lt!105710 lt!105711))))

(assert (=> d!20948 (or (= lt!105710 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105711 (bvsdiv (bvmul lt!105710 lt!105711) lt!105710)))))

(assert (=> d!20948 (= lt!105711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20948 (= lt!105710 ((_ sign_extend 32) (size!1314 (buf!1695 thiss!1379))))))

(assert (=> d!20948 (= lt!105709 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3367 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3362 thiss!1379))))))

(assert (=> d!20948 (invariant!0 (currentBit!3362 thiss!1379) (currentByte!3367 thiss!1379) (size!1314 (buf!1695 thiss!1379)))))

(assert (=> d!20948 (= (bitIndex!0 (size!1314 (buf!1695 thiss!1379)) (currentByte!3367 thiss!1379) (currentBit!3362 thiss!1379)) lt!105709)))

(declare-fun b!66570 () Bool)

(declare-fun res!55139 () Bool)

(assert (=> b!66570 (=> (not res!55139) (not e!43691))))

(assert (=> b!66570 (= res!55139 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105709))))

(declare-fun b!66571 () Bool)

(declare-fun lt!105713 () (_ BitVec 64))

(assert (=> b!66571 (= e!43691 (bvsle lt!105709 (bvmul lt!105713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66571 (or (= lt!105713 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105713 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105713)))))

(assert (=> b!66571 (= lt!105713 ((_ sign_extend 32) (size!1314 (buf!1695 thiss!1379))))))

(assert (= (and d!20948 res!55138) b!66570))

(assert (= (and b!66570 res!55139) b!66571))

(assert (=> d!20948 m!105349))

(assert (=> d!20948 m!105823))

(assert (=> b!66213 d!20948))

(check-sat (not d!20942) (not d!20806) (not b!66536) (not b!66531) (not b!66524) (not d!20936) (not bm!844) (not b!66561) (not b!66529) (not d!20800) (not d!20804) (not d!20770) (not b!66306) (not b!66569) (not d!20916) (not b!66326) (not b!66348) (not b!66307) (not b!66559) (not b!66564) (not b!66310) (not d!20934) (not b!66565) (not d!20926) (not b!66341) (not b!66533) (not b!66345) (not b!66520) (not b!66309) (not d!20948) (not b!66329) (not d!20782) (not b!66323) (not b!66328) (not b!66538) (not d!20774) (not b!66527) (not d!20780) (not b!66567) (not b!66525) (not d!20754) (not b!66346) (not b!66347) (not b!66311) (not b!66324) (not b!66334) (not d!20784) (not b!66325) (not b!66526) (not d!20796) (not b!66532) (not b!66349) (not b!66562) (not b!66289) (not d!20932) (not d!20792) (not b!66541) (not b!66305) (not b!66566) (not b!66343) (not d!20778) (not b!66330) (not b!66331) (not b!66351) (not b!66563) (not b!66560) (not d!20802) (not d!20786) (not b!66522) (not d!20946))
