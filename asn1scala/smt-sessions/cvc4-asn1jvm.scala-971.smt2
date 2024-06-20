; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27364 () Bool)

(assert start!27364)

(declare-fun b!140545 () Bool)

(declare-fun res!117186 () Bool)

(declare-fun e!93669 () Bool)

(assert (=> b!140545 (=> (not res!117186) (not e!93669))))

(declare-datatypes ((array!6430 0))(
  ( (array!6431 (arr!3617 (Array (_ BitVec 32) (_ BitVec 8))) (size!2910 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5078 0))(
  ( (BitStream!5079 (buf!3331 array!6430) (currentByte!6182 (_ BitVec 32)) (currentBit!6177 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5078)

(declare-datatypes ((Unit!8799 0))(
  ( (Unit!8800) )
))
(declare-datatypes ((tuple2!12334 0))(
  ( (tuple2!12335 (_1!6497 Unit!8799) (_2!6497 BitStream!5078)) )
))
(declare-fun lt!218769 () tuple2!12334)

(declare-fun isPrefixOf!0 (BitStream!5078 BitStream!5078) Bool)

(assert (=> b!140545 (= res!117186 (isPrefixOf!0 thiss!1634 (_2!6497 lt!218769)))))

(declare-fun b!140546 () Bool)

(declare-fun res!117190 () Bool)

(declare-fun e!93666 () Bool)

(assert (=> b!140546 (=> (not res!117190) (not e!93666))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140546 (= res!117190 (bvslt from!447 to!404))))

(declare-fun b!140547 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140547 (= e!93666 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2910 (buf!3331 (_2!6497 lt!218769))) (currentByte!6182 (_2!6497 lt!218769)) (currentBit!6177 (_2!6497 lt!218769))))))))

(assert (=> b!140547 e!93669))

(declare-fun res!117189 () Bool)

(assert (=> b!140547 (=> (not res!117189) (not e!93669))))

(assert (=> b!140547 (= res!117189 (= (size!2910 (buf!3331 thiss!1634)) (size!2910 (buf!3331 (_2!6497 lt!218769)))))))

(declare-fun arr!237 () array!6430)

(declare-fun appendByte!0 (BitStream!5078 (_ BitVec 8)) tuple2!12334)

(assert (=> b!140547 (= lt!218769 (appendByte!0 thiss!1634 (select (arr!3617 arr!237) from!447)))))

(declare-fun b!140548 () Bool)

(declare-fun e!93667 () Bool)

(declare-fun array_inv!2699 (array!6430) Bool)

(assert (=> b!140548 (= e!93667 (array_inv!2699 (buf!3331 thiss!1634)))))

(declare-fun b!140549 () Bool)

(declare-fun res!117188 () Bool)

(assert (=> b!140549 (=> (not res!117188) (not e!93669))))

(assert (=> b!140549 (= res!117188 (= (bitIndex!0 (size!2910 (buf!3331 (_2!6497 lt!218769))) (currentByte!6182 (_2!6497 lt!218769)) (currentBit!6177 (_2!6497 lt!218769))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2910 (buf!3331 thiss!1634)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634)))))))

(declare-datatypes ((tuple2!12336 0))(
  ( (tuple2!12337 (_1!6498 BitStream!5078) (_2!6498 (_ BitVec 8))) )
))
(declare-fun lt!218770 () tuple2!12336)

(declare-fun b!140550 () Bool)

(declare-datatypes ((tuple2!12338 0))(
  ( (tuple2!12339 (_1!6499 BitStream!5078) (_2!6499 BitStream!5078)) )
))
(declare-fun lt!218771 () tuple2!12338)

(assert (=> b!140550 (= e!93669 (and (= (_2!6498 lt!218770) (select (arr!3617 arr!237) from!447)) (= (_1!6498 lt!218770) (_2!6499 lt!218771))))))

(declare-fun readBytePure!0 (BitStream!5078) tuple2!12336)

(assert (=> b!140550 (= lt!218770 (readBytePure!0 (_1!6499 lt!218771)))))

(declare-fun reader!0 (BitStream!5078 BitStream!5078) tuple2!12338)

(assert (=> b!140550 (= lt!218771 (reader!0 thiss!1634 (_2!6497 lt!218769)))))

(declare-fun b!140551 () Bool)

(declare-fun res!117184 () Bool)

