; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2860 () Bool)

(assert start!2860)

(declare-fun b!13350 () Bool)

(declare-fun e!8177 () Bool)

(declare-datatypes ((array!752 0))(
  ( (array!753 (arr!755 (Array (_ BitVec 32) (_ BitVec 8))) (size!326 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!612 0))(
  ( (BitStream!613 (buf!677 array!752) (currentByte!1776 (_ BitVec 32)) (currentBit!1771 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!612)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13350 (= e!8177 (invariant!0 (currentBit!1771 thiss!957) (currentByte!1776 thiss!957) (size!326 (buf!677 thiss!957))))))

(declare-fun b!13351 () Bool)

(declare-fun res!12663 () Bool)

(declare-fun e!8183 () Bool)

(assert (=> b!13351 (=> (not res!12663) (not e!8183))))

(declare-datatypes ((Unit!1117 0))(
  ( (Unit!1118) )
))
(declare-datatypes ((tuple2!1584 0))(
  ( (tuple2!1585 (_1!847 Unit!1117) (_2!847 BitStream!612)) )
))
(declare-fun lt!21029 () tuple2!1584)

(declare-fun isPrefixOf!0 (BitStream!612 BitStream!612) Bool)

(assert (=> b!13351 (= res!12663 (isPrefixOf!0 thiss!957 (_2!847 lt!21029)))))

(declare-fun res!12665 () Bool)

(declare-fun e!8179 () Bool)

(assert (=> start!2860 (=> (not res!12665) (not e!8179))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2860 (= res!12665 (validate_offset_bit!0 ((_ sign_extend 32) (size!326 (buf!677 thiss!957))) ((_ sign_extend 32) (currentByte!1776 thiss!957)) ((_ sign_extend 32) (currentBit!1771 thiss!957))))))

(assert (=> start!2860 e!8179))

(declare-fun e!8182 () Bool)

(declare-fun inv!12 (BitStream!612) Bool)

(assert (=> start!2860 (and (inv!12 thiss!957) e!8182)))

(declare-fun b!13352 () Bool)

(declare-fun e!8178 () Bool)

(assert (=> b!13352 (= e!8183 e!8178)))

(declare-fun res!12662 () Bool)

(assert (=> b!13352 (=> (not res!12662) (not e!8178))))

(declare-datatypes ((tuple2!1586 0))(
  ( (tuple2!1587 (_1!848 BitStream!612) (_2!848 Bool)) )
))
(declare-fun lt!21027 () tuple2!1586)

(assert (=> b!13352 (= res!12662 (and (not (_2!848 lt!21027)) (= (_1!848 lt!21027) (_2!847 lt!21029))))))

(declare-fun readBitPure!0 (BitStream!612) tuple2!1586)

(declare-fun readerFrom!0 (BitStream!612 (_ BitVec 32) (_ BitVec 32)) BitStream!612)

(assert (=> b!13352 (= lt!21027 (readBitPure!0 (readerFrom!0 (_2!847 lt!21029) (currentBit!1771 thiss!957) (currentByte!1776 thiss!957))))))

(declare-fun b!13353 () Bool)

(declare-fun array_inv!315 (array!752) Bool)

(assert (=> b!13353 (= e!8182 (array_inv!315 (buf!677 thiss!957)))))

(declare-fun b!13354 () Bool)

(declare-fun e!8181 () Bool)

(assert (=> b!13354 (= e!8181 e!8183)))

(declare-fun res!12664 () Bool)

(assert (=> b!13354 (=> (not res!12664) (not e!8183))))

(declare-fun lt!21028 () (_ BitVec 64))

(declare-fun lt!21026 () (_ BitVec 64))

(assert (=> b!13354 (= res!12664 (= lt!21028 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21026)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13354 (= lt!21028 (bitIndex!0 (size!326 (buf!677 (_2!847 lt!21029))) (currentByte!1776 (_2!847 lt!21029)) (currentBit!1771 (_2!847 lt!21029))))))

(assert (=> b!13354 (= lt!21026 (bitIndex!0 (size!326 (buf!677 thiss!957)) (currentByte!1776 thiss!957) (currentBit!1771 thiss!957)))))

(declare-fun b!13355 () Bool)

(assert (=> b!13355 (= e!8179 (not e!8177))))

(declare-fun res!12667 () Bool)

(assert (=> b!13355 (=> res!12667 e!8177)))

(assert (=> b!13355 (= res!12667 (not (= (size!326 (buf!677 (_2!847 lt!21029))) (size!326 (buf!677 thiss!957)))))))

(assert (=> b!13355 e!8181))

(declare-fun res!12666 () Bool)

(assert (=> b!13355 (=> (not res!12666) (not e!8181))))

(assert (=> b!13355 (= res!12666 (= (size!326 (buf!677 thiss!957)) (size!326 (buf!677 (_2!847 lt!21029)))))))

(declare-fun appendBit!0 (BitStream!612 Bool) tuple2!1584)

(assert (=> b!13355 (= lt!21029 (appendBit!0 thiss!957 false))))

(declare-fun b!13356 () Bool)

(assert (=> b!13356 (= e!8178 (= (bitIndex!0 (size!326 (buf!677 (_1!848 lt!21027))) (currentByte!1776 (_1!848 lt!21027)) (currentBit!1771 (_1!848 lt!21027))) lt!21028))))

(assert (= (and start!2860 res!12665) b!13355))

(assert (= (and b!13355 res!12666) b!13354))

(assert (= (and b!13354 res!12664) b!13351))

(assert (= (and b!13351 res!12663) b!13352))

(assert (= (and b!13352 res!12662) b!13356))

(assert (= (and b!13355 (not res!12667)) b!13350))

(assert (= start!2860 b!13353))

(declare-fun m!19987 () Bool)

(assert (=> b!13356 m!19987))

(declare-fun m!19989 () Bool)

(assert (=> start!2860 m!19989))

(declare-fun m!19991 () Bool)

(assert (=> start!2860 m!19991))

(declare-fun m!19993 () Bool)

(assert (=> b!13352 m!19993))

(assert (=> b!13352 m!19993))

(declare-fun m!19995 () Bool)

(assert (=> b!13352 m!19995))

(declare-fun m!19997 () Bool)

(assert (=> b!13354 m!19997))

(declare-fun m!19999 () Bool)

(assert (=> b!13354 m!19999))

(declare-fun m!20001 () Bool)

(assert (=> b!13351 m!20001))

(declare-fun m!20003 () Bool)

(assert (=> b!13353 m!20003))

(declare-fun m!20005 () Bool)

(assert (=> b!13350 m!20005))

(declare-fun m!20007 () Bool)

(assert (=> b!13355 m!20007))

(check-sat (not b!13353) (not b!13352) (not b!13350) (not start!2860) (not b!13356) (not b!13351) (not b!13355) (not b!13354))
(check-sat)
(get-model)

(declare-fun d!4304 () Bool)

(assert (=> d!4304 (= (invariant!0 (currentBit!1771 thiss!957) (currentByte!1776 thiss!957) (size!326 (buf!677 thiss!957))) (and (bvsge (currentBit!1771 thiss!957) #b00000000000000000000000000000000) (bvslt (currentBit!1771 thiss!957) #b00000000000000000000000000001000) (bvsge (currentByte!1776 thiss!957) #b00000000000000000000000000000000) (or (bvslt (currentByte!1776 thiss!957) (size!326 (buf!677 thiss!957))) (and (= (currentBit!1771 thiss!957) #b00000000000000000000000000000000) (= (currentByte!1776 thiss!957) (size!326 (buf!677 thiss!957)))))))))

(assert (=> b!13350 d!4304))

(declare-fun b!13421 () Bool)

(declare-fun res!12731 () Bool)

(declare-fun e!8231 () Bool)

(assert (=> b!13421 (=> (not res!12731) (not e!8231))))

(declare-fun lt!21096 () tuple2!1584)

(assert (=> b!13421 (= res!12731 (isPrefixOf!0 thiss!957 (_2!847 lt!21096)))))

(declare-fun b!13420 () Bool)

(declare-fun res!12730 () Bool)

(assert (=> b!13420 (=> (not res!12730) (not e!8231))))

(declare-fun lt!21097 () (_ BitVec 64))

(declare-fun lt!21095 () (_ BitVec 64))

(assert (=> b!13420 (= res!12730 (= (bitIndex!0 (size!326 (buf!677 (_2!847 lt!21096))) (currentByte!1776 (_2!847 lt!21096)) (currentBit!1771 (_2!847 lt!21096))) (bvadd lt!21095 lt!21097)))))

(assert (=> b!13420 (or (not (= (bvand lt!21095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21097 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21095 lt!21097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13420 (= lt!21097 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13420 (= lt!21095 (bitIndex!0 (size!326 (buf!677 thiss!957)) (currentByte!1776 thiss!957) (currentBit!1771 thiss!957)))))

(declare-fun b!13423 () Bool)

(declare-fun e!8230 () Bool)

(declare-fun lt!21098 () tuple2!1586)

(assert (=> b!13423 (= e!8230 (= (bitIndex!0 (size!326 (buf!677 (_1!848 lt!21098))) (currentByte!1776 (_1!848 lt!21098)) (currentBit!1771 (_1!848 lt!21098))) (bitIndex!0 (size!326 (buf!677 (_2!847 lt!21096))) (currentByte!1776 (_2!847 lt!21096)) (currentBit!1771 (_2!847 lt!21096)))))))

(declare-fun b!13422 () Bool)

(assert (=> b!13422 (= e!8231 e!8230)))

(declare-fun res!12729 () Bool)

(assert (=> b!13422 (=> (not res!12729) (not e!8230))))

(assert (=> b!13422 (= res!12729 (and (= (_2!848 lt!21098) false) (= (_1!848 lt!21098) (_2!847 lt!21096))))))

(assert (=> b!13422 (= lt!21098 (readBitPure!0 (readerFrom!0 (_2!847 lt!21096) (currentBit!1771 thiss!957) (currentByte!1776 thiss!957))))))

(declare-fun d!4308 () Bool)

(assert (=> d!4308 e!8231))

(declare-fun res!12732 () Bool)

(assert (=> d!4308 (=> (not res!12732) (not e!8231))))

(assert (=> d!4308 (= res!12732 (= (size!326 (buf!677 thiss!957)) (size!326 (buf!677 (_2!847 lt!21096)))))))

(declare-fun choose!16 (BitStream!612 Bool) tuple2!1584)

(assert (=> d!4308 (= lt!21096 (choose!16 thiss!957 false))))

(assert (=> d!4308 (validate_offset_bit!0 ((_ sign_extend 32) (size!326 (buf!677 thiss!957))) ((_ sign_extend 32) (currentByte!1776 thiss!957)) ((_ sign_extend 32) (currentBit!1771 thiss!957)))))

(assert (=> d!4308 (= (appendBit!0 thiss!957 false) lt!21096)))

(assert (= (and d!4308 res!12732) b!13420))

(assert (= (and b!13420 res!12730) b!13421))

(assert (= (and b!13421 res!12731) b!13422))

(assert (= (and b!13422 res!12729) b!13423))

(declare-fun m!20057 () Bool)

(assert (=> b!13423 m!20057))

(declare-fun m!20059 () Bool)

(assert (=> b!13423 m!20059))

(declare-fun m!20061 () Bool)

(assert (=> b!13422 m!20061))

(assert (=> b!13422 m!20061))

(declare-fun m!20063 () Bool)

(assert (=> b!13422 m!20063))

(declare-fun m!20065 () Bool)

(assert (=> b!13421 m!20065))

(assert (=> b!13420 m!20059))

(assert (=> b!13420 m!19999))

(declare-fun m!20067 () Bool)

(assert (=> d!4308 m!20067))

(assert (=> d!4308 m!19989))

(assert (=> b!13355 d!4308))

(declare-fun d!4322 () Bool)

(declare-fun e!8249 () Bool)

(assert (=> d!4322 e!8249))

(declare-fun res!12766 () Bool)

(assert (=> d!4322 (=> (not res!12766) (not e!8249))))

(declare-fun lt!21152 () (_ BitVec 64))

(declare-fun lt!21150 () (_ BitVec 64))

(declare-fun lt!21151 () (_ BitVec 64))

(assert (=> d!4322 (= res!12766 (= lt!21150 (bvsub lt!21151 lt!21152)))))

(assert (=> d!4322 (or (= (bvand lt!21151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21152 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21151 lt!21152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4322 (= lt!21152 (remainingBits!0 ((_ sign_extend 32) (size!326 (buf!677 (_1!848 lt!21027)))) ((_ sign_extend 32) (currentByte!1776 (_1!848 lt!21027))) ((_ sign_extend 32) (currentBit!1771 (_1!848 lt!21027)))))))

(declare-fun lt!21147 () (_ BitVec 64))

(declare-fun lt!21148 () (_ BitVec 64))

(assert (=> d!4322 (= lt!21151 (bvmul lt!21147 lt!21148))))

(assert (=> d!4322 (or (= lt!21147 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21148 (bvsdiv (bvmul lt!21147 lt!21148) lt!21147)))))

(assert (=> d!4322 (= lt!21148 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4322 (= lt!21147 ((_ sign_extend 32) (size!326 (buf!677 (_1!848 lt!21027)))))))

(assert (=> d!4322 (= lt!21150 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1776 (_1!848 lt!21027))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1771 (_1!848 lt!21027)))))))

(assert (=> d!4322 (invariant!0 (currentBit!1771 (_1!848 lt!21027)) (currentByte!1776 (_1!848 lt!21027)) (size!326 (buf!677 (_1!848 lt!21027))))))

(assert (=> d!4322 (= (bitIndex!0 (size!326 (buf!677 (_1!848 lt!21027))) (currentByte!1776 (_1!848 lt!21027)) (currentBit!1771 (_1!848 lt!21027))) lt!21150)))

(declare-fun b!13460 () Bool)

(declare-fun res!12767 () Bool)

(assert (=> b!13460 (=> (not res!12767) (not e!8249))))

(assert (=> b!13460 (= res!12767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21150))))

(declare-fun b!13461 () Bool)

(declare-fun lt!21149 () (_ BitVec 64))

(assert (=> b!13461 (= e!8249 (bvsle lt!21150 (bvmul lt!21149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13461 (or (= lt!21149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21149)))))

(assert (=> b!13461 (= lt!21149 ((_ sign_extend 32) (size!326 (buf!677 (_1!848 lt!21027)))))))

(assert (= (and d!4322 res!12766) b!13460))

(assert (= (and b!13460 res!12767) b!13461))

(declare-fun m!20091 () Bool)

(assert (=> d!4322 m!20091))

(declare-fun m!20093 () Bool)

(assert (=> d!4322 m!20093))

(assert (=> b!13356 d!4322))

(declare-fun d!4340 () Bool)

(declare-fun res!12776 () Bool)

(declare-fun e!8254 () Bool)

(assert (=> d!4340 (=> (not res!12776) (not e!8254))))

(assert (=> d!4340 (= res!12776 (= (size!326 (buf!677 thiss!957)) (size!326 (buf!677 (_2!847 lt!21029)))))))

(assert (=> d!4340 (= (isPrefixOf!0 thiss!957 (_2!847 lt!21029)) e!8254)))

(declare-fun b!13468 () Bool)

(declare-fun res!12777 () Bool)

(assert (=> b!13468 (=> (not res!12777) (not e!8254))))

(assert (=> b!13468 (= res!12777 (bvsle (bitIndex!0 (size!326 (buf!677 thiss!957)) (currentByte!1776 thiss!957) (currentBit!1771 thiss!957)) (bitIndex!0 (size!326 (buf!677 (_2!847 lt!21029))) (currentByte!1776 (_2!847 lt!21029)) (currentBit!1771 (_2!847 lt!21029)))))))

(declare-fun b!13469 () Bool)

(declare-fun e!8255 () Bool)

(assert (=> b!13469 (= e!8254 e!8255)))

(declare-fun res!12775 () Bool)

(assert (=> b!13469 (=> res!12775 e!8255)))

(assert (=> b!13469 (= res!12775 (= (size!326 (buf!677 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13470 () Bool)

(declare-fun arrayBitRangesEq!0 (array!752 array!752 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13470 (= e!8255 (arrayBitRangesEq!0 (buf!677 thiss!957) (buf!677 (_2!847 lt!21029)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!326 (buf!677 thiss!957)) (currentByte!1776 thiss!957) (currentBit!1771 thiss!957))))))

(assert (= (and d!4340 res!12776) b!13468))

(assert (= (and b!13468 res!12777) b!13469))

(assert (= (and b!13469 (not res!12775)) b!13470))

(assert (=> b!13468 m!19999))

(assert (=> b!13468 m!19997))

(assert (=> b!13470 m!19999))

(assert (=> b!13470 m!19999))

(declare-fun m!20097 () Bool)

(assert (=> b!13470 m!20097))

(assert (=> b!13351 d!4340))

(declare-fun d!4346 () Bool)

(declare-datatypes ((tuple2!1594 0))(
  ( (tuple2!1595 (_1!852 Bool) (_2!852 BitStream!612)) )
))
(declare-fun lt!21164 () tuple2!1594)

(declare-fun readBit!0 (BitStream!612) tuple2!1594)

(assert (=> d!4346 (= lt!21164 (readBit!0 (readerFrom!0 (_2!847 lt!21029) (currentBit!1771 thiss!957) (currentByte!1776 thiss!957))))))

(assert (=> d!4346 (= (readBitPure!0 (readerFrom!0 (_2!847 lt!21029) (currentBit!1771 thiss!957) (currentByte!1776 thiss!957))) (tuple2!1587 (_2!852 lt!21164) (_1!852 lt!21164)))))

(declare-fun bs!1210 () Bool)

(assert (= bs!1210 d!4346))

(assert (=> bs!1210 m!19993))

(declare-fun m!20105 () Bool)

(assert (=> bs!1210 m!20105))

(assert (=> b!13352 d!4346))

(declare-fun d!4350 () Bool)

(declare-fun e!8262 () Bool)

(assert (=> d!4350 e!8262))

(declare-fun res!12786 () Bool)

(assert (=> d!4350 (=> (not res!12786) (not e!8262))))

(assert (=> d!4350 (= res!12786 (invariant!0 (currentBit!1771 (_2!847 lt!21029)) (currentByte!1776 (_2!847 lt!21029)) (size!326 (buf!677 (_2!847 lt!21029)))))))

(assert (=> d!4350 (= (readerFrom!0 (_2!847 lt!21029) (currentBit!1771 thiss!957) (currentByte!1776 thiss!957)) (BitStream!613 (buf!677 (_2!847 lt!21029)) (currentByte!1776 thiss!957) (currentBit!1771 thiss!957)))))

(declare-fun b!13478 () Bool)

(assert (=> b!13478 (= e!8262 (invariant!0 (currentBit!1771 thiss!957) (currentByte!1776 thiss!957) (size!326 (buf!677 (_2!847 lt!21029)))))))

(assert (= (and d!4350 res!12786) b!13478))

(declare-fun m!20107 () Bool)

(assert (=> d!4350 m!20107))

(declare-fun m!20109 () Bool)

(assert (=> b!13478 m!20109))

(assert (=> b!13352 d!4350))

(declare-fun d!4352 () Bool)

(assert (=> d!4352 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!326 (buf!677 thiss!957))) ((_ sign_extend 32) (currentByte!1776 thiss!957)) ((_ sign_extend 32) (currentBit!1771 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!326 (buf!677 thiss!957))) ((_ sign_extend 32) (currentByte!1776 thiss!957)) ((_ sign_extend 32) (currentBit!1771 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1211 () Bool)

(assert (= bs!1211 d!4352))

(declare-fun m!20111 () Bool)

(assert (=> bs!1211 m!20111))

(assert (=> start!2860 d!4352))

(declare-fun d!4354 () Bool)

(assert (=> d!4354 (= (inv!12 thiss!957) (invariant!0 (currentBit!1771 thiss!957) (currentByte!1776 thiss!957) (size!326 (buf!677 thiss!957))))))

(declare-fun bs!1212 () Bool)

(assert (= bs!1212 d!4354))

(assert (=> bs!1212 m!20005))

(assert (=> start!2860 d!4354))

(declare-fun d!4356 () Bool)

(assert (=> d!4356 (= (array_inv!315 (buf!677 thiss!957)) (bvsge (size!326 (buf!677 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13353 d!4356))

(declare-fun d!4358 () Bool)

(declare-fun e!8263 () Bool)

(assert (=> d!4358 e!8263))

(declare-fun res!12787 () Bool)

(assert (=> d!4358 (=> (not res!12787) (not e!8263))))

(declare-fun lt!21169 () (_ BitVec 64))

(declare-fun lt!21170 () (_ BitVec 64))

(declare-fun lt!21168 () (_ BitVec 64))

(assert (=> d!4358 (= res!12787 (= lt!21168 (bvsub lt!21169 lt!21170)))))

(assert (=> d!4358 (or (= (bvand lt!21169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21169 lt!21170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4358 (= lt!21170 (remainingBits!0 ((_ sign_extend 32) (size!326 (buf!677 (_2!847 lt!21029)))) ((_ sign_extend 32) (currentByte!1776 (_2!847 lt!21029))) ((_ sign_extend 32) (currentBit!1771 (_2!847 lt!21029)))))))

(declare-fun lt!21165 () (_ BitVec 64))

(declare-fun lt!21166 () (_ BitVec 64))

(assert (=> d!4358 (= lt!21169 (bvmul lt!21165 lt!21166))))

(assert (=> d!4358 (or (= lt!21165 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21166 (bvsdiv (bvmul lt!21165 lt!21166) lt!21165)))))

(assert (=> d!4358 (= lt!21166 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4358 (= lt!21165 ((_ sign_extend 32) (size!326 (buf!677 (_2!847 lt!21029)))))))

(assert (=> d!4358 (= lt!21168 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1776 (_2!847 lt!21029))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1771 (_2!847 lt!21029)))))))

(assert (=> d!4358 (invariant!0 (currentBit!1771 (_2!847 lt!21029)) (currentByte!1776 (_2!847 lt!21029)) (size!326 (buf!677 (_2!847 lt!21029))))))

(assert (=> d!4358 (= (bitIndex!0 (size!326 (buf!677 (_2!847 lt!21029))) (currentByte!1776 (_2!847 lt!21029)) (currentBit!1771 (_2!847 lt!21029))) lt!21168)))

(declare-fun b!13479 () Bool)

(declare-fun res!12788 () Bool)

(assert (=> b!13479 (=> (not res!12788) (not e!8263))))

(assert (=> b!13479 (= res!12788 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21168))))

(declare-fun b!13480 () Bool)

(declare-fun lt!21167 () (_ BitVec 64))

(assert (=> b!13480 (= e!8263 (bvsle lt!21168 (bvmul lt!21167 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13480 (or (= lt!21167 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21167 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21167)))))

(assert (=> b!13480 (= lt!21167 ((_ sign_extend 32) (size!326 (buf!677 (_2!847 lt!21029)))))))

(assert (= (and d!4358 res!12787) b!13479))

(assert (= (and b!13479 res!12788) b!13480))

(declare-fun m!20113 () Bool)

(assert (=> d!4358 m!20113))

(assert (=> d!4358 m!20107))

(assert (=> b!13354 d!4358))

(declare-fun d!4360 () Bool)

(declare-fun e!8264 () Bool)

(assert (=> d!4360 e!8264))

(declare-fun res!12789 () Bool)

(assert (=> d!4360 (=> (not res!12789) (not e!8264))))

(declare-fun lt!21174 () (_ BitVec 64))

(declare-fun lt!21175 () (_ BitVec 64))

(declare-fun lt!21176 () (_ BitVec 64))

(assert (=> d!4360 (= res!12789 (= lt!21174 (bvsub lt!21175 lt!21176)))))

(assert (=> d!4360 (or (= (bvand lt!21175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21175 lt!21176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4360 (= lt!21176 (remainingBits!0 ((_ sign_extend 32) (size!326 (buf!677 thiss!957))) ((_ sign_extend 32) (currentByte!1776 thiss!957)) ((_ sign_extend 32) (currentBit!1771 thiss!957))))))

(declare-fun lt!21171 () (_ BitVec 64))

(declare-fun lt!21172 () (_ BitVec 64))

(assert (=> d!4360 (= lt!21175 (bvmul lt!21171 lt!21172))))

(assert (=> d!4360 (or (= lt!21171 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21172 (bvsdiv (bvmul lt!21171 lt!21172) lt!21171)))))

(assert (=> d!4360 (= lt!21172 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4360 (= lt!21171 ((_ sign_extend 32) (size!326 (buf!677 thiss!957))))))

(assert (=> d!4360 (= lt!21174 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1776 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1771 thiss!957))))))

(assert (=> d!4360 (invariant!0 (currentBit!1771 thiss!957) (currentByte!1776 thiss!957) (size!326 (buf!677 thiss!957)))))

(assert (=> d!4360 (= (bitIndex!0 (size!326 (buf!677 thiss!957)) (currentByte!1776 thiss!957) (currentBit!1771 thiss!957)) lt!21174)))

(declare-fun b!13481 () Bool)

(declare-fun res!12790 () Bool)

(assert (=> b!13481 (=> (not res!12790) (not e!8264))))

(assert (=> b!13481 (= res!12790 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21174))))

(declare-fun b!13482 () Bool)

(declare-fun lt!21173 () (_ BitVec 64))

(assert (=> b!13482 (= e!8264 (bvsle lt!21174 (bvmul lt!21173 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13482 (or (= lt!21173 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21173 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21173)))))

(assert (=> b!13482 (= lt!21173 ((_ sign_extend 32) (size!326 (buf!677 thiss!957))))))

(assert (= (and d!4360 res!12789) b!13481))

(assert (= (and b!13481 res!12790) b!13482))

(assert (=> d!4360 m!20111))

(assert (=> d!4360 m!20005))

(assert (=> b!13354 d!4360))

(check-sat (not d!4350) (not b!13470) (not b!13420) (not b!13423) (not b!13422) (not d!4308) (not d!4360) (not d!4358) (not d!4346) (not b!13468) (not b!13421) (not b!13478) (not d!4322) (not d!4352) (not d!4354))
