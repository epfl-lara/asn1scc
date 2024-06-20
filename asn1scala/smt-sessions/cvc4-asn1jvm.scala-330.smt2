; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7488 () Bool)

(assert start!7488)

(declare-fun b!36637 () Bool)

(declare-fun res!31232 () Bool)

(declare-fun e!24179 () Bool)

(assert (=> b!36637 (=> res!31232 e!24179)))

(declare-datatypes ((array!1926 0))(
  ( (array!1927 (arr!1348 (Array (_ BitVec 32) (_ BitVec 8))) (size!861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1490 0))(
  ( (BitStream!1491 (buf!1189 array!1926) (currentByte!2583 (_ BitVec 32)) (currentBit!2578 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1490)

(declare-datatypes ((Unit!2673 0))(
  ( (Unit!2674) )
))
(declare-datatypes ((tuple2!3610 0))(
  ( (tuple2!3611 (_1!1892 Unit!2673) (_2!1892 BitStream!1490)) )
))
(declare-fun lt!54958 () tuple2!3610)

(assert (=> b!36637 (= res!31232 (not (= (size!861 (buf!1189 thiss!1379)) (size!861 (buf!1189 (_2!1892 lt!54958))))))))

(declare-fun b!36638 () Bool)

(declare-fun res!31231 () Bool)

(declare-fun e!24177 () Bool)

(assert (=> b!36638 (=> res!31231 e!24177)))

(declare-datatypes ((List!446 0))(
  ( (Nil!443) (Cons!442 (h!561 Bool) (t!1196 List!446)) )
))
(declare-fun lt!54966 () List!446)

(declare-fun lt!54971 () Bool)

(declare-fun head!283 (List!446) Bool)

(assert (=> b!36638 (= res!31231 (not (= (head!283 lt!54966) lt!54971)))))

(declare-fun b!36639 () Bool)

(declare-fun e!24188 () Bool)

(declare-fun e!24190 () Bool)

(assert (=> b!36639 (= e!24188 (not e!24190))))

(declare-fun res!31229 () Bool)

(assert (=> b!36639 (=> res!31229 e!24190)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!36639 (= res!31229 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1490 BitStream!1490) Bool)

(assert (=> b!36639 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54959 () Unit!2673)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1490) Unit!2673)

(assert (=> b!36639 (= lt!54959 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!54976 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!36639 (= lt!54976 (bitIndex!0 (size!861 (buf!1189 thiss!1379)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)))))

(declare-fun b!36640 () Bool)

(declare-fun e!24184 () Bool)

(assert (=> b!36640 (= e!24184 (not (= lt!54966 Nil!443)))))

(declare-fun b!36641 () Bool)

(declare-fun e!24185 () Bool)

(declare-fun e!24180 () Bool)

(assert (=> b!36641 (= e!24185 e!24180)))

(declare-fun res!31238 () Bool)

(assert (=> b!36641 (=> res!31238 e!24180)))

(declare-fun lt!54967 () List!446)

(declare-fun lt!54957 () List!446)

(assert (=> b!36641 (= res!31238 (not (= lt!54967 lt!54957)))))

(assert (=> b!36641 (= lt!54957 lt!54967)))

(declare-fun tail!163 (List!446) List!446)

(assert (=> b!36641 (= lt!54967 (tail!163 lt!54966))))

(declare-datatypes ((tuple2!3612 0))(
  ( (tuple2!3613 (_1!1893 BitStream!1490) (_2!1893 BitStream!1490)) )
))
(declare-fun lt!54965 () tuple2!3612)

(declare-fun lt!54964 () tuple2!3612)

(declare-fun lt!54973 () Unit!2673)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1490 BitStream!1490 BitStream!1490 BitStream!1490 (_ BitVec 64) List!446) Unit!2673)

(assert (=> b!36641 (= lt!54973 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1892 lt!54958) (_2!1892 lt!54958) (_1!1893 lt!54964) (_1!1893 lt!54965) (bvsub to!314 i!635) lt!54966))))

(declare-fun b!36642 () Bool)

(declare-fun res!31230 () Bool)

(assert (=> b!36642 (=> res!31230 e!24185)))

(declare-fun length!172 (List!446) Int)

(assert (=> b!36642 (= res!31230 (<= (length!172 lt!54966) 0))))

(declare-fun b!36643 () Bool)

(declare-fun e!24183 () Bool)

(declare-fun e!24181 () Bool)

(assert (=> b!36643 (= e!24183 e!24181)))

(declare-fun res!31242 () Bool)

(assert (=> b!36643 (=> res!31242 e!24181)))

(declare-fun lt!54955 () tuple2!3610)

(assert (=> b!36643 (= res!31242 (not (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!54958))))))

(assert (=> b!36643 (isPrefixOf!0 thiss!1379 (_2!1892 lt!54958))))

(declare-fun lt!54970 () Unit!2673)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1490 BitStream!1490 BitStream!1490) Unit!2673)

(assert (=> b!36643 (= lt!54970 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1892 lt!54955) (_2!1892 lt!54958)))))

(declare-fun srcBuffer!2 () array!1926)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1490 array!1926 (_ BitVec 64) (_ BitVec 64)) tuple2!3610)