(assert (=> b!140551 (=> (not res!117184) (not e!93666))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140551 (= res!117184 (invariant!0 (currentBit!6177 thiss!1634) (currentByte!6182 thiss!1634) (size!2910 (buf!3331 thiss!1634))))))

(declare-fun b!140552 () Bool)

(declare-fun res!117187 () Bool)

(assert (=> b!140552 (=> (not res!117187) (not e!93666))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140552 (= res!117187 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2910 (buf!3331 thiss!1634))) ((_ sign_extend 32) (currentByte!6182 thiss!1634)) ((_ sign_extend 32) (currentBit!6177 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!117185 () Bool)

(assert (=> start!27364 (=> (not res!117185) (not e!93666))))

(assert (=> start!27364 (= res!117185 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2910 arr!237))))))

(assert (=> start!27364 e!93666))

(assert (=> start!27364 true))

(assert (=> start!27364 (array_inv!2699 arr!237)))

(declare-fun inv!12 (BitStream!5078) Bool)

(assert (=> start!27364 (and (inv!12 thiss!1634) e!93667)))

(assert (= (and start!27364 res!117185) b!140552))

(assert (= (and b!140552 res!117187) b!140546))

(assert (= (and b!140546 res!117190) b!140551))

(assert (= (and b!140551 res!117184) b!140547))

(assert (= (and b!140547 res!117189) b!140549))

(assert (= (and b!140549 res!117188) b!140545))

(assert (= (and b!140545 res!117186) b!140550))

(assert (= start!27364 b!140548))

(declare-fun m!216329 () Bool)

(assert (=> b!140547 m!216329))

(declare-fun m!216331 () Bool)

(assert (=> b!140547 m!216331))

(assert (=> b!140547 m!216331))

(declare-fun m!216333 () Bool)

(assert (=> b!140547 m!216333))

(declare-fun m!216335 () Bool)

(assert (=> b!140552 m!216335))

(declare-fun m!216337 () Bool)

(assert (=> start!27364 m!216337))

(declare-fun m!216339 () Bool)

(assert (=> start!27364 m!216339))

(declare-fun m!216341 () Bool)

(assert (=> b!140548 m!216341))

(assert (=> b!140550 m!216331))

(declare-fun m!216343 () Bool)

(assert (=> b!140550 m!216343))

(declare-fun m!216345 () Bool)

(assert (=> b!140550 m!216345))

(declare-fun m!216347 () Bool)

(assert (=> b!140545 m!216347))

(assert (=> b!140549 m!216329))

(declare-fun m!216349 () Bool)

(assert (=> b!140549 m!216349))

(declare-fun m!216351 () Bool)

(assert (=> b!140551 m!216351))

(push 1)

(assert (not b!140548))

(assert (not b!140550))

(assert (not b!140552))

(assert (not b!140551))

(assert (not b!140549))

(assert (not b!140545))

(assert (not start!27364))

(assert (not b!140547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45308 () Bool)

(declare-datatypes ((tuple2!12340 0))(
  ( (tuple2!12341 (_1!6500 (_ BitVec 8)) (_2!6500 BitStream!5078)) )
))
(declare-fun lt!218798 () tuple2!12340)

(declare-fun readByte!0 (BitStream!5078) tuple2!12340)

(assert (=> d!45308 (= lt!218798 (readByte!0 (_1!6499 lt!218771)))))

(assert (=> d!45308 (= (readBytePure!0 (_1!6499 lt!218771)) (tuple2!12337 (_2!6500 lt!218798) (_1!6500 lt!218798)))))

(declare-fun bs!11118 () Bool)

(assert (= bs!11118 d!45308))

(declare-fun m!216361 () Bool)

(assert (=> bs!11118 m!216361))

(assert (=> b!140550 d!45308))

(declare-fun lt!218944 () (_ BitVec 64))

(declare-fun lt!218932 () tuple2!12338)

(declare-fun b!140600 () Bool)

(declare-fun lt!218938 () (_ BitVec 64))

(declare-fun e!93693 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5078 (_ BitVec 64)) BitStream!5078)

(assert (=> b!140600 (= e!93693 (= (_1!6499 lt!218932) (withMovedBitIndex!0 (_2!6499 lt!218932) (bvsub lt!218938 lt!218944))))))

