; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2922 () Bool)

(assert start!2922)

(declare-fun b!13555 () Bool)

(declare-fun res!12855 () Bool)

(declare-fun e!8323 () Bool)

(assert (=> b!13555 (=> res!12855 e!8323)))

(declare-datatypes ((array!763 0))(
  ( (array!764 (arr!759 (Array (_ BitVec 32) (_ BitVec 8))) (size!330 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!620 0))(
  ( (BitStream!621 (buf!681 array!763) (currentByte!1789 (_ BitVec 32)) (currentBit!1784 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1125 0))(
  ( (Unit!1126) )
))
(declare-datatypes ((tuple2!1606 0))(
  ( (tuple2!1607 (_1!858 Unit!1125) (_2!858 BitStream!620)) )
))
(declare-fun lt!21209 () tuple2!1606)

(declare-fun thiss!957 () BitStream!620)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13555 (= res!12855 (not (= (bitIndex!0 (size!330 (buf!681 (_2!858 lt!21209))) (currentByte!1789 (_2!858 lt!21209)) (currentBit!1784 (_2!858 lt!21209))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!330 (buf!681 thiss!957)) (currentByte!1789 thiss!957) (currentBit!1784 thiss!957))))))))

(declare-fun b!13556 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13556 (= e!8323 (invariant!0 (currentBit!1784 (_2!858 lt!21209)) (currentByte!1789 (_2!858 lt!21209)) (size!330 (buf!681 (_2!858 lt!21209)))))))

(declare-fun b!13557 () Bool)

(declare-fun res!12859 () Bool)

(assert (=> b!13557 (=> res!12859 e!8323)))

(declare-fun isPrefixOf!0 (BitStream!620 BitStream!620) Bool)

(assert (=> b!13557 (= res!12859 (not (isPrefixOf!0 thiss!957 (_2!858 lt!21209))))))

(declare-fun b!13558 () Bool)

(declare-fun e!8321 () Bool)

(declare-fun e!8327 () Bool)

(assert (=> b!13558 (= e!8321 e!8327)))

(declare-fun res!12861 () Bool)

(assert (=> b!13558 (=> (not res!12861) (not e!8327))))

(declare-fun lt!21211 () (_ BitVec 64))

(declare-fun lt!21210 () (_ BitVec 64))

(assert (=> b!13558 (= res!12861 (= lt!21211 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21210)))))

(assert (=> b!13558 (= lt!21211 (bitIndex!0 (size!330 (buf!681 (_2!858 lt!21209))) (currentByte!1789 (_2!858 lt!21209)) (currentBit!1784 (_2!858 lt!21209))))))

(assert (=> b!13558 (= lt!21210 (bitIndex!0 (size!330 (buf!681 thiss!957)) (currentByte!1789 thiss!957) (currentBit!1784 thiss!957)))))

(declare-fun b!13559 () Bool)

(declare-fun e!8322 () Bool)

(assert (=> b!13559 (= e!8322 (not e!8323))))

(declare-fun res!12856 () Bool)

(assert (=> b!13559 (=> res!12856 e!8323)))

(assert (=> b!13559 (= res!12856 (not (= (size!330 (buf!681 (_2!858 lt!21209))) (size!330 (buf!681 thiss!957)))))))

(assert (=> b!13559 e!8321))

(declare-fun res!12860 () Bool)

(assert (=> b!13559 (=> (not res!12860) (not e!8321))))

(assert (=> b!13559 (= res!12860 (= (size!330 (buf!681 thiss!957)) (size!330 (buf!681 (_2!858 lt!21209)))))))

(declare-fun appendBit!0 (BitStream!620 Bool) tuple2!1606)

(assert (=> b!13559 (= lt!21209 (appendBit!0 thiss!957 false))))

(declare-fun res!12857 () Bool)

(assert (=> start!2922 (=> (not res!12857) (not e!8322))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2922 (= res!12857 (validate_offset_bit!0 ((_ sign_extend 32) (size!330 (buf!681 thiss!957))) ((_ sign_extend 32) (currentByte!1789 thiss!957)) ((_ sign_extend 32) (currentBit!1784 thiss!957))))))

