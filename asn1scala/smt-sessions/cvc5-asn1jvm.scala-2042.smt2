; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52060 () Bool)

(assert start!52060)

(declare-fun res!200218 () Bool)

(declare-fun e!166303 () Bool)

(assert (=> start!52060 (=> (not res!200218) (not e!166303))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52060 (= res!200218 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52060 e!166303))

(assert (=> start!52060 true))

(declare-datatypes ((array!13105 0))(
  ( (array!13106 (arr!6727 (Array (_ BitVec 32) (_ BitVec 8))) (size!5740 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10402 0))(
  ( (BitStream!10403 (buf!6194 array!13105) (currentByte!11536 (_ BitVec 32)) (currentBit!11531 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10402)

(declare-fun e!166304 () Bool)

(declare-fun inv!12 (BitStream!10402) Bool)

(assert (=> start!52060 (and (inv!12 thiss!982) e!166304)))

(declare-fun b!239844 () Bool)

(declare-fun res!200219 () Bool)

(declare-fun e!166301 () Bool)

(assert (=> b!239844 (=> (not res!200219) (not e!166301))))

(declare-datatypes ((Unit!17575 0))(
  ( (Unit!17576) )
))
(declare-datatypes ((tuple2!20280 0))(
  ( (tuple2!20281 (_1!11062 Unit!17575) (_2!11062 BitStream!10402)) )
))
(declare-fun lt!374470 () tuple2!20280)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239844 (= res!200219 (= (bitIndex!0 (size!5740 (buf!6194 (_2!11062 lt!374470))) (currentByte!11536 (_2!11062 lt!374470)) (currentBit!11531 (_2!11062 lt!374470))) (bvadd (bitIndex!0 (size!5740 (buf!6194 thiss!982)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982)) nBits!288)))))

(declare-fun b!239845 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239845 (= e!166303 (not (invariant!0 (currentBit!11531 (_2!11062 lt!374470)) (currentByte!11536 (_2!11062 lt!374470)) (size!5740 (buf!6194 (_2!11062 lt!374470))))))))

(assert (=> b!239845 e!166301))

(declare-fun res!200216 () Bool)

(assert (=> b!239845 (=> (not res!200216) (not e!166301))))

(assert (=> b!239845 (= res!200216 (= (size!5740 (buf!6194 thiss!982)) (size!5740 (buf!6194 (_2!11062 lt!374470)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10402 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20280)

(assert (=> b!239845 (= lt!374470 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239846 () Bool)

(declare-fun array_inv!5481 (array!13105) Bool)

(assert (=> b!239846 (= e!166304 (array_inv!5481 (buf!6194 thiss!982)))))

(declare-fun b!239847 () Bool)

(declare-datatypes ((tuple2!20282 0))(
  ( (tuple2!20283 (_1!11063 BitStream!10402) (_2!11063 Bool)) )
))
(declare-fun lt!374471 () tuple2!20282)

(declare-datatypes ((tuple2!20284 0))(
  ( (tuple2!20285 (_1!11064 BitStream!10402) (_2!11064 BitStream!10402)) )
))
(declare-fun lt!374469 () tuple2!20284)

(assert (=> b!239847 (= e!166301 (not (or (not (_2!11063 lt!374471)) (not (= (_1!11063 lt!374471) (_2!11064 lt!374469))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10402 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20282)

(assert (=> b!239847 (= lt!374471 (checkBitsLoopPure!0 (_1!11064 lt!374469) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239847 (validate_offset_bits!1 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374470)))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982)) nBits!288)))

(declare-fun lt!374472 () Unit!17575)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10402 array!13105 (_ BitVec 64)) Unit!17575)

(assert (=> b!239847 (= lt!374472 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6194 (_2!11062 lt!374470)) nBits!288))))

(declare-fun reader!0 (BitStream!10402 BitStream!10402) tuple2!20284)

(assert (=> b!239847 (= lt!374469 (reader!0 thiss!982 (_2!11062 lt!374470)))))

(declare-fun b!239848 () Bool)

(declare-fun res!200220 () Bool)

(assert (=> b!239848 (=> (not res!200220) (not e!166303))))

(assert (=> b!239848 (= res!200220 (validate_offset_bits!1 ((_ sign_extend 32) (size!5740 (buf!6194 thiss!982))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982)) nBits!288))))

(declare-fun b!239849 () Bool)

(declare-fun res!200217 () Bool)

(assert (=> b!239849 (=> (not res!200217) (not e!166301))))

(declare-fun isPrefixOf!0 (BitStream!10402 BitStream!10402) Bool)

(assert (=> b!239849 (= res!200217 (isPrefixOf!0 thiss!982 (_2!11062 lt!374470)))))

(assert (= (and start!52060 res!200218) b!239848))

(assert (= (and b!239848 res!200220) b!239845))

(assert (= (and b!239845 res!200216) b!239844))

(assert (= (and b!239844 res!200219) b!239849))

(assert (= (and b!239849 res!200217) b!239847))

(assert (= start!52060 b!239846))

(declare-fun m!362157 () Bool)

(assert (=> b!239844 m!362157))

(declare-fun m!362159 () Bool)

(assert (=> b!239844 m!362159))

(declare-fun m!362161 () Bool)

(assert (=> b!239847 m!362161))

(declare-fun m!362163 () Bool)

(assert (=> b!239847 m!362163))

(declare-fun m!362165 () Bool)

(assert (=> b!239847 m!362165))

(declare-fun m!362167 () Bool)

(assert (=> b!239847 m!362167))

(declare-fun m!362169 () Bool)

(assert (=> b!239848 m!362169))

(declare-fun m!362171 () Bool)

(assert (=> b!239845 m!362171))

(declare-fun m!362173 () Bool)

(assert (=> b!239845 m!362173))

(declare-fun m!362175 () Bool)

(assert (=> b!239849 m!362175))

(declare-fun m!362177 () Bool)

(assert (=> b!239846 m!362177))

(declare-fun m!362179 () Bool)

(assert (=> start!52060 m!362179))

(push 1)

(assert (not b!239849))

(assert (not b!239847))

(assert (not start!52060))

(assert (not b!239848))

(assert (not b!239845))

(assert (not b!239846))

(assert (not b!239844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81160 () Bool)

(assert (=> d!81160 (= (invariant!0 (currentBit!11531 (_2!11062 lt!374470)) (currentByte!11536 (_2!11062 lt!374470)) (size!5740 (buf!6194 (_2!11062 lt!374470)))) (and (bvsge (currentBit!11531 (_2!11062 lt!374470)) #b00000000000000000000000000000000) (bvslt (currentBit!11531 (_2!11062 lt!374470)) #b00000000000000000000000000001000) (bvsge (currentByte!11536 (_2!11062 lt!374470)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11536 (_2!11062 lt!374470)) (size!5740 (buf!6194 (_2!11062 lt!374470)))) (and (= (currentBit!11531 (_2!11062 lt!374470)) #b00000000000000000000000000000000) (= (currentByte!11536 (_2!11062 lt!374470)) (size!5740 (buf!6194 (_2!11062 lt!374470))))))))))

(assert (=> b!239845 d!81160))

(declare-fun b!239928 () Bool)

(declare-fun e!166348 () Bool)

(declare-fun lt!374630 () (_ BitVec 64))

(assert (=> b!239928 (= e!166348 (validate_offset_bits!1 ((_ sign_extend 32) (size!5740 (buf!6194 thiss!982))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982)) lt!374630))))

(declare-fun b!239926 () Bool)

(declare-fun res!200286 () Bool)

(declare-fun e!166347 () Bool)

(assert (=> b!239926 (=> (not res!200286) (not e!166347))))

(declare-fun lt!374628 () tuple2!20280)

(assert (=> b!239926 (= res!200286 (isPrefixOf!0 thiss!982 (_2!11062 lt!374628)))))

(declare-fun d!81162 () Bool)

(assert (=> d!81162 e!166347))

(declare-fun res!200287 () Bool)

(assert (=> d!81162 (=> (not res!200287) (not e!166347))))

(assert (=> d!81162 (= res!200287 (= (size!5740 (buf!6194 thiss!982)) (size!5740 (buf!6194 (_2!11062 lt!374628)))))))

(declare-fun choose!51 (BitStream!10402 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20280)

(assert (=> d!81162 (= lt!374628 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81162 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81162 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!374628)))

(declare-fun b!239927 () Bool)

(declare-fun lt!374629 () tuple2!20282)

(declare-fun lt!374633 () tuple2!20284)

(assert (=> b!239927 (= e!166347 (and (_2!11063 lt!374629) (= (_1!11063 lt!374629) (_2!11064 lt!374633))))))

(assert (=> b!239927 (= lt!374629 (checkBitsLoopPure!0 (_1!11064 lt!374633) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!374631 () Unit!17575)

(declare-fun lt!374632 () Unit!17575)

(assert (=> b!239927 (= lt!374631 lt!374632)))

(assert (=> b!239927 (validate_offset_bits!1 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374628)))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982)) lt!374630)))

(assert (=> b!239927 (= lt!374632 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6194 (_2!11062 lt!374628)) lt!374630))))

(assert (=> b!239927 e!166348))

(declare-fun res!200285 () Bool)

(assert (=> b!239927 (=> (not res!200285) (not e!166348))))

(assert (=> b!239927 (= res!200285 (and (= (size!5740 (buf!6194 thiss!982)) (size!5740 (buf!6194 (_2!11062 lt!374628)))) (bvsge lt!374630 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239927 (= lt!374630 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239927 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239927 (= lt!374633 (reader!0 thiss!982 (_2!11062 lt!374628)))))

(declare-fun b!239925 () Bool)

(declare-fun res!200284 () Bool)

(assert (=> b!239925 (=> (not res!200284) (not e!166347))))

(declare-fun lt!374627 () (_ BitVec 64))

(declare-fun lt!374634 () (_ BitVec 64))

(assert (=> b!239925 (= res!200284 (= (bitIndex!0 (size!5740 (buf!6194 (_2!11062 lt!374628))) (currentByte!11536 (_2!11062 lt!374628)) (currentBit!11531 (_2!11062 lt!374628))) (bvadd lt!374627 lt!374634)))))

(assert (=> b!239925 (or (not (= (bvand lt!374627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374634 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374627 lt!374634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239925 (= lt!374634 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239925 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239925 (= lt!374627 (bitIndex!0 (size!5740 (buf!6194 thiss!982)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982)))))

(assert (= (and d!81162 res!200287) b!239925))

(assert (= (and b!239925 res!200284) b!239926))

(assert (= (and b!239926 res!200286) b!239927))

(assert (= (and b!239927 res!200285) b!239928))

(declare-fun m!362277 () Bool)

(assert (=> b!239927 m!362277))

(declare-fun m!362279 () Bool)

(assert (=> b!239927 m!362279))

(declare-fun m!362281 () Bool)

(assert (=> b!239927 m!362281))

(declare-fun m!362283 () Bool)

(assert (=> b!239927 m!362283))

(declare-fun m!362285 () Bool)

(assert (=> b!239928 m!362285))

(declare-fun m!362287 () Bool)

(assert (=> b!239926 m!362287))

(declare-fun m!362289 () Bool)

(assert (=> d!81162 m!362289))

(declare-fun m!362291 () Bool)

(assert (=> b!239925 m!362291))

(assert (=> b!239925 m!362159))

(assert (=> b!239845 d!81162))

(declare-fun d!81186 () Bool)

(assert (=> d!81186 (= (inv!12 thiss!982) (invariant!0 (currentBit!11531 thiss!982) (currentByte!11536 thiss!982) (size!5740 (buf!6194 thiss!982))))))

(declare-fun bs!20463 () Bool)

(assert (= bs!20463 d!81186))

(declare-fun m!362293 () Bool)

(assert (=> bs!20463 m!362293))

(assert (=> start!52060 d!81186))

(declare-fun d!81188 () Bool)

(assert (=> d!81188 (= (array_inv!5481 (buf!6194 thiss!982)) (bvsge (size!5740 (buf!6194 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!239846 d!81188))

(declare-fun d!81190 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81190 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5740 (buf!6194 thiss!982))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5740 (buf!6194 thiss!982))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982))) nBits!288))))

(declare-fun bs!20464 () Bool)

(assert (= bs!20464 d!81190))

(declare-fun m!362295 () Bool)

(assert (=> bs!20464 m!362295))

(assert (=> b!239848 d!81190))

(declare-datatypes ((tuple2!20298 0))(
  ( (tuple2!20299 (_1!11071 Bool) (_2!11071 BitStream!10402)) )
))
(declare-fun lt!374637 () tuple2!20298)

(declare-fun d!81192 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10402 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20298)

(assert (=> d!81192 (= lt!374637 (checkBitsLoop!0 (_1!11064 lt!374469) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81192 (= (checkBitsLoopPure!0 (_1!11064 lt!374469) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20283 (_2!11071 lt!374637) (_1!11071 lt!374637)))))

(declare-fun bs!20465 () Bool)

(assert (= bs!20465 d!81192))

(declare-fun m!362297 () Bool)

(assert (=> bs!20465 m!362297))

(assert (=> b!239847 d!81192))

(declare-fun d!81194 () Bool)

(assert (=> d!81194 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374470)))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374470)))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982))) nBits!288))))

(declare-fun bs!20466 () Bool)

(assert (= bs!20466 d!81194))

(declare-fun m!362299 () Bool)

(assert (=> bs!20466 m!362299))

(assert (=> b!239847 d!81194))

(declare-fun d!81196 () Bool)

(assert (=> d!81196 (validate_offset_bits!1 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374470)))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982)) nBits!288)))

(declare-fun lt!374640 () Unit!17575)

(declare-fun choose!9 (BitStream!10402 array!13105 (_ BitVec 64) BitStream!10402) Unit!17575)

(assert (=> d!81196 (= lt!374640 (choose!9 thiss!982 (buf!6194 (_2!11062 lt!374470)) nBits!288 (BitStream!10403 (buf!6194 (_2!11062 lt!374470)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982))))))

(assert (=> d!81196 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6194 (_2!11062 lt!374470)) nBits!288) lt!374640)))