(assert (=> b!140600 (or (= (bvand lt!218938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218938 lt!218944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140600 (= lt!218944 (bitIndex!0 (size!2910 (buf!3331 (_2!6497 lt!218769))) (currentByte!6182 (_2!6497 lt!218769)) (currentBit!6177 (_2!6497 lt!218769))))))

(assert (=> b!140600 (= lt!218938 (bitIndex!0 (size!2910 (buf!3331 thiss!1634)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634)))))

(declare-fun d!45322 () Bool)

(assert (=> d!45322 e!93693))

(declare-fun res!117226 () Bool)

(assert (=> d!45322 (=> (not res!117226) (not e!93693))))

(assert (=> d!45322 (= res!117226 (isPrefixOf!0 (_1!6499 lt!218932) (_2!6499 lt!218932)))))

(declare-fun lt!218939 () BitStream!5078)

(assert (=> d!45322 (= lt!218932 (tuple2!12339 lt!218939 (_2!6497 lt!218769)))))

(declare-fun lt!218931 () Unit!8799)

(declare-fun lt!218926 () Unit!8799)

(assert (=> d!45322 (= lt!218931 lt!218926)))

(assert (=> d!45322 (isPrefixOf!0 lt!218939 (_2!6497 lt!218769))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5078 BitStream!5078 BitStream!5078) Unit!8799)

(assert (=> d!45322 (= lt!218926 (lemmaIsPrefixTransitive!0 lt!218939 (_2!6497 lt!218769) (_2!6497 lt!218769)))))

(declare-fun lt!218929 () Unit!8799)

(declare-fun lt!218942 () Unit!8799)

(assert (=> d!45322 (= lt!218929 lt!218942)))

(assert (=> d!45322 (isPrefixOf!0 lt!218939 (_2!6497 lt!218769))))

(assert (=> d!45322 (= lt!218942 (lemmaIsPrefixTransitive!0 lt!218939 thiss!1634 (_2!6497 lt!218769)))))

(declare-fun lt!218934 () Unit!8799)

(declare-fun e!93692 () Unit!8799)

(assert (=> d!45322 (= lt!218934 e!93692)))

(declare-fun c!7797 () Bool)

(assert (=> d!45322 (= c!7797 (not (= (size!2910 (buf!3331 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!218930 () Unit!8799)

(declare-fun lt!218935 () Unit!8799)

(assert (=> d!45322 (= lt!218930 lt!218935)))

(assert (=> d!45322 (isPrefixOf!0 (_2!6497 lt!218769) (_2!6497 lt!218769))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5078) Unit!8799)

(assert (=> d!45322 (= lt!218935 (lemmaIsPrefixRefl!0 (_2!6497 lt!218769)))))

(declare-fun lt!218927 () Unit!8799)

(declare-fun lt!218940 () Unit!8799)

(assert (=> d!45322 (= lt!218927 lt!218940)))

(assert (=> d!45322 (= lt!218940 (lemmaIsPrefixRefl!0 (_2!6497 lt!218769)))))

(declare-fun lt!218928 () Unit!8799)

(declare-fun lt!218943 () Unit!8799)

(assert (=> d!45322 (= lt!218928 lt!218943)))

(assert (=> d!45322 (isPrefixOf!0 lt!218939 lt!218939)))

(assert (=> d!45322 (= lt!218943 (lemmaIsPrefixRefl!0 lt!218939))))

(declare-fun lt!218936 () Unit!8799)

(declare-fun lt!218941 () Unit!8799)

(assert (=> d!45322 (= lt!218936 lt!218941)))

(assert (=> d!45322 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45322 (= lt!218941 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45322 (= lt!218939 (BitStream!5079 (buf!3331 (_2!6497 lt!218769)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634)))))

(assert (=> d!45322 (isPrefixOf!0 thiss!1634 (_2!6497 lt!218769))))

(assert (=> d!45322 (= (reader!0 thiss!1634 (_2!6497 lt!218769)) lt!218932)))

(declare-fun b!140601 () Bool)

(declare-fun lt!218925 () Unit!8799)

(assert (=> b!140601 (= e!93692 lt!218925)))

(declare-fun lt!218933 () (_ BitVec 64))

(assert (=> b!140601 (= lt!218933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218937 () (_ BitVec 64))

(assert (=> b!140601 (= lt!218937 (bitIndex!0 (size!2910 (buf!3331 thiss!1634)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6430 array!6430 (_ BitVec 64) (_ BitVec 64)) Unit!8799)

(assert (=> b!140601 (= lt!218925 (arrayBitRangesEqSymmetric!0 (buf!3331 thiss!1634) (buf!3331 (_2!6497 lt!218769)) lt!218933 lt!218937))))

(declare-fun arrayBitRangesEq!0 (array!6430 array!6430 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!140601 (arrayBitRangesEq!0 (buf!3331 (_2!6497 lt!218769)) (buf!3331 thiss!1634) lt!218933 lt!218937)))

(declare-fun b!140602 () Bool)

(declare-fun Unit!8803 () Unit!8799)

(assert (=> b!140602 (= e!93692 Unit!8803)))

(declare-fun b!140603 () Bool)

(declare-fun res!117228 () Bool)

(assert (=> b!140603 (=> (not res!117228) (not e!93693))))

(assert (=> b!140603 (= res!117228 (isPrefixOf!0 (_2!6499 lt!218932) (_2!6497 lt!218769)))))

(declare-fun b!140604 () Bool)

(declare-fun res!117227 () Bool)

(assert (=> b!140604 (=> (not res!117227) (not e!93693))))

(assert (=> b!140604 (= res!117227 (isPrefixOf!0 (_1!6499 lt!218932) thiss!1634))))

(assert (= (and d!45322 c!7797) b!140601))

(assert (= (and d!45322 (not c!7797)) b!140602))

(assert (= (and d!45322 res!117226) b!140604))

(assert (= (and b!140604 res!117227) b!140603))

(assert (= (and b!140603 res!117228) b!140600))

(declare-fun m!216367 () Bool)

(assert (=> b!140600 m!216367))

(assert (=> b!140600 m!216329))

(assert (=> b!140600 m!216349))

(declare-fun m!216369 () Bool)

(assert (=> b!140603 m!216369))

(assert (=> b!140601 m!216349))

(declare-fun m!216371 () Bool)

(assert (=> b!140601 m!216371))

(declare-fun m!216373 () Bool)

(assert (=> b!140601 m!216373))

(declare-fun m!216375 () Bool)

(assert (=> d!45322 m!216375))

(declare-fun m!216377 () Bool)

(assert (=> d!45322 m!216377))

(declare-fun m!216379 () Bool)

(assert (=> d!45322 m!216379))

(declare-fun m!216381 () Bool)

(assert (=> d!45322 m!216381))

(declare-fun m!216383 () Bool)

(assert (=> d!45322 m!216383))

(declare-fun m!216385 () Bool)

(assert (=> d!45322 m!216385))

(declare-fun m!216387 () Bool)

(assert (=> d!45322 m!216387))

(declare-fun m!216389 () Bool)

(assert (=> d!45322 m!216389))

(assert (=> d!45322 m!216347))

(declare-fun m!216391 () Bool)

(assert (=> d!45322 m!216391))

(declare-fun m!216393 () Bool)

(assert (=> d!45322 m!216393))

(declare-fun m!216395 () Bool)

(assert (=> b!140604 m!216395))

(assert (=> b!140550 d!45322))

(declare-fun d!45328 () Bool)

(declare-fun e!93700 () Bool)

(assert (=> d!45328 e!93700))

(declare-fun res!117240 () Bool)

(assert (=> d!45328 (=> (not res!117240) (not e!93700))))

(declare-fun lt!219001 () (_ BitVec 64))

(declare-fun lt!218998 () (_ BitVec 64))

(declare-fun lt!219002 () (_ BitVec 64))

(assert (=> d!45328 (= res!117240 (= lt!218998 (bvsub lt!219001 lt!219002)))))

(assert (=> d!45328 (or (= (bvand lt!219001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219002 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219001 lt!219002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45328 (= lt!219002 (remainingBits!0 ((_ sign_extend 32) (size!2910 (buf!3331 (_2!6497 lt!218769)))) ((_ sign_extend 32) (currentByte!6182 (_2!6497 lt!218769))) ((_ sign_extend 32) (currentBit!6177 (_2!6497 lt!218769)))))))

(declare-fun lt!219000 () (_ BitVec 64))

(declare-fun lt!218997 () (_ BitVec 64))

(assert (=> d!45328 (= lt!219001 (bvmul lt!219000 lt!218997))))

(assert (=> d!45328 (or (= lt!219000 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218997 (bvsdiv (bvmul lt!219000 lt!218997) lt!219000)))))

(assert (=> d!45328 (= lt!218997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45328 (= lt!219000 ((_ sign_extend 32) (size!2910 (buf!3331 (_2!6497 lt!218769)))))))

(assert (=> d!45328 (= lt!218998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6182 (_2!6497 lt!218769))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6177 (_2!6497 lt!218769)))))))

(assert (=> d!45328 (invariant!0 (currentBit!6177 (_2!6497 lt!218769)) (currentByte!6182 (_2!6497 lt!218769)) (size!2910 (buf!3331 (_2!6497 lt!218769))))))

(assert (=> d!45328 (= (bitIndex!0 (size!2910 (buf!3331 (_2!6497 lt!218769))) (currentByte!6182 (_2!6497 lt!218769)) (currentBit!6177 (_2!6497 lt!218769))) lt!218998)))

(declare-fun b!140619 () Bool)

(declare-fun res!117239 () Bool)

(assert (=> b!140619 (=> (not res!117239) (not e!93700))))

(assert (=> b!140619 (= res!117239 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218998))))

(declare-fun b!140620 () Bool)

(declare-fun lt!218999 () (_ BitVec 64))

(assert (=> b!140620 (= e!93700 (bvsle lt!218998 (bvmul lt!218999 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140620 (or (= lt!218999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218999)))))

(assert (=> b!140620 (= lt!218999 ((_ sign_extend 32) (size!2910 (buf!3331 (_2!6497 lt!218769)))))))

(assert (= (and d!45328 res!117240) b!140619))

(assert (= (and b!140619 res!117239) b!140620))

(declare-fun m!216459 () Bool)

(assert (=> d!45328 m!216459))

(declare-fun m!216461 () Bool)

(assert (=> d!45328 m!216461))

(assert (=> b!140549 d!45328))

(declare-fun d!45338 () Bool)

(declare-fun e!93701 () Bool)

(assert (=> d!45338 e!93701))

(declare-fun res!117242 () Bool)

(assert (=> d!45338 (=> (not res!117242) (not e!93701))))

(declare-fun lt!219008 () (_ BitVec 64))

(declare-fun lt!219007 () (_ BitVec 64))

(declare-fun lt!219004 () (_ BitVec 64))

(assert (=> d!45338 (= res!117242 (= lt!219004 (bvsub lt!219007 lt!219008)))))

(assert (=> d!45338 (or (= (bvand lt!219007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219007 lt!219008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45338 (= lt!219008 (remainingBits!0 ((_ sign_extend 32) (size!2910 (buf!3331 thiss!1634))) ((_ sign_extend 32) (currentByte!6182 thiss!1634)) ((_ sign_extend 32) (currentBit!6177 thiss!1634))))))

(declare-fun lt!219006 () (_ BitVec 64))

(declare-fun lt!219003 () (_ BitVec 64))

(assert (=> d!45338 (= lt!219007 (bvmul lt!219006 lt!219003))))

(assert (=> d!45338 (or (= lt!219006 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219003 (bvsdiv (bvmul lt!219006 lt!219003) lt!219006)))))

(assert (=> d!45338 (= lt!219003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45338 (= lt!219006 ((_ sign_extend 32) (size!2910 (buf!3331 thiss!1634))))))

(assert (=> d!45338 (= lt!219004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6182 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6177 thiss!1634))))))

(assert (=> d!45338 (invariant!0 (currentBit!6177 thiss!1634) (currentByte!6182 thiss!1634) (size!2910 (buf!3331 thiss!1634)))))

(assert (=> d!45338 (= (bitIndex!0 (size!2910 (buf!3331 thiss!1634)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634)) lt!219004)))

(declare-fun b!140621 () Bool)

(declare-fun res!117241 () Bool)

(assert (=> b!140621 (=> (not res!117241) (not e!93701))))

(assert (=> b!140621 (= res!117241 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219004))))

(declare-fun b!140622 () Bool)

(declare-fun lt!219005 () (_ BitVec 64))

(assert (=> b!140622 (= e!93701 (bvsle lt!219004 (bvmul lt!219005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140622 (or (= lt!219005 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219005 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219005)))))

(assert (=> b!140622 (= lt!219005 ((_ sign_extend 32) (size!2910 (buf!3331 thiss!1634))))))

(assert (= (and d!45338 res!117242) b!140621))

(assert (= (and b!140621 res!117241) b!140622))

(declare-fun m!216463 () Bool)

(assert (=> d!45338 m!216463))

(assert (=> d!45338 m!216351))

(assert (=> b!140549 d!45338))

(declare-fun d!45340 () Bool)

(assert (=> d!45340 (= (array_inv!2699 (buf!3331 thiss!1634)) (bvsge (size!2910 (buf!3331 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!140548 d!45340))

(declare-fun d!45342 () Bool)

(assert (=> d!45342 (= (array_inv!2699 arr!237) (bvsge (size!2910 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27364 d!45342))

(declare-fun d!45344 () Bool)

(assert (=> d!45344 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6177 thiss!1634) (currentByte!6182 thiss!1634) (size!2910 (buf!3331 thiss!1634))))))

(declare-fun bs!11122 () Bool)

(assert (= bs!11122 d!45344))

(assert (=> bs!11122 m!216351))

(assert (=> start!27364 d!45344))

(assert (=> b!140547 d!45328))

(declare-fun d!45346 () Bool)

(declare-fun e!93718 () Bool)

(assert (=> d!45346 e!93718))

(declare-fun res!117279 () Bool)

(assert (=> d!45346 (=> (not res!117279) (not e!93718))))

(declare-fun lt!219065 () tuple2!12334)

(assert (=> d!45346 (= res!117279 (= (size!2910 (buf!3331 thiss!1634)) (size!2910 (buf!3331 (_2!6497 lt!219065)))))))

(declare-fun choose!6 (BitStream!5078 (_ BitVec 8)) tuple2!12334)

(assert (=> d!45346 (= lt!219065 (choose!6 thiss!1634 (select (arr!3617 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45346 (validate_offset_byte!0 ((_ sign_extend 32) (size!2910 (buf!3331 thiss!1634))) ((_ sign_extend 32) (currentByte!6182 thiss!1634)) ((_ sign_extend 32) (currentBit!6177 thiss!1634)))))

(assert (=> d!45346 (= (appendByte!0 thiss!1634 (select (arr!3617 arr!237) from!447)) lt!219065)))

(declare-fun b!140659 () Bool)

(declare-fun res!117281 () Bool)

(assert (=> b!140659 (=> (not res!117281) (not e!93718))))

(declare-fun lt!219062 () (_ BitVec 64))

(declare-fun lt!219063 () (_ BitVec 64))

(assert (=> b!140659 (= res!117281 (= (bitIndex!0 (size!2910 (buf!3331 (_2!6497 lt!219065))) (currentByte!6182 (_2!6497 lt!219065)) (currentBit!6177 (_2!6497 lt!219065))) (bvadd lt!219063 lt!219062)))))

(assert (=> b!140659 (or (not (= (bvand lt!219063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219062 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!219063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!219063 lt!219062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140659 (= lt!219062 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!140659 (= lt!219063 (bitIndex!0 (size!2910 (buf!3331 thiss!1634)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634)))))

(declare-fun b!140660 () Bool)

(declare-fun res!117280 () Bool)

(assert (=> b!140660 (=> (not res!117280) (not e!93718))))

(assert (=> b!140660 (= res!117280 (isPrefixOf!0 thiss!1634 (_2!6497 lt!219065)))))

(declare-fun lt!219066 () tuple2!12338)

(declare-fun lt!219064 () tuple2!12336)

(declare-fun b!140661 () Bool)

(assert (=> b!140661 (= e!93718 (and (= (_2!6498 lt!219064) (select (arr!3617 arr!237) from!447)) (= (_1!6498 lt!219064) (_2!6499 lt!219066))))))

(assert (=> b!140661 (= lt!219064 (readBytePure!0 (_1!6499 lt!219066)))))

(assert (=> b!140661 (= lt!219066 (reader!0 thiss!1634 (_2!6497 lt!219065)))))

(assert (= (and d!45346 res!117279) b!140659))

(assert (= (and b!140659 res!117281) b!140660))

(assert (= (and b!140660 res!117280) b!140661))

(assert (=> d!45346 m!216331))

(declare-fun m!216483 () Bool)

(assert (=> d!45346 m!216483))

(declare-fun m!216485 () Bool)

(assert (=> d!45346 m!216485))

(declare-fun m!216487 () Bool)

(assert (=> b!140659 m!216487))

(assert (=> b!140659 m!216349))

(declare-fun m!216489 () Bool)

(assert (=> b!140660 m!216489))

(declare-fun m!216491 () Bool)

(assert (=> b!140661 m!216491))

(declare-fun m!216493 () Bool)

(assert (=> b!140661 m!216493))

(assert (=> b!140547 d!45346))

(declare-fun d!45360 () Bool)

(assert (=> d!45360 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2910 (buf!3331 thiss!1634))) ((_ sign_extend 32) (currentByte!6182 thiss!1634)) ((_ sign_extend 32) (currentBit!6177 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2910 (buf!3331 thiss!1634))) ((_ sign_extend 32) (currentByte!6182 thiss!1634)) ((_ sign_extend 32) (currentBit!6177 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11125 () Bool)

(assert (= bs!11125 d!45360))

(assert (=> bs!11125 m!216463))

(assert (=> b!140552 d!45360))

(declare-fun d!45364 () Bool)

(assert (=> d!45364 (= (invariant!0 (currentBit!6177 thiss!1634) (currentByte!6182 thiss!1634) (size!2910 (buf!3331 thiss!1634))) (and (bvsge (currentBit!6177 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6177 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6182 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6182 thiss!1634) (size!2910 (buf!3331 thiss!1634))) (and (= (currentBit!6177 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6182 thiss!1634) (size!2910 (buf!3331 thiss!1634)))))))))

(assert (=> b!140551 d!45364))

(declare-fun d!45366 () Bool)

(declare-fun res!117293 () Bool)

(declare-fun e!93726 () Bool)

(assert (=> d!45366 (=> (not res!117293) (not e!93726))))

(assert (=> d!45366 (= res!117293 (= (size!2910 (buf!3331 thiss!1634)) (size!2910 (buf!3331 (_2!6497 lt!218769)))))))

(assert (=> d!45366 (= (isPrefixOf!0 thiss!1634 (_2!6497 lt!218769)) e!93726)))

(declare-fun b!140673 () Bool)

(declare-fun res!117295 () Bool)

(assert (=> b!140673 (=> (not res!117295) (not e!93726))))

(assert (=> b!140673 (= res!117295 (bvsle (bitIndex!0 (size!2910 (buf!3331 thiss!1634)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634)) (bitIndex!0 (size!2910 (buf!3331 (_2!6497 lt!218769))) (currentByte!6182 (_2!6497 lt!218769)) (currentBit!6177 (_2!6497 lt!218769)))))))

(declare-fun b!140674 () Bool)

(declare-fun e!93725 () Bool)

(assert (=> b!140674 (= e!93726 e!93725)))

(declare-fun res!117294 () Bool)

(assert (=> b!140674 (=> res!117294 e!93725)))

(assert (=> b!140674 (= res!117294 (= (size!2910 (buf!3331 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!140675 () Bool)

(assert (=> b!140675 (= e!93725 (arrayBitRangesEq!0 (buf!3331 thiss!1634) (buf!3331 (_2!6497 lt!218769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2910 (buf!3331 thiss!1634)) (currentByte!6182 thiss!1634) (currentBit!6177 thiss!1634))))))

(assert (= (and d!45366 res!117293) b!140673))

(assert (= (and b!140673 res!117295) b!140674))

(assert (= (and b!140674 (not res!117294)) b!140675))

(assert (=> b!140673 m!216349))

(assert (=> b!140673 m!216329))

(assert (=> b!140675 m!216349))

(assert (=> b!140675 m!216349))

(declare-fun m!216507 () Bool)

(assert (=> b!140675 m!216507))

(assert (=> b!140545 d!45366))

(push 1)

(assert (not b!140600))

(assert (not d!45338))

(assert (not d!45322))

(assert (not b!140675))

(assert (not b!140659))

(assert (not d!45344))

(assert (not b!140604))

(assert (not d!45328))

(assert (not b!140661))

(assert (not d!45346))

(assert (not b!140660))

(assert (not b!140603))

(assert (not b!140673))

(assert (not b!140601))

(assert (not d!45308))

(assert (not d!45360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

