; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22386 () Bool)

(assert start!22386)

(declare-fun b!113215 () Bool)

(declare-fun e!74295 () Bool)

(declare-datatypes ((array!5150 0))(
  ( (array!5151 (arr!2934 (Array (_ BitVec 32) (_ BitVec 8))) (size!2341 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4156 0))(
  ( (BitStream!4157 (buf!2749 array!5150) (currentByte!5329 (_ BitVec 32)) (currentBit!5324 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9324 0))(
  ( (tuple2!9325 (_1!4924 BitStream!4156) (_2!4924 Bool)) )
))
(declare-fun lt!171980 () tuple2!9324)

(declare-fun lt!171978 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113215 (= e!74295 (= (bitIndex!0 (size!2341 (buf!2749 (_1!4924 lt!171980))) (currentByte!5329 (_1!4924 lt!171980)) (currentBit!5324 (_1!4924 lt!171980))) lt!171978))))

(declare-fun b!113216 () Bool)

(declare-fun res!93494 () Bool)

(declare-fun e!74294 () Bool)

(assert (=> b!113216 (=> (not res!93494) (not e!74294))))

(declare-fun thiss!1305 () BitStream!4156)

(declare-datatypes ((Unit!6949 0))(
  ( (Unit!6950) )
))
(declare-datatypes ((tuple2!9326 0))(
  ( (tuple2!9327 (_1!4925 Unit!6949) (_2!4925 BitStream!4156)) )
))
(declare-fun lt!171981 () tuple2!9326)

(declare-fun isPrefixOf!0 (BitStream!4156 BitStream!4156) Bool)

(assert (=> b!113216 (= res!93494 (isPrefixOf!0 thiss!1305 (_2!4925 lt!171981)))))

(declare-fun b!113217 () Bool)

(declare-fun res!93498 () Bool)

(declare-fun e!74291 () Bool)

(assert (=> b!113217 (=> (not res!93498) (not e!74291))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113217 (= res!93498 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113219 () Bool)

(declare-fun e!74290 () Bool)

(assert (=> b!113219 (= e!74291 (not e!74290))))

(declare-fun res!93493 () Bool)

(assert (=> b!113219 (=> res!93493 e!74290)))

(assert (=> b!113219 (= res!93493 (not (isPrefixOf!0 thiss!1305 (_2!4925 lt!171981))))))

(declare-fun lt!171982 () tuple2!9326)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4156 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9326)

(assert (=> b!113219 (= lt!171982 (appendNLeastSignificantBitsLoop!0 (_2!4925 lt!171981) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!74289 () Bool)

(assert (=> b!113219 e!74289))

(declare-fun res!93497 () Bool)

(assert (=> b!113219 (=> (not res!93497) (not e!74289))))

(assert (=> b!113219 (= res!93497 (= (size!2341 (buf!2749 thiss!1305)) (size!2341 (buf!2749 (_2!4925 lt!171981)))))))

(declare-fun lt!171979 () Bool)

(declare-fun appendBit!0 (BitStream!4156 Bool) tuple2!9326)

(assert (=> b!113219 (= lt!171981 (appendBit!0 thiss!1305 lt!171979))))

(assert (=> b!113219 (= lt!171979 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113220 () Bool)

(declare-fun res!93499 () Bool)

(assert (=> b!113220 (=> (not res!93499) (not e!74291))))

(assert (=> b!113220 (= res!93499 (bvslt i!615 nBits!396))))

(declare-fun b!113221 () Bool)

(assert (=> b!113221 (= e!74289 e!74294)))

(declare-fun res!93496 () Bool)

(assert (=> b!113221 (=> (not res!93496) (not e!74294))))

(declare-fun lt!171983 () (_ BitVec 64))

(assert (=> b!113221 (= res!93496 (= lt!171978 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171983)))))

(assert (=> b!113221 (= lt!171978 (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))))))

(assert (=> b!113221 (= lt!171983 (bitIndex!0 (size!2341 (buf!2749 thiss!1305)) (currentByte!5329 thiss!1305) (currentBit!5324 thiss!1305)))))

(declare-fun b!113222 () Bool)

(declare-fun res!93500 () Bool)

(assert (=> b!113222 (=> (not res!93500) (not e!74291))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113222 (= res!93500 (validate_offset_bits!1 ((_ sign_extend 32) (size!2341 (buf!2749 thiss!1305))) ((_ sign_extend 32) (currentByte!5329 thiss!1305)) ((_ sign_extend 32) (currentBit!5324 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113223 () Bool)

(assert (=> b!113223 (= e!74294 e!74295)))

(declare-fun res!93495 () Bool)

(assert (=> b!113223 (=> (not res!93495) (not e!74295))))

(assert (=> b!113223 (= res!93495 (and (= (_2!4924 lt!171980) lt!171979) (= (_1!4924 lt!171980) (_2!4925 lt!171981))))))

(declare-fun readBitPure!0 (BitStream!4156) tuple2!9324)

(declare-fun readerFrom!0 (BitStream!4156 (_ BitVec 32) (_ BitVec 32)) BitStream!4156)

(assert (=> b!113223 (= lt!171980 (readBitPure!0 (readerFrom!0 (_2!4925 lt!171981) (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305))))))

(declare-fun b!113224 () Bool)

(assert (=> b!113224 (= e!74290 (isPrefixOf!0 (_2!4925 lt!171981) (_2!4925 lt!171982)))))

(declare-fun res!93492 () Bool)

(assert (=> start!22386 (=> (not res!93492) (not e!74291))))

(assert (=> start!22386 (= res!93492 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22386 e!74291))

(assert (=> start!22386 true))

(declare-fun e!74292 () Bool)

(declare-fun inv!12 (BitStream!4156) Bool)

(assert (=> start!22386 (and (inv!12 thiss!1305) e!74292)))

(declare-fun b!113218 () Bool)

(declare-fun array_inv!2143 (array!5150) Bool)

(assert (=> b!113218 (= e!74292 (array_inv!2143 (buf!2749 thiss!1305)))))

(assert (= (and start!22386 res!93492) b!113222))

(assert (= (and b!113222 res!93500) b!113217))

(assert (= (and b!113217 res!93498) b!113220))

(assert (= (and b!113220 res!93499) b!113219))

(assert (= (and b!113219 res!93497) b!113221))

(assert (= (and b!113221 res!93496) b!113216))

(assert (= (and b!113216 res!93494) b!113223))

(assert (= (and b!113223 res!93495) b!113215))

(assert (= (and b!113219 (not res!93493)) b!113224))

(assert (= start!22386 b!113218))

(declare-fun m!169231 () Bool)

(assert (=> b!113219 m!169231))

(declare-fun m!169233 () Bool)

(assert (=> b!113219 m!169233))

(declare-fun m!169235 () Bool)

(assert (=> b!113219 m!169235))

(declare-fun m!169237 () Bool)

(assert (=> start!22386 m!169237))

(declare-fun m!169239 () Bool)

(assert (=> b!113221 m!169239))

(declare-fun m!169241 () Bool)

(assert (=> b!113221 m!169241))

(declare-fun m!169243 () Bool)

(assert (=> b!113224 m!169243))

(declare-fun m!169245 () Bool)

(assert (=> b!113223 m!169245))

(assert (=> b!113223 m!169245))

(declare-fun m!169247 () Bool)

(assert (=> b!113223 m!169247))

(declare-fun m!169249 () Bool)

(assert (=> b!113218 m!169249))

(declare-fun m!169251 () Bool)

(assert (=> b!113215 m!169251))

(assert (=> b!113216 m!169231))

(declare-fun m!169253 () Bool)

(assert (=> b!113222 m!169253))

(declare-fun m!169255 () Bool)

(assert (=> b!113217 m!169255))

(push 1)

(assert (not start!22386))

(assert (not b!113224))

(assert (not b!113218))

(assert (not b!113215))

(assert (not b!113217))

(assert (not b!113216))

(assert (not b!113223))

(assert (not b!113219))

(assert (not b!113221))

(assert (not b!113222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36426 () Bool)

(declare-fun e!74354 () Bool)

(assert (=> d!36426 e!74354))

(declare-fun res!93582 () Bool)

(assert (=> d!36426 (=> (not res!93582) (not e!74354))))

(declare-fun lt!172070 () (_ BitVec 64))

(declare-fun lt!172069 () (_ BitVec 64))

(declare-fun lt!172068 () (_ BitVec 64))

(assert (=> d!36426 (= res!93582 (= lt!172070 (bvsub lt!172068 lt!172069)))))

(assert (=> d!36426 (or (= (bvand lt!172068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172069 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172068 lt!172069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36426 (= lt!172069 (remainingBits!0 ((_ sign_extend 32) (size!2341 (buf!2749 (_1!4924 lt!171980)))) ((_ sign_extend 32) (currentByte!5329 (_1!4924 lt!171980))) ((_ sign_extend 32) (currentBit!5324 (_1!4924 lt!171980)))))))

(declare-fun lt!172065 () (_ BitVec 64))

(declare-fun lt!172067 () (_ BitVec 64))

(assert (=> d!36426 (= lt!172068 (bvmul lt!172065 lt!172067))))

(assert (=> d!36426 (or (= lt!172065 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172067 (bvsdiv (bvmul lt!172065 lt!172067) lt!172065)))))

(assert (=> d!36426 (= lt!172067 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36426 (= lt!172065 ((_ sign_extend 32) (size!2341 (buf!2749 (_1!4924 lt!171980)))))))

(assert (=> d!36426 (= lt!172070 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5329 (_1!4924 lt!171980))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5324 (_1!4924 lt!171980)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!36426 (invariant!0 (currentBit!5324 (_1!4924 lt!171980)) (currentByte!5329 (_1!4924 lt!171980)) (size!2341 (buf!2749 (_1!4924 lt!171980))))))

(assert (=> d!36426 (= (bitIndex!0 (size!2341 (buf!2749 (_1!4924 lt!171980))) (currentByte!5329 (_1!4924 lt!171980)) (currentBit!5324 (_1!4924 lt!171980))) lt!172070)))

(declare-fun b!113311 () Bool)

(declare-fun res!93583 () Bool)

(assert (=> b!113311 (=> (not res!93583) (not e!74354))))

(assert (=> b!113311 (= res!93583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172070))))

(declare-fun b!113312 () Bool)

(declare-fun lt!172066 () (_ BitVec 64))

(assert (=> b!113312 (= e!74354 (bvsle lt!172070 (bvmul lt!172066 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113312 (or (= lt!172066 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172066 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172066)))))

(assert (=> b!113312 (= lt!172066 ((_ sign_extend 32) (size!2341 (buf!2749 (_1!4924 lt!171980)))))))

(assert (= (and d!36426 res!93582) b!113311))

(assert (= (and b!113311 res!93583) b!113312))

(declare-fun m!169327 () Bool)

(assert (=> d!36426 m!169327))

(declare-fun m!169329 () Bool)

(assert (=> d!36426 m!169329))

(assert (=> b!113215 d!36426))

(declare-fun d!36428 () Bool)

(declare-fun res!93593 () Bool)

(declare-fun e!74360 () Bool)

(assert (=> d!36428 (=> (not res!93593) (not e!74360))))

(assert (=> d!36428 (= res!93593 (= (size!2341 (buf!2749 thiss!1305)) (size!2341 (buf!2749 (_2!4925 lt!171981)))))))

(assert (=> d!36428 (= (isPrefixOf!0 thiss!1305 (_2!4925 lt!171981)) e!74360)))

(declare-fun b!113319 () Bool)

(declare-fun res!93591 () Bool)

(assert (=> b!113319 (=> (not res!93591) (not e!74360))))

(assert (=> b!113319 (= res!93591 (bvsle (bitIndex!0 (size!2341 (buf!2749 thiss!1305)) (currentByte!5329 thiss!1305) (currentBit!5324 thiss!1305)) (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981)))))))

(declare-fun b!113320 () Bool)

(declare-fun e!74359 () Bool)

(assert (=> b!113320 (= e!74360 e!74359)))

(declare-fun res!93592 () Bool)

(assert (=> b!113320 (=> res!93592 e!74359)))

(assert (=> b!113320 (= res!93592 (= (size!2341 (buf!2749 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113321 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5150 array!5150 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113321 (= e!74359 (arrayBitRangesEq!0 (buf!2749 thiss!1305) (buf!2749 (_2!4925 lt!171981)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2341 (buf!2749 thiss!1305)) (currentByte!5329 thiss!1305) (currentBit!5324 thiss!1305))))))

(assert (= (and d!36428 res!93593) b!113319))

(assert (= (and b!113319 res!93591) b!113320))

(assert (= (and b!113320 (not res!93592)) b!113321))

(assert (=> b!113319 m!169241))

(assert (=> b!113319 m!169239))

(assert (=> b!113321 m!169241))

(assert (=> b!113321 m!169241))

(declare-fun m!169333 () Bool)

(assert (=> b!113321 m!169333))

(assert (=> b!113219 d!36428))

(declare-fun d!36434 () Bool)

(declare-fun e!74424 () Bool)

(assert (=> d!36434 e!74424))

(declare-fun res!93677 () Bool)

(assert (=> d!36434 (=> (not res!93677) (not e!74424))))

(declare-fun lt!172421 () tuple2!9326)

(assert (=> d!36434 (= res!93677 (= (size!2341 (buf!2749 (_2!4925 lt!171981))) (size!2341 (buf!2749 (_2!4925 lt!172421)))))))

(declare-fun e!74423 () tuple2!9326)

(assert (=> d!36434 (= lt!172421 e!74423)))

(declare-fun c!6886 () Bool)

(assert (=> d!36434 (= c!6886 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36434 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36434 (= (appendNLeastSignificantBitsLoop!0 (_2!4925 lt!171981) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!172421)))

(declare-fun b!113428 () Bool)

(declare-fun lt!172426 () tuple2!9326)

(declare-fun Unit!6957 () Unit!6949)

(assert (=> b!113428 (= e!74423 (tuple2!9327 Unit!6957 (_2!4925 lt!172426)))))

(declare-fun lt!172397 () Bool)

(assert (=> b!113428 (= lt!172397 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!172424 () tuple2!9326)

(assert (=> b!113428 (= lt!172424 (appendBit!0 (_2!4925 lt!171981) lt!172397))))

(declare-fun res!93673 () Bool)

(assert (=> b!113428 (= res!93673 (= (size!2341 (buf!2749 (_2!4925 lt!171981))) (size!2341 (buf!2749 (_2!4925 lt!172424)))))))

(declare-fun e!74425 () Bool)

(assert (=> b!113428 (=> (not res!93673) (not e!74425))))

(assert (=> b!113428 e!74425))

(declare-fun lt!172430 () tuple2!9326)

(assert (=> b!113428 (= lt!172430 lt!172424)))

(assert (=> b!113428 (= lt!172426 (appendNLeastSignificantBitsLoop!0 (_2!4925 lt!172430) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!172412 () Unit!6949)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4156 BitStream!4156 BitStream!4156) Unit!6949)

(assert (=> b!113428 (= lt!172412 (lemmaIsPrefixTransitive!0 (_2!4925 lt!171981) (_2!4925 lt!172430) (_2!4925 lt!172426)))))

(declare-fun call!1447 () Bool)

(assert (=> b!113428 call!1447))

(declare-fun lt!172429 () Unit!6949)

(assert (=> b!113428 (= lt!172429 lt!172412)))

(assert (=> b!113428 (invariant!0 (currentBit!5324 (_2!4925 lt!171981)) (currentByte!5329 (_2!4925 lt!171981)) (size!2341 (buf!2749 (_2!4925 lt!172430))))))

(declare-fun lt!172418 () BitStream!4156)

(assert (=> b!113428 (= lt!172418 (BitStream!4157 (buf!2749 (_2!4925 lt!172430)) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))))))

(assert (=> b!113428 (invariant!0 (currentBit!5324 lt!172418) (currentByte!5329 lt!172418) (size!2341 (buf!2749 (_2!4925 lt!172426))))))

(declare-fun lt!172389 () BitStream!4156)

(assert (=> b!113428 (= lt!172389 (BitStream!4157 (buf!2749 (_2!4925 lt!172426)) (currentByte!5329 lt!172418) (currentBit!5324 lt!172418)))))

(declare-fun lt!172405 () tuple2!9324)

(assert (=> b!113428 (= lt!172405 (readBitPure!0 lt!172418))))

(declare-fun lt!172423 () tuple2!9324)

(assert (=> b!113428 (= lt!172423 (readBitPure!0 lt!172389))))

(declare-fun lt!172394 () Unit!6949)

(declare-fun readBitPrefixLemma!0 (BitStream!4156 BitStream!4156) Unit!6949)

(assert (=> b!113428 (= lt!172394 (readBitPrefixLemma!0 lt!172418 (_2!4925 lt!172426)))))

(declare-fun res!93680 () Bool)

(assert (=> b!113428 (= res!93680 (= (bitIndex!0 (size!2341 (buf!2749 (_1!4924 lt!172405))) (currentByte!5329 (_1!4924 lt!172405)) (currentBit!5324 (_1!4924 lt!172405))) (bitIndex!0 (size!2341 (buf!2749 (_1!4924 lt!172423))) (currentByte!5329 (_1!4924 lt!172423)) (currentBit!5324 (_1!4924 lt!172423)))))))

(declare-fun e!74422 () Bool)

(assert (=> b!113428 (=> (not res!93680) (not e!74422))))

(assert (=> b!113428 e!74422))

(declare-fun lt!172404 () Unit!6949)

(assert (=> b!113428 (= lt!172404 lt!172394)))

(declare-datatypes ((tuple2!9344 0))(
  ( (tuple2!9345 (_1!4934 BitStream!4156) (_2!4934 BitStream!4156)) )
))
(declare-fun lt!172411 () tuple2!9344)

(declare-fun reader!0 (BitStream!4156 BitStream!4156) tuple2!9344)

(assert (=> b!113428 (= lt!172411 (reader!0 (_2!4925 lt!171981) (_2!4925 lt!172426)))))

(declare-fun lt!172431 () tuple2!9344)

(assert (=> b!113428 (= lt!172431 (reader!0 (_2!4925 lt!172430) (_2!4925 lt!172426)))))

(declare-fun lt!172425 () tuple2!9324)

(assert (=> b!113428 (= lt!172425 (readBitPure!0 (_1!4934 lt!172411)))))

(assert (=> b!113428 (= (_2!4924 lt!172425) lt!172397)))

(declare-fun lt!172401 () Unit!6949)

(declare-fun Unit!6962 () Unit!6949)

(assert (=> b!113428 (= lt!172401 Unit!6962)))

(declare-fun lt!172419 () (_ BitVec 64))

(assert (=> b!113428 (= lt!172419 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!172406 () (_ BitVec 64))

(assert (=> b!113428 (= lt!172406 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!172415 () Unit!6949)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4156 array!5150 (_ BitVec 64)) Unit!6949)

(assert (=> b!113428 (= lt!172415 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4925 lt!171981) (buf!2749 (_2!4925 lt!172426)) lt!172406))))

(assert (=> b!113428 (validate_offset_bits!1 ((_ sign_extend 32) (size!2341 (buf!2749 (_2!4925 lt!172426)))) ((_ sign_extend 32) (currentByte!5329 (_2!4925 lt!171981))) ((_ sign_extend 32) (currentBit!5324 (_2!4925 lt!171981))) lt!172406)))

(declare-fun lt!172427 () Unit!6949)

(assert (=> b!113428 (= lt!172427 lt!172415)))

(declare-datatypes ((tuple2!9346 0))(
  ( (tuple2!9347 (_1!4935 BitStream!4156) (_2!4935 (_ BitVec 64))) )
))
(declare-fun lt!172402 () tuple2!9346)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9346)

(assert (=> b!113428 (= lt!172402 (readNLeastSignificantBitsLoopPure!0 (_1!4934 lt!172411) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172419))))

(declare-fun lt!172400 () (_ BitVec 64))

(assert (=> b!113428 (= lt!172400 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!172396 () Unit!6949)

(assert (=> b!113428 (= lt!172396 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4925 lt!172430) (buf!2749 (_2!4925 lt!172426)) lt!172400))))

(assert (=> b!113428 (validate_offset_bits!1 ((_ sign_extend 32) (size!2341 (buf!2749 (_2!4925 lt!172426)))) ((_ sign_extend 32) (currentByte!5329 (_2!4925 lt!172430))) ((_ sign_extend 32) (currentBit!5324 (_2!4925 lt!172430))) lt!172400)))

(declare-fun lt!172432 () Unit!6949)

(assert (=> b!113428 (= lt!172432 lt!172396)))

(declare-fun lt!172392 () tuple2!9346)

(assert (=> b!113428 (= lt!172392 (readNLeastSignificantBitsLoopPure!0 (_1!4934 lt!172431) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172419 (ite (_2!4924 lt!172425) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!172398 () tuple2!9346)

(assert (=> b!113428 (= lt!172398 (readNLeastSignificantBitsLoopPure!0 (_1!4934 lt!172411) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172419))))

(declare-fun c!6887 () Bool)

(assert (=> b!113428 (= c!6887 (_2!4924 (readBitPure!0 (_1!4934 lt!172411))))))

(declare-fun e!74421 () (_ BitVec 64))

(declare-fun lt!172413 () tuple2!9346)

(declare-fun withMovedBitIndex!0 (BitStream!4156 (_ BitVec 64)) BitStream!4156)

(assert (=> b!113428 (= lt!172413 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4934 lt!172411) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172419 e!74421)))))

(declare-fun lt!172403 () Unit!6949)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6949)

(assert (=> b!113428 (= lt!172403 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4934 lt!172411) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172419))))

(assert (=> b!113428 (and (= (_2!4935 lt!172398) (_2!4935 lt!172413)) (= (_1!4935 lt!172398) (_1!4935 lt!172413)))))

(declare-fun lt!172428 () Unit!6949)

(assert (=> b!113428 (= lt!172428 lt!172403)))

(assert (=> b!113428 (= (_1!4934 lt!172411) (withMovedBitIndex!0 (_2!4934 lt!172411) (bvsub (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))) (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172426))) (currentByte!5329 (_2!4925 lt!172426)) (currentBit!5324 (_2!4925 lt!172426))))))))

(declare-fun lt!172417 () Unit!6949)

(declare-fun Unit!6963 () Unit!6949)

(assert (=> b!113428 (= lt!172417 Unit!6963)))

(assert (=> b!113428 (= (_1!4934 lt!172431) (withMovedBitIndex!0 (_2!4934 lt!172431) (bvsub (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172430))) (currentByte!5329 (_2!4925 lt!172430)) (currentBit!5324 (_2!4925 lt!172430))) (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172426))) (currentByte!5329 (_2!4925 lt!172426)) (currentBit!5324 (_2!4925 lt!172426))))))))

(declare-fun lt!172414 () Unit!6949)

(declare-fun Unit!6964 () Unit!6949)

(assert (=> b!113428 (= lt!172414 Unit!6964)))

(assert (=> b!113428 (= (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))) (bvsub (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172430))) (currentByte!5329 (_2!4925 lt!172430)) (currentBit!5324 (_2!4925 lt!172430))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!172407 () Unit!6949)

(declare-fun Unit!6965 () Unit!6949)

(assert (=> b!113428 (= lt!172407 Unit!6965)))

(assert (=> b!113428 (= (_2!4935 lt!172402) (_2!4935 lt!172392))))

(declare-fun lt!172433 () Unit!6949)

(declare-fun Unit!6966 () Unit!6949)

(assert (=> b!113428 (= lt!172433 Unit!6966)))

(assert (=> b!113428 (= (_1!4935 lt!172402) (_2!4934 lt!172411))))

(declare-fun b!113429 () Bool)

(declare-fun res!93676 () Bool)

(assert (=> b!113429 (= res!93676 (isPrefixOf!0 (_2!4925 lt!171981) (_2!4925 lt!172424)))))

(assert (=> b!113429 (=> (not res!93676) (not e!74425))))

(declare-fun b!113430 () Bool)

(declare-fun lt!172409 () Unit!6949)

(assert (=> b!113430 (= e!74423 (tuple2!9327 lt!172409 (_2!4925 lt!171981)))))

(declare-fun lt!172420 () BitStream!4156)

(assert (=> b!113430 (= lt!172420 (_2!4925 lt!171981))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4156) Unit!6949)

(assert (=> b!113430 (= lt!172409 (lemmaIsPrefixRefl!0 lt!172420))))

(assert (=> b!113430 call!1447))

(declare-fun b!113431 () Bool)

(declare-fun e!74427 () Bool)

(declare-fun lt!172393 () (_ BitVec 64))

(assert (=> b!113431 (= e!74427 (validate_offset_bits!1 ((_ sign_extend 32) (size!2341 (buf!2749 (_2!4925 lt!171981)))) ((_ sign_extend 32) (currentByte!5329 (_2!4925 lt!171981))) ((_ sign_extend 32) (currentBit!5324 (_2!4925 lt!171981))) lt!172393))))

(declare-fun b!113432 () Bool)

(assert (=> b!113432 (= e!74421 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun lt!172408 () tuple2!9344)

(declare-fun b!113433 () Bool)

(declare-fun lt!172399 () tuple2!9346)

(assert (=> b!113433 (= e!74424 (and (= (_2!4935 lt!172399) v!199) (= (_1!4935 lt!172399) (_2!4934 lt!172408))))))

(declare-fun lt!172395 () (_ BitVec 64))

(assert (=> b!113433 (= lt!172399 (readNLeastSignificantBitsLoopPure!0 (_1!4934 lt!172408) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172395))))

(declare-fun lt!172391 () Unit!6949)

(declare-fun lt!172390 () Unit!6949)

(assert (=> b!113433 (= lt!172391 lt!172390)))

(assert (=> b!113433 (validate_offset_bits!1 ((_ sign_extend 32) (size!2341 (buf!2749 (_2!4925 lt!172421)))) ((_ sign_extend 32) (currentByte!5329 (_2!4925 lt!171981))) ((_ sign_extend 32) (currentBit!5324 (_2!4925 lt!171981))) lt!172393)))

(assert (=> b!113433 (= lt!172390 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4925 lt!171981) (buf!2749 (_2!4925 lt!172421)) lt!172393))))

(assert (=> b!113433 e!74427))

(declare-fun res!93679 () Bool)

(assert (=> b!113433 (=> (not res!93679) (not e!74427))))

(assert (=> b!113433 (= res!93679 (and (= (size!2341 (buf!2749 (_2!4925 lt!171981))) (size!2341 (buf!2749 (_2!4925 lt!172421)))) (bvsge lt!172393 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113433 (= lt!172393 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113433 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113433 (= lt!172395 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!113433 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113433 (= lt!172408 (reader!0 (_2!4925 lt!171981) (_2!4925 lt!172421)))))

(declare-fun b!113434 () Bool)

(declare-fun e!74426 () Bool)

(declare-fun lt!172410 () tuple2!9324)

(assert (=> b!113434 (= e!74426 (= (bitIndex!0 (size!2341 (buf!2749 (_1!4924 lt!172410))) (currentByte!5329 (_1!4924 lt!172410)) (currentBit!5324 (_1!4924 lt!172410))) (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172424))) (currentByte!5329 (_2!4925 lt!172424)) (currentBit!5324 (_2!4925 lt!172424)))))))

(declare-fun b!113435 () Bool)

(assert (=> b!113435 (= e!74421 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!113436 () Bool)

(assert (=> b!113436 (= e!74422 (= (_2!4924 lt!172405) (_2!4924 lt!172423)))))

(declare-fun b!113437 () Bool)

(assert (=> b!113437 (= lt!172410 (readBitPure!0 (readerFrom!0 (_2!4925 lt!172424) (currentBit!5324 (_2!4925 lt!171981)) (currentByte!5329 (_2!4925 lt!171981)))))))

(declare-fun res!93678 () Bool)

(assert (=> b!113437 (= res!93678 (and (= (_2!4924 lt!172410) lt!172397) (= (_1!4924 lt!172410) (_2!4925 lt!172424))))))

(assert (=> b!113437 (=> (not res!93678) (not e!74426))))

(assert (=> b!113437 (= e!74425 e!74426)))

(declare-fun b!113438 () Bool)

(declare-fun res!93675 () Bool)

(assert (=> b!113438 (= res!93675 (= (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172424))) (currentByte!5329 (_2!4925 lt!172424)) (currentBit!5324 (_2!4925 lt!172424))) (bvadd (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!113438 (=> (not res!93675) (not e!74425))))

(declare-fun bm!1444 () Bool)

(assert (=> bm!1444 (= call!1447 (isPrefixOf!0 (ite c!6886 (_2!4925 lt!171981) lt!172420) (ite c!6886 (_2!4925 lt!172426) lt!172420)))))

(declare-fun b!113439 () Bool)

(declare-fun res!93672 () Bool)

(assert (=> b!113439 (=> (not res!93672) (not e!74424))))

(assert (=> b!113439 (= res!93672 (isPrefixOf!0 (_2!4925 lt!171981) (_2!4925 lt!172421)))))

(declare-fun b!113440 () Bool)

(declare-fun res!93674 () Bool)

(assert (=> b!113440 (=> (not res!93674) (not e!74424))))

(declare-fun lt!172422 () (_ BitVec 64))

(declare-fun lt!172416 () (_ BitVec 64))

(assert (=> b!113440 (= res!93674 (= (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172421))) (currentByte!5329 (_2!4925 lt!172421)) (currentBit!5324 (_2!4925 lt!172421))) (bvadd lt!172416 lt!172422)))))

(assert (=> b!113440 (or (not (= (bvand lt!172416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172422 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172416 lt!172422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113440 (= lt!172422 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113440 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113440 (= lt!172416 (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))))))

(assert (= (and d!36434 c!6886) b!113428))

(assert (= (and d!36434 (not c!6886)) b!113430))

(assert (= (and b!113428 res!93673) b!113438))

(assert (= (and b!113438 res!93675) b!113429))

(assert (= (and b!113429 res!93676) b!113437))

(assert (= (and b!113437 res!93678) b!113434))

(assert (= (and b!113428 res!93680) b!113436))

(assert (= (and b!113428 c!6887) b!113432))

(assert (= (and b!113428 (not c!6887)) b!113435))

(assert (= (or b!113428 b!113430) bm!1444))

(assert (= (and d!36434 res!93677) b!113440))

(assert (= (and b!113440 res!93674) b!113439))

(assert (= (and b!113439 res!93672) b!113433))

(assert (= (and b!113433 res!93679) b!113431))

(declare-fun m!169427 () Bool)

(assert (=> b!113440 m!169427))

(assert (=> b!113440 m!169239))

(declare-fun m!169429 () Bool)

(assert (=> b!113429 m!169429))

(declare-fun m!169431 () Bool)

(assert (=> b!113430 m!169431))

(declare-fun m!169433 () Bool)

(assert (=> b!113431 m!169433))

(declare-fun m!169435 () Bool)

(assert (=> b!113439 m!169435))

(declare-fun m!169437 () Bool)

(assert (=> b!113437 m!169437))

(assert (=> b!113437 m!169437))

(declare-fun m!169439 () Bool)

(assert (=> b!113437 m!169439))

(declare-fun m!169441 () Bool)

(assert (=> b!113434 m!169441))

(declare-fun m!169443 () Bool)

(assert (=> b!113434 m!169443))

(assert (=> b!113428 m!169239))

(declare-fun m!169445 () Bool)

(assert (=> b!113428 m!169445))

(declare-fun m!169447 () Bool)

(assert (=> b!113428 m!169447))

(declare-fun m!169449 () Bool)

(assert (=> b!113428 m!169449))

(declare-fun m!169451 () Bool)

(assert (=> b!113428 m!169451))

(declare-fun m!169453 () Bool)

(assert (=> b!113428 m!169453))

(declare-fun m!169455 () Bool)

(assert (=> b!113428 m!169455))

(declare-fun m!169457 () Bool)

(assert (=> b!113428 m!169457))

(declare-fun m!169459 () Bool)

(assert (=> b!113428 m!169459))

(declare-fun m!169461 () Bool)

(assert (=> b!113428 m!169461))

(declare-fun m!169463 () Bool)

(assert (=> b!113428 m!169463))

(declare-fun m!169465 () Bool)

(assert (=> b!113428 m!169465))

(assert (=> b!113428 m!169457))

(declare-fun m!169467 () Bool)

(assert (=> b!113428 m!169467))

(declare-fun m!169469 () Bool)

(assert (=> b!113428 m!169469))

(declare-fun m!169471 () Bool)

(assert (=> b!113428 m!169471))

(declare-fun m!169473 () Bool)

(assert (=> b!113428 m!169473))

(declare-fun m!169475 () Bool)

(assert (=> b!113428 m!169475))

(declare-fun m!169477 () Bool)

(assert (=> b!113428 m!169477))

(declare-fun m!169479 () Bool)

(assert (=> b!113428 m!169479))

(declare-fun m!169481 () Bool)

(assert (=> b!113428 m!169481))

(declare-fun m!169483 () Bool)

(assert (=> b!113428 m!169483))

(declare-fun m!169485 () Bool)

(assert (=> b!113428 m!169485))

(declare-fun m!169487 () Bool)

(assert (=> b!113428 m!169487))

(declare-fun m!169489 () Bool)

(assert (=> b!113428 m!169489))

(declare-fun m!169491 () Bool)

(assert (=> b!113428 m!169491))

(declare-fun m!169493 () Bool)

(assert (=> b!113428 m!169493))

(declare-fun m!169495 () Bool)

(assert (=> b!113428 m!169495))

(declare-fun m!169497 () Bool)

(assert (=> b!113428 m!169497))

(declare-fun m!169499 () Bool)

(assert (=> b!113433 m!169499))

(declare-fun m!169501 () Bool)

(assert (=> b!113433 m!169501))

(assert (=> b!113433 m!169483))

(declare-fun m!169503 () Bool)

(assert (=> b!113433 m!169503))

(declare-fun m!169505 () Bool)

(assert (=> b!113433 m!169505))

(declare-fun m!169507 () Bool)

(assert (=> bm!1444 m!169507))

(assert (=> b!113438 m!169443))

(assert (=> b!113438 m!169239))

(assert (=> b!113219 d!36434))

(declare-fun b!113482 () Bool)

(declare-fun e!74448 () Bool)

(declare-fun lt!172499 () tuple2!9324)

(declare-fun lt!172500 () tuple2!9326)

(assert (=> b!113482 (= e!74448 (= (bitIndex!0 (size!2341 (buf!2749 (_1!4924 lt!172499))) (currentByte!5329 (_1!4924 lt!172499)) (currentBit!5324 (_1!4924 lt!172499))) (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172500))) (currentByte!5329 (_2!4925 lt!172500)) (currentBit!5324 (_2!4925 lt!172500)))))))

(declare-fun b!113481 () Bool)

(declare-fun e!74447 () Bool)

(assert (=> b!113481 (= e!74447 e!74448)))

(declare-fun res!93713 () Bool)

(assert (=> b!113481 (=> (not res!93713) (not e!74448))))

(assert (=> b!113481 (= res!93713 (and (= (_2!4924 lt!172499) lt!171979) (= (_1!4924 lt!172499) (_2!4925 lt!172500))))))

(assert (=> b!113481 (= lt!172499 (readBitPure!0 (readerFrom!0 (_2!4925 lt!172500) (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305))))))

(declare-fun b!113480 () Bool)

(declare-fun res!93716 () Bool)

(assert (=> b!113480 (=> (not res!93716) (not e!74447))))

(assert (=> b!113480 (= res!93716 (isPrefixOf!0 thiss!1305 (_2!4925 lt!172500)))))

(declare-fun d!36444 () Bool)

(assert (=> d!36444 e!74447))

(declare-fun res!93714 () Bool)

(assert (=> d!36444 (=> (not res!93714) (not e!74447))))

(assert (=> d!36444 (= res!93714 (= (size!2341 (buf!2749 thiss!1305)) (size!2341 (buf!2749 (_2!4925 lt!172500)))))))

(declare-fun choose!16 (BitStream!4156 Bool) tuple2!9326)

(assert (=> d!36444 (= lt!172500 (choose!16 thiss!1305 lt!171979))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!36444 (validate_offset_bit!0 ((_ sign_extend 32) (size!2341 (buf!2749 thiss!1305))) ((_ sign_extend 32) (currentByte!5329 thiss!1305)) ((_ sign_extend 32) (currentBit!5324 thiss!1305)))))

(assert (=> d!36444 (= (appendBit!0 thiss!1305 lt!171979) lt!172500)))

(declare-fun b!113479 () Bool)

(declare-fun res!93715 () Bool)

(assert (=> b!113479 (=> (not res!93715) (not e!74447))))

(declare-fun lt!172502 () (_ BitVec 64))

(declare-fun lt!172501 () (_ BitVec 64))

(assert (=> b!113479 (= res!93715 (= (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!172500))) (currentByte!5329 (_2!4925 lt!172500)) (currentBit!5324 (_2!4925 lt!172500))) (bvadd lt!172502 lt!172501)))))

(assert (=> b!113479 (or (not (= (bvand lt!172502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172501 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172502 lt!172501) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113479 (= lt!172501 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!113479 (= lt!172502 (bitIndex!0 (size!2341 (buf!2749 thiss!1305)) (currentByte!5329 thiss!1305) (currentBit!5324 thiss!1305)))))

(assert (= (and d!36444 res!93714) b!113479))

(assert (= (and b!113479 res!93715) b!113480))

(assert (= (and b!113480 res!93716) b!113481))

(assert (= (and b!113481 res!93713) b!113482))

(declare-fun m!169609 () Bool)

(assert (=> b!113479 m!169609))

(assert (=> b!113479 m!169241))

(declare-fun m!169611 () Bool)

(assert (=> b!113482 m!169611))

(assert (=> b!113482 m!169609))

(declare-fun m!169613 () Bool)

(assert (=> b!113481 m!169613))

(assert (=> b!113481 m!169613))

(declare-fun m!169615 () Bool)

(assert (=> b!113481 m!169615))

(declare-fun m!169617 () Bool)

(assert (=> d!36444 m!169617))

(declare-fun m!169619 () Bool)

(assert (=> d!36444 m!169619))

(declare-fun m!169621 () Bool)

(assert (=> b!113480 m!169621))

(assert (=> b!113219 d!36444))

(declare-fun d!36450 () Bool)

(declare-fun res!93719 () Bool)

(declare-fun e!74450 () Bool)

(assert (=> d!36450 (=> (not res!93719) (not e!74450))))

(assert (=> d!36450 (= res!93719 (= (size!2341 (buf!2749 (_2!4925 lt!171981))) (size!2341 (buf!2749 (_2!4925 lt!171982)))))))

(assert (=> d!36450 (= (isPrefixOf!0 (_2!4925 lt!171981) (_2!4925 lt!171982)) e!74450)))

(declare-fun b!113483 () Bool)

(declare-fun res!93717 () Bool)

(assert (=> b!113483 (=> (not res!93717) (not e!74450))))

(assert (=> b!113483 (= res!93717 (bvsle (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))) (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171982))) (currentByte!5329 (_2!4925 lt!171982)) (currentBit!5324 (_2!4925 lt!171982)))))))

(declare-fun b!113484 () Bool)

(declare-fun e!74449 () Bool)

(assert (=> b!113484 (= e!74450 e!74449)))

(declare-fun res!93718 () Bool)

(assert (=> b!113484 (=> res!93718 e!74449)))

(assert (=> b!113484 (= res!93718 (= (size!2341 (buf!2749 (_2!4925 lt!171981))) #b00000000000000000000000000000000))))

(declare-fun b!113485 () Bool)

(assert (=> b!113485 (= e!74449 (arrayBitRangesEq!0 (buf!2749 (_2!4925 lt!171981)) (buf!2749 (_2!4925 lt!171982)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981)))))))

(assert (= (and d!36450 res!93719) b!113483))

(assert (= (and b!113483 res!93717) b!113484))

(assert (= (and b!113484 (not res!93718)) b!113485))

(assert (=> b!113483 m!169239))

(declare-fun m!169623 () Bool)

(assert (=> b!113483 m!169623))

(assert (=> b!113485 m!169239))

(assert (=> b!113485 m!169239))

(declare-fun m!169625 () Bool)

(assert (=> b!113485 m!169625))

(assert (=> b!113224 d!36450))

(declare-fun d!36452 () Bool)

(assert (=> d!36452 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305) (size!2341 (buf!2749 thiss!1305))))))

(declare-fun bs!8860 () Bool)

(assert (= bs!8860 d!36452))

(declare-fun m!169627 () Bool)

(assert (=> bs!8860 m!169627))

(assert (=> start!22386 d!36452))

(declare-fun d!36454 () Bool)

(declare-datatypes ((tuple2!9352 0))(
  ( (tuple2!9353 (_1!4938 Bool) (_2!4938 BitStream!4156)) )
))
(declare-fun lt!172505 () tuple2!9352)

(declare-fun readBit!0 (BitStream!4156) tuple2!9352)

(assert (=> d!36454 (= lt!172505 (readBit!0 (readerFrom!0 (_2!4925 lt!171981) (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305))))))

(assert (=> d!36454 (= (readBitPure!0 (readerFrom!0 (_2!4925 lt!171981) (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305))) (tuple2!9325 (_2!4938 lt!172505) (_1!4938 lt!172505)))))

(declare-fun bs!8861 () Bool)

(assert (= bs!8861 d!36454))

(assert (=> bs!8861 m!169245))

(declare-fun m!169629 () Bool)

(assert (=> bs!8861 m!169629))

(assert (=> b!113223 d!36454))

(declare-fun d!36456 () Bool)

(declare-fun e!74455 () Bool)

(assert (=> d!36456 e!74455))

(declare-fun res!93729 () Bool)

(assert (=> d!36456 (=> (not res!93729) (not e!74455))))

(assert (=> d!36456 (= res!93729 (invariant!0 (currentBit!5324 (_2!4925 lt!171981)) (currentByte!5329 (_2!4925 lt!171981)) (size!2341 (buf!2749 (_2!4925 lt!171981)))))))

(assert (=> d!36456 (= (readerFrom!0 (_2!4925 lt!171981) (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305)) (BitStream!4157 (buf!2749 (_2!4925 lt!171981)) (currentByte!5329 thiss!1305) (currentBit!5324 thiss!1305)))))

(declare-fun b!113495 () Bool)

(assert (=> b!113495 (= e!74455 (invariant!0 (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305) (size!2341 (buf!2749 (_2!4925 lt!171981)))))))

(assert (= (and d!36456 res!93729) b!113495))

(declare-fun m!169631 () Bool)

(assert (=> d!36456 m!169631))

(declare-fun m!169633 () Bool)

(assert (=> b!113495 m!169633))

(assert (=> b!113223 d!36456))

(declare-fun d!36458 () Bool)

(assert (=> d!36458 (= (array_inv!2143 (buf!2749 thiss!1305)) (bvsge (size!2341 (buf!2749 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!113218 d!36458))

(declare-fun d!36460 () Bool)

(assert (=> d!36460 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113217 d!36460))

(declare-fun d!36462 () Bool)

(assert (=> d!36462 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2341 (buf!2749 thiss!1305))) ((_ sign_extend 32) (currentByte!5329 thiss!1305)) ((_ sign_extend 32) (currentBit!5324 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2341 (buf!2749 thiss!1305))) ((_ sign_extend 32) (currentByte!5329 thiss!1305)) ((_ sign_extend 32) (currentBit!5324 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8862 () Bool)

(assert (= bs!8862 d!36462))

(declare-fun m!169635 () Bool)

(assert (=> bs!8862 m!169635))

(assert (=> b!113222 d!36462))

(declare-fun d!36464 () Bool)

(declare-fun e!74458 () Bool)

(assert (=> d!36464 e!74458))

(declare-fun res!93732 () Bool)

(assert (=> d!36464 (=> (not res!93732) (not e!74458))))

(declare-fun lt!172517 () (_ BitVec 64))

(declare-fun lt!172518 () (_ BitVec 64))

(declare-fun lt!172519 () (_ BitVec 64))

(assert (=> d!36464 (= res!93732 (= lt!172519 (bvsub lt!172517 lt!172518)))))

(assert (=> d!36464 (or (= (bvand lt!172517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172518 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172517 lt!172518) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36464 (= lt!172518 (remainingBits!0 ((_ sign_extend 32) (size!2341 (buf!2749 (_2!4925 lt!171981)))) ((_ sign_extend 32) (currentByte!5329 (_2!4925 lt!171981))) ((_ sign_extend 32) (currentBit!5324 (_2!4925 lt!171981)))))))

(declare-fun lt!172514 () (_ BitVec 64))

(declare-fun lt!172516 () (_ BitVec 64))

(assert (=> d!36464 (= lt!172517 (bvmul lt!172514 lt!172516))))

(assert (=> d!36464 (or (= lt!172514 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172516 (bvsdiv (bvmul lt!172514 lt!172516) lt!172514)))))

(assert (=> d!36464 (= lt!172516 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36464 (= lt!172514 ((_ sign_extend 32) (size!2341 (buf!2749 (_2!4925 lt!171981)))))))

(assert (=> d!36464 (= lt!172519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5329 (_2!4925 lt!171981))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5324 (_2!4925 lt!171981)))))))

(assert (=> d!36464 (invariant!0 (currentBit!5324 (_2!4925 lt!171981)) (currentByte!5329 (_2!4925 lt!171981)) (size!2341 (buf!2749 (_2!4925 lt!171981))))))

(assert (=> d!36464 (= (bitIndex!0 (size!2341 (buf!2749 (_2!4925 lt!171981))) (currentByte!5329 (_2!4925 lt!171981)) (currentBit!5324 (_2!4925 lt!171981))) lt!172519)))

(declare-fun b!113498 () Bool)

(declare-fun res!93733 () Bool)

(assert (=> b!113498 (=> (not res!93733) (not e!74458))))

(assert (=> b!113498 (= res!93733 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172519))))

(declare-fun b!113499 () Bool)

(declare-fun lt!172515 () (_ BitVec 64))

(assert (=> b!113499 (= e!74458 (bvsle lt!172519 (bvmul lt!172515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113499 (or (= lt!172515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172515)))))

(assert (=> b!113499 (= lt!172515 ((_ sign_extend 32) (size!2341 (buf!2749 (_2!4925 lt!171981)))))))

(assert (= (and d!36464 res!93732) b!113498))

(assert (= (and b!113498 res!93733) b!113499))

(declare-fun m!169637 () Bool)

(assert (=> d!36464 m!169637))

(assert (=> d!36464 m!169631))

(assert (=> b!113221 d!36464))

(declare-fun d!36466 () Bool)

(declare-fun e!74459 () Bool)

(assert (=> d!36466 e!74459))

(declare-fun res!93734 () Bool)

(assert (=> d!36466 (=> (not res!93734) (not e!74459))))

(declare-fun lt!172524 () (_ BitVec 64))

(declare-fun lt!172523 () (_ BitVec 64))

(declare-fun lt!172525 () (_ BitVec 64))

(assert (=> d!36466 (= res!93734 (= lt!172525 (bvsub lt!172523 lt!172524)))))

(assert (=> d!36466 (or (= (bvand lt!172523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172524 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172523 lt!172524) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36466 (= lt!172524 (remainingBits!0 ((_ sign_extend 32) (size!2341 (buf!2749 thiss!1305))) ((_ sign_extend 32) (currentByte!5329 thiss!1305)) ((_ sign_extend 32) (currentBit!5324 thiss!1305))))))

(declare-fun lt!172520 () (_ BitVec 64))

(declare-fun lt!172522 () (_ BitVec 64))

(assert (=> d!36466 (= lt!172523 (bvmul lt!172520 lt!172522))))

(assert (=> d!36466 (or (= lt!172520 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172522 (bvsdiv (bvmul lt!172520 lt!172522) lt!172520)))))

(assert (=> d!36466 (= lt!172522 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36466 (= lt!172520 ((_ sign_extend 32) (size!2341 (buf!2749 thiss!1305))))))

(assert (=> d!36466 (= lt!172525 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5329 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5324 thiss!1305))))))

(assert (=> d!36466 (invariant!0 (currentBit!5324 thiss!1305) (currentByte!5329 thiss!1305) (size!2341 (buf!2749 thiss!1305)))))

(assert (=> d!36466 (= (bitIndex!0 (size!2341 (buf!2749 thiss!1305)) (currentByte!5329 thiss!1305) (currentBit!5324 thiss!1305)) lt!172525)))

(declare-fun b!113500 () Bool)

(declare-fun res!93735 () Bool)

(assert (=> b!113500 (=> (not res!93735) (not e!74459))))

(assert (=> b!113500 (= res!93735 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172525))))

(declare-fun b!113501 () Bool)

(declare-fun lt!172521 () (_ BitVec 64))

(assert (=> b!113501 (= e!74459 (bvsle lt!172525 (bvmul lt!172521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113501 (or (= lt!172521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172521)))))

(assert (=> b!113501 (= lt!172521 ((_ sign_extend 32) (size!2341 (buf!2749 thiss!1305))))))

(assert (= (and d!36466 res!93734) b!113500))

(assert (= (and b!113500 res!93735) b!113501))

(assert (=> d!36466 m!169635))

(assert (=> d!36466 m!169627))

(assert (=> b!113221 d!36466))

(assert (=> b!113216 d!36428))

(push 1)

(assert (not d!36426))

(assert (not b!113479))

(assert (not b!113483))

(assert (not d!36456))

(assert (not b!113480))

(assert (not b!113431))

(assert (not b!113481))

(assert (not b!113434))

(assert (not b!113482))

(assert (not b!113438))

(assert (not b!113437))

(assert (not b!113321))

(assert (not b!113439))

(assert (not b!113430))

(assert (not b!113440))

(assert (not d!36454))

(assert (not b!113433))

(assert (not d!36452))

(assert (not b!113428))

(assert (not b!113485))

(assert (not bm!1444))

(assert (not d!36466))

(assert (not b!113429))

(assert (not b!113495))

(assert (not b!113319))

(assert (not d!36444))

(assert (not d!36462))

(assert (not d!36464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