(assert (=> start!2922 e!8322))

(declare-fun e!8326 () Bool)

(declare-fun inv!12 (BitStream!620) Bool)

(assert (=> start!2922 (and (inv!12 thiss!957) e!8326)))

(declare-fun b!13560 () Bool)

(declare-fun array_inv!319 (array!763) Bool)

(assert (=> b!13560 (= e!8326 (array_inv!319 (buf!681 thiss!957)))))

(declare-fun b!13561 () Bool)

(declare-fun e!8324 () Bool)

(assert (=> b!13561 (= e!8327 e!8324)))

(declare-fun res!12862 () Bool)

(assert (=> b!13561 (=> (not res!12862) (not e!8324))))

(declare-datatypes ((tuple2!1608 0))(
  ( (tuple2!1609 (_1!859 BitStream!620) (_2!859 Bool)) )
))
(declare-fun lt!21212 () tuple2!1608)

(assert (=> b!13561 (= res!12862 (and (not (_2!859 lt!21212)) (= (_1!859 lt!21212) (_2!858 lt!21209))))))

(declare-fun readBitPure!0 (BitStream!620) tuple2!1608)

(declare-fun readerFrom!0 (BitStream!620 (_ BitVec 32) (_ BitVec 32)) BitStream!620)

(assert (=> b!13561 (= lt!21212 (readBitPure!0 (readerFrom!0 (_2!858 lt!21209) (currentBit!1784 thiss!957) (currentByte!1789 thiss!957))))))

(declare-fun b!13562 () Bool)

(declare-fun res!12858 () Bool)

(assert (=> b!13562 (=> (not res!12858) (not e!8327))))

(assert (=> b!13562 (= res!12858 (isPrefixOf!0 thiss!957 (_2!858 lt!21209)))))

(declare-fun b!13563 () Bool)

(assert (=> b!13563 (= e!8324 (= (bitIndex!0 (size!330 (buf!681 (_1!859 lt!21212))) (currentByte!1789 (_1!859 lt!21212)) (currentBit!1784 (_1!859 lt!21212))) lt!21211))))

(assert (= (and start!2922 res!12857) b!13559))

(assert (= (and b!13559 res!12860) b!13558))

(assert (= (and b!13558 res!12861) b!13562))

(assert (= (and b!13562 res!12858) b!13561))

(assert (= (and b!13561 res!12862) b!13563))

(assert (= (and b!13559 (not res!12856)) b!13555))

(assert (= (and b!13555 (not res!12855)) b!13557))

(assert (= (and b!13557 (not res!12859)) b!13556))

(assert (= start!2922 b!13560))

(declare-fun m!20159 () Bool)

(assert (=> b!13561 m!20159))

(assert (=> b!13561 m!20159))

(declare-fun m!20161 () Bool)

(assert (=> b!13561 m!20161))

(declare-fun m!20163 () Bool)

(assert (=> b!13555 m!20163))

(declare-fun m!20165 () Bool)

(assert (=> b!13555 m!20165))

(assert (=> b!13558 m!20163))

(assert (=> b!13558 m!20165))

(declare-fun m!20167 () Bool)

(assert (=> b!13556 m!20167))

(declare-fun m!20169 () Bool)

(assert (=> b!13563 m!20169))

(declare-fun m!20171 () Bool)

(assert (=> b!13559 m!20171))

(declare-fun m!20173 () Bool)

(assert (=> b!13562 m!20173))

(assert (=> b!13557 m!20173))

(declare-fun m!20175 () Bool)

(assert (=> start!2922 m!20175))

(declare-fun m!20177 () Bool)

(assert (=> start!2922 m!20177))

(declare-fun m!20179 () Bool)

(assert (=> b!13560 m!20179))

(push 1)

(assert (not start!2922))

(assert (not b!13559))

(assert (not b!13556))

(assert (not b!13558))

(assert (not b!13562))

(assert (not b!13557))