(declare-fun bs!20467 () Bool)

(assert (= bs!20467 d!81196))

(assert (=> bs!20467 m!362163))

(declare-fun m!362301 () Bool)

(assert (=> bs!20467 m!362301))

(assert (=> b!239847 d!81196))

(declare-fun b!239960 () Bool)

(declare-fun e!166365 () Unit!17575)

(declare-fun Unit!17581 () Unit!17575)

(assert (=> b!239960 (= e!166365 Unit!17581)))

(declare-fun d!81198 () Bool)

(declare-fun e!166366 () Bool)

(assert (=> d!81198 e!166366))

(declare-fun res!200317 () Bool)

(assert (=> d!81198 (=> (not res!200317) (not e!166366))))

(declare-fun lt!374720 () tuple2!20284)

(assert (=> d!81198 (= res!200317 (isPrefixOf!0 (_1!11064 lt!374720) (_2!11064 lt!374720)))))

(declare-fun lt!374727 () BitStream!10402)

(assert (=> d!81198 (= lt!374720 (tuple2!20285 lt!374727 (_2!11062 lt!374470)))))

(declare-fun lt!374713 () Unit!17575)

(declare-fun lt!374719 () Unit!17575)

(assert (=> d!81198 (= lt!374713 lt!374719)))

(assert (=> d!81198 (isPrefixOf!0 lt!374727 (_2!11062 lt!374470))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10402 BitStream!10402 BitStream!10402) Unit!17575)

