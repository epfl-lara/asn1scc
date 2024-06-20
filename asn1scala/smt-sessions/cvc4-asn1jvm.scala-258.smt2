; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5042 () Bool)

(assert start!5042)

(declare-fun res!17466 () Bool)

(declare-fun e!13427 () Bool)

(assert (=> start!5042 (=> (not res!17466) (not e!13427))))

(declare-datatypes ((array!1440 0))(
  ( (array!1441 (arr!1056 (Array (_ BitVec 32) (_ BitVec 8))) (size!612 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1440)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5042 (= res!17466 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!612 srcBuffer!2))))))))

(assert (=> start!5042 e!13427))

(assert (=> start!5042 true))

(declare-fun array_inv!582 (array!1440) Bool)

(assert (=> start!5042 (array_inv!582 srcBuffer!2)))

(declare-datatypes ((BitStream!1058 0))(
  ( (BitStream!1059 (buf!918 array!1440) (currentByte!2204 (_ BitVec 32)) (currentBit!2199 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1058)

(declare-fun e!13428 () Bool)

(declare-fun inv!12 (BitStream!1058) Bool)

(assert (=> start!5042 (and (inv!12 thiss!1379) e!13428)))

(declare-fun b!20068 () Bool)

(declare-fun e!13425 () Bool)

(assert (=> b!20068 (= e!13427 (not e!13425))))

(declare-fun res!17467 () Bool)

(assert (=> b!20068 (=> res!17467 e!13425)))

(assert (=> b!20068 (= res!17467 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1058 BitStream!1058) Bool)

(assert (=> b!20068 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1774 0))(
  ( (Unit!1775) )
))
(declare-fun lt!28594 () Unit!1774)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1058) Unit!1774)

(assert (=> b!20068 (= lt!28594 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28592 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20068 (= lt!28592 (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)))))

(declare-fun b!20069 () Bool)

(declare-fun e!13426 () Bool)

(declare-datatypes ((tuple2!2332 0))(
  ( (tuple2!2333 (_1!1251 Unit!1774) (_2!1251 BitStream!1058)) )
))
(declare-fun lt!28597 () tuple2!2332)

(declare-datatypes ((tuple2!2334 0))(
  ( (tuple2!2335 (_1!1252 BitStream!1058) (_2!1252 BitStream!1058)) )
))
(declare-fun lt!28593 () tuple2!2334)

(declare-datatypes ((List!230 0))(
  ( (Nil!227) (Cons!226 (h!345 Bool) (t!980 List!230)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1058 BitStream!1058 (_ BitVec 64)) List!230)

(assert (=> b!20069 (= e!13426 (not (= (bitStreamReadBitsIntoList!0 (_2!1251 lt!28597) (_1!1252 lt!28593) #b0000000000000000000000000000000000000000000000000000000000000001) Nil!227)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20069 (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28596 () Unit!1774)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1058 array!1440 (_ BitVec 64)) Unit!1774)

(assert (=> b!20069 (= lt!28596 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!918 (_2!1251 lt!28597)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1058 BitStream!1058) tuple2!2334)

(assert (=> b!20069 (= lt!28593 (reader!0 thiss!1379 (_2!1251 lt!28597)))))

(declare-fun b!20070 () Bool)

(assert (=> b!20070 (= e!13428 (array_inv!582 (buf!918 thiss!1379)))))

(declare-fun b!20071 () Bool)

(assert (=> b!20071 (= e!13425 e!13426)))

(declare-fun res!17465 () Bool)

(assert (=> b!20071 (=> res!17465 e!13426)))

(assert (=> b!20071 (= res!17465 (not (isPrefixOf!0 thiss!1379 (_2!1251 lt!28597))))))

(assert (=> b!20071 (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 (_2!1251 lt!28597))) ((_ sign_extend 32) (currentBit!2199 (_2!1251 lt!28597))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28595 () Unit!1774)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1058 BitStream!1058 (_ BitVec 64) (_ BitVec 64)) Unit!1774)

(assert (=> b!20071 (= lt!28595 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1251 lt!28597) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1058 (_ BitVec 8) (_ BitVec 32)) tuple2!2332)

(assert (=> b!20071 (= lt!28597 (appendBitFromByte!0 thiss!1379 (select (arr!1056 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20072 () Bool)

(declare-fun res!17468 () Bool)

(assert (=> b!20072 (=> (not res!17468) (not e!13427))))

(assert (=> b!20072 (= res!17468 (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 thiss!1379))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5042 res!17466) b!20072))

(assert (= (and b!20072 res!17468) b!20068))

(assert (= (and b!20068 (not res!17467)) b!20071))

(assert (= (and b!20071 (not res!17465)) b!20069))

(assert (= start!5042 b!20070))

(declare-fun m!27157 () Bool)

(assert (=> b!20071 m!27157))

(declare-fun m!27159 () Bool)

(assert (=> b!20071 m!27159))

(declare-fun m!27161 () Bool)

(assert (=> b!20071 m!27161))

(declare-fun m!27163 () Bool)

(assert (=> b!20071 m!27163))

(declare-fun m!27165 () Bool)

(assert (=> b!20071 m!27165))

(assert (=> b!20071 m!27161))

(declare-fun m!27167 () Bool)

(assert (=> start!5042 m!27167))

(declare-fun m!27169 () Bool)

(assert (=> start!5042 m!27169))

(declare-fun m!27171 () Bool)

(assert (=> b!20070 m!27171))

(declare-fun m!27173 () Bool)

(assert (=> b!20068 m!27173))

(declare-fun m!27175 () Bool)

(assert (=> b!20068 m!27175))

(declare-fun m!27177 () Bool)

(assert (=> b!20068 m!27177))

(declare-fun m!27179 () Bool)

(assert (=> b!20072 m!27179))

(declare-fun m!27181 () Bool)

(assert (=> b!20069 m!27181))

(declare-fun m!27183 () Bool)

(assert (=> b!20069 m!27183))

(declare-fun m!27185 () Bool)

(assert (=> b!20069 m!27185))

(declare-fun m!27187 () Bool)

(assert (=> b!20069 m!27187))

(push 1)

(assert (not b!20069))

(assert (not b!20071))

(assert (not start!5042))

(assert (not b!20070))

(assert (not b!20072))

(assert (not b!20068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!20111 () Bool)

(declare-fun e!13449 () Bool)

(declare-fun lt!28637 () List!230)

(declare-fun length!48 (List!230) Int)

(assert (=> b!20111 (= e!13449 (> (length!48 lt!28637) 0))))

(declare-fun b!20110 () Bool)

(declare-fun isEmpty!53 (List!230) Bool)

(assert (=> b!20110 (= e!13449 (isEmpty!53 lt!28637))))

(declare-fun d!6550 () Bool)

(assert (=> d!6550 e!13449))

(declare-fun c!1444 () Bool)

(assert (=> d!6550 (= c!1444 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!2342 0))(
  ( (tuple2!2343 (_1!1256 List!230) (_2!1256 BitStream!1058)) )
))
(declare-fun e!13448 () tuple2!2342)

(assert (=> d!6550 (= lt!28637 (_1!1256 e!13448))))

(declare-fun c!1443 () Bool)

(assert (=> d!6550 (= c!1443 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6550 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6550 (= (bitStreamReadBitsIntoList!0 (_2!1251 lt!28597) (_1!1252 lt!28593) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28637)))

(declare-fun b!20109 () Bool)

(declare-datatypes ((tuple2!2344 0))(
  ( (tuple2!2345 (_1!1257 Bool) (_2!1257 BitStream!1058)) )
))
(declare-fun lt!28638 () tuple2!2344)

(declare-fun lt!28639 () (_ BitVec 64))

(assert (=> b!20109 (= e!13448 (tuple2!2343 (Cons!226 (_1!1257 lt!28638) (bitStreamReadBitsIntoList!0 (_2!1251 lt!28597) (_2!1257 lt!28638) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!28639))) (_2!1257 lt!28638)))))

(declare-fun readBit!0 (BitStream!1058) tuple2!2344)

(assert (=> b!20109 (= lt!28638 (readBit!0 (_1!1252 lt!28593)))))

(assert (=> b!20109 (= lt!28639 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!20108 () Bool)

(assert (=> b!20108 (= e!13448 (tuple2!2343 Nil!227 (_1!1252 lt!28593)))))

(assert (= (and d!6550 c!1443) b!20108))

(assert (= (and d!6550 (not c!1443)) b!20109))

(assert (= (and d!6550 c!1444) b!20110))

(assert (= (and d!6550 (not c!1444)) b!20111))

(declare-fun m!27211 () Bool)

(assert (=> b!20111 m!27211))

(declare-fun m!27213 () Bool)

(assert (=> b!20110 m!27213))

(declare-fun m!27215 () Bool)

(assert (=> b!20109 m!27215))

(declare-fun m!27217 () Bool)

(assert (=> b!20109 m!27217))

(assert (=> b!20069 d!6550))

(declare-fun d!6558 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6558 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1926 () Bool)

(assert (= bs!1926 d!6558))

(declare-fun m!27219 () Bool)

(assert (=> bs!1926 m!27219))

(assert (=> b!20069 d!6558))

(declare-fun d!6560 () Bool)

(assert (=> d!6560 (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28648 () Unit!1774)

(declare-fun choose!9 (BitStream!1058 array!1440 (_ BitVec 64) BitStream!1058) Unit!1774)

(assert (=> d!6560 (= lt!28648 (choose!9 thiss!1379 (buf!918 (_2!1251 lt!28597)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1059 (buf!918 (_2!1251 lt!28597)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379))))))

(assert (=> d!6560 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!918 (_2!1251 lt!28597)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28648)))

(declare-fun bs!1927 () Bool)

(assert (= bs!1927 d!6560))

(assert (=> bs!1927 m!27183))

(declare-fun m!27221 () Bool)

(assert (=> bs!1927 m!27221))

(assert (=> b!20069 d!6560))

(declare-fun b!20155 () Bool)

(declare-fun res!17506 () Bool)

(declare-fun e!13471 () Bool)

(assert (=> b!20155 (=> (not res!17506) (not e!13471))))

(declare-fun lt!28774 () tuple2!2334)

(assert (=> b!20155 (= res!17506 (isPrefixOf!0 (_1!1252 lt!28774) thiss!1379))))

(declare-fun b!20156 () Bool)

(declare-fun res!17507 () Bool)

(assert (=> b!20156 (=> (not res!17507) (not e!13471))))

(assert (=> b!20156 (= res!17507 (isPrefixOf!0 (_2!1252 lt!28774) (_2!1251 lt!28597)))))

(declare-fun d!6562 () Bool)

(assert (=> d!6562 e!13471))

(declare-fun res!17505 () Bool)

(assert (=> d!6562 (=> (not res!17505) (not e!13471))))

(assert (=> d!6562 (= res!17505 (isPrefixOf!0 (_1!1252 lt!28774) (_2!1252 lt!28774)))))

(declare-fun lt!28763 () BitStream!1058)

(assert (=> d!6562 (= lt!28774 (tuple2!2335 lt!28763 (_2!1251 lt!28597)))))

(declare-fun lt!28761 () Unit!1774)

(declare-fun lt!28772 () Unit!1774)

(assert (=> d!6562 (= lt!28761 lt!28772)))

(assert (=> d!6562 (isPrefixOf!0 lt!28763 (_2!1251 lt!28597))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1058 BitStream!1058 BitStream!1058) Unit!1774)

(assert (=> d!6562 (= lt!28772 (lemmaIsPrefixTransitive!0 lt!28763 (_2!1251 lt!28597) (_2!1251 lt!28597)))))

(declare-fun lt!28775 () Unit!1774)

(declare-fun lt!28766 () Unit!1774)

(assert (=> d!6562 (= lt!28775 lt!28766)))

(assert (=> d!6562 (isPrefixOf!0 lt!28763 (_2!1251 lt!28597))))

(assert (=> d!6562 (= lt!28766 (lemmaIsPrefixTransitive!0 lt!28763 thiss!1379 (_2!1251 lt!28597)))))

(declare-fun lt!28767 () Unit!1774)

(declare-fun e!13472 () Unit!1774)

(assert (=> d!6562 (= lt!28767 e!13472)))

(declare-fun c!1456 () Bool)

(assert (=> d!6562 (= c!1456 (not (= (size!612 (buf!918 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!28771 () Unit!1774)

(declare-fun lt!28777 () Unit!1774)

(assert (=> d!6562 (= lt!28771 lt!28777)))

(assert (=> d!6562 (isPrefixOf!0 (_2!1251 lt!28597) (_2!1251 lt!28597))))

(assert (=> d!6562 (= lt!28777 (lemmaIsPrefixRefl!0 (_2!1251 lt!28597)))))

(declare-fun lt!28776 () Unit!1774)

(declare-fun lt!28773 () Unit!1774)

(assert (=> d!6562 (= lt!28776 lt!28773)))

(assert (=> d!6562 (= lt!28773 (lemmaIsPrefixRefl!0 (_2!1251 lt!28597)))))

(declare-fun lt!28764 () Unit!1774)

(declare-fun lt!28760 () Unit!1774)

(assert (=> d!6562 (= lt!28764 lt!28760)))

(assert (=> d!6562 (isPrefixOf!0 lt!28763 lt!28763)))

(assert (=> d!6562 (= lt!28760 (lemmaIsPrefixRefl!0 lt!28763))))

(declare-fun lt!28770 () Unit!1774)

(declare-fun lt!28768 () Unit!1774)

(assert (=> d!6562 (= lt!28770 lt!28768)))

(assert (=> d!6562 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6562 (= lt!28768 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6562 (= lt!28763 (BitStream!1059 (buf!918 (_2!1251 lt!28597)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)))))

(assert (=> d!6562 (isPrefixOf!0 thiss!1379 (_2!1251 lt!28597))))

(assert (=> d!6562 (= (reader!0 thiss!1379 (_2!1251 lt!28597)) lt!28774)))

(declare-fun b!20157 () Bool)

(declare-fun lt!28765 () Unit!1774)

(assert (=> b!20157 (= e!13472 lt!28765)))

(declare-fun lt!28769 () (_ BitVec 64))

(assert (=> b!20157 (= lt!28769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28762 () (_ BitVec 64))

(assert (=> b!20157 (= lt!28762 (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1440 array!1440 (_ BitVec 64) (_ BitVec 64)) Unit!1774)

(assert (=> b!20157 (= lt!28765 (arrayBitRangesEqSymmetric!0 (buf!918 thiss!1379) (buf!918 (_2!1251 lt!28597)) lt!28769 lt!28762))))

(declare-fun arrayBitRangesEq!0 (array!1440 array!1440 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20157 (arrayBitRangesEq!0 (buf!918 (_2!1251 lt!28597)) (buf!918 thiss!1379) lt!28769 lt!28762)))

(declare-fun b!20158 () Bool)

(declare-fun lt!28758 () (_ BitVec 64))

(declare-fun lt!28759 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1058 (_ BitVec 64)) BitStream!1058)

(assert (=> b!20158 (= e!13471 (= (_1!1252 lt!28774) (withMovedBitIndex!0 (_2!1252 lt!28774) (bvsub lt!28758 lt!28759))))))

(assert (=> b!20158 (or (= (bvand lt!28758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28759 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28758 lt!28759) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20158 (= lt!28759 (bitIndex!0 (size!612 (buf!918 (_2!1251 lt!28597))) (currentByte!2204 (_2!1251 lt!28597)) (currentBit!2199 (_2!1251 lt!28597))))))

(assert (=> b!20158 (= lt!28758 (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)))))

(declare-fun b!20159 () Bool)

(declare-fun Unit!1777 () Unit!1774)

(assert (=> b!20159 (= e!13472 Unit!1777)))

(assert (= (and d!6562 c!1456) b!20157))

(assert (= (and d!6562 (not c!1456)) b!20159))

(assert (= (and d!6562 res!17505) b!20155))

(assert (= (and b!20155 res!17506) b!20156))

(assert (= (and b!20156 res!17507) b!20158))

(declare-fun m!27269 () Bool)

(assert (=> b!20155 m!27269))

(declare-fun m!27271 () Bool)

(assert (=> b!20156 m!27271))

(declare-fun m!27273 () Bool)

(assert (=> b!20158 m!27273))

(declare-fun m!27275 () Bool)

(assert (=> b!20158 m!27275))

(assert (=> b!20158 m!27177))

(assert (=> b!20157 m!27177))

(declare-fun m!27277 () Bool)

(assert (=> b!20157 m!27277))

(declare-fun m!27279 () Bool)

(assert (=> b!20157 m!27279))

(declare-fun m!27281 () Bool)

(assert (=> d!6562 m!27281))

(declare-fun m!27283 () Bool)

(assert (=> d!6562 m!27283))

(declare-fun m!27285 () Bool)

(assert (=> d!6562 m!27285))

(declare-fun m!27287 () Bool)

(assert (=> d!6562 m!27287))

(assert (=> d!6562 m!27175))

(declare-fun m!27289 () Bool)

(assert (=> d!6562 m!27289))

(assert (=> d!6562 m!27159))

(declare-fun m!27291 () Bool)

(assert (=> d!6562 m!27291))

(declare-fun m!27293 () Bool)

(assert (=> d!6562 m!27293))

(assert (=> d!6562 m!27173))

(declare-fun m!27295 () Bool)

(assert (=> d!6562 m!27295))

(assert (=> b!20069 d!6562))

(declare-fun d!6578 () Bool)

(assert (=> d!6578 (= (array_inv!582 (buf!918 thiss!1379)) (bvsge (size!612 (buf!918 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!20070 d!6578))

(declare-fun d!6580 () Bool)

(assert (=> d!6580 (= (array_inv!582 srcBuffer!2) (bvsge (size!612 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5042 d!6580))

(declare-fun d!6582 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6582 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2199 thiss!1379) (currentByte!2204 thiss!1379) (size!612 (buf!918 thiss!1379))))))

(declare-fun bs!1931 () Bool)

(assert (= bs!1931 d!6582))

(declare-fun m!27297 () Bool)

(assert (=> bs!1931 m!27297))

(assert (=> start!5042 d!6582))

(declare-fun d!6584 () Bool)

(declare-fun res!17514 () Bool)

(declare-fun e!13477 () Bool)

(assert (=> d!6584 (=> (not res!17514) (not e!13477))))

(assert (=> d!6584 (= res!17514 (= (size!612 (buf!918 thiss!1379)) (size!612 (buf!918 thiss!1379))))))

(assert (=> d!6584 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!13477)))

(declare-fun b!20166 () Bool)

(declare-fun res!17516 () Bool)

(assert (=> b!20166 (=> (not res!17516) (not e!13477))))

(assert (=> b!20166 (= res!17516 (bvsle (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)) (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379))))))

(declare-fun b!20167 () Bool)

(declare-fun e!13478 () Bool)

(assert (=> b!20167 (= e!13477 e!13478)))

(declare-fun res!17515 () Bool)

(assert (=> b!20167 (=> res!17515 e!13478)))

(assert (=> b!20167 (= res!17515 (= (size!612 (buf!918 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20168 () Bool)

(assert (=> b!20168 (= e!13478 (arrayBitRangesEq!0 (buf!918 thiss!1379) (buf!918 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379))))))

(assert (= (and d!6584 res!17514) b!20166))

(assert (= (and b!20166 res!17516) b!20167))

(assert (= (and b!20167 (not res!17515)) b!20168))

(assert (=> b!20166 m!27177))

(assert (=> b!20166 m!27177))

(assert (=> b!20168 m!27177))

(assert (=> b!20168 m!27177))

(declare-fun m!27299 () Bool)

(assert (=> b!20168 m!27299))

(assert (=> b!20068 d!6584))

(declare-fun d!6586 () Bool)

(assert (=> d!6586 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28816 () Unit!1774)

(declare-fun choose!11 (BitStream!1058) Unit!1774)

(assert (=> d!6586 (= lt!28816 (choose!11 thiss!1379))))

(assert (=> d!6586 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!28816)))

(declare-fun bs!1933 () Bool)

(assert (= bs!1933 d!6586))

(assert (=> bs!1933 m!27173))

(declare-fun m!27301 () Bool)

(assert (=> bs!1933 m!27301))

(assert (=> b!20068 d!6586))

(declare-fun d!6588 () Bool)

(declare-fun e!13491 () Bool)

(assert (=> d!6588 e!13491))

(declare-fun res!17537 () Bool)

(assert (=> d!6588 (=> (not res!17537) (not e!13491))))

(declare-fun lt!28853 () (_ BitVec 64))

(declare-fun lt!28856 () (_ BitVec 64))

(declare-fun lt!28858 () (_ BitVec 64))

(assert (=> d!6588 (= res!17537 (= lt!28858 (bvsub lt!28856 lt!28853)))))

(assert (=> d!6588 (or (= (bvand lt!28856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28856 lt!28853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6588 (= lt!28853 (remainingBits!0 ((_ sign_extend 32) (size!612 (buf!918 thiss!1379))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379))))))

(declare-fun lt!28854 () (_ BitVec 64))

(declare-fun lt!28857 () (_ BitVec 64))

(assert (=> d!6588 (= lt!28856 (bvmul lt!28854 lt!28857))))

(assert (=> d!6588 (or (= lt!28854 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!28857 (bvsdiv (bvmul lt!28854 lt!28857) lt!28854)))))

(assert (=> d!6588 (= lt!28857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6588 (= lt!28854 ((_ sign_extend 32) (size!612 (buf!918 thiss!1379))))))

(assert (=> d!6588 (= lt!28858 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2204 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2199 thiss!1379))))))

(assert (=> d!6588 (invariant!0 (currentBit!2199 thiss!1379) (currentByte!2204 thiss!1379) (size!612 (buf!918 thiss!1379)))))

(assert (=> d!6588 (= (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)) lt!28858)))

(declare-fun b!20194 () Bool)

(declare-fun res!17536 () Bool)

(assert (=> b!20194 (=> (not res!17536) (not e!13491))))

(assert (=> b!20194 (= res!17536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!28858))))

(declare-fun b!20195 () Bool)

(declare-fun lt!28855 () (_ BitVec 64))

(assert (=> b!20195 (= e!13491 (bvsle lt!28858 (bvmul lt!28855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!20195 (or (= lt!28855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!28855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!28855)))))

(assert (=> b!20195 (= lt!28855 ((_ sign_extend 32) (size!612 (buf!918 thiss!1379))))))

(assert (= (and d!6588 res!17537) b!20194))

(assert (= (and b!20194 res!17536) b!20195))

(declare-fun m!27331 () Bool)

(assert (=> d!6588 m!27331))

(assert (=> d!6588 m!27297))

(assert (=> b!20068 d!6588))

(declare-fun d!6592 () Bool)

(assert (=> d!6592 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 thiss!1379))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!612 (buf!918 thiss!1379))) ((_ sign_extend 32) (currentByte!2204 thiss!1379)) ((_ sign_extend 32) (currentBit!2199 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1934 () Bool)

(assert (= bs!1934 d!6592))

(assert (=> bs!1934 m!27331))

(assert (=> b!20072 d!6592))

(declare-fun d!6594 () Bool)

(declare-fun res!17538 () Bool)

(declare-fun e!13492 () Bool)

(assert (=> d!6594 (=> (not res!17538) (not e!13492))))

(assert (=> d!6594 (= res!17538 (= (size!612 (buf!918 thiss!1379)) (size!612 (buf!918 (_2!1251 lt!28597)))))))

(assert (=> d!6594 (= (isPrefixOf!0 thiss!1379 (_2!1251 lt!28597)) e!13492)))

(declare-fun b!20196 () Bool)

(declare-fun res!17540 () Bool)

(assert (=> b!20196 (=> (not res!17540) (not e!13492))))

(assert (=> b!20196 (= res!17540 (bvsle (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)) (bitIndex!0 (size!612 (buf!918 (_2!1251 lt!28597))) (currentByte!2204 (_2!1251 lt!28597)) (currentBit!2199 (_2!1251 lt!28597)))))))

(declare-fun b!20197 () Bool)

(declare-fun e!13493 () Bool)

(assert (=> b!20197 (= e!13492 e!13493)))

(declare-fun res!17539 () Bool)

(assert (=> b!20197 (=> res!17539 e!13493)))

(assert (=> b!20197 (= res!17539 (= (size!612 (buf!918 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20198 () Bool)

(assert (=> b!20198 (= e!13493 (arrayBitRangesEq!0 (buf!918 thiss!1379) (buf!918 (_2!1251 lt!28597)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379))))))

(assert (= (and d!6594 res!17538) b!20196))

(assert (= (and b!20196 res!17540) b!20197))

(assert (= (and b!20197 (not res!17539)) b!20198))

(assert (=> b!20196 m!27177))

(assert (=> b!20196 m!27275))

(assert (=> b!20198 m!27177))

(assert (=> b!20198 m!27177))

(declare-fun m!27333 () Bool)

(assert (=> b!20198 m!27333))

(assert (=> b!20071 d!6594))

(declare-fun d!6596 () Bool)

(assert (=> d!6596 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 (_2!1251 lt!28597))) ((_ sign_extend 32) (currentBit!2199 (_2!1251 lt!28597))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 (_2!1251 lt!28597))) ((_ sign_extend 32) (currentBit!2199 (_2!1251 lt!28597)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1935 () Bool)

(assert (= bs!1935 d!6596))

(declare-fun m!27335 () Bool)

(assert (=> bs!1935 m!27335))

(assert (=> b!20071 d!6596))

(declare-fun d!6598 () Bool)

(declare-fun e!13498 () Bool)

(assert (=> d!6598 e!13498))

(declare-fun res!17546 () Bool)

(assert (=> d!6598 (=> (not res!17546) (not e!13498))))

(assert (=> d!6598 (= res!17546 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28861 () Unit!1774)

(declare-fun choose!27 (BitStream!1058 BitStream!1058 (_ BitVec 64) (_ BitVec 64)) Unit!1774)

(assert (=> d!6598 (= lt!28861 (choose!27 thiss!1379 (_2!1251 lt!28597) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6598 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6598 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1251 lt!28597) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28861)))

(declare-fun b!20204 () Bool)

(assert (=> b!20204 (= e!13498 (validate_offset_bits!1 ((_ sign_extend 32) (size!612 (buf!918 (_2!1251 lt!28597)))) ((_ sign_extend 32) (currentByte!2204 (_2!1251 lt!28597))) ((_ sign_extend 32) (currentBit!2199 (_2!1251 lt!28597))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6598 res!17546) b!20204))

(declare-fun m!27341 () Bool)

(assert (=> d!6598 m!27341))

(assert (=> b!20204 m!27165))

(assert (=> b!20071 d!6598))

(declare-fun b!20250 () Bool)

(declare-fun e!13522 () Bool)

(declare-datatypes ((tuple2!2352 0))(
  ( (tuple2!2353 (_1!1261 BitStream!1058) (_2!1261 Bool)) )
))
(declare-fun lt!28925 () tuple2!2352)

(declare-fun lt!28935 () tuple2!2332)

(assert (=> b!20250 (= e!13522 (= (bitIndex!0 (size!612 (buf!918 (_1!1261 lt!28925))) (currentByte!2204 (_1!1261 lt!28925)) (currentBit!2199 (_1!1261 lt!28925))) (bitIndex!0 (size!612 (buf!918 (_2!1251 lt!28935))) (currentByte!2204 (_2!1251 lt!28935)) (currentBit!2199 (_2!1251 lt!28935)))))))

(declare-fun d!6604 () Bool)

(declare-fun e!13523 () Bool)

(assert (=> d!6604 e!13523))

(declare-fun res!17595 () Bool)

(assert (=> d!6604 (=> (not res!17595) (not e!13523))))

(declare-fun lt!28929 () tuple2!2332)

(assert (=> d!6604 (= res!17595 (= (size!612 (buf!918 (_2!1251 lt!28929))) (size!612 (buf!918 thiss!1379))))))

(declare-fun lt!28927 () (_ BitVec 8))

(declare-fun lt!28933 () array!1440)

(assert (=> d!6604 (= lt!28927 (select (arr!1056 lt!28933) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6604 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!612 lt!28933)))))

(assert (=> d!6604 (= lt!28933 (array!1441 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!28930 () tuple2!2332)

(assert (=> d!6604 (= lt!28929 (tuple2!2333 (_1!1251 lt!28930) (_2!1251 lt!28930)))))

(assert (=> d!6604 (= lt!28930 lt!28935)))

(declare-fun e!13524 () Bool)

(assert (=> d!6604 e!13524))

(declare-fun res!17596 () Bool)

(assert (=> d!6604 (=> (not res!17596) (not e!13524))))

(assert (=> d!6604 (= res!17596 (= (size!612 (buf!918 thiss!1379)) (size!612 (buf!918 (_2!1251 lt!28935)))))))

(declare-fun lt!28936 () Bool)

(declare-fun appendBit!0 (BitStream!1058 Bool) tuple2!2332)

(assert (=> d!6604 (= lt!28935 (appendBit!0 thiss!1379 lt!28936))))

(assert (=> d!6604 (= lt!28936 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1056 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6604 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6604 (= (appendBitFromByte!0 thiss!1379 (select (arr!1056 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!28929)))

(declare-fun b!20251 () Bool)

(assert (=> b!20251 (= e!13524 e!13522)))

(declare-fun res!17594 () Bool)

(assert (=> b!20251 (=> (not res!17594) (not e!13522))))

(assert (=> b!20251 (= res!17594 (and (= (_2!1261 lt!28925) lt!28936) (= (_1!1261 lt!28925) (_2!1251 lt!28935))))))

(declare-fun readBitPure!0 (BitStream!1058) tuple2!2352)

(declare-fun readerFrom!0 (BitStream!1058 (_ BitVec 32) (_ BitVec 32)) BitStream!1058)

(assert (=> b!20251 (= lt!28925 (readBitPure!0 (readerFrom!0 (_2!1251 lt!28935) (currentBit!2199 thiss!1379) (currentByte!2204 thiss!1379))))))

(declare-fun b!20252 () Bool)

(declare-fun e!13525 () Bool)

(assert (=> b!20252 (= e!13523 e!13525)))

(declare-fun res!17597 () Bool)

(assert (=> b!20252 (=> (not res!17597) (not e!13525))))

(declare-fun lt!28928 () tuple2!2352)

(assert (=> b!20252 (= res!17597 (and (= (_2!1261 lt!28928) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1056 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!28927)) #b00000000000000000000000000000000))) (= (_1!1261 lt!28928) (_2!1251 lt!28929))))))

(declare-datatypes ((tuple2!2354 0))(
  ( (tuple2!2355 (_1!1262 array!1440) (_2!1262 BitStream!1058)) )
))
(declare-fun lt!28934 () tuple2!2354)

(declare-fun lt!28926 () BitStream!1058)

(declare-fun readBits!0 (BitStream!1058 (_ BitVec 64)) tuple2!2354)

(assert (=> b!20252 (= lt!28934 (readBits!0 lt!28926 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!20252 (= lt!28928 (readBitPure!0 lt!28926))))

(assert (=> b!20252 (= lt!28926 (readerFrom!0 (_2!1251 lt!28929) (currentBit!2199 thiss!1379) (currentByte!2204 thiss!1379)))))

(declare-fun b!20253 () Bool)

(declare-fun res!17590 () Bool)

(assert (=> b!20253 (=> (not res!17590) (not e!13524))))

(assert (=> b!20253 (= res!17590 (isPrefixOf!0 thiss!1379 (_2!1251 lt!28935)))))

(declare-fun b!20254 () Bool)

(assert (=> b!20254 (= e!13525 (= (bitIndex!0 (size!612 (buf!918 (_1!1261 lt!28928))) (currentByte!2204 (_1!1261 lt!28928)) (currentBit!2199 (_1!1261 lt!28928))) (bitIndex!0 (size!612 (buf!918 (_2!1251 lt!28929))) (currentByte!2204 (_2!1251 lt!28929)) (currentBit!2199 (_2!1251 lt!28929)))))))

(declare-fun b!20255 () Bool)

(declare-fun res!17592 () Bool)

(assert (=> b!20255 (=> (not res!17592) (not e!13524))))

(assert (=> b!20255 (= res!17592 (= (bitIndex!0 (size!612 (buf!918 (_2!1251 lt!28935))) (currentByte!2204 (_2!1251 lt!28935)) (currentBit!2199 (_2!1251 lt!28935))) (bvadd (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!20256 () Bool)

(declare-fun res!17591 () Bool)

(assert (=> b!20256 (=> (not res!17591) (not e!13523))))

(declare-fun lt!28931 () (_ BitVec 64))

(declare-fun lt!28932 () (_ BitVec 64))

(assert (=> b!20256 (= res!17591 (= (bitIndex!0 (size!612 (buf!918 (_2!1251 lt!28929))) (currentByte!2204 (_2!1251 lt!28929)) (currentBit!2199 (_2!1251 lt!28929))) (bvadd lt!28932 lt!28931)))))

(assert (=> b!20256 (or (not (= (bvand lt!28932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28931 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!28932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!28932 lt!28931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20256 (= lt!28931 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!20256 (= lt!28932 (bitIndex!0 (size!612 (buf!918 thiss!1379)) (currentByte!2204 thiss!1379) (currentBit!2199 thiss!1379)))))

(declare-fun b!20257 () Bool)

(declare-fun res!17593 () Bool)

(assert (=> b!20257 (=> (not res!17593) (not e!13523))))

(assert (=> b!20257 (= res!17593 (isPrefixOf!0 thiss!1379 (_2!1251 lt!28929)))))

(assert (= (and d!6604 res!17596) b!20255))

(assert (= (and b!20255 res!17592) b!20253))

(assert (= (and b!20253 res!17590) b!20251))

(assert (= (and b!20251 res!17594) b!20250))

(assert (= (and d!6604 res!17595) b!20256))

(assert (= (and b!20256 res!17591) b!20257))

(assert (= (and b!20257 res!17593) b!20252))

(assert (= (and b!20252 res!17597) b!20254))

(declare-fun m!27373 () Bool)

(assert (=> b!20251 m!27373))

(assert (=> b!20251 m!27373))

(declare-fun m!27375 () Bool)

(assert (=> b!20251 m!27375))

(declare-fun m!27377 () Bool)

(assert (=> b!20250 m!27377))

(declare-fun m!27379 () Bool)

(assert (=> b!20250 m!27379))

(declare-fun m!27381 () Bool)

(assert (=> b!20254 m!27381))

(declare-fun m!27383 () Bool)

(assert (=> b!20254 m!27383))

(declare-fun m!27385 () Bool)

(assert (=> b!20252 m!27385))

(declare-fun m!27387 () Bool)

(assert (=> b!20252 m!27387))

(declare-fun m!27389 () Bool)

(assert (=> b!20252 m!27389))

(declare-fun m!27391 () Bool)

(assert (=> d!6604 m!27391))

(declare-fun m!27393 () Bool)

(assert (=> d!6604 m!27393))

(declare-fun m!27395 () Bool)

(assert (=> d!6604 m!27395))

(assert (=> b!20256 m!27383))

(assert (=> b!20256 m!27177))

(assert (=> b!20255 m!27379))

(assert (=> b!20255 m!27177))

(declare-fun m!27397 () Bool)

(assert (=> b!20253 m!27397))

(declare-fun m!27399 () Bool)

(assert (=> b!20257 m!27399))

(assert (=> b!20071 d!6604))

(push 1)

(assert (not b!20156))

(assert (not b!20204))

(assert (not b!20250))

(assert (not b!20166))

(assert (not b!20111))

(assert (not d!6592))

(assert (not b!20110))

(assert (not d!6588))

(assert (not b!20253))

(assert (not d!6562))

(assert (not d!6598))

(assert (not b!20254))

(assert (not b!20196))

(assert (not d!6560))

(assert (not b!20155))

(assert (not b!20158))

(assert (not b!20109))

(assert (not d!6582))

(assert (not d!6604))

(assert (not b!20198))

(assert (not b!20256))

(assert (not d!6586))

(assert (not b!20255))

(assert (not b!20157))

(assert (not d!6596))

(assert (not b!20168))

(assert (not d!6558))

(assert (not b!20251))

(assert (not b!20252))

(assert (not b!20257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