(assert (not b!13561))

(assert (not b!13555))

(assert (not b!13563))

(assert (not b!13560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4376 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4376 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!330 (buf!681 thiss!957))) ((_ sign_extend 32) (currentByte!1789 thiss!957)) ((_ sign_extend 32) (currentBit!1784 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!330 (buf!681 thiss!957))) ((_ sign_extend 32) (currentByte!1789 thiss!957)) ((_ sign_extend 32) (currentBit!1784 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1220 () Bool)

(assert (= bs!1220 d!4376))

(declare-fun m!20189 () Bool)

(assert (=> bs!1220 m!20189))

(assert (=> start!2922 d!4376))

(declare-fun d!4378 () Bool)

(assert (=> d!4378 (= (inv!12 thiss!957) (invariant!0 (currentBit!1784 thiss!957) (currentByte!1789 thiss!957) (size!330 (buf!681 thiss!957))))))

(declare-fun bs!1221 () Bool)

(assert (= bs!1221 d!4378))

(declare-fun m!20191 () Bool)

(assert (=> bs!1221 m!20191))

(assert (=> start!2922 d!4378))

(declare-fun b!13605 () Bool)

(declare-fun res!12905 () Bool)

(declare-fun e!8350 () Bool)

(assert (=> b!13605 (=> (not res!12905) (not e!8350))))

(declare-fun lt!21269 () (_ BitVec 64))

(declare-fun lt!21267 () tuple2!1606)

(declare-fun lt!21266 () (_ BitVec 64))

(assert (=> b!13605 (= res!12905 (= (bitIndex!0 (size!330 (buf!681 (_2!858 lt!21267))) (currentByte!1789 (_2!858 lt!21267)) (currentBit!1784 (_2!858 lt!21267))) (bvadd lt!21269 lt!21266)))))

(assert (=> b!13605 (or (not (= (bvand lt!21269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21266 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21269 lt!21266) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13605 (= lt!21266 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13605 (= lt!21269 (bitIndex!0 (size!330 (buf!681 thiss!957)) (currentByte!1789 thiss!957) (currentBit!1784 thiss!957)))))

(declare-fun b!13606 () Bool)

(declare-fun res!12904 () Bool)

(assert (=> b!13606 (=> (not res!12904) (not e!8350))))

(assert (=> b!13606 (= res!12904 (isPrefixOf!0 thiss!957 (_2!858 lt!21267)))))

(declare-fun b!13608 () Bool)

(declare-fun e!8349 () Bool)

(declare-fun lt!21268 () tuple2!1608)

(assert (=> b!13608 (= e!8349 (= (bitIndex!0 (size!330 (buf!681 (_1!859 lt!21268))) (currentByte!1789 (_1!859 lt!21268)) (currentBit!1784 (_1!859 lt!21268))) (bitIndex!0 (size!330 (buf!681 (_2!858 lt!21267))) (currentByte!1789 (_2!858 lt!21267)) (currentBit!1784 (_2!858 lt!21267)))))))

(declare-fun b!13607 () Bool)

(assert (=> b!13607 (= e!8350 e!8349)))

(declare-fun res!12902 () Bool)

(assert (=> b!13607 (=> (not res!12902) (not e!8349))))

(assert (=> b!13607 (= res!12902 (and (= (_2!859 lt!21268) false) (= (_1!859 lt!21268) (_2!858 lt!21267))))))

(assert (=> b!13607 (= lt!21268 (readBitPure!0 (readerFrom!0 (_2!858 lt!21267) (currentBit!1784 thiss!957) (currentByte!1789 thiss!957))))))

(declare-fun d!4380 () Bool)

(assert (=> d!4380 e!8350))

(declare-fun res!12903 () Bool)

(assert (=> d!4380 (=> (not res!12903) (not e!8350))))

(assert (=> d!4380 (= res!12903 (= (size!330 (buf!681 thiss!957)) (size!330 (buf!681 (_2!858 lt!21267)))))))

(declare-fun choose!16 (BitStream!620 Bool) tuple2!1606)

(assert (=> d!4380 (= lt!21267 (choose!16 thiss!957 false))))

(assert (=> d!4380 (validate_offset_bit!0 ((_ sign_extend 32) (size!330 (buf!681 thiss!957))) ((_ sign_extend 32) (currentByte!1789 thiss!957)) ((_ sign_extend 32) (currentBit!1784 thiss!957)))))

(assert (=> d!4380 (= (appendBit!0 thiss!957 false) lt!21267)))

(assert (= (and d!4380 res!12903) b!13605))

(assert (= (and b!13605 res!12905) b!13606))

(assert (= (and b!13606 res!12904) b!13607))

(assert (= (and b!13607 res!12902) b!13608))

(declare-fun m!20215 () Bool)

(assert (=> b!13608 m!20215))

(declare-fun m!20217 () Bool)

(assert (=> b!13608 m!20217))

(assert (=> b!13605 m!20217))

(assert (=> b!13605 m!20165))

(declare-fun m!20219 () Bool)

(assert (=> b!13606 m!20219))

(declare-fun m!20221 () Bool)

(assert (=> b!13607 m!20221))

(assert (=> b!13607 m!20221))

(declare-fun m!20223 () Bool)

(assert (=> b!13607 m!20223))

(declare-fun m!20225 () Bool)

(assert (=> d!4380 m!20225))

(assert (=> d!4380 m!20175))

(assert (=> b!13559 d!4380))

(declare-fun d!4394 () Bool)

(assert (=> d!4394 (= (array_inv!319 (buf!681 thiss!957)) (bvsge (size!330 (buf!681 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13560 d!4394))

(declare-fun d!4396 () Bool)

(declare-fun e!8368 () Bool)

(assert (=> d!4396 e!8368))

(declare-fun res!12936 () Bool)

(assert (=> d!4396 (=> (not res!12936) (not e!8368))))

(declare-fun lt!21301 () (_ BitVec 64))

(declare-fun lt!21298 () (_ BitVec 64))

(declare-fun lt!21297 () (_ BitVec 64))

(assert (=> d!4396 (= res!12936 (= lt!21297 (bvsub lt!21298 lt!21301)))))

(assert (=> d!4396 (or (= (bvand lt!21298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21298 lt!21301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4396 (= lt!21301 (remainingBits!0 ((_ sign_extend 32) (size!330 (buf!681 (_2!858 lt!21209)))) ((_ sign_extend 32) (currentByte!1789 (_2!858 lt!21209))) ((_ sign_extend 32) (currentBit!1784 (_2!858 lt!21209)))))))

(declare-fun lt!21300 () (_ BitVec 64))

(declare-fun lt!21302 () (_ BitVec 64))

(assert (=> d!4396 (= lt!21298 (bvmul lt!21300 lt!21302))))

(assert (=> d!4396 (or (= lt!21300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21302 (bvsdiv (bvmul lt!21300 lt!21302) lt!21300)))))

(assert (=> d!4396 (= lt!21302 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4396 (= lt!21300 ((_ sign_extend 32) (size!330 (buf!681 (_2!858 lt!21209)))))))

(assert (=> d!4396 (= lt!21297 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1789 (_2!858 lt!21209))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1784 (_2!858 lt!21209)))))))

(assert (=> d!4396 (invariant!0 (currentBit!1784 (_2!858 lt!21209)) (currentByte!1789 (_2!858 lt!21209)) (size!330 (buf!681 (_2!858 lt!21209))))))

(assert (=> d!4396 (= (bitIndex!0 (size!330 (buf!681 (_2!858 lt!21209))) (currentByte!1789 (_2!858 lt!21209)) (currentBit!1784 (_2!858 lt!21209))) lt!21297)))

(declare-fun b!13638 () Bool)

(declare-fun res!12937 () Bool)

(assert (=> b!13638 (=> (not res!12937) (not e!8368))))

(assert (=> b!13638 (= res!12937 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21297))))

(declare-fun b!13639 () Bool)

(declare-fun lt!21299 () (_ BitVec 64))

(assert (=> b!13639 (= e!8368 (bvsle lt!21297 (bvmul lt!21299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13639 (or (= lt!21299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21299)))))

(assert (=> b!13639 (= lt!21299 ((_ sign_extend 32) (size!330 (buf!681 (_2!858 lt!21209)))))))

(assert (= (and d!4396 res!12936) b!13638))

(assert (= (and b!13638 res!12937) b!13639))

(declare-fun m!20245 () Bool)

(assert (=> d!4396 m!20245))

(assert (=> d!4396 m!20167))

(assert (=> b!13555 d!4396))

(declare-fun d!4408 () Bool)

(declare-fun e!8371 () Bool)

(assert (=> d!4408 e!8371))

(declare-fun res!12940 () Bool)

(assert (=> d!4408 (=> (not res!12940) (not e!8371))))

(declare-fun lt!21303 () (_ BitVec 64))

(declare-fun lt!21307 () (_ BitVec 64))

(declare-fun lt!21304 () (_ BitVec 64))

(assert (=> d!4408 (= res!12940 (= lt!21303 (bvsub lt!21304 lt!21307)))))

(assert (=> d!4408 (or (= (bvand lt!21304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21304 lt!21307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4408 (= lt!21307 (remainingBits!0 ((_ sign_extend 32) (size!330 (buf!681 thiss!957))) ((_ sign_extend 32) (currentByte!1789 thiss!957)) ((_ sign_extend 32) (currentBit!1784 thiss!957))))))

(declare-fun lt!21306 () (_ BitVec 64))

(declare-fun lt!21308 () (_ BitVec 64))

(assert (=> d!4408 (= lt!21304 (bvmul lt!21306 lt!21308))))

(assert (=> d!4408 (or (= lt!21306 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21308 (bvsdiv (bvmul lt!21306 lt!21308) lt!21306)))))

(assert (=> d!4408 (= lt!21308 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4408 (= lt!21306 ((_ sign_extend 32) (size!330 (buf!681 thiss!957))))))

(assert (=> d!4408 (= lt!21303 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1789 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1784 thiss!957))))))

(assert (=> d!4408 (invariant!0 (currentBit!1784 thiss!957) (currentByte!1789 thiss!957) (size!330 (buf!681 thiss!957)))))

(assert (=> d!4408 (= (bitIndex!0 (size!330 (buf!681 thiss!957)) (currentByte!1789 thiss!957) (currentBit!1784 thiss!957)) lt!21303)))

(declare-fun b!13642 () Bool)

(declare-fun res!12941 () Bool)

(assert (=> b!13642 (=> (not res!12941) (not e!8371))))

(assert (=> b!13642 (= res!12941 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21303))))

(declare-fun b!13643 () Bool)

(declare-fun lt!21305 () (_ BitVec 64))

(assert (=> b!13643 (= e!8371 (bvsle lt!21303 (bvmul lt!21305 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13643 (or (= lt!21305 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21305 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21305)))))

(assert (=> b!13643 (= lt!21305 ((_ sign_extend 32) (size!330 (buf!681 thiss!957))))))

(assert (= (and d!4408 res!12940) b!13642))

(assert (= (and b!13642 res!12941) b!13643))

(assert (=> d!4408 m!20189))

(assert (=> d!4408 m!20191))

(assert (=> b!13555 d!4408))

(declare-fun d!4410 () Bool)

(declare-datatypes ((tuple2!1614 0))(
  ( (tuple2!1615 (_1!862 Bool) (_2!862 BitStream!620)) )
))
(declare-fun lt!21311 () tuple2!1614)

(declare-fun readBit!0 (BitStream!620) tuple2!1614)

(assert (=> d!4410 (= lt!21311 (readBit!0 (readerFrom!0 (_2!858 lt!21209) (currentBit!1784 thiss!957) (currentByte!1789 thiss!957))))))

(assert (=> d!4410 (= (readBitPure!0 (readerFrom!0 (_2!858 lt!21209) (currentBit!1784 thiss!957) (currentByte!1789 thiss!957))) (tuple2!1609 (_2!862 lt!21311) (_1!862 lt!21311)))))

(declare-fun bs!1224 () Bool)

(assert (= bs!1224 d!4410))

(assert (=> bs!1224 m!20159))

(declare-fun m!20249 () Bool)

(assert (=> bs!1224 m!20249))

(assert (=> b!13561 d!4410))

(declare-fun d!4414 () Bool)

(declare-fun e!8377 () Bool)

(assert (=> d!4414 e!8377))

(declare-fun res!12950 () Bool)

(assert (=> d!4414 (=> (not res!12950) (not e!8377))))

(assert (=> d!4414 (= res!12950 (invariant!0 (currentBit!1784 (_2!858 lt!21209)) (currentByte!1789 (_2!858 lt!21209)) (size!330 (buf!681 (_2!858 lt!21209)))))))

(assert (=> d!4414 (= (readerFrom!0 (_2!858 lt!21209) (currentBit!1784 thiss!957) (currentByte!1789 thiss!957)) (BitStream!621 (buf!681 (_2!858 lt!21209)) (currentByte!1789 thiss!957) (currentBit!1784 thiss!957)))))

(declare-fun b!13651 () Bool)

(assert (=> b!13651 (= e!8377 (invariant!0 (currentBit!1784 thiss!957) (currentByte!1789 thiss!957) (size!330 (buf!681 (_2!858 lt!21209)))))))

(assert (= (and d!4414 res!12950) b!13651))

(assert (=> d!4414 m!20167))

(declare-fun m!20251 () Bool)

(assert (=> b!13651 m!20251))

(assert (=> b!13561 d!4414))

(declare-fun d!4416 () Bool)

(assert (=> d!4416 (= (invariant!0 (currentBit!1784 (_2!858 lt!21209)) (currentByte!1789 (_2!858 lt!21209)) (size!330 (buf!681 (_2!858 lt!21209)))) (and (bvsge (currentBit!1784 (_2!858 lt!21209)) #b00000000000000000000000000000000) (bvslt (currentBit!1784 (_2!858 lt!21209)) #b00000000000000000000000000001000) (bvsge (currentByte!1789 (_2!858 lt!21209)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1789 (_2!858 lt!21209)) (size!330 (buf!681 (_2!858 lt!21209)))) (and (= (currentBit!1784 (_2!858 lt!21209)) #b00000000000000000000000000000000) (= (currentByte!1789 (_2!858 lt!21209)) (size!330 (buf!681 (_2!858 lt!21209))))))))))

(assert (=> b!13556 d!4416))

(declare-fun d!4422 () Bool)

(declare-fun res!12963 () Bool)

(declare-fun e!8386 () Bool)

(assert (=> d!4422 (=> (not res!12963) (not e!8386))))

(assert (=> d!4422 (= res!12963 (= (size!330 (buf!681 thiss!957)) (size!330 (buf!681 (_2!858 lt!21209)))))))

(assert (=> d!4422 (= (isPrefixOf!0 thiss!957 (_2!858 lt!21209)) e!8386)))

(declare-fun b!13664 () Bool)

(declare-fun res!12965 () Bool)

(assert (=> b!13664 (=> (not res!12965) (not e!8386))))

(assert (=> b!13664 (= res!12965 (bvsle (bitIndex!0 (size!330 (buf!681 thiss!957)) (currentByte!1789 thiss!957) (currentBit!1784 thiss!957)) (bitIndex!0 (size!330 (buf!681 (_2!858 lt!21209))) (currentByte!1789 (_2!858 lt!21209)) (currentBit!1784 (_2!858 lt!21209)))))))

(declare-fun b!13665 () Bool)

(declare-fun e!8385 () Bool)

(assert (=> b!13665 (= e!8386 e!8385)))

(declare-fun res!12964 () Bool)

(assert (=> b!13665 (=> res!12964 e!8385)))

(assert (=> b!13665 (= res!12964 (= (size!330 (buf!681 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13666 () Bool)

(declare-fun arrayBitRangesEq!0 (array!763 array!763 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13666 (= e!8385 (arrayBitRangesEq!0 (buf!681 thiss!957) (buf!681 (_2!858 lt!21209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!330 (buf!681 thiss!957)) (currentByte!1789 thiss!957) (currentBit!1784 thiss!957))))))

(assert (= (and d!4422 res!12963) b!13664))

(assert (= (and b!13664 res!12965) b!13665))

(assert (= (and b!13665 (not res!12964)) b!13666))

(assert (=> b!13664 m!20165))

(assert (=> b!13664 m!20163))

(assert (=> b!13666 m!20165))

(assert (=> b!13666 m!20165))

(declare-fun m!20259 () Bool)

(assert (=> b!13666 m!20259))

(assert (=> b!13562 d!4422))

(assert (=> b!13557 d!4422))

(declare-fun d!4428 () Bool)

(declare-fun e!8387 () Bool)

(assert (=> d!4428 e!8387))

(declare-fun res!12966 () Bool)

(assert (=> d!4428 (=> (not res!12966) (not e!8387))))

(declare-fun lt!21342 () (_ BitVec 64))

(declare-fun lt!21346 () (_ BitVec 64))

(declare-fun lt!21343 () (_ BitVec 64))

(assert (=> d!4428 (= res!12966 (= lt!21342 (bvsub lt!21343 lt!21346)))))

(assert (=> d!4428 (or (= (bvand lt!21343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21346 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21343 lt!21346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4428 (= lt!21346 (remainingBits!0 ((_ sign_extend 32) (size!330 (buf!681 (_1!859 lt!21212)))) ((_ sign_extend 32) (currentByte!1789 (_1!859 lt!21212))) ((_ sign_extend 32) (currentBit!1784 (_1!859 lt!21212)))))))

(declare-fun lt!21345 () (_ BitVec 64))

(declare-fun lt!21347 () (_ BitVec 64))

(assert (=> d!4428 (= lt!21343 (bvmul lt!21345 lt!21347))))

(assert (=> d!4428 (or (= lt!21345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21347 (bvsdiv (bvmul lt!21345 lt!21347) lt!21345)))))

(assert (=> d!4428 (= lt!21347 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4428 (= lt!21345 ((_ sign_extend 32) (size!330 (buf!681 (_1!859 lt!21212)))))))

(assert (=> d!4428 (= lt!21342 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1789 (_1!859 lt!21212))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1784 (_1!859 lt!21212)))))))

(assert (=> d!4428 (invariant!0 (currentBit!1784 (_1!859 lt!21212)) (currentByte!1789 (_1!859 lt!21212)) (size!330 (buf!681 (_1!859 lt!21212))))))

(assert (=> d!4428 (= (bitIndex!0 (size!330 (buf!681 (_1!859 lt!21212))) (currentByte!1789 (_1!859 lt!21212)) (currentBit!1784 (_1!859 lt!21212))) lt!21342)))

(declare-fun b!13667 () Bool)

(declare-fun res!12967 () Bool)

(assert (=> b!13667 (=> (not res!12967) (not e!8387))))

(assert (=> b!13667 (= res!12967 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21342))))

(declare-fun b!13668 () Bool)

(declare-fun lt!21344 () (_ BitVec 64))

(assert (=> b!13668 (= e!8387 (bvsle lt!21342 (bvmul lt!21344 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13668 (or (= lt!21344 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21344 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21344)))))

(assert (=> b!13668 (= lt!21344 ((_ sign_extend 32) (size!330 (buf!681 (_1!859 lt!21212)))))))

(assert (= (and d!4428 res!12966) b!13667))

(assert (= (and b!13667 res!12967) b!13668))

(declare-fun m!20261 () Bool)

(assert (=> d!4428 m!20261))

(declare-fun m!20263 () Bool)

(assert (=> d!4428 m!20263))

(assert (=> b!13563 d!4428))

(assert (=> b!13558 d!4396))

(assert (=> b!13558 d!4408))

(push 1)