(assert (=> d!81198 (= lt!374719 (lemmaIsPrefixTransitive!0 lt!374727 (_2!11062 lt!374470) (_2!11062 lt!374470)))))

(declare-fun lt!374722 () Unit!17575)

(declare-fun lt!374711 () Unit!17575)

(assert (=> d!81198 (= lt!374722 lt!374711)))

(assert (=> d!81198 (isPrefixOf!0 lt!374727 (_2!11062 lt!374470))))

(assert (=> d!81198 (= lt!374711 (lemmaIsPrefixTransitive!0 lt!374727 thiss!982 (_2!11062 lt!374470)))))

(declare-fun lt!374729 () Unit!17575)

(assert (=> d!81198 (= lt!374729 e!166365)))

(declare-fun c!11410 () Bool)

(assert (=> d!81198 (= c!11410 (not (= (size!5740 (buf!6194 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!374721 () Unit!17575)

(declare-fun lt!374716 () Unit!17575)

(assert (=> d!81198 (= lt!374721 lt!374716)))

(assert (=> d!81198 (isPrefixOf!0 (_2!11062 lt!374470) (_2!11062 lt!374470))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10402) Unit!17575)

(assert (=> d!81198 (= lt!374716 (lemmaIsPrefixRefl!0 (_2!11062 lt!374470)))))

(declare-fun lt!374714 () Unit!17575)

(declare-fun lt!374730 () Unit!17575)

(assert (=> d!81198 (= lt!374714 lt!374730)))

(assert (=> d!81198 (= lt!374730 (lemmaIsPrefixRefl!0 (_2!11062 lt!374470)))))

(declare-fun lt!374718 () Unit!17575)

(declare-fun lt!374715 () Unit!17575)

(assert (=> d!81198 (= lt!374718 lt!374715)))

(assert (=> d!81198 (isPrefixOf!0 lt!374727 lt!374727)))

(assert (=> d!81198 (= lt!374715 (lemmaIsPrefixRefl!0 lt!374727))))

(declare-fun lt!374726 () Unit!17575)

(declare-fun lt!374717 () Unit!17575)

(assert (=> d!81198 (= lt!374726 lt!374717)))

(assert (=> d!81198 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81198 (= lt!374717 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81198 (= lt!374727 (BitStream!10403 (buf!6194 (_2!11062 lt!374470)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982)))))

(assert (=> d!81198 (isPrefixOf!0 thiss!982 (_2!11062 lt!374470))))

(assert (=> d!81198 (= (reader!0 thiss!982 (_2!11062 lt!374470)) lt!374720)))

(declare-fun lt!374724 () (_ BitVec 64))

(declare-fun lt!374712 () (_ BitVec 64))

(declare-fun b!239961 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10402 (_ BitVec 64)) BitStream!10402)

(assert (=> b!239961 (= e!166366 (= (_1!11064 lt!374720) (withMovedBitIndex!0 (_2!11064 lt!374720) (bvsub lt!374724 lt!374712))))))

(assert (=> b!239961 (or (= (bvand lt!374724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374724 lt!374712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239961 (= lt!374712 (bitIndex!0 (size!5740 (buf!6194 (_2!11062 lt!374470))) (currentByte!11536 (_2!11062 lt!374470)) (currentBit!11531 (_2!11062 lt!374470))))))

(assert (=> b!239961 (= lt!374724 (bitIndex!0 (size!5740 (buf!6194 thiss!982)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982)))))

(declare-fun b!239962 () Bool)

(declare-fun lt!374725 () Unit!17575)

(assert (=> b!239962 (= e!166365 lt!374725)))

(declare-fun lt!374728 () (_ BitVec 64))

(assert (=> b!239962 (= lt!374728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374723 () (_ BitVec 64))

(assert (=> b!239962 (= lt!374723 (bitIndex!0 (size!5740 (buf!6194 thiss!982)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13105 array!13105 (_ BitVec 64) (_ BitVec 64)) Unit!17575)

(assert (=> b!239962 (= lt!374725 (arrayBitRangesEqSymmetric!0 (buf!6194 thiss!982) (buf!6194 (_2!11062 lt!374470)) lt!374728 lt!374723))))

(declare-fun arrayBitRangesEq!0 (array!13105 array!13105 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239962 (arrayBitRangesEq!0 (buf!6194 (_2!11062 lt!374470)) (buf!6194 thiss!982) lt!374728 lt!374723)))

(declare-fun b!239963 () Bool)

(declare-fun res!200315 () Bool)

(assert (=> b!239963 (=> (not res!200315) (not e!166366))))

(assert (=> b!239963 (= res!200315 (isPrefixOf!0 (_1!11064 lt!374720) thiss!982))))

(declare-fun b!239964 () Bool)

(declare-fun res!200316 () Bool)

(assert (=> b!239964 (=> (not res!200316) (not e!166366))))

(assert (=> b!239964 (= res!200316 (isPrefixOf!0 (_2!11064 lt!374720) (_2!11062 lt!374470)))))

(assert (= (and d!81198 c!11410) b!239962))

(assert (= (and d!81198 (not c!11410)) b!239960))

(assert (= (and d!81198 res!200317) b!239963))

(assert (= (and b!239963 res!200315) b!239964))

(assert (= (and b!239964 res!200316) b!239961))

(declare-fun m!362327 () Bool)

(assert (=> b!239961 m!362327))

(assert (=> b!239961 m!362157))

(assert (=> b!239961 m!362159))

(declare-fun m!362329 () Bool)

(assert (=> b!239963 m!362329))

(assert (=> b!239962 m!362159))

(declare-fun m!362331 () Bool)

(assert (=> b!239962 m!362331))

(declare-fun m!362333 () Bool)

(assert (=> b!239962 m!362333))

(declare-fun m!362335 () Bool)

(assert (=> d!81198 m!362335))

(declare-fun m!362337 () Bool)

(assert (=> d!81198 m!362337))

(declare-fun m!362339 () Bool)

(assert (=> d!81198 m!362339))

(declare-fun m!362341 () Bool)

(assert (=> d!81198 m!362341))

(declare-fun m!362343 () Bool)

(assert (=> d!81198 m!362343))

(declare-fun m!362345 () Bool)

(assert (=> d!81198 m!362345))

(declare-fun m!362347 () Bool)

(assert (=> d!81198 m!362347))

(assert (=> d!81198 m!362175))

(declare-fun m!362349 () Bool)

(assert (=> d!81198 m!362349))

(declare-fun m!362351 () Bool)

(assert (=> d!81198 m!362351))

(declare-fun m!362353 () Bool)

(assert (=> d!81198 m!362353))

(declare-fun m!362355 () Bool)

(assert (=> b!239964 m!362355))

(assert (=> b!239847 d!81198))

(declare-fun d!81214 () Bool)

(declare-fun res!200326 () Bool)

(declare-fun e!166372 () Bool)

(assert (=> d!81214 (=> (not res!200326) (not e!166372))))

(assert (=> d!81214 (= res!200326 (= (size!5740 (buf!6194 thiss!982)) (size!5740 (buf!6194 (_2!11062 lt!374470)))))))

(assert (=> d!81214 (= (isPrefixOf!0 thiss!982 (_2!11062 lt!374470)) e!166372)))

(declare-fun b!239971 () Bool)

(declare-fun res!200325 () Bool)

(assert (=> b!239971 (=> (not res!200325) (not e!166372))))

(assert (=> b!239971 (= res!200325 (bvsle (bitIndex!0 (size!5740 (buf!6194 thiss!982)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982)) (bitIndex!0 (size!5740 (buf!6194 (_2!11062 lt!374470))) (currentByte!11536 (_2!11062 lt!374470)) (currentBit!11531 (_2!11062 lt!374470)))))))

(declare-fun b!239972 () Bool)

(declare-fun e!166371 () Bool)

(assert (=> b!239972 (= e!166372 e!166371)))

(declare-fun res!200324 () Bool)

(assert (=> b!239972 (=> res!200324 e!166371)))

(assert (=> b!239972 (= res!200324 (= (size!5740 (buf!6194 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!239973 () Bool)

(assert (=> b!239973 (= e!166371 (arrayBitRangesEq!0 (buf!6194 thiss!982) (buf!6194 (_2!11062 lt!374470)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5740 (buf!6194 thiss!982)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982))))))

(assert (= (and d!81214 res!200326) b!239971))

(assert (= (and b!239971 res!200325) b!239972))

(assert (= (and b!239972 (not res!200324)) b!239973))

(assert (=> b!239971 m!362159))

(assert (=> b!239971 m!362157))

(assert (=> b!239973 m!362159))

(assert (=> b!239973 m!362159))

(declare-fun m!362357 () Bool)

(assert (=> b!239973 m!362357))

(assert (=> b!239849 d!81214))

(declare-fun d!81216 () Bool)

(declare-fun e!166377 () Bool)

(assert (=> d!81216 e!166377))

(declare-fun res!200331 () Bool)

(assert (=> d!81216 (=> (not res!200331) (not e!166377))))

(declare-fun lt!374781 () (_ BitVec 64))

(declare-fun lt!374784 () (_ BitVec 64))

(declare-fun lt!374780 () (_ BitVec 64))

(assert (=> d!81216 (= res!200331 (= lt!374781 (bvsub lt!374780 lt!374784)))))

(assert (=> d!81216 (or (= (bvand lt!374780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374780 lt!374784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81216 (= lt!374784 (remainingBits!0 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374470)))) ((_ sign_extend 32) (currentByte!11536 (_2!11062 lt!374470))) ((_ sign_extend 32) (currentBit!11531 (_2!11062 lt!374470)))))))

(declare-fun lt!374783 () (_ BitVec 64))

(declare-fun lt!374782 () (_ BitVec 64))

(assert (=> d!81216 (= lt!374780 (bvmul lt!374783 lt!374782))))

(assert (=> d!81216 (or (= lt!374783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374782 (bvsdiv (bvmul lt!374783 lt!374782) lt!374783)))))

(assert (=> d!81216 (= lt!374782 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81216 (= lt!374783 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374470)))))))

(assert (=> d!81216 (= lt!374781 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11536 (_2!11062 lt!374470))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11531 (_2!11062 lt!374470)))))))

(assert (=> d!81216 (invariant!0 (currentBit!11531 (_2!11062 lt!374470)) (currentByte!11536 (_2!11062 lt!374470)) (size!5740 (buf!6194 (_2!11062 lt!374470))))))

(assert (=> d!81216 (= (bitIndex!0 (size!5740 (buf!6194 (_2!11062 lt!374470))) (currentByte!11536 (_2!11062 lt!374470)) (currentBit!11531 (_2!11062 lt!374470))) lt!374781)))

(declare-fun b!239982 () Bool)

(declare-fun res!200332 () Bool)

(assert (=> b!239982 (=> (not res!200332) (not e!166377))))

(assert (=> b!239982 (= res!200332 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374781))))

(declare-fun b!239983 () Bool)

(declare-fun lt!374779 () (_ BitVec 64))

(assert (=> b!239983 (= e!166377 (bvsle lt!374781 (bvmul lt!374779 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239983 (or (= lt!374779 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374779 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374779)))))

(assert (=> b!239983 (= lt!374779 ((_ sign_extend 32) (size!5740 (buf!6194 (_2!11062 lt!374470)))))))

(assert (= (and d!81216 res!200331) b!239982))

(assert (= (and b!239982 res!200332) b!239983))

(declare-fun m!362359 () Bool)

(assert (=> d!81216 m!362359))

(assert (=> d!81216 m!362171))

(assert (=> b!239844 d!81216))

(declare-fun d!81218 () Bool)

(declare-fun e!166380 () Bool)

(assert (=> d!81218 e!166380))

(declare-fun res!200339 () Bool)

(assert (=> d!81218 (=> (not res!200339) (not e!166380))))

(declare-fun lt!374791 () (_ BitVec 64))

(declare-fun lt!374790 () (_ BitVec 64))

(declare-fun lt!374794 () (_ BitVec 64))

(assert (=> d!81218 (= res!200339 (= lt!374791 (bvsub lt!374790 lt!374794)))))

(assert (=> d!81218 (or (= (bvand lt!374790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374790 lt!374794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81218 (= lt!374794 (remainingBits!0 ((_ sign_extend 32) (size!5740 (buf!6194 thiss!982))) ((_ sign_extend 32) (currentByte!11536 thiss!982)) ((_ sign_extend 32) (currentBit!11531 thiss!982))))))

(declare-fun lt!374793 () (_ BitVec 64))

(declare-fun lt!374792 () (_ BitVec 64))

(assert (=> d!81218 (= lt!374790 (bvmul lt!374793 lt!374792))))

(assert (=> d!81218 (or (= lt!374793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374792 (bvsdiv (bvmul lt!374793 lt!374792) lt!374793)))))

(assert (=> d!81218 (= lt!374792 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81218 (= lt!374793 ((_ sign_extend 32) (size!5740 (buf!6194 thiss!982))))))

(assert (=> d!81218 (= lt!374791 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11536 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11531 thiss!982))))))

(assert (=> d!81218 (invariant!0 (currentBit!11531 thiss!982) (currentByte!11536 thiss!982) (size!5740 (buf!6194 thiss!982)))))

(assert (=> d!81218 (= (bitIndex!0 (size!5740 (buf!6194 thiss!982)) (currentByte!11536 thiss!982) (currentBit!11531 thiss!982)) lt!374791)))

(declare-fun b!239990 () Bool)

(declare-fun res!200340 () Bool)

(assert (=> b!239990 (=> (not res!200340) (not e!166380))))

(assert (=> b!239990 (= res!200340 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374791))))

(declare-fun b!239991 () Bool)

(declare-fun lt!374789 () (_ BitVec 64))

(assert (=> b!239991 (= e!166380 (bvsle lt!374791 (bvmul lt!374789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239991 (or (= lt!374789 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374789 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374789)))))

(assert (=> b!239991 (= lt!374789 ((_ sign_extend 32) (size!5740 (buf!6194 thiss!982))))))

(assert (= (and d!81218 res!200339) b!239990))

(assert (= (and b!239990 res!200340) b!239991))

(assert (=> d!81218 m!362295))

(assert (=> d!81218 m!362293))

(assert (=> b!239844 d!81218))

(push 1)

(assert (not b!239927))

(assert (not d!81190))

(assert (not d!81194))

(assert (not d!81186))

(assert (not d!81196))

(assert (not b!239962))

(assert (not d!81218))

(assert (not b!239963))

(assert (not b!239971))

(assert (not b!239964))

(assert (not d!81198))

(assert (not b!239961))

(assert (not b!239973))

(assert (not d!81192))

(assert (not d!81162))

(assert (not b!239928))

(assert (not d!81216))

(assert (not b!239925))

(assert (not b!239926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