(assert (=> b!36643 (= lt!54958 (appendBitsMSBFirstLoop!0 (_2!1892 lt!54955) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!24176 () Bool)

(assert (=> b!36643 e!24176))

(declare-fun res!31233 () Bool)

(assert (=> b!36643 (=> (not res!31233) (not e!24176))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36643 (= res!31233 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54954 () Unit!2673)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1490 array!1926 (_ BitVec 64)) Unit!2673)

(assert (=> b!36643 (= lt!54954 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1189 (_2!1892 lt!54955)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54960 () tuple2!3612)

(declare-fun reader!0 (BitStream!1490 BitStream!1490) tuple2!3612)

(assert (=> b!36643 (= lt!54960 (reader!0 thiss!1379 (_2!1892 lt!54955)))))

(declare-fun b!36644 () Bool)

(declare-fun e!24186 () Bool)

(assert (=> b!36644 (= e!24186 e!24185)))

(declare-fun res!31223 () Bool)

(assert (=> b!36644 (=> res!31223 e!24185)))

(assert (=> b!36644 (= res!31223 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!54956 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1490 BitStream!1490 (_ BitVec 64)) List!446)

(assert (=> b!36644 (= lt!54957 (bitStreamReadBitsIntoList!0 (_2!1892 lt!54958) (_1!1893 lt!54965) lt!54956))))

(assert (=> b!36644 (= lt!54966 (bitStreamReadBitsIntoList!0 (_2!1892 lt!54958) (_1!1893 lt!54964) (bvsub to!314 i!635)))))

(assert (=> b!36644 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!54956)))

(declare-fun lt!54972 () Unit!2673)

(assert (=> b!36644 (= lt!54972 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1892 lt!54955) (buf!1189 (_2!1892 lt!54958)) lt!54956))))

(assert (=> b!36644 (= lt!54965 (reader!0 (_2!1892 lt!54955) (_2!1892 lt!54958)))))

(assert (=> b!36644 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!54953 () Unit!2673)

(assert (=> b!36644 (= lt!54953 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1189 (_2!1892 lt!54958)) (bvsub to!314 i!635)))))

(assert (=> b!36644 (= lt!54964 (reader!0 thiss!1379 (_2!1892 lt!54958)))))

(declare-fun b!36645 () Bool)

(declare-fun res!31228 () Bool)

(assert (=> b!36645 (=> res!31228 e!24184)))

(declare-fun lt!54969 () Bool)

(declare-datatypes ((tuple2!3614 0))(
  ( (tuple2!3615 (_1!1894 BitStream!1490) (_2!1894 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1490) tuple2!3614)

(assert (=> b!36645 (= res!31228 (not (= (_2!1894 (readBitPure!0 (_1!1893 lt!54964))) lt!54969)))))

(declare-fun b!36646 () Bool)

(declare-fun e!24187 () Bool)

(assert (=> b!36646 (= e!24177 e!24187)))

(declare-fun res!31224 () Bool)

(assert (=> b!36646 (=> res!31224 e!24187)))

(declare-fun byteArrayBitContentToList!0 (BitStream!1490 array!1926 (_ BitVec 64) (_ BitVec 64)) List!446)

(assert (=> b!36646 (= res!31224 (not (= (head!283 (byteArrayBitContentToList!0 (_2!1892 lt!54958) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!54969)))))

(declare-fun bitAt!0 (array!1926 (_ BitVec 64)) Bool)

(assert (=> b!36646 (= lt!54969 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!36647 () Bool)

(assert (=> b!36647 (= e!24180 e!24177)))

(declare-fun res!31241 () Bool)

(assert (=> b!36647 (=> res!31241 e!24177)))

(assert (=> b!36647 (= res!31241 (not (= lt!54971 (bitAt!0 (buf!1189 (_1!1893 lt!54965)) lt!54976))))))

(assert (=> b!36647 (= lt!54971 (bitAt!0 (buf!1189 (_1!1893 lt!54964)) lt!54976))))

(declare-fun b!36648 () Bool)

(declare-fun res!31239 () Bool)

(assert (=> b!36648 (=> res!31239 e!24186)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!36648 (= res!31239 (not (invariant!0 (currentBit!2578 (_2!1892 lt!54955)) (currentByte!2583 (_2!1892 lt!54955)) (size!861 (buf!1189 (_2!1892 lt!54955))))))))

(declare-fun b!36649 () Bool)

(assert (=> b!36649 (= e!24190 e!24183)))

(declare-fun res!31237 () Bool)

(assert (=> b!36649 (=> res!31237 e!24183)))

(assert (=> b!36649 (= res!31237 (not (isPrefixOf!0 thiss!1379 (_2!1892 lt!54955))))))

(assert (=> b!36649 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!54956)))

(assert (=> b!36649 (= lt!54956 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54962 () Unit!2673)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1490 BitStream!1490 (_ BitVec 64) (_ BitVec 64)) Unit!2673)

(assert (=> b!36649 (= lt!54962 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1892 lt!54955) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1490 (_ BitVec 8) (_ BitVec 32)) tuple2!3610)

(assert (=> b!36649 (= lt!54955 (appendBitFromByte!0 thiss!1379 (select (arr!1348 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!36650 () Bool)

(declare-fun e!24189 () Bool)

(assert (=> b!36650 (= e!24189 e!24184)))

(declare-fun res!31225 () Bool)

(assert (=> b!36650 (=> res!31225 e!24184)))

(declare-fun lt!54975 () Bool)

(assert (=> b!36650 (= res!31225 (not (= lt!54975 lt!54969)))))

(declare-fun lt!54961 () Bool)

(assert (=> b!36650 (= lt!54961 lt!54975)))

(assert (=> b!36650 (= lt!54975 (bitAt!0 (buf!1189 (_2!1892 lt!54958)) lt!54976))))

(declare-fun lt!54968 () Unit!2673)

(declare-fun lt!54974 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1926 array!1926 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2673)

(assert (=> b!36650 (= lt!54968 (arrayBitRangesEqImpliesEq!0 (buf!1189 (_2!1892 lt!54955)) (buf!1189 (_2!1892 lt!54958)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54976 lt!54974))))

(declare-fun res!31234 () Bool)

(assert (=> start!7488 (=> (not res!31234) (not e!24188))))

(assert (=> start!7488 (= res!31234 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!861 srcBuffer!2))))))))

(assert (=> start!7488 e!24188))

(assert (=> start!7488 true))

(declare-fun array_inv!798 (array!1926) Bool)

(assert (=> start!7488 (array_inv!798 srcBuffer!2)))

(declare-fun e!24175 () Bool)

(declare-fun inv!12 (BitStream!1490) Bool)

(assert (=> start!7488 (and (inv!12 thiss!1379) e!24175)))

(declare-fun b!36651 () Bool)

(assert (=> b!36651 (= e!24187 e!24189)))

(declare-fun res!31235 () Bool)

(assert (=> b!36651 (=> res!31235 e!24189)))

(assert (=> b!36651 (= res!31235 (not (= lt!54961 lt!54969)))))

(assert (=> b!36651 (= lt!54961 (bitAt!0 (buf!1189 (_2!1892 lt!54955)) lt!54976))))

(declare-fun b!36652 () Bool)

(assert (=> b!36652 (= e!24179 e!24186)))

(declare-fun res!31227 () Bool)

(assert (=> b!36652 (=> res!31227 e!24186)))

(assert (=> b!36652 (= res!31227 (not (= (size!861 (buf!1189 (_2!1892 lt!54955))) (size!861 (buf!1189 (_2!1892 lt!54958))))))))

(declare-fun lt!54963 () (_ BitVec 64))

(assert (=> b!36652 (= lt!54963 (bvsub (bvsub (bvadd lt!54974 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36652 (= lt!54974 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))))))

(assert (=> b!36652 (= (size!861 (buf!1189 (_2!1892 lt!54958))) (size!861 (buf!1189 thiss!1379)))))

(declare-fun b!36653 () Bool)

(assert (=> b!36653 (= e!24176 (= (head!283 (byteArrayBitContentToList!0 (_2!1892 lt!54955) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!283 (bitStreamReadBitsIntoList!0 (_2!1892 lt!54955) (_1!1893 lt!54960) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!36654 () Bool)

(declare-fun res!31236 () Bool)

(assert (=> b!36654 (=> res!31236 e!24186)))

(assert (=> b!36654 (= res!31236 (not (invariant!0 (currentBit!2578 (_2!1892 lt!54955)) (currentByte!2583 (_2!1892 lt!54955)) (size!861 (buf!1189 (_2!1892 lt!54958))))))))

(declare-fun b!36655 () Bool)

(declare-fun res!31226 () Bool)

(assert (=> b!36655 (=> (not res!31226) (not e!24188))))

(assert (=> b!36655 (= res!31226 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 thiss!1379))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!36656 () Bool)

(assert (=> b!36656 (= e!24175 (array_inv!798 (buf!1189 thiss!1379)))))

(declare-fun b!36657 () Bool)

(declare-fun res!31240 () Bool)

(assert (=> b!36657 (=> res!31240 e!24179)))

(assert (=> b!36657 (= res!31240 (not (invariant!0 (currentBit!2578 (_2!1892 lt!54958)) (currentByte!2583 (_2!1892 lt!54958)) (size!861 (buf!1189 (_2!1892 lt!54958))))))))

(declare-fun b!36658 () Bool)

(assert (=> b!36658 (= e!24181 e!24179)))

(declare-fun res!31222 () Bool)

(assert (=> b!36658 (=> res!31222 e!24179)))

(assert (=> b!36658 (= res!31222 (not (= lt!54963 (bvsub (bvadd lt!54976 to!314) i!635))))))

(assert (=> b!36658 (= lt!54963 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54958))) (currentByte!2583 (_2!1892 lt!54958)) (currentBit!2578 (_2!1892 lt!54958))))))

(assert (= (and start!7488 res!31234) b!36655))

(assert (= (and b!36655 res!31226) b!36639))

(assert (= (and b!36639 (not res!31229)) b!36649))

(assert (= (and b!36649 (not res!31237)) b!36643))

(assert (= (and b!36643 res!31233) b!36653))

(assert (= (and b!36643 (not res!31242)) b!36658))

(assert (= (and b!36658 (not res!31222)) b!36657))

(assert (= (and b!36657 (not res!31240)) b!36637))

(assert (= (and b!36637 (not res!31232)) b!36652))

(assert (= (and b!36652 (not res!31227)) b!36648))

(assert (= (and b!36648 (not res!31239)) b!36654))

(assert (= (and b!36654 (not res!31236)) b!36644))

(assert (= (and b!36644 (not res!31223)) b!36642))

(assert (= (and b!36642 (not res!31230)) b!36641))

(assert (= (and b!36641 (not res!31238)) b!36647))

(assert (= (and b!36647 (not res!31241)) b!36638))

(assert (= (and b!36638 (not res!31231)) b!36646))

(assert (= (and b!36646 (not res!31224)) b!36651))

(assert (= (and b!36651 (not res!31235)) b!36650))

(assert (= (and b!36650 (not res!31225)) b!36645))

(assert (= (and b!36645 (not res!31228)) b!36640))

(assert (= start!7488 b!36656))

(declare-fun m!55285 () Bool)

(assert (=> b!36654 m!55285))

(declare-fun m!55287 () Bool)

(assert (=> b!36644 m!55287))

(declare-fun m!55289 () Bool)

(assert (=> b!36644 m!55289))

(declare-fun m!55291 () Bool)

(assert (=> b!36644 m!55291))

(declare-fun m!55293 () Bool)

(assert (=> b!36644 m!55293))

(declare-fun m!55295 () Bool)

(assert (=> b!36644 m!55295))

(declare-fun m!55297 () Bool)

(assert (=> b!36644 m!55297))

(declare-fun m!55299 () Bool)

(assert (=> b!36644 m!55299))

(declare-fun m!55301 () Bool)

(assert (=> b!36644 m!55301))

(declare-fun m!55303 () Bool)

(assert (=> b!36638 m!55303))

(declare-fun m!55305 () Bool)

(assert (=> b!36641 m!55305))

(declare-fun m!55307 () Bool)

(assert (=> b!36641 m!55307))

(declare-fun m!55309 () Bool)

(assert (=> b!36650 m!55309))

(declare-fun m!55311 () Bool)

(assert (=> b!36650 m!55311))

(declare-fun m!55313 () Bool)

(assert (=> b!36652 m!55313))

(declare-fun m!55315 () Bool)

(assert (=> b!36655 m!55315))

(declare-fun m!55317 () Bool)

(assert (=> b!36647 m!55317))

(declare-fun m!55319 () Bool)

(assert (=> b!36647 m!55319))

(declare-fun m!55321 () Bool)

(assert (=> b!36639 m!55321))

(declare-fun m!55323 () Bool)

(assert (=> b!36639 m!55323))

(declare-fun m!55325 () Bool)

(assert (=> b!36639 m!55325))

(declare-fun m!55327 () Bool)

(assert (=> b!36656 m!55327))

(declare-fun m!55329 () Bool)

(assert (=> b!36657 m!55329))

(declare-fun m!55331 () Bool)

(assert (=> b!36645 m!55331))

(declare-fun m!55333 () Bool)

(assert (=> start!7488 m!55333))

(declare-fun m!55335 () Bool)

(assert (=> start!7488 m!55335))

(declare-fun m!55337 () Bool)

(assert (=> b!36646 m!55337))

(assert (=> b!36646 m!55337))

(declare-fun m!55339 () Bool)

(assert (=> b!36646 m!55339))

(declare-fun m!55341 () Bool)

(assert (=> b!36646 m!55341))

(declare-fun m!55343 () Bool)

(assert (=> b!36649 m!55343))

(declare-fun m!55345 () Bool)

(assert (=> b!36649 m!55345))

(declare-fun m!55347 () Bool)

(assert (=> b!36649 m!55347))

(declare-fun m!55349 () Bool)

(assert (=> b!36649 m!55349))

(assert (=> b!36649 m!55347))

(declare-fun m!55351 () Bool)

(assert (=> b!36649 m!55351))

(declare-fun m!55353 () Bool)

(assert (=> b!36651 m!55353))

(declare-fun m!55355 () Bool)

(assert (=> b!36653 m!55355))

(assert (=> b!36653 m!55355))

(declare-fun m!55357 () Bool)

(assert (=> b!36653 m!55357))

(declare-fun m!55359 () Bool)

(assert (=> b!36653 m!55359))

(assert (=> b!36653 m!55359))

(declare-fun m!55361 () Bool)

(assert (=> b!36653 m!55361))

(declare-fun m!55363 () Bool)

(assert (=> b!36643 m!55363))

(declare-fun m!55365 () Bool)

(assert (=> b!36643 m!55365))

(declare-fun m!55367 () Bool)

(assert (=> b!36643 m!55367))

(declare-fun m!55369 () Bool)

(assert (=> b!36643 m!55369))

(declare-fun m!55371 () Bool)

(assert (=> b!36643 m!55371))

(declare-fun m!55373 () Bool)

(assert (=> b!36643 m!55373))

(declare-fun m!55375 () Bool)

(assert (=> b!36643 m!55375))

(declare-fun m!55377 () Bool)

(assert (=> b!36648 m!55377))

(declare-fun m!55379 () Bool)

(assert (=> b!36658 m!55379))

(declare-fun m!55381 () Bool)

(assert (=> b!36642 m!55381))

(push 1)

(assert (not b!36639))

(assert (not b!36650))

(assert (not b!36643))

(assert (not b!36655))

(assert (not b!36652))

(assert (not b!36648))

(assert (not b!36649))

(assert (not b!36653))

(assert (not b!36647))

(assert (not b!36645))

(assert (not b!36658))

(assert (not b!36654))

(assert (not b!36644))

(assert (not b!36642))

(assert (not b!36651))

(assert (not b!36641))

(assert (not b!36638))

(assert (not start!7488))

(assert (not b!36646))

(assert (not b!36656))

(assert (not b!36657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!10794 () Bool)

(assert (=> d!10794 (= (invariant!0 (currentBit!2578 (_2!1892 lt!54955)) (currentByte!2583 (_2!1892 lt!54955)) (size!861 (buf!1189 (_2!1892 lt!54958)))) (and (bvsge (currentBit!2578 (_2!1892 lt!54955)) #b00000000000000000000000000000000) (bvslt (currentBit!2578 (_2!1892 lt!54955)) #b00000000000000000000000000001000) (bvsge (currentByte!2583 (_2!1892 lt!54955)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2583 (_2!1892 lt!54955)) (size!861 (buf!1189 (_2!1892 lt!54958)))) (and (= (currentBit!2578 (_2!1892 lt!54955)) #b00000000000000000000000000000000) (= (currentByte!2583 (_2!1892 lt!54955)) (size!861 (buf!1189 (_2!1892 lt!54958))))))))))

(assert (=> b!36654 d!10794))

(declare-fun d!10796 () Bool)

(assert (=> d!10796 (= (array_inv!798 srcBuffer!2) (bvsge (size!861 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7488 d!10796))

(declare-fun d!10798 () Bool)

(assert (=> d!10798 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2578 thiss!1379) (currentByte!2583 thiss!1379) (size!861 (buf!1189 thiss!1379))))))

(declare-fun bs!2897 () Bool)

(assert (= bs!2897 d!10798))

(declare-fun m!55457 () Bool)

(assert (=> bs!2897 m!55457))

(assert (=> start!7488 d!10798))

(declare-fun d!10802 () Bool)

(assert (=> d!10802 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!55090 () Unit!2673)

(declare-fun choose!9 (BitStream!1490 array!1926 (_ BitVec 64) BitStream!1490) Unit!2673)

(assert (=> d!10802 (= lt!55090 (choose!9 thiss!1379 (buf!1189 (_2!1892 lt!54958)) (bvsub to!314 i!635) (BitStream!1491 (buf!1189 (_2!1892 lt!54958)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379))))))

(assert (=> d!10802 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1189 (_2!1892 lt!54958)) (bvsub to!314 i!635)) lt!55090)))

(declare-fun bs!2901 () Bool)

(assert (= bs!2901 d!10802))

(assert (=> bs!2901 m!55287))

(declare-fun m!55463 () Bool)

(assert (=> bs!2901 m!55463))

(assert (=> b!36644 d!10802))

(declare-fun b!36746 () Bool)

(declare-fun e!24239 () Unit!2673)

(declare-fun Unit!2694 () Unit!2673)

(assert (=> b!36746 (= e!24239 Unit!2694)))

(declare-fun d!10814 () Bool)

(declare-fun e!24240 () Bool)

(assert (=> d!10814 e!24240))

(declare-fun res!31296 () Bool)

(assert (=> d!10814 (=> (not res!31296) (not e!24240))))

(declare-fun lt!55136 () tuple2!3612)

(assert (=> d!10814 (= res!31296 (isPrefixOf!0 (_1!1893 lt!55136) (_2!1893 lt!55136)))))

(declare-fun lt!55142 () BitStream!1490)

(assert (=> d!10814 (= lt!55136 (tuple2!3613 lt!55142 (_2!1892 lt!54958)))))

(declare-fun lt!55135 () Unit!2673)

(declare-fun lt!55146 () Unit!2673)

(assert (=> d!10814 (= lt!55135 lt!55146)))

(assert (=> d!10814 (isPrefixOf!0 lt!55142 (_2!1892 lt!54958))))

(assert (=> d!10814 (= lt!55146 (lemmaIsPrefixTransitive!0 lt!55142 (_2!1892 lt!54958) (_2!1892 lt!54958)))))

(declare-fun lt!55140 () Unit!2673)

(declare-fun lt!55134 () Unit!2673)

(assert (=> d!10814 (= lt!55140 lt!55134)))

(assert (=> d!10814 (isPrefixOf!0 lt!55142 (_2!1892 lt!54958))))

(assert (=> d!10814 (= lt!55134 (lemmaIsPrefixTransitive!0 lt!55142 thiss!1379 (_2!1892 lt!54958)))))

(declare-fun lt!55138 () Unit!2673)

(assert (=> d!10814 (= lt!55138 e!24239)))

(declare-fun c!2505 () Bool)

(assert (=> d!10814 (= c!2505 (not (= (size!861 (buf!1189 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!55149 () Unit!2673)

(declare-fun lt!55153 () Unit!2673)

(assert (=> d!10814 (= lt!55149 lt!55153)))

(assert (=> d!10814 (isPrefixOf!0 (_2!1892 lt!54958) (_2!1892 lt!54958))))

(assert (=> d!10814 (= lt!55153 (lemmaIsPrefixRefl!0 (_2!1892 lt!54958)))))

(declare-fun lt!55147 () Unit!2673)

(declare-fun lt!55137 () Unit!2673)

(assert (=> d!10814 (= lt!55147 lt!55137)))

(assert (=> d!10814 (= lt!55137 (lemmaIsPrefixRefl!0 (_2!1892 lt!54958)))))

(declare-fun lt!55145 () Unit!2673)

(declare-fun lt!55143 () Unit!2673)

(assert (=> d!10814 (= lt!55145 lt!55143)))

(assert (=> d!10814 (isPrefixOf!0 lt!55142 lt!55142)))

(assert (=> d!10814 (= lt!55143 (lemmaIsPrefixRefl!0 lt!55142))))

(declare-fun lt!55141 () Unit!2673)

(declare-fun lt!55144 () Unit!2673)

(assert (=> d!10814 (= lt!55141 lt!55144)))

(assert (=> d!10814 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10814 (= lt!55144 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10814 (= lt!55142 (BitStream!1491 (buf!1189 (_2!1892 lt!54958)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)))))

(assert (=> d!10814 (isPrefixOf!0 thiss!1379 (_2!1892 lt!54958))))

(assert (=> d!10814 (= (reader!0 thiss!1379 (_2!1892 lt!54958)) lt!55136)))

(declare-fun b!36747 () Bool)

(declare-fun res!31298 () Bool)

(assert (=> b!36747 (=> (not res!31298) (not e!24240))))

(assert (=> b!36747 (= res!31298 (isPrefixOf!0 (_1!1893 lt!55136) thiss!1379))))

(declare-fun b!36748 () Bool)

(declare-fun lt!55152 () Unit!2673)

(assert (=> b!36748 (= e!24239 lt!55152)))

(declare-fun lt!55151 () (_ BitVec 64))

(assert (=> b!36748 (= lt!55151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55139 () (_ BitVec 64))

(assert (=> b!36748 (= lt!55139 (bitIndex!0 (size!861 (buf!1189 thiss!1379)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1926 array!1926 (_ BitVec 64) (_ BitVec 64)) Unit!2673)

(assert (=> b!36748 (= lt!55152 (arrayBitRangesEqSymmetric!0 (buf!1189 thiss!1379) (buf!1189 (_2!1892 lt!54958)) lt!55151 lt!55139))))

(declare-fun arrayBitRangesEq!0 (array!1926 array!1926 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36748 (arrayBitRangesEq!0 (buf!1189 (_2!1892 lt!54958)) (buf!1189 thiss!1379) lt!55151 lt!55139)))

(declare-fun b!36749 () Bool)

(declare-fun lt!55148 () (_ BitVec 64))

(declare-fun lt!55150 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1490 (_ BitVec 64)) BitStream!1490)

(assert (=> b!36749 (= e!24240 (= (_1!1893 lt!55136) (withMovedBitIndex!0 (_2!1893 lt!55136) (bvsub lt!55150 lt!55148))))))

(assert (=> b!36749 (or (= (bvand lt!55150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55150 lt!55148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36749 (= lt!55148 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54958))) (currentByte!2583 (_2!1892 lt!54958)) (currentBit!2578 (_2!1892 lt!54958))))))

(assert (=> b!36749 (= lt!55150 (bitIndex!0 (size!861 (buf!1189 thiss!1379)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)))))

(declare-fun b!36750 () Bool)

(declare-fun res!31297 () Bool)

(assert (=> b!36750 (=> (not res!31297) (not e!24240))))

(assert (=> b!36750 (= res!31297 (isPrefixOf!0 (_2!1893 lt!55136) (_2!1892 lt!54958)))))

(assert (= (and d!10814 c!2505) b!36748))

(assert (= (and d!10814 (not c!2505)) b!36746))

(assert (= (and d!10814 res!31296) b!36747))

(assert (= (and b!36747 res!31298) b!36750))

(assert (= (and b!36750 res!31297) b!36749))

(declare-fun m!55469 () Bool)

(assert (=> b!36747 m!55469))

(declare-fun m!55471 () Bool)

(assert (=> b!36750 m!55471))

(declare-fun m!55473 () Bool)

(assert (=> b!36749 m!55473))

(assert (=> b!36749 m!55379))

(assert (=> b!36749 m!55325))

(assert (=> b!36748 m!55325))

(declare-fun m!55475 () Bool)

(assert (=> b!36748 m!55475))

(declare-fun m!55477 () Bool)

(assert (=> b!36748 m!55477))

(declare-fun m!55479 () Bool)

(assert (=> d!10814 m!55479))

(assert (=> d!10814 m!55367))

(declare-fun m!55481 () Bool)

(assert (=> d!10814 m!55481))

(declare-fun m!55483 () Bool)

(assert (=> d!10814 m!55483))

(declare-fun m!55485 () Bool)

(assert (=> d!10814 m!55485))

(declare-fun m!55487 () Bool)

(assert (=> d!10814 m!55487))

(declare-fun m!55489 () Bool)

(assert (=> d!10814 m!55489))

(declare-fun m!55491 () Bool)

(assert (=> d!10814 m!55491))

(assert (=> d!10814 m!55321))

(declare-fun m!55493 () Bool)

(assert (=> d!10814 m!55493))

(assert (=> d!10814 m!55323))

(assert (=> b!36644 d!10814))

(declare-fun b!36751 () Bool)

(declare-fun e!24241 () Unit!2673)

(declare-fun Unit!2696 () Unit!2673)

(assert (=> b!36751 (= e!24241 Unit!2696)))

(declare-fun d!10818 () Bool)

(declare-fun e!24242 () Bool)

(assert (=> d!10818 e!24242))

(declare-fun res!31299 () Bool)

(assert (=> d!10818 (=> (not res!31299) (not e!24242))))

(declare-fun lt!55156 () tuple2!3612)

(assert (=> d!10818 (= res!31299 (isPrefixOf!0 (_1!1893 lt!55156) (_2!1893 lt!55156)))))

(declare-fun lt!55162 () BitStream!1490)

(assert (=> d!10818 (= lt!55156 (tuple2!3613 lt!55162 (_2!1892 lt!54958)))))

(declare-fun lt!55155 () Unit!2673)

(declare-fun lt!55166 () Unit!2673)

(assert (=> d!10818 (= lt!55155 lt!55166)))

(assert (=> d!10818 (isPrefixOf!0 lt!55162 (_2!1892 lt!54958))))

(assert (=> d!10818 (= lt!55166 (lemmaIsPrefixTransitive!0 lt!55162 (_2!1892 lt!54958) (_2!1892 lt!54958)))))

(declare-fun lt!55160 () Unit!2673)

(declare-fun lt!55154 () Unit!2673)

(assert (=> d!10818 (= lt!55160 lt!55154)))

(assert (=> d!10818 (isPrefixOf!0 lt!55162 (_2!1892 lt!54958))))

(assert (=> d!10818 (= lt!55154 (lemmaIsPrefixTransitive!0 lt!55162 (_2!1892 lt!54955) (_2!1892 lt!54958)))))

(declare-fun lt!55158 () Unit!2673)

(assert (=> d!10818 (= lt!55158 e!24241)))

(declare-fun c!2506 () Bool)

(assert (=> d!10818 (= c!2506 (not (= (size!861 (buf!1189 (_2!1892 lt!54955))) #b00000000000000000000000000000000)))))

(declare-fun lt!55169 () Unit!2673)

(declare-fun lt!55173 () Unit!2673)

(assert (=> d!10818 (= lt!55169 lt!55173)))

(assert (=> d!10818 (isPrefixOf!0 (_2!1892 lt!54958) (_2!1892 lt!54958))))

(assert (=> d!10818 (= lt!55173 (lemmaIsPrefixRefl!0 (_2!1892 lt!54958)))))

(declare-fun lt!55167 () Unit!2673)

(declare-fun lt!55157 () Unit!2673)

(assert (=> d!10818 (= lt!55167 lt!55157)))

(assert (=> d!10818 (= lt!55157 (lemmaIsPrefixRefl!0 (_2!1892 lt!54958)))))

(declare-fun lt!55165 () Unit!2673)

(declare-fun lt!55163 () Unit!2673)

(assert (=> d!10818 (= lt!55165 lt!55163)))

(assert (=> d!10818 (isPrefixOf!0 lt!55162 lt!55162)))

(assert (=> d!10818 (= lt!55163 (lemmaIsPrefixRefl!0 lt!55162))))

(declare-fun lt!55161 () Unit!2673)

(declare-fun lt!55164 () Unit!2673)

(assert (=> d!10818 (= lt!55161 lt!55164)))

(assert (=> d!10818 (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!54955))))

(assert (=> d!10818 (= lt!55164 (lemmaIsPrefixRefl!0 (_2!1892 lt!54955)))))

(assert (=> d!10818 (= lt!55162 (BitStream!1491 (buf!1189 (_2!1892 lt!54958)) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))))))

(assert (=> d!10818 (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!54958))))

(assert (=> d!10818 (= (reader!0 (_2!1892 lt!54955) (_2!1892 lt!54958)) lt!55156)))

(declare-fun b!36752 () Bool)

(declare-fun res!31301 () Bool)

(assert (=> b!36752 (=> (not res!31301) (not e!24242))))

(assert (=> b!36752 (= res!31301 (isPrefixOf!0 (_1!1893 lt!55156) (_2!1892 lt!54955)))))

(declare-fun b!36753 () Bool)

(declare-fun lt!55172 () Unit!2673)

(assert (=> b!36753 (= e!24241 lt!55172)))

(declare-fun lt!55171 () (_ BitVec 64))

(assert (=> b!36753 (= lt!55171 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55159 () (_ BitVec 64))

(assert (=> b!36753 (= lt!55159 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))))))

(assert (=> b!36753 (= lt!55172 (arrayBitRangesEqSymmetric!0 (buf!1189 (_2!1892 lt!54955)) (buf!1189 (_2!1892 lt!54958)) lt!55171 lt!55159))))

(assert (=> b!36753 (arrayBitRangesEq!0 (buf!1189 (_2!1892 lt!54958)) (buf!1189 (_2!1892 lt!54955)) lt!55171 lt!55159)))

(declare-fun lt!55168 () (_ BitVec 64))

(declare-fun lt!55170 () (_ BitVec 64))

(declare-fun b!36754 () Bool)

(assert (=> b!36754 (= e!24242 (= (_1!1893 lt!55156) (withMovedBitIndex!0 (_2!1893 lt!55156) (bvsub lt!55170 lt!55168))))))

(assert (=> b!36754 (or (= (bvand lt!55170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55170 lt!55168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36754 (= lt!55168 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54958))) (currentByte!2583 (_2!1892 lt!54958)) (currentBit!2578 (_2!1892 lt!54958))))))

(assert (=> b!36754 (= lt!55170 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))))))

(declare-fun b!36755 () Bool)

(declare-fun res!31300 () Bool)

(assert (=> b!36755 (=> (not res!31300) (not e!24242))))

(assert (=> b!36755 (= res!31300 (isPrefixOf!0 (_2!1893 lt!55156) (_2!1892 lt!54958)))))

(assert (= (and d!10818 c!2506) b!36753))

(assert (= (and d!10818 (not c!2506)) b!36751))

(assert (= (and d!10818 res!31299) b!36752))

(assert (= (and b!36752 res!31301) b!36755))

(assert (= (and b!36755 res!31300) b!36754))

(declare-fun m!55495 () Bool)

(assert (=> b!36752 m!55495))

(declare-fun m!55497 () Bool)

(assert (=> b!36755 m!55497))

(declare-fun m!55499 () Bool)

(assert (=> b!36754 m!55499))

(assert (=> b!36754 m!55379))

(assert (=> b!36754 m!55313))

(assert (=> b!36753 m!55313))

(declare-fun m!55501 () Bool)

(assert (=> b!36753 m!55501))

(declare-fun m!55503 () Bool)

(assert (=> b!36753 m!55503))

(assert (=> d!10818 m!55479))

(assert (=> d!10818 m!55363))

(declare-fun m!55505 () Bool)

(assert (=> d!10818 m!55505))

(assert (=> d!10818 m!55483))

(declare-fun m!55507 () Bool)

(assert (=> d!10818 m!55507))

(declare-fun m!55509 () Bool)

(assert (=> d!10818 m!55509))

(declare-fun m!55511 () Bool)

(assert (=> d!10818 m!55511))

(declare-fun m!55513 () Bool)

(assert (=> d!10818 m!55513))

(declare-fun m!55515 () Bool)

(assert (=> d!10818 m!55515))

(declare-fun m!55517 () Bool)

(assert (=> d!10818 m!55517))

(declare-fun m!55519 () Bool)

(assert (=> d!10818 m!55519))

(assert (=> b!36644 d!10818))

(declare-datatypes ((tuple2!3628 0))(
  ( (tuple2!3629 (_1!1901 List!446) (_2!1901 BitStream!1490)) )
))
(declare-fun e!24247 () tuple2!3628)

(declare-fun b!36765 () Bool)

(declare-datatypes ((tuple2!3630 0))(
  ( (tuple2!3631 (_1!1902 Bool) (_2!1902 BitStream!1490)) )
))
(declare-fun lt!55182 () tuple2!3630)

(declare-fun lt!55181 () (_ BitVec 64))

(assert (=> b!36765 (= e!24247 (tuple2!3629 (Cons!442 (_1!1902 lt!55182) (bitStreamReadBitsIntoList!0 (_2!1892 lt!54958) (_2!1902 lt!55182) (bvsub (bvsub to!314 i!635) lt!55181))) (_2!1902 lt!55182)))))

(declare-fun readBit!0 (BitStream!1490) tuple2!3630)

(assert (=> b!36765 (= lt!55182 (readBit!0 (_1!1893 lt!54964)))))

(assert (=> b!36765 (= lt!55181 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10820 () Bool)

(declare-fun e!24248 () Bool)

(assert (=> d!10820 e!24248))

(declare-fun c!2511 () Bool)

(assert (=> d!10820 (= c!2511 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!55180 () List!446)

(assert (=> d!10820 (= lt!55180 (_1!1901 e!24247))))

(declare-fun c!2512 () Bool)

(assert (=> d!10820 (= c!2512 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10820 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10820 (= (bitStreamReadBitsIntoList!0 (_2!1892 lt!54958) (_1!1893 lt!54964) (bvsub to!314 i!635)) lt!55180)))

(declare-fun b!36766 () Bool)

(declare-fun isEmpty!104 (List!446) Bool)

(assert (=> b!36766 (= e!24248 (isEmpty!104 lt!55180))))

(declare-fun b!36764 () Bool)

(assert (=> b!36764 (= e!24247 (tuple2!3629 Nil!443 (_1!1893 lt!54964)))))

(declare-fun b!36767 () Bool)

(assert (=> b!36767 (= e!24248 (> (length!172 lt!55180) 0))))

(assert (= (and d!10820 c!2512) b!36764))

(assert (= (and d!10820 (not c!2512)) b!36765))

(assert (= (and d!10820 c!2511) b!36766))

(assert (= (and d!10820 (not c!2511)) b!36767))

(declare-fun m!55521 () Bool)

(assert (=> b!36765 m!55521))

(declare-fun m!55523 () Bool)

(assert (=> b!36765 m!55523))

(declare-fun m!55525 () Bool)

(assert (=> b!36766 m!55525))

(declare-fun m!55527 () Bool)

(assert (=> b!36767 m!55527))

(assert (=> b!36644 d!10820))

(declare-fun d!10822 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!54956) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955)))) lt!54956))))

(declare-fun bs!2902 () Bool)

(assert (= bs!2902 d!10822))

(declare-fun m!55529 () Bool)

(assert (=> bs!2902 m!55529))

(assert (=> b!36644 d!10822))

(declare-fun d!10824 () Bool)

(assert (=> d!10824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2903 () Bool)

(assert (= bs!2903 d!10824))

(declare-fun m!55531 () Bool)

(assert (=> bs!2903 m!55531))

(assert (=> b!36644 d!10824))

(declare-fun d!10826 () Bool)

(assert (=> d!10826 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54958)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!54956)))

(declare-fun lt!55183 () Unit!2673)

(assert (=> d!10826 (= lt!55183 (choose!9 (_2!1892 lt!54955) (buf!1189 (_2!1892 lt!54958)) lt!54956 (BitStream!1491 (buf!1189 (_2!1892 lt!54958)) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955)))))))

(assert (=> d!10826 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1892 lt!54955) (buf!1189 (_2!1892 lt!54958)) lt!54956) lt!55183)))

(declare-fun bs!2904 () Bool)

(assert (= bs!2904 d!10826))

(assert (=> bs!2904 m!55301))

(declare-fun m!55533 () Bool)

(assert (=> bs!2904 m!55533))

(assert (=> b!36644 d!10826))

(declare-fun b!36769 () Bool)

(declare-fun e!24249 () tuple2!3628)

(declare-fun lt!55185 () (_ BitVec 64))

(declare-fun lt!55186 () tuple2!3630)

(assert (=> b!36769 (= e!24249 (tuple2!3629 (Cons!442 (_1!1902 lt!55186) (bitStreamReadBitsIntoList!0 (_2!1892 lt!54958) (_2!1902 lt!55186) (bvsub lt!54956 lt!55185))) (_2!1902 lt!55186)))))

(assert (=> b!36769 (= lt!55186 (readBit!0 (_1!1893 lt!54965)))))

(assert (=> b!36769 (= lt!55185 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10828 () Bool)

(declare-fun e!24250 () Bool)

(assert (=> d!10828 e!24250))

(declare-fun c!2513 () Bool)

(assert (=> d!10828 (= c!2513 (= lt!54956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!55184 () List!446)

(assert (=> d!10828 (= lt!55184 (_1!1901 e!24249))))

(declare-fun c!2514 () Bool)

(assert (=> d!10828 (= c!2514 (= lt!54956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10828 (bvsge lt!54956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10828 (= (bitStreamReadBitsIntoList!0 (_2!1892 lt!54958) (_1!1893 lt!54965) lt!54956) lt!55184)))

(declare-fun b!36770 () Bool)

(assert (=> b!36770 (= e!24250 (isEmpty!104 lt!55184))))

(declare-fun b!36768 () Bool)

(assert (=> b!36768 (= e!24249 (tuple2!3629 Nil!443 (_1!1893 lt!54965)))))

(declare-fun b!36771 () Bool)

(assert (=> b!36771 (= e!24250 (> (length!172 lt!55184) 0))))

(assert (= (and d!10828 c!2514) b!36768))

(assert (= (and d!10828 (not c!2514)) b!36769))

(assert (= (and d!10828 c!2513) b!36770))

(assert (= (and d!10828 (not c!2513)) b!36771))

(declare-fun m!55535 () Bool)

(assert (=> b!36769 m!55535))

(declare-fun m!55537 () Bool)

(assert (=> b!36769 m!55537))

(declare-fun m!55539 () Bool)

(assert (=> b!36770 m!55539))

(declare-fun m!55541 () Bool)

(assert (=> b!36771 m!55541))

(assert (=> b!36644 d!10828))

(declare-fun d!10830 () Bool)

(assert (=> d!10830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 thiss!1379))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!861 (buf!1189 thiss!1379))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2905 () Bool)

(assert (= bs!2905 d!10830))

(declare-fun m!55543 () Bool)

(assert (=> bs!2905 m!55543))

(assert (=> b!36655 d!10830))

(declare-fun d!10832 () Bool)

(declare-fun lt!55189 () tuple2!3630)

(assert (=> d!10832 (= lt!55189 (readBit!0 (_1!1893 lt!54964)))))

(assert (=> d!10832 (= (readBitPure!0 (_1!1893 lt!54964)) (tuple2!3615 (_2!1902 lt!55189) (_1!1902 lt!55189)))))

(declare-fun bs!2906 () Bool)

(assert (= bs!2906 d!10832))

(assert (=> bs!2906 m!55523))

(assert (=> b!36645 d!10832))

(declare-fun d!10834 () Bool)

(assert (=> d!10834 (= (array_inv!798 (buf!1189 thiss!1379)) (bvsge (size!861 (buf!1189 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!36656 d!10834))

(declare-fun d!10836 () Bool)

(assert (=> d!10836 (= (tail!163 lt!54966) (t!1196 lt!54966))))

(assert (=> b!36641 d!10836))

(declare-fun d!10838 () Bool)

(declare-fun e!24253 () Bool)

(assert (=> d!10838 e!24253))

(declare-fun res!31304 () Bool)

(assert (=> d!10838 (=> (not res!31304) (not e!24253))))

(declare-fun lt!55195 () (_ BitVec 64))

(assert (=> d!10838 (= res!31304 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!55195) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10838 (= lt!55195 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55194 () Unit!2673)

(declare-fun choose!42 (BitStream!1490 BitStream!1490 BitStream!1490 BitStream!1490 (_ BitVec 64) List!446) Unit!2673)

(assert (=> d!10838 (= lt!55194 (choose!42 (_2!1892 lt!54958) (_2!1892 lt!54958) (_1!1893 lt!54964) (_1!1893 lt!54965) (bvsub to!314 i!635) lt!54966))))

(assert (=> d!10838 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10838 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1892 lt!54958) (_2!1892 lt!54958) (_1!1893 lt!54964) (_1!1893 lt!54965) (bvsub to!314 i!635) lt!54966) lt!55194)))

(declare-fun b!36774 () Bool)

(assert (=> b!36774 (= e!24253 (= (bitStreamReadBitsIntoList!0 (_2!1892 lt!54958) (_1!1893 lt!54965) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!163 lt!54966)))))

(assert (= (and d!10838 res!31304) b!36774))

(declare-fun m!55545 () Bool)

(assert (=> d!10838 m!55545))

(declare-fun m!55547 () Bool)

(assert (=> b!36774 m!55547))

(assert (=> b!36774 m!55305))

(assert (=> b!36641 d!10838))

(declare-fun d!10840 () Bool)

(declare-fun e!24270 () Bool)

(assert (=> d!10840 e!24270))

(declare-fun res!31336 () Bool)

(assert (=> d!10840 (=> (not res!31336) (not e!24270))))

(declare-fun lt!55250 () (_ BitVec 64))

(declare-fun lt!55254 () (_ BitVec 64))

(declare-fun lt!55252 () (_ BitVec 64))

(assert (=> d!10840 (= res!31336 (= lt!55254 (bvsub lt!55252 lt!55250)))))

(assert (=> d!10840 (or (= (bvand lt!55252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55250 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55252 lt!55250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10840 (= lt!55250 (remainingBits!0 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955)))))))

(declare-fun lt!55255 () (_ BitVec 64))

(declare-fun lt!55253 () (_ BitVec 64))

(assert (=> d!10840 (= lt!55252 (bvmul lt!55255 lt!55253))))

(assert (=> d!10840 (or (= lt!55255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!55253 (bvsdiv (bvmul lt!55255 lt!55253) lt!55255)))))

(assert (=> d!10840 (= lt!55253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10840 (= lt!55255 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))))))

(assert (=> d!10840 (= lt!55254 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955)))))))

(assert (=> d!10840 (invariant!0 (currentBit!2578 (_2!1892 lt!54955)) (currentByte!2583 (_2!1892 lt!54955)) (size!861 (buf!1189 (_2!1892 lt!54955))))))

(assert (=> d!10840 (= (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))) lt!55254)))

(declare-fun b!36808 () Bool)

(declare-fun res!31335 () Bool)

(assert (=> b!36808 (=> (not res!31335) (not e!24270))))

(assert (=> b!36808 (= res!31335 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!55254))))

(declare-fun b!36809 () Bool)

(declare-fun lt!55251 () (_ BitVec 64))

(assert (=> b!36809 (= e!24270 (bvsle lt!55254 (bvmul lt!55251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36809 (or (= lt!55251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!55251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!55251)))))

(assert (=> b!36809 (= lt!55251 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))))))

(assert (= (and d!10840 res!31336) b!36808))

(assert (= (and b!36808 res!31335) b!36809))

(declare-fun m!55577 () Bool)

(assert (=> d!10840 m!55577))

(assert (=> d!10840 m!55377))

(assert (=> b!36652 d!10840))

(declare-fun d!10852 () Bool)

(declare-fun size!864 (List!446) Int)

(assert (=> d!10852 (= (length!172 lt!54966) (size!864 lt!54966))))

(declare-fun bs!2908 () Bool)

(assert (= bs!2908 d!10852))

(declare-fun m!55579 () Bool)

(assert (=> bs!2908 m!55579))

(assert (=> b!36642 d!10852))

(declare-fun d!10854 () Bool)

(assert (=> d!10854 (= (head!283 (byteArrayBitContentToList!0 (_2!1892 lt!54955) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!561 (byteArrayBitContentToList!0 (_2!1892 lt!54955) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!36653 d!10854))

(declare-fun d!10856 () Bool)

(declare-fun c!2518 () Bool)

(assert (=> d!10856 (= c!2518 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24273 () List!446)

(assert (=> d!10856 (= (byteArrayBitContentToList!0 (_2!1892 lt!54955) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!24273)))

(declare-fun b!36814 () Bool)

(assert (=> b!36814 (= e!24273 Nil!443)))

(declare-fun b!36815 () Bool)

(assert (=> b!36815 (= e!24273 (Cons!442 (not (= (bvand ((_ sign_extend 24) (select (arr!1348 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1892 lt!54955) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10856 c!2518) b!36814))

(assert (= (and d!10856 (not c!2518)) b!36815))

(assert (=> b!36815 m!55347))

(declare-fun m!55581 () Bool)

(assert (=> b!36815 m!55581))

(declare-fun m!55583 () Bool)

(assert (=> b!36815 m!55583))

(assert (=> b!36653 d!10856))

(declare-fun d!10858 () Bool)

(assert (=> d!10858 (= (head!283 (bitStreamReadBitsIntoList!0 (_2!1892 lt!54955) (_1!1893 lt!54960) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!561 (bitStreamReadBitsIntoList!0 (_2!1892 lt!54955) (_1!1893 lt!54960) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!36653 d!10858))

(declare-fun b!36817 () Bool)

(declare-fun lt!55257 () (_ BitVec 64))

(declare-fun lt!55258 () tuple2!3630)

(declare-fun e!24274 () tuple2!3628)

(assert (=> b!36817 (= e!24274 (tuple2!3629 (Cons!442 (_1!1902 lt!55258) (bitStreamReadBitsIntoList!0 (_2!1892 lt!54955) (_2!1902 lt!55258) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!55257))) (_2!1902 lt!55258)))))

(assert (=> b!36817 (= lt!55258 (readBit!0 (_1!1893 lt!54960)))))

(assert (=> b!36817 (= lt!55257 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10860 () Bool)

(declare-fun e!24275 () Bool)

(assert (=> d!10860 e!24275))

(declare-fun c!2519 () Bool)

(assert (=> d!10860 (= c!2519 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!55256 () List!446)

(assert (=> d!10860 (= lt!55256 (_1!1901 e!24274))))

(declare-fun c!2520 () Bool)

(assert (=> d!10860 (= c!2520 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10860 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10860 (= (bitStreamReadBitsIntoList!0 (_2!1892 lt!54955) (_1!1893 lt!54960) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55256)))

(declare-fun b!36818 () Bool)

(assert (=> b!36818 (= e!24275 (isEmpty!104 lt!55256))))

(declare-fun b!36816 () Bool)

(assert (=> b!36816 (= e!24274 (tuple2!3629 Nil!443 (_1!1893 lt!54960)))))

(declare-fun b!36819 () Bool)

(assert (=> b!36819 (= e!24275 (> (length!172 lt!55256) 0))))

(assert (= (and d!10860 c!2520) b!36816))

(assert (= (and d!10860 (not c!2520)) b!36817))

(assert (= (and d!10860 c!2519) b!36818))

(assert (= (and d!10860 (not c!2519)) b!36819))

(declare-fun m!55585 () Bool)

(assert (=> b!36817 m!55585))

(declare-fun m!55587 () Bool)

(assert (=> b!36817 m!55587))

(declare-fun m!55589 () Bool)

(assert (=> b!36818 m!55589))

(declare-fun m!55591 () Bool)

(assert (=> b!36819 m!55591))

(assert (=> b!36653 d!10860))

(declare-fun d!10862 () Bool)

(declare-fun res!31344 () Bool)

(declare-fun e!24281 () Bool)

(assert (=> d!10862 (=> (not res!31344) (not e!24281))))

(assert (=> d!10862 (= res!31344 (= (size!861 (buf!1189 thiss!1379)) (size!861 (buf!1189 (_2!1892 lt!54958)))))))

(assert (=> d!10862 (= (isPrefixOf!0 thiss!1379 (_2!1892 lt!54958)) e!24281)))

(declare-fun b!36826 () Bool)

(declare-fun res!31343 () Bool)

(assert (=> b!36826 (=> (not res!31343) (not e!24281))))

(assert (=> b!36826 (= res!31343 (bvsle (bitIndex!0 (size!861 (buf!1189 thiss!1379)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)) (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54958))) (currentByte!2583 (_2!1892 lt!54958)) (currentBit!2578 (_2!1892 lt!54958)))))))

(declare-fun b!36827 () Bool)

(declare-fun e!24280 () Bool)

(assert (=> b!36827 (= e!24281 e!24280)))

(declare-fun res!31345 () Bool)

(assert (=> b!36827 (=> res!31345 e!24280)))

(assert (=> b!36827 (= res!31345 (= (size!861 (buf!1189 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36828 () Bool)

(assert (=> b!36828 (= e!24280 (arrayBitRangesEq!0 (buf!1189 thiss!1379) (buf!1189 (_2!1892 lt!54958)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!861 (buf!1189 thiss!1379)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379))))))

(assert (= (and d!10862 res!31344) b!36826))

(assert (= (and b!36826 res!31343) b!36827))

(assert (= (and b!36827 (not res!31345)) b!36828))

(assert (=> b!36826 m!55325))

(assert (=> b!36826 m!55379))

(assert (=> b!36828 m!55325))

(assert (=> b!36828 m!55325))

(declare-fun m!55593 () Bool)

(assert (=> b!36828 m!55593))

(assert (=> b!36643 d!10862))

(declare-fun b!37011 () Bool)

(declare-fun e!24366 () Bool)

(declare-fun lt!55871 () (_ BitVec 64))

(assert (=> b!37011 (= e!24366 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!55871))))

(declare-fun b!37012 () Bool)

(declare-fun e!24367 () tuple2!3610)

(declare-fun lt!55910 () tuple2!3610)

(declare-fun Unit!2697 () Unit!2673)

(assert (=> b!37012 (= e!24367 (tuple2!3611 Unit!2697 (_2!1892 lt!55910)))))

(declare-fun lt!55881 () tuple2!3610)

(assert (=> b!37012 (= lt!55881 (appendBitFromByte!0 (_2!1892 lt!54955) (select (arr!1348 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!55872 () (_ BitVec 64))

(assert (=> b!37012 (= lt!55872 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55889 () (_ BitVec 64))

(assert (=> b!37012 (= lt!55889 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55892 () Unit!2673)

(assert (=> b!37012 (= lt!55892 (validateOffsetBitsIneqLemma!0 (_2!1892 lt!54955) (_2!1892 lt!55881) lt!55872 lt!55889))))

(assert (=> b!37012 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!55881)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!55881))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!55881))) (bvsub lt!55872 lt!55889))))

(declare-fun lt!55912 () Unit!2673)

(assert (=> b!37012 (= lt!55912 lt!55892)))

(declare-fun lt!55901 () tuple2!3612)

(assert (=> b!37012 (= lt!55901 (reader!0 (_2!1892 lt!54955) (_2!1892 lt!55881)))))

(declare-fun lt!55877 () (_ BitVec 64))

(assert (=> b!37012 (= lt!55877 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55891 () Unit!2673)

(assert (=> b!37012 (= lt!55891 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1892 lt!54955) (buf!1189 (_2!1892 lt!55881)) lt!55877))))

(assert (=> b!37012 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!55881)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!55877)))

(declare-fun lt!55904 () Unit!2673)

(assert (=> b!37012 (= lt!55904 lt!55891)))

(assert (=> b!37012 (= (head!283 (byteArrayBitContentToList!0 (_2!1892 lt!55881) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!283 (bitStreamReadBitsIntoList!0 (_2!1892 lt!55881) (_1!1893 lt!55901) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55869 () Unit!2673)

(declare-fun Unit!2698 () Unit!2673)

(assert (=> b!37012 (= lt!55869 Unit!2698)))

(assert (=> b!37012 (= lt!55910 (appendBitsMSBFirstLoop!0 (_2!1892 lt!55881) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!55902 () Unit!2673)

(assert (=> b!37012 (= lt!55902 (lemmaIsPrefixTransitive!0 (_2!1892 lt!54955) (_2!1892 lt!55881) (_2!1892 lt!55910)))))

(assert (=> b!37012 (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!55910))))

(declare-fun lt!55879 () Unit!2673)

(assert (=> b!37012 (= lt!55879 lt!55902)))

(assert (=> b!37012 (= (size!861 (buf!1189 (_2!1892 lt!55910))) (size!861 (buf!1189 (_2!1892 lt!54955))))))

(declare-fun lt!55883 () Unit!2673)

(declare-fun Unit!2699 () Unit!2673)

(assert (=> b!37012 (= lt!55883 Unit!2699)))

(assert (=> b!37012 (= (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!55910))) (currentByte!2583 (_2!1892 lt!55910)) (currentBit!2578 (_2!1892 lt!55910))) (bvsub (bvadd (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55882 () Unit!2673)

(declare-fun Unit!2700 () Unit!2673)

(assert (=> b!37012 (= lt!55882 Unit!2700)))

(assert (=> b!37012 (= (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!55910))) (currentByte!2583 (_2!1892 lt!55910)) (currentBit!2578 (_2!1892 lt!55910))) (bvsub (bvsub (bvadd (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!55881))) (currentByte!2583 (_2!1892 lt!55881)) (currentBit!2578 (_2!1892 lt!55881))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!55870 () Unit!2673)

(declare-fun Unit!2701 () Unit!2673)

(assert (=> b!37012 (= lt!55870 Unit!2701)))

(declare-fun lt!55895 () tuple2!3612)

(assert (=> b!37012 (= lt!55895 (reader!0 (_2!1892 lt!54955) (_2!1892 lt!55910)))))

(declare-fun lt!55899 () (_ BitVec 64))

(assert (=> b!37012 (= lt!55899 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55906 () Unit!2673)

(assert (=> b!37012 (= lt!55906 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1892 lt!54955) (buf!1189 (_2!1892 lt!55910)) lt!55899))))

(assert (=> b!37012 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!55910)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!55899)))

(declare-fun lt!55908 () Unit!2673)

(assert (=> b!37012 (= lt!55908 lt!55906)))

(declare-fun lt!55878 () tuple2!3612)

(declare-fun call!463 () tuple2!3612)

(assert (=> b!37012 (= lt!55878 call!463)))

(declare-fun lt!55875 () (_ BitVec 64))

(assert (=> b!37012 (= lt!55875 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!55873 () Unit!2673)

(assert (=> b!37012 (= lt!55873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1892 lt!55881) (buf!1189 (_2!1892 lt!55910)) lt!55875))))

(assert (=> b!37012 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!55910)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!55881))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!55881))) lt!55875)))

(declare-fun lt!55874 () Unit!2673)

(assert (=> b!37012 (= lt!55874 lt!55873)))

(declare-fun lt!55890 () List!446)

(assert (=> b!37012 (= lt!55890 (byteArrayBitContentToList!0 (_2!1892 lt!55910) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!55893 () List!446)

(assert (=> b!37012 (= lt!55893 (byteArrayBitContentToList!0 (_2!1892 lt!55910) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55900 () List!446)

(assert (=> b!37012 (= lt!55900 (bitStreamReadBitsIntoList!0 (_2!1892 lt!55910) (_1!1893 lt!55895) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!55903 () List!446)

(assert (=> b!37012 (= lt!55903 (bitStreamReadBitsIntoList!0 (_2!1892 lt!55910) (_1!1893 lt!55878) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55911 () (_ BitVec 64))

(assert (=> b!37012 (= lt!55911 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55884 () Unit!2673)

(assert (=> b!37012 (= lt!55884 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1892 lt!55910) (_2!1892 lt!55910) (_1!1893 lt!55895) (_1!1893 lt!55878) lt!55911 lt!55900))))

(assert (=> b!37012 (= (bitStreamReadBitsIntoList!0 (_2!1892 lt!55910) (_1!1893 lt!55878) (bvsub lt!55911 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!163 lt!55900))))

(declare-fun lt!55876 () Unit!2673)

(assert (=> b!37012 (= lt!55876 lt!55884)))

(declare-fun lt!55897 () (_ BitVec 64))

(declare-fun lt!55886 () Unit!2673)

(assert (=> b!37012 (= lt!55886 (arrayBitRangesEqImpliesEq!0 (buf!1189 (_2!1892 lt!55881)) (buf!1189 (_2!1892 lt!55910)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!55897 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!55881))) (currentByte!2583 (_2!1892 lt!55881)) (currentBit!2578 (_2!1892 lt!55881)))))))

(assert (=> b!37012 (= (bitAt!0 (buf!1189 (_2!1892 lt!55881)) lt!55897) (bitAt!0 (buf!1189 (_2!1892 lt!55910)) lt!55897))))

(declare-fun lt!55888 () Unit!2673)

(assert (=> b!37012 (= lt!55888 lt!55886)))

(declare-fun d!10864 () Bool)

(declare-fun e!24368 () Bool)

(assert (=> d!10864 e!24368))

(declare-fun res!31469 () Bool)

(assert (=> d!10864 (=> (not res!31469) (not e!24368))))

(declare-fun lt!55887 () (_ BitVec 64))

(declare-fun lt!55885 () tuple2!3610)

(assert (=> d!10864 (= res!31469 (= (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!55885))) (currentByte!2583 (_2!1892 lt!55885)) (currentBit!2578 (_2!1892 lt!55885))) (bvsub lt!55887 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10864 (or (= (bvand lt!55887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55887 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!55907 () (_ BitVec 64))

(assert (=> d!10864 (= lt!55887 (bvadd lt!55907 to!314))))

(assert (=> d!10864 (or (not (= (bvand lt!55907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!55907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!55907 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10864 (= lt!55907 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))))))

(assert (=> d!10864 (= lt!55885 e!24367)))

(declare-fun c!2551 () Bool)

(assert (=> d!10864 (= c!2551 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!55896 () Unit!2673)

(declare-fun lt!55894 () Unit!2673)

(assert (=> d!10864 (= lt!55896 lt!55894)))

(assert (=> d!10864 (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!54955))))

(assert (=> d!10864 (= lt!55894 (lemmaIsPrefixRefl!0 (_2!1892 lt!54955)))))

(assert (=> d!10864 (= lt!55897 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))))))

(assert (=> d!10864 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10864 (= (appendBitsMSBFirstLoop!0 (_2!1892 lt!54955) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!55885)))

(declare-fun b!37013 () Bool)

(declare-fun res!31467 () Bool)

(assert (=> b!37013 (=> (not res!31467) (not e!24368))))

(assert (=> b!37013 (= res!31467 (invariant!0 (currentBit!2578 (_2!1892 lt!55885)) (currentByte!2583 (_2!1892 lt!55885)) (size!861 (buf!1189 (_2!1892 lt!55885)))))))

(declare-fun b!37014 () Bool)

(declare-fun res!31470 () Bool)

(assert (=> b!37014 (=> (not res!31470) (not e!24368))))

(assert (=> b!37014 (= res!31470 (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!55885)))))

(declare-fun b!37015 () Bool)

(declare-fun res!31471 () Bool)

(assert (=> b!37015 (=> (not res!31471) (not e!24368))))

(assert (=> b!37015 (= res!31471 (= (size!861 (buf!1189 (_2!1892 lt!54955))) (size!861 (buf!1189 (_2!1892 lt!55885)))))))

(declare-fun b!37016 () Bool)

(declare-fun Unit!2702 () Unit!2673)

(assert (=> b!37016 (= e!24367 (tuple2!3611 Unit!2702 (_2!1892 lt!54955)))))

(assert (=> b!37016 (= (size!861 (buf!1189 (_2!1892 lt!54955))) (size!861 (buf!1189 (_2!1892 lt!54955))))))

(declare-fun lt!55898 () Unit!2673)

(declare-fun Unit!2703 () Unit!2673)

(assert (=> b!37016 (= lt!55898 Unit!2703)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1490 array!1926 array!1926 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3632 0))(
  ( (tuple2!3633 (_1!1903 array!1926) (_2!1903 BitStream!1490)) )
))
(declare-fun readBits!0 (BitStream!1490 (_ BitVec 64)) tuple2!3632)

(assert (=> b!37016 (checkByteArrayBitContent!0 (_2!1892 lt!54955) srcBuffer!2 (_1!1903 (readBits!0 (_1!1893 call!463) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!37017 () Bool)

(declare-fun res!31472 () Bool)

(assert (=> b!37017 (=> (not res!31472) (not e!24368))))

(assert (=> b!37017 (= res!31472 (= (size!861 (buf!1189 (_2!1892 lt!55885))) (size!861 (buf!1189 (_2!1892 lt!54955)))))))

(declare-fun lt!55909 () tuple2!3612)

(declare-fun b!37018 () Bool)

(assert (=> b!37018 (= e!24368 (= (bitStreamReadBitsIntoList!0 (_2!1892 lt!55885) (_1!1893 lt!55909) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1892 lt!55885) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!37018 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37018 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!55905 () Unit!2673)

(declare-fun lt!55880 () Unit!2673)

(assert (=> b!37018 (= lt!55905 lt!55880)))

(assert (=> b!37018 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!55885)))) ((_ sign_extend 32) (currentByte!2583 (_2!1892 lt!54955))) ((_ sign_extend 32) (currentBit!2578 (_2!1892 lt!54955))) lt!55871)))

(assert (=> b!37018 (= lt!55880 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1892 lt!54955) (buf!1189 (_2!1892 lt!55885)) lt!55871))))

(assert (=> b!37018 e!24366))

(declare-fun res!31468 () Bool)

(assert (=> b!37018 (=> (not res!31468) (not e!24366))))

(assert (=> b!37018 (= res!31468 (and (= (size!861 (buf!1189 (_2!1892 lt!54955))) (size!861 (buf!1189 (_2!1892 lt!55885)))) (bvsge lt!55871 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37018 (= lt!55871 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!37018 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37018 (= lt!55909 (reader!0 (_2!1892 lt!54955) (_2!1892 lt!55885)))))

(declare-fun bm!460 () Bool)

(assert (=> bm!460 (= call!463 (reader!0 (ite c!2551 (_2!1892 lt!55881) (_2!1892 lt!54955)) (ite c!2551 (_2!1892 lt!55910) (_2!1892 lt!54955))))))

(assert (= (and d!10864 c!2551) b!37012))

(assert (= (and d!10864 (not c!2551)) b!37016))

(assert (= (or b!37012 b!37016) bm!460))

(assert (= (and d!10864 res!31469) b!37013))

(assert (= (and b!37013 res!31467) b!37015))

(assert (= (and b!37015 res!31471) b!37014))

(assert (= (and b!37014 res!31470) b!37017))

(assert (= (and b!37017 res!31472) b!37018))

(assert (= (and b!37018 res!31468) b!37011))

(declare-fun m!56025 () Bool)

(assert (=> b!37018 m!56025))

(declare-fun m!56027 () Bool)

(assert (=> b!37018 m!56027))

(declare-fun m!56029 () Bool)

(assert (=> b!37018 m!56029))

(declare-fun m!56031 () Bool)

(assert (=> b!37018 m!56031))

(declare-fun m!56033 () Bool)

(assert (=> b!37018 m!56033))

(declare-fun m!56035 () Bool)

(assert (=> b!37011 m!56035))

(declare-fun m!56037 () Bool)

(assert (=> b!37013 m!56037))

(declare-fun m!56039 () Bool)

(assert (=> d!10864 m!56039))

(assert (=> d!10864 m!55313))

(assert (=> d!10864 m!55515))

(assert (=> d!10864 m!55519))

(declare-fun m!56041 () Bool)

(assert (=> b!37014 m!56041))

(declare-fun m!56043 () Bool)

(assert (=> b!37016 m!56043))

(declare-fun m!56045 () Bool)

(assert (=> b!37016 m!56045))

(declare-fun m!56047 () Bool)

(assert (=> b!37012 m!56047))

(declare-fun m!56049 () Bool)

(assert (=> b!37012 m!56049))

(declare-fun m!56051 () Bool)

(assert (=> b!37012 m!56051))

(declare-fun m!56053 () Bool)

(assert (=> b!37012 m!56053))

(declare-fun m!56055 () Bool)

(assert (=> b!37012 m!56055))

(declare-fun m!56057 () Bool)

(assert (=> b!37012 m!56057))

(declare-fun m!56059 () Bool)

(assert (=> b!37012 m!56059))

(declare-fun m!56061 () Bool)

(assert (=> b!37012 m!56061))

(declare-fun m!56063 () Bool)

(assert (=> b!37012 m!56063))

(declare-fun m!56065 () Bool)

(assert (=> b!37012 m!56065))

(assert (=> b!37012 m!56061))

(declare-fun m!56067 () Bool)

(assert (=> b!37012 m!56067))

(declare-fun m!56069 () Bool)

(assert (=> b!37012 m!56069))

(assert (=> b!37012 m!55313))

(declare-fun m!56071 () Bool)

(assert (=> b!37012 m!56071))

(declare-fun m!56073 () Bool)

(assert (=> b!37012 m!56073))

(declare-fun m!56075 () Bool)

(assert (=> b!37012 m!56075))

(declare-fun m!56077 () Bool)

(assert (=> b!37012 m!56077))

(declare-fun m!56079 () Bool)

(assert (=> b!37012 m!56079))

(declare-fun m!56081 () Bool)

(assert (=> b!37012 m!56081))

(assert (=> b!37012 m!56053))

(declare-fun m!56083 () Bool)

(assert (=> b!37012 m!56083))

(declare-fun m!56085 () Bool)

(assert (=> b!37012 m!56085))

(declare-fun m!56087 () Bool)

(assert (=> b!37012 m!56087))

(declare-fun m!56089 () Bool)

(assert (=> b!37012 m!56089))

(assert (=> b!37012 m!56075))

(assert (=> b!37012 m!56069))

(declare-fun m!56091 () Bool)

(assert (=> b!37012 m!56091))

(declare-fun m!56093 () Bool)

(assert (=> b!37012 m!56093))

(declare-fun m!56095 () Bool)

(assert (=> b!37012 m!56095))

(declare-fun m!56097 () Bool)

(assert (=> b!37012 m!56097))

(declare-fun m!56099 () Bool)

(assert (=> b!37012 m!56099))

(declare-fun m!56101 () Bool)

(assert (=> b!37012 m!56101))

(declare-fun m!56103 () Bool)

(assert (=> b!37012 m!56103))

(declare-fun m!56105 () Bool)

(assert (=> b!37012 m!56105))

(declare-fun m!56107 () Bool)

(assert (=> b!37012 m!56107))

(declare-fun m!56109 () Bool)

(assert (=> bm!460 m!56109))

(assert (=> b!36643 d!10864))

(declare-fun d!10980 () Bool)

(assert (=> d!10980 (isPrefixOf!0 thiss!1379 (_2!1892 lt!54958))))

(declare-fun lt!55915 () Unit!2673)

(declare-fun choose!30 (BitStream!1490 BitStream!1490 BitStream!1490) Unit!2673)

(assert (=> d!10980 (= lt!55915 (choose!30 thiss!1379 (_2!1892 lt!54955) (_2!1892 lt!54958)))))

(assert (=> d!10980 (isPrefixOf!0 thiss!1379 (_2!1892 lt!54955))))

(assert (=> d!10980 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1892 lt!54955) (_2!1892 lt!54958)) lt!55915)))

(declare-fun bs!2936 () Bool)

(assert (= bs!2936 d!10980))

(assert (=> bs!2936 m!55367))

(declare-fun m!56111 () Bool)

(assert (=> bs!2936 m!56111))

(assert (=> bs!2936 m!55343))

(assert (=> b!36643 d!10980))

(declare-fun b!37019 () Bool)

(declare-fun e!24369 () Unit!2673)

(declare-fun Unit!2704 () Unit!2673)

(assert (=> b!37019 (= e!24369 Unit!2704)))

(declare-fun d!10982 () Bool)

(declare-fun e!24370 () Bool)

(assert (=> d!10982 e!24370))

(declare-fun res!31473 () Bool)

(assert (=> d!10982 (=> (not res!31473) (not e!24370))))

(declare-fun lt!55918 () tuple2!3612)

(assert (=> d!10982 (= res!31473 (isPrefixOf!0 (_1!1893 lt!55918) (_2!1893 lt!55918)))))

(declare-fun lt!55924 () BitStream!1490)

(assert (=> d!10982 (= lt!55918 (tuple2!3613 lt!55924 (_2!1892 lt!54955)))))

(declare-fun lt!55917 () Unit!2673)

(declare-fun lt!55928 () Unit!2673)

(assert (=> d!10982 (= lt!55917 lt!55928)))

(assert (=> d!10982 (isPrefixOf!0 lt!55924 (_2!1892 lt!54955))))

(assert (=> d!10982 (= lt!55928 (lemmaIsPrefixTransitive!0 lt!55924 (_2!1892 lt!54955) (_2!1892 lt!54955)))))

(declare-fun lt!55922 () Unit!2673)

(declare-fun lt!55916 () Unit!2673)

(assert (=> d!10982 (= lt!55922 lt!55916)))

(assert (=> d!10982 (isPrefixOf!0 lt!55924 (_2!1892 lt!54955))))

(assert (=> d!10982 (= lt!55916 (lemmaIsPrefixTransitive!0 lt!55924 thiss!1379 (_2!1892 lt!54955)))))

(declare-fun lt!55920 () Unit!2673)

(assert (=> d!10982 (= lt!55920 e!24369)))

(declare-fun c!2552 () Bool)

(assert (=> d!10982 (= c!2552 (not (= (size!861 (buf!1189 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!55931 () Unit!2673)

(declare-fun lt!55935 () Unit!2673)

(assert (=> d!10982 (= lt!55931 lt!55935)))

(assert (=> d!10982 (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!54955))))

(assert (=> d!10982 (= lt!55935 (lemmaIsPrefixRefl!0 (_2!1892 lt!54955)))))

(declare-fun lt!55929 () Unit!2673)

(declare-fun lt!55919 () Unit!2673)

(assert (=> d!10982 (= lt!55929 lt!55919)))

(assert (=> d!10982 (= lt!55919 (lemmaIsPrefixRefl!0 (_2!1892 lt!54955)))))

(declare-fun lt!55927 () Unit!2673)

(declare-fun lt!55925 () Unit!2673)

(assert (=> d!10982 (= lt!55927 lt!55925)))

(assert (=> d!10982 (isPrefixOf!0 lt!55924 lt!55924)))

(assert (=> d!10982 (= lt!55925 (lemmaIsPrefixRefl!0 lt!55924))))

(declare-fun lt!55923 () Unit!2673)

(declare-fun lt!55926 () Unit!2673)

(assert (=> d!10982 (= lt!55923 lt!55926)))

(assert (=> d!10982 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10982 (= lt!55926 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10982 (= lt!55924 (BitStream!1491 (buf!1189 (_2!1892 lt!54955)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)))))

(assert (=> d!10982 (isPrefixOf!0 thiss!1379 (_2!1892 lt!54955))))

(assert (=> d!10982 (= (reader!0 thiss!1379 (_2!1892 lt!54955)) lt!55918)))

(declare-fun b!37020 () Bool)

(declare-fun res!31475 () Bool)

(assert (=> b!37020 (=> (not res!31475) (not e!24370))))

(assert (=> b!37020 (= res!31475 (isPrefixOf!0 (_1!1893 lt!55918) thiss!1379))))

(declare-fun b!37021 () Bool)

(declare-fun lt!55934 () Unit!2673)

(assert (=> b!37021 (= e!24369 lt!55934)))

(declare-fun lt!55933 () (_ BitVec 64))

(assert (=> b!37021 (= lt!55933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55921 () (_ BitVec 64))

(assert (=> b!37021 (= lt!55921 (bitIndex!0 (size!861 (buf!1189 thiss!1379)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)))))

(assert (=> b!37021 (= lt!55934 (arrayBitRangesEqSymmetric!0 (buf!1189 thiss!1379) (buf!1189 (_2!1892 lt!54955)) lt!55933 lt!55921))))

(assert (=> b!37021 (arrayBitRangesEq!0 (buf!1189 (_2!1892 lt!54955)) (buf!1189 thiss!1379) lt!55933 lt!55921)))

(declare-fun lt!55932 () (_ BitVec 64))

(declare-fun b!37022 () Bool)

(declare-fun lt!55930 () (_ BitVec 64))

(assert (=> b!37022 (= e!24370 (= (_1!1893 lt!55918) (withMovedBitIndex!0 (_2!1893 lt!55918) (bvsub lt!55932 lt!55930))))))

(assert (=> b!37022 (or (= (bvand lt!55932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55930 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55932 lt!55930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37022 (= lt!55930 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))))))

(assert (=> b!37022 (= lt!55932 (bitIndex!0 (size!861 (buf!1189 thiss!1379)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379)))))

(declare-fun b!37023 () Bool)

(declare-fun res!31474 () Bool)

(assert (=> b!37023 (=> (not res!31474) (not e!24370))))

(assert (=> b!37023 (= res!31474 (isPrefixOf!0 (_2!1893 lt!55918) (_2!1892 lt!54955)))))

(assert (= (and d!10982 c!2552) b!37021))

(assert (= (and d!10982 (not c!2552)) b!37019))

(assert (= (and d!10982 res!31473) b!37020))

(assert (= (and b!37020 res!31475) b!37023))

(assert (= (and b!37023 res!31474) b!37022))

(declare-fun m!56113 () Bool)

(assert (=> b!37020 m!56113))

(declare-fun m!56115 () Bool)

(assert (=> b!37023 m!56115))

(declare-fun m!56117 () Bool)

(assert (=> b!37022 m!56117))

(assert (=> b!37022 m!55313))

(assert (=> b!37022 m!55325))

(assert (=> b!37021 m!55325))

(declare-fun m!56119 () Bool)

(assert (=> b!37021 m!56119))

(declare-fun m!56121 () Bool)

(assert (=> b!37021 m!56121))

(assert (=> d!10982 m!55515))

(assert (=> d!10982 m!55343))

(declare-fun m!56123 () Bool)

(assert (=> d!10982 m!56123))

(assert (=> d!10982 m!55519))

(declare-fun m!56125 () Bool)

(assert (=> d!10982 m!56125))

(declare-fun m!56127 () Bool)

(assert (=> d!10982 m!56127))

(declare-fun m!56129 () Bool)

(assert (=> d!10982 m!56129))

(declare-fun m!56131 () Bool)

(assert (=> d!10982 m!56131))

(assert (=> d!10982 m!55321))

(declare-fun m!56133 () Bool)

(assert (=> d!10982 m!56133))

(assert (=> d!10982 m!55323))

(assert (=> b!36643 d!10982))

(declare-fun d!10984 () Bool)

(assert (=> d!10984 (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55936 () Unit!2673)

(assert (=> d!10984 (= lt!55936 (choose!9 thiss!1379 (buf!1189 (_2!1892 lt!54955)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1491 (buf!1189 (_2!1892 lt!54955)) (currentByte!2583 thiss!1379) (currentBit!2578 thiss!1379))))))

(assert (=> d!10984 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1189 (_2!1892 lt!54955)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55936)))

(declare-fun bs!2937 () Bool)

(assert (= bs!2937 d!10984))

(assert (=> bs!2937 m!55369))

(declare-fun m!56135 () Bool)

(assert (=> bs!2937 m!56135))

(assert (=> b!36643 d!10984))

(declare-fun d!10986 () Bool)

(declare-fun res!31477 () Bool)

(declare-fun e!24372 () Bool)

(assert (=> d!10986 (=> (not res!31477) (not e!24372))))

(assert (=> d!10986 (= res!31477 (= (size!861 (buf!1189 (_2!1892 lt!54955))) (size!861 (buf!1189 (_2!1892 lt!54958)))))))

(assert (=> d!10986 (= (isPrefixOf!0 (_2!1892 lt!54955) (_2!1892 lt!54958)) e!24372)))

(declare-fun b!37024 () Bool)

(declare-fun res!31476 () Bool)

(assert (=> b!37024 (=> (not res!31476) (not e!24372))))

(assert (=> b!37024 (= res!31476 (bvsle (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955))) (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54958))) (currentByte!2583 (_2!1892 lt!54958)) (currentBit!2578 (_2!1892 lt!54958)))))))

(declare-fun b!37025 () Bool)

(declare-fun e!24371 () Bool)

(assert (=> b!37025 (= e!24372 e!24371)))

(declare-fun res!31478 () Bool)

(assert (=> b!37025 (=> res!31478 e!24371)))

(assert (=> b!37025 (= res!31478 (= (size!861 (buf!1189 (_2!1892 lt!54955))) #b00000000000000000000000000000000))))

(declare-fun b!37026 () Bool)

(assert (=> b!37026 (= e!24371 (arrayBitRangesEq!0 (buf!1189 (_2!1892 lt!54955)) (buf!1189 (_2!1892 lt!54958)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!861 (buf!1189 (_2!1892 lt!54955))) (currentByte!2583 (_2!1892 lt!54955)) (currentBit!2578 (_2!1892 lt!54955)))))))

(assert (= (and d!10986 res!31477) b!37024))

(assert (= (and b!37024 res!31476) b!37025))

(assert (= (and b!37025 (not res!31478)) b!37026))

(assert (=> b!37024 m!55313))

(assert (=> b!37024 m!55379))

(assert (=> b!37026 m!55313))

(assert (=> b!37026 m!55313))

(declare-fun m!56137 () Bool)

(assert (=> b!37026 m!56137))

(assert (=> b!36643 d!10986))

(declare-fun d!10988 () Bool)

(assert (=> d!10988 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!861 (buf!1189 (_2!1892 lt!54955)))) ((_ sign_extend 32) (currentByte!2583 thiss!1379)) ((_ sign_extend 32) (currentBit!2578 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2938 () Bool)

(assert (= bs!2938 d!10988))

(declare-fun m!56139 () Bool)

(assert (=> bs!2938 m!56139))

(assert (=> b!36643 d!10988))

(declare-fun d!10990 () Bool)

(assert (=> d!10990 (= (head!283 lt!54966) (h!561 lt!54966))))

(assert (=> b!36638 d!10990))

(declare-fun d!10992 () Bool)

(declare-fun res!31480 () Bool)

(declare-fun e!24374 () Bool)

(assert (=> d!10992 (=> (not res!31480) (not e!24374))))

(assert (=> d!10992 (= res!31480 (= (size!861 (buf!1189 thiss!1379)) (size!861 (buf!1189 (_2!1892 lt!54955)))))))

(assert (=> d!10992 (= (isPrefixOf!0 thiss!1379 (_2!1892 lt!54955)) e!24374)))

