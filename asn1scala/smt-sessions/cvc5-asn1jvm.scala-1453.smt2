; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39836 () Bool)

(assert start!39836)

(declare-fun b!180925 () Bool)

(declare-fun e!125683 () Bool)

(declare-fun e!125689 () Bool)

(assert (=> b!180925 (= e!125683 e!125689)))

(declare-fun res!150244 () Bool)

(assert (=> b!180925 (=> (not res!150244) (not e!125689))))

(declare-fun lt!277694 () (_ BitVec 64))

(declare-fun lt!277700 () (_ BitVec 64))

(assert (=> b!180925 (= res!150244 (= lt!277694 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!277700)))))

(declare-datatypes ((array!9689 0))(
  ( (array!9690 (arr!5203 (Array (_ BitVec 32) (_ BitVec 8))) (size!4273 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7654 0))(
  ( (BitStream!7655 (buf!4719 array!9689) (currentByte!8935 (_ BitVec 32)) (currentBit!8930 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13004 0))(
  ( (Unit!13005) )
))
(declare-datatypes ((tuple2!15596 0))(
  ( (tuple2!15597 (_1!8443 Unit!13004) (_2!8443 BitStream!7654)) )
))
(declare-fun lt!277709 () tuple2!15596)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180925 (= lt!277694 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))))))

(declare-fun thiss!1204 () BitStream!7654)

(assert (=> b!180925 (= lt!277700 (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(declare-fun b!180926 () Bool)

(declare-fun e!125682 () Bool)

(declare-fun e!125678 () Bool)

(assert (=> b!180926 (= e!125682 (not e!125678))))

(declare-fun res!150251 () Bool)

(assert (=> b!180926 (=> res!150251 e!125678)))

(declare-fun lt!277693 () (_ BitVec 64))

(declare-fun lt!277702 () (_ BitVec 64))

(assert (=> b!180926 (= res!150251 (not (= lt!277693 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!277702))))))

(assert (=> b!180926 (= lt!277693 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))))))

(assert (=> b!180926 (= lt!277702 (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(assert (=> b!180926 e!125683))

(declare-fun res!150243 () Bool)

(assert (=> b!180926 (=> (not res!150243) (not e!125683))))

(assert (=> b!180926 (= res!150243 (= (size!4273 (buf!4719 thiss!1204)) (size!4273 (buf!4719 (_2!8443 lt!277709)))))))

(declare-fun lt!277696 () Bool)

(declare-fun appendBit!0 (BitStream!7654 Bool) tuple2!15596)

(assert (=> b!180926 (= lt!277709 (appendBit!0 thiss!1204 lt!277696))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!180926 (= lt!277696 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180927 () Bool)

(declare-fun e!125685 () Bool)

(assert (=> b!180927 (= e!125678 e!125685)))

(declare-fun res!150255 () Bool)

(assert (=> b!180927 (=> res!150255 e!125685)))

(declare-fun lt!277708 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!180927 (= res!150255 (not (= lt!277708 (bvsub (bvsub (bvadd lt!277693 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!277704 () tuple2!15596)

(assert (=> b!180927 (= lt!277708 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277704))) (currentByte!8935 (_2!8443 lt!277704)) (currentBit!8930 (_2!8443 lt!277704))))))

(declare-fun isPrefixOf!0 (BitStream!7654 BitStream!7654) Bool)

(assert (=> b!180927 (isPrefixOf!0 thiss!1204 (_2!8443 lt!277704))))

(declare-fun lt!277707 () Unit!13004)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7654 BitStream!7654 BitStream!7654) Unit!13004)

(assert (=> b!180927 (= lt!277707 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8443 lt!277709) (_2!8443 lt!277704)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7654 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15596)

(assert (=> b!180927 (= lt!277704 (appendBitsLSBFirstLoopTR!0 (_2!8443 lt!277709) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180928 () Bool)

(declare-fun e!125679 () Bool)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180928 (= e!125679 (= (bvand (bvand v!189 (onesLSBLong!0 i!590)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180929 () Bool)

(declare-fun e!125684 () Bool)

(assert (=> b!180929 (= e!125689 e!125684)))

(declare-fun res!150249 () Bool)

(assert (=> b!180929 (=> (not res!150249) (not e!125684))))

(declare-datatypes ((tuple2!15598 0))(
  ( (tuple2!15599 (_1!8444 BitStream!7654) (_2!8444 Bool)) )
))
(declare-fun lt!277703 () tuple2!15598)

(assert (=> b!180929 (= res!150249 (and (= (_2!8444 lt!277703) lt!277696) (= (_1!8444 lt!277703) (_2!8443 lt!277709))))))

(declare-fun readBitPure!0 (BitStream!7654) tuple2!15598)

(declare-fun readerFrom!0 (BitStream!7654 (_ BitVec 32) (_ BitVec 32)) BitStream!7654)

(assert (=> b!180929 (= lt!277703 (readBitPure!0 (readerFrom!0 (_2!8443 lt!277709) (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204))))))

(declare-fun b!180930 () Bool)

(declare-fun res!150250 () Bool)

(assert (=> b!180930 (=> res!150250 e!125685)))

(assert (=> b!180930 (= res!150250 (not (isPrefixOf!0 (_2!8443 lt!277709) (_2!8443 lt!277704))))))

(declare-fun b!180931 () Bool)

(declare-fun e!125680 () Bool)

(declare-fun array_inv!4014 (array!9689) Bool)

(assert (=> b!180931 (= e!125680 (array_inv!4014 (buf!4719 thiss!1204)))))

(declare-fun b!180932 () Bool)

(declare-fun res!150247 () Bool)

(assert (=> b!180932 (=> res!150247 e!125685)))

(assert (=> b!180932 (= res!150247 (or (not (= (size!4273 (buf!4719 (_2!8443 lt!277704))) (size!4273 (buf!4719 thiss!1204)))) (not (= lt!277708 (bvsub (bvadd lt!277702 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!150253 () Bool)

(declare-fun e!125686 () Bool)

(assert (=> start!39836 (=> (not res!150253) (not e!125686))))

(assert (=> start!39836 (= res!150253 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39836 e!125686))

(assert (=> start!39836 true))

(declare-fun inv!12 (BitStream!7654) Bool)

(assert (=> start!39836 (and (inv!12 thiss!1204) e!125680)))

(declare-fun b!180933 () Bool)

(assert (=> b!180933 (= e!125686 e!125682)))

(declare-fun res!150245 () Bool)

(assert (=> b!180933 (=> (not res!150245) (not e!125682))))

(declare-fun lt!277699 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180933 (= res!150245 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 thiss!1204))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204)) lt!277699))))

(assert (=> b!180933 (= lt!277699 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!180934 () Bool)

(declare-fun e!125688 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180934 (= e!125688 (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277704)))))))

(declare-fun b!180935 () Bool)

(assert (=> b!180935 (= e!125684 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!277703))) (currentByte!8935 (_1!8444 lt!277703)) (currentBit!8930 (_1!8444 lt!277703))) lt!277694))))

(declare-fun b!180936 () Bool)

(declare-fun res!150252 () Bool)

(assert (=> b!180936 (=> (not res!150252) (not e!125689))))

(assert (=> b!180936 (= res!150252 (isPrefixOf!0 thiss!1204 (_2!8443 lt!277709)))))

(declare-fun b!180937 () Bool)

(declare-fun res!150258 () Bool)

(assert (=> b!180937 (=> res!150258 e!125685)))

(assert (=> b!180937 (= res!150258 (not (invariant!0 (currentBit!8930 (_2!8443 lt!277704)) (currentByte!8935 (_2!8443 lt!277704)) (size!4273 (buf!4719 (_2!8443 lt!277704))))))))

(declare-fun b!180938 () Bool)

(declare-fun res!150248 () Bool)

(assert (=> b!180938 (=> (not res!150248) (not e!125682))))

(assert (=> b!180938 (= res!150248 (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 thiss!1204))))))

(declare-fun b!180939 () Bool)

(declare-fun res!150257 () Bool)

(assert (=> b!180939 (=> (not res!150257) (not e!125682))))

(assert (=> b!180939 (= res!150257 (not (= i!590 nBits!348)))))

(declare-fun b!180940 () Bool)

(declare-fun e!125687 () Bool)

(declare-fun lt!277692 () tuple2!15598)

(declare-fun lt!277695 () tuple2!15598)

(assert (=> b!180940 (= e!125687 (= (_2!8444 lt!277692) (_2!8444 lt!277695)))))

(declare-fun b!180941 () Bool)

(declare-fun res!150254 () Bool)

(assert (=> b!180941 (=> res!150254 e!125685)))

(assert (=> b!180941 (= res!150254 (not (isPrefixOf!0 thiss!1204 (_2!8443 lt!277709))))))

(declare-fun b!180942 () Bool)

(assert (=> b!180942 (= e!125685 e!125679)))

(declare-fun res!150242 () Bool)

(assert (=> b!180942 (=> res!150242 e!125679)))

(declare-datatypes ((tuple2!15600 0))(
  ( (tuple2!15601 (_1!8445 BitStream!7654) (_2!8445 BitStream!7654)) )
))
(declare-fun lt!277705 () tuple2!15600)

(assert (=> b!180942 (= res!150242 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8445 lt!277705)))) ((_ sign_extend 32) (currentByte!8935 (_1!8445 lt!277705))) ((_ sign_extend 32) (currentBit!8930 (_1!8445 lt!277705))) lt!277699)))))

(assert (=> b!180942 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277704)))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204)) lt!277699)))

(declare-fun lt!277706 () Unit!13004)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7654 array!9689 (_ BitVec 64)) Unit!13004)

(assert (=> b!180942 (= lt!277706 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4719 (_2!8443 lt!277704)) lt!277699))))

(assert (=> b!180942 (= (_2!8444 (readBitPure!0 (_1!8445 lt!277705))) lt!277696)))

(declare-fun lt!277701 () tuple2!15600)

(declare-fun reader!0 (BitStream!7654 BitStream!7654) tuple2!15600)

(assert (=> b!180942 (= lt!277701 (reader!0 (_2!8443 lt!277709) (_2!8443 lt!277704)))))

(assert (=> b!180942 (= lt!277705 (reader!0 thiss!1204 (_2!8443 lt!277704)))))

(assert (=> b!180942 e!125687))

(declare-fun res!150256 () Bool)

(assert (=> b!180942 (=> (not res!150256) (not e!125687))))

(assert (=> b!180942 (= res!150256 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!277692))) (currentByte!8935 (_1!8444 lt!277692)) (currentBit!8930 (_1!8444 lt!277692))) (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!277695))) (currentByte!8935 (_1!8444 lt!277695)) (currentBit!8930 (_1!8444 lt!277695)))))))

(declare-fun lt!277697 () Unit!13004)

(declare-fun lt!277698 () BitStream!7654)

(declare-fun readBitPrefixLemma!0 (BitStream!7654 BitStream!7654) Unit!13004)

(assert (=> b!180942 (= lt!277697 (readBitPrefixLemma!0 lt!277698 (_2!8443 lt!277704)))))

(assert (=> b!180942 (= lt!277695 (readBitPure!0 (BitStream!7655 (buf!4719 (_2!8443 lt!277704)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204))))))

(assert (=> b!180942 (= lt!277692 (readBitPure!0 lt!277698))))

(assert (=> b!180942 e!125688))

(declare-fun res!150246 () Bool)

(assert (=> b!180942 (=> (not res!150246) (not e!125688))))

(assert (=> b!180942 (= res!150246 (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277709)))))))

(assert (=> b!180942 (= lt!277698 (BitStream!7655 (buf!4719 (_2!8443 lt!277709)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(assert (= (and start!39836 res!150253) b!180933))

(assert (= (and b!180933 res!150245) b!180938))

(assert (= (and b!180938 res!150248) b!180939))

(assert (= (and b!180939 res!150257) b!180926))

(assert (= (and b!180926 res!150243) b!180925))

(assert (= (and b!180925 res!150244) b!180936))

(assert (= (and b!180936 res!150252) b!180929))

(assert (= (and b!180929 res!150249) b!180935))

(assert (= (and b!180926 (not res!150251)) b!180927))

(assert (= (and b!180927 (not res!150255)) b!180937))

(assert (= (and b!180937 (not res!150258)) b!180932))

(assert (= (and b!180932 (not res!150247)) b!180930))

(assert (= (and b!180930 (not res!150250)) b!180941))

(assert (= (and b!180941 (not res!150254)) b!180942))

(assert (= (and b!180942 res!150246) b!180934))

(assert (= (and b!180942 res!150256) b!180940))

(assert (= (and b!180942 (not res!150242)) b!180928))

(assert (= start!39836 b!180931))

(declare-fun m!281647 () Bool)

(assert (=> b!180926 m!281647))

(declare-fun m!281649 () Bool)

(assert (=> b!180926 m!281649))

(declare-fun m!281651 () Bool)

(assert (=> b!180926 m!281651))

(declare-fun m!281653 () Bool)

(assert (=> b!180927 m!281653))

(declare-fun m!281655 () Bool)

(assert (=> b!180927 m!281655))

(declare-fun m!281657 () Bool)

(assert (=> b!180927 m!281657))

(declare-fun m!281659 () Bool)

(assert (=> b!180927 m!281659))

(declare-fun m!281661 () Bool)

(assert (=> b!180929 m!281661))

(assert (=> b!180929 m!281661))

(declare-fun m!281663 () Bool)

(assert (=> b!180929 m!281663))

(declare-fun m!281665 () Bool)

(assert (=> b!180931 m!281665))

(declare-fun m!281667 () Bool)

(assert (=> b!180930 m!281667))

(declare-fun m!281669 () Bool)

(assert (=> b!180941 m!281669))

(declare-fun m!281671 () Bool)

(assert (=> b!180937 m!281671))

(declare-fun m!281673 () Bool)

(assert (=> b!180934 m!281673))

(declare-fun m!281675 () Bool)

(assert (=> b!180928 m!281675))

(declare-fun m!281677 () Bool)

(assert (=> b!180928 m!281677))

(declare-fun m!281679 () Bool)

(assert (=> b!180942 m!281679))

(declare-fun m!281681 () Bool)

(assert (=> b!180942 m!281681))

(declare-fun m!281683 () Bool)

(assert (=> b!180942 m!281683))

(declare-fun m!281685 () Bool)

(assert (=> b!180942 m!281685))

(declare-fun m!281687 () Bool)

(assert (=> b!180942 m!281687))

(declare-fun m!281689 () Bool)

(assert (=> b!180942 m!281689))

(declare-fun m!281691 () Bool)

(assert (=> b!180942 m!281691))

(declare-fun m!281693 () Bool)

(assert (=> b!180942 m!281693))

(declare-fun m!281695 () Bool)

(assert (=> b!180942 m!281695))

(declare-fun m!281697 () Bool)

(assert (=> b!180942 m!281697))

(declare-fun m!281699 () Bool)

(assert (=> b!180942 m!281699))

(declare-fun m!281701 () Bool)

(assert (=> b!180942 m!281701))

(assert (=> b!180936 m!281669))

(assert (=> b!180925 m!281647))

(assert (=> b!180925 m!281649))

(declare-fun m!281703 () Bool)

(assert (=> b!180938 m!281703))

(declare-fun m!281705 () Bool)

(assert (=> b!180933 m!281705))

(declare-fun m!281707 () Bool)

(assert (=> b!180935 m!281707))

(declare-fun m!281709 () Bool)

(assert (=> start!39836 m!281709))

(push 1)

(assert (not start!39836))

(assert (not b!180934))

(assert (not b!180931))

(assert (not b!180930))

(assert (not b!180942))

(assert (not b!180928))

(assert (not b!180927))

(assert (not b!180933))

(assert (not b!180929))

(assert (not b!180941))

(assert (not b!180926))

(assert (not b!180936))

(assert (not b!180935))

(assert (not b!180937))

(assert (not b!180925))

(assert (not b!180938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63051 () Bool)

(declare-fun res!150412 () Bool)

(declare-fun e!125795 () Bool)

(assert (=> d!63051 (=> (not res!150412) (not e!125795))))

(assert (=> d!63051 (= res!150412 (= (size!4273 (buf!4719 thiss!1204)) (size!4273 (buf!4719 (_2!8443 lt!277709)))))))

(assert (=> d!63051 (= (isPrefixOf!0 thiss!1204 (_2!8443 lt!277709)) e!125795)))

(declare-fun b!181108 () Bool)

(declare-fun res!150411 () Bool)

(assert (=> b!181108 (=> (not res!150411) (not e!125795))))

(assert (=> b!181108 (= res!150411 (bvsle (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)) (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709)))))))

(declare-fun b!181109 () Bool)

(declare-fun e!125794 () Bool)

(assert (=> b!181109 (= e!125795 e!125794)))

(declare-fun res!150413 () Bool)

(assert (=> b!181109 (=> res!150413 e!125794)))

(assert (=> b!181109 (= res!150413 (= (size!4273 (buf!4719 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!181110 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9689 array!9689 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181110 (= e!125794 (arrayBitRangesEq!0 (buf!4719 thiss!1204) (buf!4719 (_2!8443 lt!277709)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204))))))

(assert (= (and d!63051 res!150412) b!181108))

(assert (= (and b!181108 res!150411) b!181109))

(assert (= (and b!181109 (not res!150413)) b!181110))

(assert (=> b!181108 m!281649))

(assert (=> b!181108 m!281647))

(assert (=> b!181110 m!281649))

(assert (=> b!181110 m!281649))

(declare-fun m!281943 () Bool)

(assert (=> b!181110 m!281943))

(assert (=> b!180936 d!63051))

(declare-fun d!63053 () Bool)

(declare-fun e!125798 () Bool)

(assert (=> d!63053 e!125798))

(declare-fun res!150418 () Bool)

(assert (=> d!63053 (=> (not res!150418) (not e!125798))))

(declare-fun lt!277983 () (_ BitVec 64))

(declare-fun lt!277987 () (_ BitVec 64))

(declare-fun lt!277984 () (_ BitVec 64))

(assert (=> d!63053 (= res!150418 (= lt!277987 (bvsub lt!277984 lt!277983)))))

(assert (=> d!63053 (or (= (bvand lt!277984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277983 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277984 lt!277983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63053 (= lt!277983 (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277709)))) ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277709))) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277709)))))))

(declare-fun lt!277985 () (_ BitVec 64))

(declare-fun lt!277986 () (_ BitVec 64))

(assert (=> d!63053 (= lt!277984 (bvmul lt!277985 lt!277986))))

(assert (=> d!63053 (or (= lt!277985 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277986 (bvsdiv (bvmul lt!277985 lt!277986) lt!277985)))))

(assert (=> d!63053 (= lt!277986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63053 (= lt!277985 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277709)))))))

(assert (=> d!63053 (= lt!277987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277709))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277709)))))))

(assert (=> d!63053 (invariant!0 (currentBit!8930 (_2!8443 lt!277709)) (currentByte!8935 (_2!8443 lt!277709)) (size!4273 (buf!4719 (_2!8443 lt!277709))))))

(assert (=> d!63053 (= (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))) lt!277987)))

(declare-fun b!181115 () Bool)

(declare-fun res!150419 () Bool)

(assert (=> b!181115 (=> (not res!150419) (not e!125798))))

(assert (=> b!181115 (= res!150419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277987))))

(declare-fun b!181116 () Bool)

(declare-fun lt!277982 () (_ BitVec 64))

(assert (=> b!181116 (= e!125798 (bvsle lt!277987 (bvmul lt!277982 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181116 (or (= lt!277982 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277982 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277982)))))

(assert (=> b!181116 (= lt!277982 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277709)))))))

(assert (= (and d!63053 res!150418) b!181115))

(assert (= (and b!181115 res!150419) b!181116))

(declare-fun m!281945 () Bool)

(assert (=> d!63053 m!281945))

(declare-fun m!281947 () Bool)

(assert (=> d!63053 m!281947))

(assert (=> b!180925 d!63053))

(declare-fun d!63055 () Bool)

(declare-fun e!125799 () Bool)

(assert (=> d!63055 e!125799))

(declare-fun res!150420 () Bool)

(assert (=> d!63055 (=> (not res!150420) (not e!125799))))

(declare-fun lt!277990 () (_ BitVec 64))

(declare-fun lt!277993 () (_ BitVec 64))

(declare-fun lt!277989 () (_ BitVec 64))

(assert (=> d!63055 (= res!150420 (= lt!277993 (bvsub lt!277990 lt!277989)))))

(assert (=> d!63055 (or (= (bvand lt!277990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277989 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277990 lt!277989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63055 (= lt!277989 (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 thiss!1204))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204))))))

(declare-fun lt!277991 () (_ BitVec 64))

(declare-fun lt!277992 () (_ BitVec 64))

(assert (=> d!63055 (= lt!277990 (bvmul lt!277991 lt!277992))))

(assert (=> d!63055 (or (= lt!277991 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!277992 (bvsdiv (bvmul lt!277991 lt!277992) lt!277991)))))

(assert (=> d!63055 (= lt!277992 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63055 (= lt!277991 ((_ sign_extend 32) (size!4273 (buf!4719 thiss!1204))))))

(assert (=> d!63055 (= lt!277993 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8935 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8930 thiss!1204))))))

(assert (=> d!63055 (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 thiss!1204)))))

(assert (=> d!63055 (= (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)) lt!277993)))

(declare-fun b!181117 () Bool)

(declare-fun res!150421 () Bool)

(assert (=> b!181117 (=> (not res!150421) (not e!125799))))

(assert (=> b!181117 (= res!150421 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!277993))))

(declare-fun b!181118 () Bool)

(declare-fun lt!277988 () (_ BitVec 64))

(assert (=> b!181118 (= e!125799 (bvsle lt!277993 (bvmul lt!277988 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181118 (or (= lt!277988 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!277988 #b0000000000000000000000000000000000000000000000000000000000001000) lt!277988)))))

(assert (=> b!181118 (= lt!277988 ((_ sign_extend 32) (size!4273 (buf!4719 thiss!1204))))))

(assert (= (and d!63055 res!150420) b!181117))

(assert (= (and b!181117 res!150421) b!181118))

(declare-fun m!281949 () Bool)

(assert (=> d!63055 m!281949))

(assert (=> d!63055 m!281703))

(assert (=> b!180925 d!63055))

(assert (=> b!180926 d!63053))

(assert (=> b!180926 d!63055))

(declare-fun d!63057 () Bool)

(declare-fun e!125805 () Bool)

(assert (=> d!63057 e!125805))

(declare-fun res!150432 () Bool)

(assert (=> d!63057 (=> (not res!150432) (not e!125805))))

(declare-fun lt!278005 () tuple2!15596)

(assert (=> d!63057 (= res!150432 (= (size!4273 (buf!4719 thiss!1204)) (size!4273 (buf!4719 (_2!8443 lt!278005)))))))

(declare-fun choose!16 (BitStream!7654 Bool) tuple2!15596)

(assert (=> d!63057 (= lt!278005 (choose!16 thiss!1204 lt!277696))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63057 (validate_offset_bit!0 ((_ sign_extend 32) (size!4273 (buf!4719 thiss!1204))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204)))))

(assert (=> d!63057 (= (appendBit!0 thiss!1204 lt!277696) lt!278005)))

(declare-fun b!181129 () Bool)

(declare-fun res!150430 () Bool)

(assert (=> b!181129 (=> (not res!150430) (not e!125805))))

(assert (=> b!181129 (= res!150430 (isPrefixOf!0 thiss!1204 (_2!8443 lt!278005)))))

(declare-fun b!181128 () Bool)

(declare-fun res!150431 () Bool)

(assert (=> b!181128 (=> (not res!150431) (not e!125805))))

(declare-fun lt!278003 () (_ BitVec 64))

(declare-fun lt!278004 () (_ BitVec 64))

(assert (=> b!181128 (= res!150431 (= (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278005))) (currentByte!8935 (_2!8443 lt!278005)) (currentBit!8930 (_2!8443 lt!278005))) (bvadd lt!278004 lt!278003)))))

(assert (=> b!181128 (or (not (= (bvand lt!278004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278003 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!278004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!278004 lt!278003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181128 (= lt!278003 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!181128 (= lt!278004 (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(declare-fun b!181130 () Bool)

(declare-fun e!125804 () Bool)

(assert (=> b!181130 (= e!125805 e!125804)))

(declare-fun res!150433 () Bool)

(assert (=> b!181130 (=> (not res!150433) (not e!125804))))

(declare-fun lt!278002 () tuple2!15598)

(assert (=> b!181130 (= res!150433 (and (= (_2!8444 lt!278002) lt!277696) (= (_1!8444 lt!278002) (_2!8443 lt!278005))))))

(assert (=> b!181130 (= lt!278002 (readBitPure!0 (readerFrom!0 (_2!8443 lt!278005) (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204))))))

(declare-fun b!181131 () Bool)

(assert (=> b!181131 (= e!125804 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!278002))) (currentByte!8935 (_1!8444 lt!278002)) (currentBit!8930 (_1!8444 lt!278002))) (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278005))) (currentByte!8935 (_2!8443 lt!278005)) (currentBit!8930 (_2!8443 lt!278005)))))))

(assert (= (and d!63057 res!150432) b!181128))

(assert (= (and b!181128 res!150431) b!181129))

(assert (= (and b!181129 res!150430) b!181130))

(assert (= (and b!181130 res!150433) b!181131))

(declare-fun m!281951 () Bool)

(assert (=> b!181128 m!281951))

(assert (=> b!181128 m!281649))

(declare-fun m!281953 () Bool)

(assert (=> d!63057 m!281953))

(declare-fun m!281955 () Bool)

(assert (=> d!63057 m!281955))

(declare-fun m!281957 () Bool)

(assert (=> b!181130 m!281957))

(assert (=> b!181130 m!281957))

(declare-fun m!281959 () Bool)

(assert (=> b!181130 m!281959))

(declare-fun m!281961 () Bool)

(assert (=> b!181131 m!281961))

(assert (=> b!181131 m!281951))

(declare-fun m!281963 () Bool)

(assert (=> b!181129 m!281963))

(assert (=> b!180926 d!63057))

(declare-fun d!63065 () Bool)

(declare-fun e!125806 () Bool)

(assert (=> d!63065 e!125806))

(declare-fun res!150434 () Bool)

(assert (=> d!63065 (=> (not res!150434) (not e!125806))))

(declare-fun lt!278007 () (_ BitVec 64))

(declare-fun lt!278008 () (_ BitVec 64))

(declare-fun lt!278011 () (_ BitVec 64))

(assert (=> d!63065 (= res!150434 (= lt!278011 (bvsub lt!278008 lt!278007)))))

(assert (=> d!63065 (or (= (bvand lt!278008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278008 lt!278007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63065 (= lt!278007 (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277703)))) ((_ sign_extend 32) (currentByte!8935 (_1!8444 lt!277703))) ((_ sign_extend 32) (currentBit!8930 (_1!8444 lt!277703)))))))

(declare-fun lt!278009 () (_ BitVec 64))

(declare-fun lt!278010 () (_ BitVec 64))

(assert (=> d!63065 (= lt!278008 (bvmul lt!278009 lt!278010))))

(assert (=> d!63065 (or (= lt!278009 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278010 (bvsdiv (bvmul lt!278009 lt!278010) lt!278009)))))

(assert (=> d!63065 (= lt!278010 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63065 (= lt!278009 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277703)))))))

(assert (=> d!63065 (= lt!278011 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8935 (_1!8444 lt!277703))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8930 (_1!8444 lt!277703)))))))

(assert (=> d!63065 (invariant!0 (currentBit!8930 (_1!8444 lt!277703)) (currentByte!8935 (_1!8444 lt!277703)) (size!4273 (buf!4719 (_1!8444 lt!277703))))))

(assert (=> d!63065 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!277703))) (currentByte!8935 (_1!8444 lt!277703)) (currentBit!8930 (_1!8444 lt!277703))) lt!278011)))

(declare-fun b!181132 () Bool)

(declare-fun res!150435 () Bool)

(assert (=> b!181132 (=> (not res!150435) (not e!125806))))

(assert (=> b!181132 (= res!150435 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278011))))

(declare-fun b!181133 () Bool)

(declare-fun lt!278006 () (_ BitVec 64))

(assert (=> b!181133 (= e!125806 (bvsle lt!278011 (bvmul lt!278006 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181133 (or (= lt!278006 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278006 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278006)))))

(assert (=> b!181133 (= lt!278006 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277703)))))))

(assert (= (and d!63065 res!150434) b!181132))

(assert (= (and b!181132 res!150435) b!181133))

(declare-fun m!281965 () Bool)

(assert (=> d!63065 m!281965))

(declare-fun m!281967 () Bool)

(assert (=> d!63065 m!281967))

(assert (=> b!180935 d!63065))

(declare-fun d!63067 () Bool)

(assert (=> d!63067 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 thiss!1204))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204)) lt!277699) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 thiss!1204))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204))) lt!277699))))

(declare-fun bs!15709 () Bool)

(assert (= bs!15709 d!63067))

(assert (=> bs!15709 m!281949))

(assert (=> b!180933 d!63067))

(declare-fun d!63069 () Bool)

(assert (=> d!63069 (= (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277704)))) (and (bvsge (currentBit!8930 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8930 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8935 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277704)))) (and (= (currentBit!8930 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277704))))))))))

(assert (=> b!180934 d!63069))

(assert (=> b!180941 d!63051))

(declare-fun d!63071 () Bool)

(declare-datatypes ((tuple2!15618 0))(
  ( (tuple2!15619 (_1!8454 Bool) (_2!8454 BitStream!7654)) )
))
(declare-fun lt!278014 () tuple2!15618)

(declare-fun readBit!0 (BitStream!7654) tuple2!15618)

(assert (=> d!63071 (= lt!278014 (readBit!0 lt!277698))))

(assert (=> d!63071 (= (readBitPure!0 lt!277698) (tuple2!15599 (_2!8454 lt!278014) (_1!8454 lt!278014)))))

(declare-fun bs!15710 () Bool)

(assert (= bs!15710 d!63071))

(declare-fun m!281969 () Bool)

(assert (=> bs!15710 m!281969))

(assert (=> b!180942 d!63071))

(declare-fun d!63073 () Bool)

(declare-fun e!125812 () Bool)

(assert (=> d!63073 e!125812))

(declare-fun res!150444 () Bool)

(assert (=> d!63073 (=> (not res!150444) (not e!125812))))

(declare-fun lt!278041 () tuple2!15598)

(declare-fun lt!278044 () tuple2!15598)

(assert (=> d!63073 (= res!150444 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!278041))) (currentByte!8935 (_1!8444 lt!278041)) (currentBit!8930 (_1!8444 lt!278041))) (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!278044))) (currentByte!8935 (_1!8444 lt!278044)) (currentBit!8930 (_1!8444 lt!278044)))))))

(declare-fun lt!278043 () Unit!13004)

(declare-fun lt!278042 () BitStream!7654)

(declare-fun choose!50 (BitStream!7654 BitStream!7654 BitStream!7654 tuple2!15598 tuple2!15598 BitStream!7654 Bool tuple2!15598 tuple2!15598 BitStream!7654 Bool) Unit!13004)

(assert (=> d!63073 (= lt!278043 (choose!50 lt!277698 (_2!8443 lt!277704) lt!278042 lt!278041 (tuple2!15599 (_1!8444 lt!278041) (_2!8444 lt!278041)) (_1!8444 lt!278041) (_2!8444 lt!278041) lt!278044 (tuple2!15599 (_1!8444 lt!278044) (_2!8444 lt!278044)) (_1!8444 lt!278044) (_2!8444 lt!278044)))))

(assert (=> d!63073 (= lt!278044 (readBitPure!0 lt!278042))))

(assert (=> d!63073 (= lt!278041 (readBitPure!0 lt!277698))))

(assert (=> d!63073 (= lt!278042 (BitStream!7655 (buf!4719 (_2!8443 lt!277704)) (currentByte!8935 lt!277698) (currentBit!8930 lt!277698)))))

(assert (=> d!63073 (invariant!0 (currentBit!8930 lt!277698) (currentByte!8935 lt!277698) (size!4273 (buf!4719 (_2!8443 lt!277704))))))

(assert (=> d!63073 (= (readBitPrefixLemma!0 lt!277698 (_2!8443 lt!277704)) lt!278043)))

(declare-fun b!181142 () Bool)

(assert (=> b!181142 (= e!125812 (= (_2!8444 lt!278041) (_2!8444 lt!278044)))))

(assert (= (and d!63073 res!150444) b!181142))

(declare-fun m!281973 () Bool)

(assert (=> d!63073 m!281973))

(declare-fun m!281975 () Bool)

(assert (=> d!63073 m!281975))

(assert (=> d!63073 m!281693))

(declare-fun m!281977 () Bool)

(assert (=> d!63073 m!281977))

(declare-fun m!281979 () Bool)

(assert (=> d!63073 m!281979))

(declare-fun m!281981 () Bool)

(assert (=> d!63073 m!281981))

(assert (=> b!180942 d!63073))

(declare-fun d!63077 () Bool)

(assert (=> d!63077 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277704)))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204)) lt!277699) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277704)))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204))) lt!277699))))

(declare-fun bs!15711 () Bool)

(assert (= bs!15711 d!63077))

(declare-fun m!281983 () Bool)

(assert (=> bs!15711 m!281983))

(assert (=> b!180942 d!63077))

(declare-fun d!63079 () Bool)

(declare-fun e!125813 () Bool)

(assert (=> d!63079 e!125813))

(declare-fun res!150445 () Bool)

(assert (=> d!63079 (=> (not res!150445) (not e!125813))))

(declare-fun lt!278047 () (_ BitVec 64))

(declare-fun lt!278050 () (_ BitVec 64))

(declare-fun lt!278046 () (_ BitVec 64))

(assert (=> d!63079 (= res!150445 (= lt!278050 (bvsub lt!278047 lt!278046)))))

(assert (=> d!63079 (or (= (bvand lt!278047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278046 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278047 lt!278046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63079 (= lt!278046 (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277692)))) ((_ sign_extend 32) (currentByte!8935 (_1!8444 lt!277692))) ((_ sign_extend 32) (currentBit!8930 (_1!8444 lt!277692)))))))

(declare-fun lt!278048 () (_ BitVec 64))

(declare-fun lt!278049 () (_ BitVec 64))

(assert (=> d!63079 (= lt!278047 (bvmul lt!278048 lt!278049))))

(assert (=> d!63079 (or (= lt!278048 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278049 (bvsdiv (bvmul lt!278048 lt!278049) lt!278048)))))

(assert (=> d!63079 (= lt!278049 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63079 (= lt!278048 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277692)))))))

(assert (=> d!63079 (= lt!278050 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8935 (_1!8444 lt!277692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8930 (_1!8444 lt!277692)))))))

(assert (=> d!63079 (invariant!0 (currentBit!8930 (_1!8444 lt!277692)) (currentByte!8935 (_1!8444 lt!277692)) (size!4273 (buf!4719 (_1!8444 lt!277692))))))

(assert (=> d!63079 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!277692))) (currentByte!8935 (_1!8444 lt!277692)) (currentBit!8930 (_1!8444 lt!277692))) lt!278050)))

(declare-fun b!181143 () Bool)

(declare-fun res!150446 () Bool)

(assert (=> b!181143 (=> (not res!150446) (not e!125813))))

(assert (=> b!181143 (= res!150446 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278050))))

(declare-fun b!181144 () Bool)

(declare-fun lt!278045 () (_ BitVec 64))

(assert (=> b!181144 (= e!125813 (bvsle lt!278050 (bvmul lt!278045 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181144 (or (= lt!278045 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278045 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278045)))))

(assert (=> b!181144 (= lt!278045 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277692)))))))

(assert (= (and d!63079 res!150445) b!181143))

(assert (= (and b!181143 res!150446) b!181144))

(declare-fun m!281985 () Bool)

(assert (=> d!63079 m!281985))

(declare-fun m!281987 () Bool)

(assert (=> d!63079 m!281987))

(assert (=> b!180942 d!63079))

(declare-fun d!63081 () Bool)

(assert (=> d!63081 (= (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277709)))) (and (bvsge (currentBit!8930 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8930 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8935 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277709)))) (and (= (currentBit!8930 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277709))))))))))

(assert (=> b!180942 d!63081))

(declare-fun d!63083 () Bool)

(declare-fun e!125814 () Bool)

(assert (=> d!63083 e!125814))

(declare-fun res!150447 () Bool)

(assert (=> d!63083 (=> (not res!150447) (not e!125814))))

(declare-fun lt!278056 () (_ BitVec 64))

(declare-fun lt!278053 () (_ BitVec 64))

(declare-fun lt!278052 () (_ BitVec 64))

(assert (=> d!63083 (= res!150447 (= lt!278056 (bvsub lt!278053 lt!278052)))))

(assert (=> d!63083 (or (= (bvand lt!278053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278053 lt!278052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63083 (= lt!278052 (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277695)))) ((_ sign_extend 32) (currentByte!8935 (_1!8444 lt!277695))) ((_ sign_extend 32) (currentBit!8930 (_1!8444 lt!277695)))))))

(declare-fun lt!278054 () (_ BitVec 64))

(declare-fun lt!278055 () (_ BitVec 64))

(assert (=> d!63083 (= lt!278053 (bvmul lt!278054 lt!278055))))

(assert (=> d!63083 (or (= lt!278054 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278055 (bvsdiv (bvmul lt!278054 lt!278055) lt!278054)))))

(assert (=> d!63083 (= lt!278055 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63083 (= lt!278054 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277695)))))))

(assert (=> d!63083 (= lt!278056 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8935 (_1!8444 lt!277695))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8930 (_1!8444 lt!277695)))))))

(assert (=> d!63083 (invariant!0 (currentBit!8930 (_1!8444 lt!277695)) (currentByte!8935 (_1!8444 lt!277695)) (size!4273 (buf!4719 (_1!8444 lt!277695))))))

(assert (=> d!63083 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!277695))) (currentByte!8935 (_1!8444 lt!277695)) (currentBit!8930 (_1!8444 lt!277695))) lt!278056)))

(declare-fun b!181145 () Bool)

(declare-fun res!150448 () Bool)

(assert (=> b!181145 (=> (not res!150448) (not e!125814))))

(assert (=> b!181145 (= res!150448 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278056))))

(declare-fun b!181146 () Bool)

(declare-fun lt!278051 () (_ BitVec 64))

(assert (=> b!181146 (= e!125814 (bvsle lt!278056 (bvmul lt!278051 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181146 (or (= lt!278051 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278051 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278051)))))

(assert (=> b!181146 (= lt!278051 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8444 lt!277695)))))))

(assert (= (and d!63083 res!150447) b!181145))

(assert (= (and b!181145 res!150448) b!181146))

(declare-fun m!281989 () Bool)

(assert (=> d!63083 m!281989))

(declare-fun m!281991 () Bool)

(assert (=> d!63083 m!281991))

(assert (=> b!180942 d!63083))

(declare-fun d!63085 () Bool)

(assert (=> d!63085 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8445 lt!277705)))) ((_ sign_extend 32) (currentByte!8935 (_1!8445 lt!277705))) ((_ sign_extend 32) (currentBit!8930 (_1!8445 lt!277705))) lt!277699) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 (_1!8445 lt!277705)))) ((_ sign_extend 32) (currentByte!8935 (_1!8445 lt!277705))) ((_ sign_extend 32) (currentBit!8930 (_1!8445 lt!277705)))) lt!277699))))

(declare-fun bs!15712 () Bool)

(assert (= bs!15712 d!63085))

(declare-fun m!281993 () Bool)

(assert (=> bs!15712 m!281993))

(assert (=> b!180942 d!63085))

(declare-fun d!63087 () Bool)

(assert (=> d!63087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277704)))) ((_ sign_extend 32) (currentByte!8935 thiss!1204)) ((_ sign_extend 32) (currentBit!8930 thiss!1204)) lt!277699)))

(declare-fun lt!278059 () Unit!13004)

(declare-fun choose!9 (BitStream!7654 array!9689 (_ BitVec 64) BitStream!7654) Unit!13004)

(assert (=> d!63087 (= lt!278059 (choose!9 thiss!1204 (buf!4719 (_2!8443 lt!277704)) lt!277699 (BitStream!7655 (buf!4719 (_2!8443 lt!277704)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204))))))

(assert (=> d!63087 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4719 (_2!8443 lt!277704)) lt!277699) lt!278059)))

(declare-fun bs!15713 () Bool)

(assert (= bs!15713 d!63087))

(assert (=> bs!15713 m!281697))

(declare-fun m!281997 () Bool)

(assert (=> bs!15713 m!281997))

(assert (=> b!180942 d!63087))

(declare-fun b!181166 () Bool)

(declare-fun lt!278118 () tuple2!15600)

(declare-fun lt!278119 () (_ BitVec 64))

(declare-fun lt!278109 () (_ BitVec 64))

(declare-fun e!125826 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7654 (_ BitVec 64)) BitStream!7654)

(assert (=> b!181166 (= e!125826 (= (_1!8445 lt!278118) (withMovedBitIndex!0 (_2!8445 lt!278118) (bvsub lt!278119 lt!278109))))))

(assert (=> b!181166 (or (= (bvand lt!278119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278119 lt!278109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181166 (= lt!278109 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277704))) (currentByte!8935 (_2!8443 lt!277704)) (currentBit!8930 (_2!8443 lt!277704))))))

(assert (=> b!181166 (= lt!278119 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))))))

(declare-fun b!181167 () Bool)

(declare-fun e!125825 () Unit!13004)

(declare-fun lt!278112 () Unit!13004)

(assert (=> b!181167 (= e!125825 lt!278112)))

(declare-fun lt!278116 () (_ BitVec 64))

(assert (=> b!181167 (= lt!278116 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!278113 () (_ BitVec 64))

(assert (=> b!181167 (= lt!278113 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9689 array!9689 (_ BitVec 64) (_ BitVec 64)) Unit!13004)

(assert (=> b!181167 (= lt!278112 (arrayBitRangesEqSymmetric!0 (buf!4719 (_2!8443 lt!277709)) (buf!4719 (_2!8443 lt!277704)) lt!278116 lt!278113))))

(assert (=> b!181167 (arrayBitRangesEq!0 (buf!4719 (_2!8443 lt!277704)) (buf!4719 (_2!8443 lt!277709)) lt!278116 lt!278113)))

(declare-fun b!181168 () Bool)

(declare-fun Unit!13023 () Unit!13004)

(assert (=> b!181168 (= e!125825 Unit!13023)))

(declare-fun b!181169 () Bool)

(declare-fun res!150464 () Bool)

(assert (=> b!181169 (=> (not res!150464) (not e!125826))))

(assert (=> b!181169 (= res!150464 (isPrefixOf!0 (_1!8445 lt!278118) (_2!8443 lt!277709)))))

(declare-fun b!181170 () Bool)

(declare-fun res!150465 () Bool)

(assert (=> b!181170 (=> (not res!150465) (not e!125826))))

(assert (=> b!181170 (= res!150465 (isPrefixOf!0 (_2!8445 lt!278118) (_2!8443 lt!277704)))))

(declare-fun d!63091 () Bool)

(assert (=> d!63091 e!125826))

(declare-fun res!150466 () Bool)

(assert (=> d!63091 (=> (not res!150466) (not e!125826))))

(assert (=> d!63091 (= res!150466 (isPrefixOf!0 (_1!8445 lt!278118) (_2!8445 lt!278118)))))

(declare-fun lt!278106 () BitStream!7654)

(assert (=> d!63091 (= lt!278118 (tuple2!15601 lt!278106 (_2!8443 lt!277704)))))

(declare-fun lt!278111 () Unit!13004)

(declare-fun lt!278120 () Unit!13004)

(assert (=> d!63091 (= lt!278111 lt!278120)))

(assert (=> d!63091 (isPrefixOf!0 lt!278106 (_2!8443 lt!277704))))

(assert (=> d!63091 (= lt!278120 (lemmaIsPrefixTransitive!0 lt!278106 (_2!8443 lt!277704) (_2!8443 lt!277704)))))

(declare-fun lt!278121 () Unit!13004)

(declare-fun lt!278105 () Unit!13004)

(assert (=> d!63091 (= lt!278121 lt!278105)))

(assert (=> d!63091 (isPrefixOf!0 lt!278106 (_2!8443 lt!277704))))

(assert (=> d!63091 (= lt!278105 (lemmaIsPrefixTransitive!0 lt!278106 (_2!8443 lt!277709) (_2!8443 lt!277704)))))

(declare-fun lt!278104 () Unit!13004)

(assert (=> d!63091 (= lt!278104 e!125825)))

(declare-fun c!9343 () Bool)

(assert (=> d!63091 (= c!9343 (not (= (size!4273 (buf!4719 (_2!8443 lt!277709))) #b00000000000000000000000000000000)))))

(declare-fun lt!278114 () Unit!13004)

(declare-fun lt!278107 () Unit!13004)

(assert (=> d!63091 (= lt!278114 lt!278107)))

(assert (=> d!63091 (isPrefixOf!0 (_2!8443 lt!277704) (_2!8443 lt!277704))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7654) Unit!13004)

(assert (=> d!63091 (= lt!278107 (lemmaIsPrefixRefl!0 (_2!8443 lt!277704)))))

(declare-fun lt!278117 () Unit!13004)

(declare-fun lt!278108 () Unit!13004)

(assert (=> d!63091 (= lt!278117 lt!278108)))

(assert (=> d!63091 (= lt!278108 (lemmaIsPrefixRefl!0 (_2!8443 lt!277704)))))

(declare-fun lt!278110 () Unit!13004)

(declare-fun lt!278122 () Unit!13004)

(assert (=> d!63091 (= lt!278110 lt!278122)))

(assert (=> d!63091 (isPrefixOf!0 lt!278106 lt!278106)))

(assert (=> d!63091 (= lt!278122 (lemmaIsPrefixRefl!0 lt!278106))))

(declare-fun lt!278115 () Unit!13004)

(declare-fun lt!278103 () Unit!13004)

(assert (=> d!63091 (= lt!278115 lt!278103)))

(assert (=> d!63091 (isPrefixOf!0 (_2!8443 lt!277709) (_2!8443 lt!277709))))

(assert (=> d!63091 (= lt!278103 (lemmaIsPrefixRefl!0 (_2!8443 lt!277709)))))

(assert (=> d!63091 (= lt!278106 (BitStream!7655 (buf!4719 (_2!8443 lt!277704)) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))))))

(assert (=> d!63091 (isPrefixOf!0 (_2!8443 lt!277709) (_2!8443 lt!277704))))

(assert (=> d!63091 (= (reader!0 (_2!8443 lt!277709) (_2!8443 lt!277704)) lt!278118)))

(assert (= (and d!63091 c!9343) b!181167))

(assert (= (and d!63091 (not c!9343)) b!181168))

(assert (= (and d!63091 res!150466) b!181169))

(assert (= (and b!181169 res!150464) b!181170))

(assert (= (and b!181170 res!150465) b!181166))

(declare-fun m!282001 () Bool)

(assert (=> b!181169 m!282001))

(declare-fun m!282003 () Bool)

(assert (=> d!63091 m!282003))

(declare-fun m!282005 () Bool)

(assert (=> d!63091 m!282005))

(declare-fun m!282007 () Bool)

(assert (=> d!63091 m!282007))

(declare-fun m!282009 () Bool)

(assert (=> d!63091 m!282009))

(declare-fun m!282011 () Bool)

(assert (=> d!63091 m!282011))

(declare-fun m!282013 () Bool)

(assert (=> d!63091 m!282013))

(assert (=> d!63091 m!281667))

(declare-fun m!282015 () Bool)

(assert (=> d!63091 m!282015))

(declare-fun m!282017 () Bool)

(assert (=> d!63091 m!282017))

(declare-fun m!282019 () Bool)

(assert (=> d!63091 m!282019))

(declare-fun m!282021 () Bool)

(assert (=> d!63091 m!282021))

(assert (=> b!181167 m!281647))

(declare-fun m!282023 () Bool)

(assert (=> b!181167 m!282023))

(declare-fun m!282025 () Bool)

(assert (=> b!181167 m!282025))

(declare-fun m!282027 () Bool)

(assert (=> b!181170 m!282027))

(declare-fun m!282029 () Bool)

(assert (=> b!181166 m!282029))

(assert (=> b!181166 m!281653))

(assert (=> b!181166 m!281647))

(assert (=> b!180942 d!63091))

(declare-fun b!181171 () Bool)

(declare-fun lt!278129 () (_ BitVec 64))

(declare-fun lt!278138 () tuple2!15600)

(declare-fun e!125828 () Bool)

(declare-fun lt!278139 () (_ BitVec 64))

(assert (=> b!181171 (= e!125828 (= (_1!8445 lt!278138) (withMovedBitIndex!0 (_2!8445 lt!278138) (bvsub lt!278139 lt!278129))))))

(assert (=> b!181171 (or (= (bvand lt!278139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278129 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278139 lt!278129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181171 (= lt!278129 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277704))) (currentByte!8935 (_2!8443 lt!277704)) (currentBit!8930 (_2!8443 lt!277704))))))

(assert (=> b!181171 (= lt!278139 (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(declare-fun b!181172 () Bool)

(declare-fun e!125827 () Unit!13004)

(declare-fun lt!278132 () Unit!13004)

(assert (=> b!181172 (= e!125827 lt!278132)))

(declare-fun lt!278136 () (_ BitVec 64))

(assert (=> b!181172 (= lt!278136 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!278133 () (_ BitVec 64))

(assert (=> b!181172 (= lt!278133 (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(assert (=> b!181172 (= lt!278132 (arrayBitRangesEqSymmetric!0 (buf!4719 thiss!1204) (buf!4719 (_2!8443 lt!277704)) lt!278136 lt!278133))))

(assert (=> b!181172 (arrayBitRangesEq!0 (buf!4719 (_2!8443 lt!277704)) (buf!4719 thiss!1204) lt!278136 lt!278133)))

(declare-fun b!181173 () Bool)

(declare-fun Unit!13024 () Unit!13004)

(assert (=> b!181173 (= e!125827 Unit!13024)))

(declare-fun b!181174 () Bool)

(declare-fun res!150467 () Bool)

(assert (=> b!181174 (=> (not res!150467) (not e!125828))))

(assert (=> b!181174 (= res!150467 (isPrefixOf!0 (_1!8445 lt!278138) thiss!1204))))

(declare-fun b!181175 () Bool)

(declare-fun res!150468 () Bool)

(assert (=> b!181175 (=> (not res!150468) (not e!125828))))

(assert (=> b!181175 (= res!150468 (isPrefixOf!0 (_2!8445 lt!278138) (_2!8443 lt!277704)))))

(declare-fun d!63095 () Bool)

(assert (=> d!63095 e!125828))

(declare-fun res!150469 () Bool)

(assert (=> d!63095 (=> (not res!150469) (not e!125828))))

(assert (=> d!63095 (= res!150469 (isPrefixOf!0 (_1!8445 lt!278138) (_2!8445 lt!278138)))))

(declare-fun lt!278126 () BitStream!7654)

(assert (=> d!63095 (= lt!278138 (tuple2!15601 lt!278126 (_2!8443 lt!277704)))))

(declare-fun lt!278131 () Unit!13004)

(declare-fun lt!278140 () Unit!13004)

(assert (=> d!63095 (= lt!278131 lt!278140)))

(assert (=> d!63095 (isPrefixOf!0 lt!278126 (_2!8443 lt!277704))))

(assert (=> d!63095 (= lt!278140 (lemmaIsPrefixTransitive!0 lt!278126 (_2!8443 lt!277704) (_2!8443 lt!277704)))))

(declare-fun lt!278141 () Unit!13004)

(declare-fun lt!278125 () Unit!13004)

(assert (=> d!63095 (= lt!278141 lt!278125)))

(assert (=> d!63095 (isPrefixOf!0 lt!278126 (_2!8443 lt!277704))))

(assert (=> d!63095 (= lt!278125 (lemmaIsPrefixTransitive!0 lt!278126 thiss!1204 (_2!8443 lt!277704)))))

(declare-fun lt!278124 () Unit!13004)

(assert (=> d!63095 (= lt!278124 e!125827)))

(declare-fun c!9344 () Bool)

(assert (=> d!63095 (= c!9344 (not (= (size!4273 (buf!4719 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!278134 () Unit!13004)

(declare-fun lt!278127 () Unit!13004)

(assert (=> d!63095 (= lt!278134 lt!278127)))

(assert (=> d!63095 (isPrefixOf!0 (_2!8443 lt!277704) (_2!8443 lt!277704))))

(assert (=> d!63095 (= lt!278127 (lemmaIsPrefixRefl!0 (_2!8443 lt!277704)))))

(declare-fun lt!278137 () Unit!13004)

(declare-fun lt!278128 () Unit!13004)

(assert (=> d!63095 (= lt!278137 lt!278128)))

(assert (=> d!63095 (= lt!278128 (lemmaIsPrefixRefl!0 (_2!8443 lt!277704)))))

(declare-fun lt!278130 () Unit!13004)

(declare-fun lt!278142 () Unit!13004)

(assert (=> d!63095 (= lt!278130 lt!278142)))

(assert (=> d!63095 (isPrefixOf!0 lt!278126 lt!278126)))

(assert (=> d!63095 (= lt!278142 (lemmaIsPrefixRefl!0 lt!278126))))

(declare-fun lt!278135 () Unit!13004)

(declare-fun lt!278123 () Unit!13004)

(assert (=> d!63095 (= lt!278135 lt!278123)))

(assert (=> d!63095 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63095 (= lt!278123 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63095 (= lt!278126 (BitStream!7655 (buf!4719 (_2!8443 lt!277704)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(assert (=> d!63095 (isPrefixOf!0 thiss!1204 (_2!8443 lt!277704))))

(assert (=> d!63095 (= (reader!0 thiss!1204 (_2!8443 lt!277704)) lt!278138)))

(assert (= (and d!63095 c!9344) b!181172))

(assert (= (and d!63095 (not c!9344)) b!181173))

(assert (= (and d!63095 res!150469) b!181174))

(assert (= (and b!181174 res!150467) b!181175))

(assert (= (and b!181175 res!150468) b!181171))

(declare-fun m!282031 () Bool)

(assert (=> b!181174 m!282031))

(declare-fun m!282033 () Bool)

(assert (=> d!63095 m!282033))

(declare-fun m!282035 () Bool)

(assert (=> d!63095 m!282035))

(declare-fun m!282037 () Bool)

(assert (=> d!63095 m!282037))

(declare-fun m!282039 () Bool)

(assert (=> d!63095 m!282039))

(declare-fun m!282041 () Bool)

(assert (=> d!63095 m!282041))

(declare-fun m!282043 () Bool)

(assert (=> d!63095 m!282043))

(assert (=> d!63095 m!281655))

(declare-fun m!282045 () Bool)

(assert (=> d!63095 m!282045))

(declare-fun m!282047 () Bool)

(assert (=> d!63095 m!282047))

(assert (=> d!63095 m!282019))

(assert (=> d!63095 m!282021))

(assert (=> b!181172 m!281649))

(declare-fun m!282049 () Bool)

(assert (=> b!181172 m!282049))

(declare-fun m!282051 () Bool)

(assert (=> b!181172 m!282051))

(declare-fun m!282053 () Bool)

(assert (=> b!181175 m!282053))

(declare-fun m!282055 () Bool)

(assert (=> b!181171 m!282055))

(assert (=> b!181171 m!281653))

(assert (=> b!181171 m!281649))

(assert (=> b!180942 d!63095))

(declare-fun d!63097 () Bool)

(declare-fun lt!278143 () tuple2!15618)

(assert (=> d!63097 (= lt!278143 (readBit!0 (_1!8445 lt!277705)))))

(assert (=> d!63097 (= (readBitPure!0 (_1!8445 lt!277705)) (tuple2!15599 (_2!8454 lt!278143) (_1!8454 lt!278143)))))

(declare-fun bs!15715 () Bool)

(assert (= bs!15715 d!63097))

(declare-fun m!282057 () Bool)

(assert (=> bs!15715 m!282057))

(assert (=> b!180942 d!63097))

(declare-fun d!63099 () Bool)

(declare-fun lt!278144 () tuple2!15618)

(assert (=> d!63099 (= lt!278144 (readBit!0 (BitStream!7655 (buf!4719 (_2!8443 lt!277704)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204))))))

(assert (=> d!63099 (= (readBitPure!0 (BitStream!7655 (buf!4719 (_2!8443 lt!277704)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204))) (tuple2!15599 (_2!8454 lt!278144) (_1!8454 lt!278144)))))

(declare-fun bs!15716 () Bool)

(assert (= bs!15716 d!63099))

(declare-fun m!282059 () Bool)

(assert (=> bs!15716 m!282059))

(assert (=> b!180942 d!63099))

(declare-fun d!63101 () Bool)

(assert (=> d!63101 (= (array_inv!4014 (buf!4719 thiss!1204)) (bvsge (size!4273 (buf!4719 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!180931 d!63101))

(declare-fun d!63103 () Bool)

(declare-fun lt!278145 () tuple2!15618)

(assert (=> d!63103 (= lt!278145 (readBit!0 (readerFrom!0 (_2!8443 lt!277709) (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204))))))

(assert (=> d!63103 (= (readBitPure!0 (readerFrom!0 (_2!8443 lt!277709) (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204))) (tuple2!15599 (_2!8454 lt!278145) (_1!8454 lt!278145)))))

(declare-fun bs!15717 () Bool)

(assert (= bs!15717 d!63103))

(assert (=> bs!15717 m!281661))

(declare-fun m!282061 () Bool)

(assert (=> bs!15717 m!282061))

(assert (=> b!180929 d!63103))

(declare-fun d!63105 () Bool)

(declare-fun e!125831 () Bool)

(assert (=> d!63105 e!125831))

(declare-fun res!150473 () Bool)

(assert (=> d!63105 (=> (not res!150473) (not e!125831))))

(assert (=> d!63105 (= res!150473 (invariant!0 (currentBit!8930 (_2!8443 lt!277709)) (currentByte!8935 (_2!8443 lt!277709)) (size!4273 (buf!4719 (_2!8443 lt!277709)))))))

(assert (=> d!63105 (= (readerFrom!0 (_2!8443 lt!277709) (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204)) (BitStream!7655 (buf!4719 (_2!8443 lt!277709)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)))))

(declare-fun b!181178 () Bool)

(assert (=> b!181178 (= e!125831 (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 (_2!8443 lt!277709)))))))

(assert (= (and d!63105 res!150473) b!181178))

(assert (=> d!63105 m!281947))

(assert (=> b!181178 m!281701))

(assert (=> b!180929 d!63105))

(declare-fun d!63107 () Bool)

(declare-fun res!150475 () Bool)

(declare-fun e!125833 () Bool)

(assert (=> d!63107 (=> (not res!150475) (not e!125833))))

(assert (=> d!63107 (= res!150475 (= (size!4273 (buf!4719 (_2!8443 lt!277709))) (size!4273 (buf!4719 (_2!8443 lt!277704)))))))

(assert (=> d!63107 (= (isPrefixOf!0 (_2!8443 lt!277709) (_2!8443 lt!277704)) e!125833)))

(declare-fun b!181179 () Bool)

(declare-fun res!150474 () Bool)

(assert (=> b!181179 (=> (not res!150474) (not e!125833))))

(assert (=> b!181179 (= res!150474 (bvsle (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))) (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277704))) (currentByte!8935 (_2!8443 lt!277704)) (currentBit!8930 (_2!8443 lt!277704)))))))

(declare-fun b!181180 () Bool)

(declare-fun e!125832 () Bool)

(assert (=> b!181180 (= e!125833 e!125832)))

(declare-fun res!150476 () Bool)

(assert (=> b!181180 (=> res!150476 e!125832)))

(assert (=> b!181180 (= res!150476 (= (size!4273 (buf!4719 (_2!8443 lt!277709))) #b00000000000000000000000000000000))))

(declare-fun b!181181 () Bool)

(assert (=> b!181181 (= e!125832 (arrayBitRangesEq!0 (buf!4719 (_2!8443 lt!277709)) (buf!4719 (_2!8443 lt!277704)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709)))))))

(assert (= (and d!63107 res!150475) b!181179))

(assert (= (and b!181179 res!150474) b!181180))

(assert (= (and b!181180 (not res!150476)) b!181181))

(assert (=> b!181179 m!281647))

(assert (=> b!181179 m!281653))

(assert (=> b!181181 m!281647))

(assert (=> b!181181 m!281647))

(declare-fun m!282063 () Bool)

(assert (=> b!181181 m!282063))

(assert (=> b!180930 d!63107))

(declare-fun d!63109 () Bool)

(assert (=> d!63109 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!180928 d!63109))

(declare-fun d!63111 () Bool)

(assert (=> d!63111 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!180928 d!63111))

(declare-fun d!63113 () Bool)

(assert (=> d!63113 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 thiss!1204))))))

(declare-fun bs!15718 () Bool)

(assert (= bs!15718 d!63113))

(assert (=> bs!15718 m!281703))

(assert (=> start!39836 d!63113))

(declare-fun d!63115 () Bool)

(assert (=> d!63115 (= (invariant!0 (currentBit!8930 (_2!8443 lt!277704)) (currentByte!8935 (_2!8443 lt!277704)) (size!4273 (buf!4719 (_2!8443 lt!277704)))) (and (bvsge (currentBit!8930 (_2!8443 lt!277704)) #b00000000000000000000000000000000) (bvslt (currentBit!8930 (_2!8443 lt!277704)) #b00000000000000000000000000001000) (bvsge (currentByte!8935 (_2!8443 lt!277704)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8935 (_2!8443 lt!277704)) (size!4273 (buf!4719 (_2!8443 lt!277704)))) (and (= (currentBit!8930 (_2!8443 lt!277704)) #b00000000000000000000000000000000) (= (currentByte!8935 (_2!8443 lt!277704)) (size!4273 (buf!4719 (_2!8443 lt!277704))))))))))

(assert (=> b!180937 d!63115))

(declare-fun d!63117 () Bool)

(assert (=> d!63117 (= (invariant!0 (currentBit!8930 thiss!1204) (currentByte!8935 thiss!1204) (size!4273 (buf!4719 thiss!1204))) (and (bvsge (currentBit!8930 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8930 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8935 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8935 thiss!1204) (size!4273 (buf!4719 thiss!1204))) (and (= (currentBit!8930 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8935 thiss!1204) (size!4273 (buf!4719 thiss!1204)))))))))

(assert (=> b!180938 d!63117))

(declare-fun d!63119 () Bool)

(declare-fun e!125834 () Bool)

(assert (=> d!63119 e!125834))

(declare-fun res!150477 () Bool)

(assert (=> d!63119 (=> (not res!150477) (not e!125834))))

(declare-fun lt!278147 () (_ BitVec 64))

(declare-fun lt!278151 () (_ BitVec 64))

(declare-fun lt!278148 () (_ BitVec 64))

(assert (=> d!63119 (= res!150477 (= lt!278151 (bvsub lt!278148 lt!278147)))))

(assert (=> d!63119 (or (= (bvand lt!278148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278147 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278148 lt!278147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63119 (= lt!278147 (remainingBits!0 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277704)))) ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277704))) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277704)))))))

(declare-fun lt!278149 () (_ BitVec 64))

(declare-fun lt!278150 () (_ BitVec 64))

(assert (=> d!63119 (= lt!278148 (bvmul lt!278149 lt!278150))))

(assert (=> d!63119 (or (= lt!278149 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278150 (bvsdiv (bvmul lt!278149 lt!278150) lt!278149)))))

(assert (=> d!63119 (= lt!278150 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63119 (= lt!278149 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277704)))))))

(assert (=> d!63119 (= lt!278151 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277704))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277704)))))))

(assert (=> d!63119 (invariant!0 (currentBit!8930 (_2!8443 lt!277704)) (currentByte!8935 (_2!8443 lt!277704)) (size!4273 (buf!4719 (_2!8443 lt!277704))))))

(assert (=> d!63119 (= (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277704))) (currentByte!8935 (_2!8443 lt!277704)) (currentBit!8930 (_2!8443 lt!277704))) lt!278151)))

(declare-fun b!181182 () Bool)

(declare-fun res!150478 () Bool)

(assert (=> b!181182 (=> (not res!150478) (not e!125834))))

(assert (=> b!181182 (= res!150478 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278151))))

(declare-fun b!181183 () Bool)

(declare-fun lt!278146 () (_ BitVec 64))

(assert (=> b!181183 (= e!125834 (bvsle lt!278151 (bvmul lt!278146 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181183 (or (= lt!278146 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278146 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278146)))))

(assert (=> b!181183 (= lt!278146 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277704)))))))

(assert (= (and d!63119 res!150477) b!181182))

(assert (= (and b!181182 res!150478) b!181183))

(declare-fun m!282065 () Bool)

(assert (=> d!63119 m!282065))

(assert (=> d!63119 m!281671))

(assert (=> b!180927 d!63119))

(declare-fun d!63121 () Bool)

(declare-fun res!150480 () Bool)

(declare-fun e!125836 () Bool)

(assert (=> d!63121 (=> (not res!150480) (not e!125836))))

(assert (=> d!63121 (= res!150480 (= (size!4273 (buf!4719 thiss!1204)) (size!4273 (buf!4719 (_2!8443 lt!277704)))))))

(assert (=> d!63121 (= (isPrefixOf!0 thiss!1204 (_2!8443 lt!277704)) e!125836)))

(declare-fun b!181184 () Bool)

(declare-fun res!150479 () Bool)

(assert (=> b!181184 (=> (not res!150479) (not e!125836))))

(assert (=> b!181184 (= res!150479 (bvsle (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204)) (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277704))) (currentByte!8935 (_2!8443 lt!277704)) (currentBit!8930 (_2!8443 lt!277704)))))))

(declare-fun b!181185 () Bool)

(declare-fun e!125835 () Bool)

(assert (=> b!181185 (= e!125836 e!125835)))

(declare-fun res!150481 () Bool)

(assert (=> b!181185 (=> res!150481 e!125835)))

(assert (=> b!181185 (= res!150481 (= (size!4273 (buf!4719 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!181186 () Bool)

(assert (=> b!181186 (= e!125835 (arrayBitRangesEq!0 (buf!4719 thiss!1204) (buf!4719 (_2!8443 lt!277704)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4273 (buf!4719 thiss!1204)) (currentByte!8935 thiss!1204) (currentBit!8930 thiss!1204))))))

(assert (= (and d!63121 res!150480) b!181184))

(assert (= (and b!181184 res!150479) b!181185))

(assert (= (and b!181185 (not res!150481)) b!181186))

(assert (=> b!181184 m!281649))

(assert (=> b!181184 m!281653))

(assert (=> b!181186 m!281649))

(assert (=> b!181186 m!281649))

(declare-fun m!282067 () Bool)

(assert (=> b!181186 m!282067))

(assert (=> b!180927 d!63121))

(declare-fun d!63123 () Bool)

(assert (=> d!63123 (isPrefixOf!0 thiss!1204 (_2!8443 lt!277704))))

(declare-fun lt!278154 () Unit!13004)

(declare-fun choose!30 (BitStream!7654 BitStream!7654 BitStream!7654) Unit!13004)

(assert (=> d!63123 (= lt!278154 (choose!30 thiss!1204 (_2!8443 lt!277709) (_2!8443 lt!277704)))))

(assert (=> d!63123 (isPrefixOf!0 thiss!1204 (_2!8443 lt!277709))))

(assert (=> d!63123 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8443 lt!277709) (_2!8443 lt!277704)) lt!278154)))

(declare-fun bs!15719 () Bool)

(assert (= bs!15719 d!63123))

(assert (=> bs!15719 m!281655))

(declare-fun m!282069 () Bool)

(assert (=> bs!15719 m!282069))

(assert (=> bs!15719 m!281669))

(assert (=> b!180927 d!63123))

(declare-fun d!63125 () Bool)

(declare-fun e!125927 () Bool)

(assert (=> d!63125 e!125927))

(declare-fun res!150603 () Bool)

(assert (=> d!63125 (=> (not res!150603) (not e!125927))))

(declare-fun lt!278661 () tuple2!15596)

(assert (=> d!63125 (= res!150603 (invariant!0 (currentBit!8930 (_2!8443 lt!278661)) (currentByte!8935 (_2!8443 lt!278661)) (size!4273 (buf!4719 (_2!8443 lt!278661)))))))

(declare-fun e!125923 () tuple2!15596)

(assert (=> d!63125 (= lt!278661 e!125923)))

(declare-fun c!9362 () Bool)

(assert (=> d!63125 (= c!9362 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63125 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63125 (= (appendBitsLSBFirstLoopTR!0 (_2!8443 lt!277709) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!278661)))

(declare-fun b!181338 () Bool)

(declare-fun e!125926 () (_ BitVec 64))

(assert (=> b!181338 (= e!125926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!181339 () Bool)

(declare-fun res!150600 () Bool)

(assert (=> b!181339 (=> (not res!150600) (not e!125927))))

(declare-fun lt!278681 () (_ BitVec 64))

(declare-fun lt!278645 () (_ BitVec 64))

(assert (=> b!181339 (= res!150600 (= (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278661))) (currentByte!8935 (_2!8443 lt!278661)) (currentBit!8930 (_2!8443 lt!278661))) (bvsub lt!278645 lt!278681)))))

(assert (=> b!181339 (or (= (bvand lt!278645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278681 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278645 lt!278681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181339 (= lt!278681 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!278670 () (_ BitVec 64))

(declare-fun lt!278650 () (_ BitVec 64))

(assert (=> b!181339 (= lt!278645 (bvadd lt!278670 lt!278650))))

(assert (=> b!181339 (or (not (= (bvand lt!278670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278650 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!278670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!278670 lt!278650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181339 (= lt!278650 ((_ sign_extend 32) nBits!348))))

(assert (=> b!181339 (= lt!278670 (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))))))

(declare-fun lt!278676 () tuple2!15596)

(declare-fun call!2954 () Bool)

(declare-fun bm!2951 () Bool)

(assert (=> bm!2951 (= call!2954 (isPrefixOf!0 (_2!8443 lt!277709) (ite c!9362 (_2!8443 lt!277709) (_2!8443 lt!278676))))))

(declare-fun b!181340 () Bool)

(declare-fun e!125928 () Bool)

(declare-fun lt!278651 () (_ BitVec 64))

(assert (=> b!181340 (= e!125928 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!277709)))) ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277709))) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277709))) lt!278651))))

(declare-fun b!181341 () Bool)

(assert (=> b!181341 (= e!125923 (tuple2!15597 (_1!8443 lt!278676) (_2!8443 lt!278676)))))

(declare-fun lt!278679 () Bool)

(assert (=> b!181341 (= lt!278679 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!278632 () tuple2!15596)

(assert (=> b!181341 (= lt!278632 (appendBit!0 (_2!8443 lt!277709) lt!278679))))

(declare-fun res!150602 () Bool)

(assert (=> b!181341 (= res!150602 (= (size!4273 (buf!4719 (_2!8443 lt!277709))) (size!4273 (buf!4719 (_2!8443 lt!278632)))))))

(declare-fun e!125925 () Bool)

(assert (=> b!181341 (=> (not res!150602) (not e!125925))))

(assert (=> b!181341 e!125925))

(declare-fun lt!278664 () tuple2!15596)

(assert (=> b!181341 (= lt!278664 lt!278632)))

(assert (=> b!181341 (= lt!278676 (appendBitsLSBFirstLoopTR!0 (_2!8443 lt!278664) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!278653 () Unit!13004)

(assert (=> b!181341 (= lt!278653 (lemmaIsPrefixTransitive!0 (_2!8443 lt!277709) (_2!8443 lt!278664) (_2!8443 lt!278676)))))

(assert (=> b!181341 call!2954))

(declare-fun lt!278657 () Unit!13004)

(assert (=> b!181341 (= lt!278657 lt!278653)))

(assert (=> b!181341 (invariant!0 (currentBit!8930 (_2!8443 lt!277709)) (currentByte!8935 (_2!8443 lt!277709)) (size!4273 (buf!4719 (_2!8443 lt!278664))))))

(declare-fun lt!278672 () BitStream!7654)

(assert (=> b!181341 (= lt!278672 (BitStream!7655 (buf!4719 (_2!8443 lt!278664)) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))))))

(assert (=> b!181341 (invariant!0 (currentBit!8930 lt!278672) (currentByte!8935 lt!278672) (size!4273 (buf!4719 (_2!8443 lt!278676))))))

(declare-fun lt!278648 () BitStream!7654)

(assert (=> b!181341 (= lt!278648 (BitStream!7655 (buf!4719 (_2!8443 lt!278676)) (currentByte!8935 lt!278672) (currentBit!8930 lt!278672)))))

(declare-fun lt!278666 () tuple2!15598)

(assert (=> b!181341 (= lt!278666 (readBitPure!0 lt!278672))))

(declare-fun lt!278662 () tuple2!15598)

(assert (=> b!181341 (= lt!278662 (readBitPure!0 lt!278648))))

(declare-fun lt!278641 () Unit!13004)

(assert (=> b!181341 (= lt!278641 (readBitPrefixLemma!0 lt!278672 (_2!8443 lt!278676)))))

(declare-fun res!150605 () Bool)

(assert (=> b!181341 (= res!150605 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!278666))) (currentByte!8935 (_1!8444 lt!278666)) (currentBit!8930 (_1!8444 lt!278666))) (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!278662))) (currentByte!8935 (_1!8444 lt!278662)) (currentBit!8930 (_1!8444 lt!278662)))))))

(declare-fun e!125929 () Bool)

(assert (=> b!181341 (=> (not res!150605) (not e!125929))))

(assert (=> b!181341 e!125929))

(declare-fun lt!278673 () Unit!13004)

(assert (=> b!181341 (= lt!278673 lt!278641)))

(declare-fun lt!278659 () tuple2!15600)

(assert (=> b!181341 (= lt!278659 (reader!0 (_2!8443 lt!277709) (_2!8443 lt!278676)))))

(declare-fun lt!278627 () tuple2!15600)

(assert (=> b!181341 (= lt!278627 (reader!0 (_2!8443 lt!278664) (_2!8443 lt!278676)))))

(declare-fun lt!278680 () tuple2!15598)

(assert (=> b!181341 (= lt!278680 (readBitPure!0 (_1!8445 lt!278659)))))

(assert (=> b!181341 (= (_2!8444 lt!278680) lt!278679)))

(declare-fun lt!278647 () Unit!13004)

(declare-fun Unit!13026 () Unit!13004)

(assert (=> b!181341 (= lt!278647 Unit!13026)))

(declare-fun lt!278643 () (_ BitVec 64))

(assert (=> b!181341 (= lt!278643 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278668 () (_ BitVec 64))

(assert (=> b!181341 (= lt!278668 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278682 () Unit!13004)

(assert (=> b!181341 (= lt!278682 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8443 lt!277709) (buf!4719 (_2!8443 lt!278676)) lt!278668))))

(assert (=> b!181341 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!278676)))) ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277709))) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277709))) lt!278668)))

(declare-fun lt!278675 () Unit!13004)

(assert (=> b!181341 (= lt!278675 lt!278682)))

(declare-datatypes ((tuple2!15622 0))(
  ( (tuple2!15623 (_1!8456 BitStream!7654) (_2!8456 (_ BitVec 64))) )
))
(declare-fun lt!278639 () tuple2!15622)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15622)

(assert (=> b!181341 (= lt!278639 (readNBitsLSBFirstsLoopPure!0 (_1!8445 lt!278659) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278643))))

(declare-fun lt!278649 () (_ BitVec 64))

(assert (=> b!181341 (= lt!278649 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!278628 () Unit!13004)

(assert (=> b!181341 (= lt!278628 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8443 lt!278664) (buf!4719 (_2!8443 lt!278676)) lt!278649))))

(assert (=> b!181341 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!278676)))) ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!278664))) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!278664))) lt!278649)))

(declare-fun lt!278646 () Unit!13004)

(assert (=> b!181341 (= lt!278646 lt!278628)))

(declare-fun lt!278663 () tuple2!15622)

(assert (=> b!181341 (= lt!278663 (readNBitsLSBFirstsLoopPure!0 (_1!8445 lt!278627) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!278643 (ite (_2!8444 lt!278680) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!278667 () tuple2!15622)

(assert (=> b!181341 (= lt!278667 (readNBitsLSBFirstsLoopPure!0 (_1!8445 lt!278659) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278643))))

(declare-fun c!9361 () Bool)

(assert (=> b!181341 (= c!9361 (_2!8444 (readBitPure!0 (_1!8445 lt!278659))))))

(declare-fun lt!278674 () tuple2!15622)

(assert (=> b!181341 (= lt!278674 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8445 lt!278659) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!278643 e!125926)))))

(declare-fun lt!278633 () Unit!13004)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13004)

(assert (=> b!181341 (= lt!278633 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8445 lt!278659) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278643))))

(assert (=> b!181341 (and (= (_2!8456 lt!278667) (_2!8456 lt!278674)) (= (_1!8456 lt!278667) (_1!8456 lt!278674)))))

(declare-fun lt!278654 () Unit!13004)

(assert (=> b!181341 (= lt!278654 lt!278633)))

(assert (=> b!181341 (= (_1!8445 lt!278659) (withMovedBitIndex!0 (_2!8445 lt!278659) (bvsub (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))) (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278676))) (currentByte!8935 (_2!8443 lt!278676)) (currentBit!8930 (_2!8443 lt!278676))))))))

(declare-fun lt!278636 () Unit!13004)

(declare-fun Unit!13027 () Unit!13004)

(assert (=> b!181341 (= lt!278636 Unit!13027)))

(assert (=> b!181341 (= (_1!8445 lt!278627) (withMovedBitIndex!0 (_2!8445 lt!278627) (bvsub (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278664))) (currentByte!8935 (_2!8443 lt!278664)) (currentBit!8930 (_2!8443 lt!278664))) (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278676))) (currentByte!8935 (_2!8443 lt!278676)) (currentBit!8930 (_2!8443 lt!278676))))))))

(declare-fun lt!278678 () Unit!13004)

(declare-fun Unit!13028 () Unit!13004)

(assert (=> b!181341 (= lt!278678 Unit!13028)))

(assert (=> b!181341 (= (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))) (bvsub (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278664))) (currentByte!8935 (_2!8443 lt!278664)) (currentBit!8930 (_2!8443 lt!278664))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!278660 () Unit!13004)

(declare-fun Unit!13030 () Unit!13004)

(assert (=> b!181341 (= lt!278660 Unit!13030)))

(assert (=> b!181341 (= (_2!8456 lt!278639) (_2!8456 lt!278663))))

(declare-fun lt!278638 () Unit!13004)

(declare-fun Unit!13031 () Unit!13004)

(assert (=> b!181341 (= lt!278638 Unit!13031)))

(assert (=> b!181341 (invariant!0 (currentBit!8930 (_2!8443 lt!278676)) (currentByte!8935 (_2!8443 lt!278676)) (size!4273 (buf!4719 (_2!8443 lt!278676))))))

(declare-fun lt!278640 () Unit!13004)

(declare-fun Unit!13032 () Unit!13004)

(assert (=> b!181341 (= lt!278640 Unit!13032)))

(assert (=> b!181341 (= (size!4273 (buf!4719 (_2!8443 lt!277709))) (size!4273 (buf!4719 (_2!8443 lt!278676))))))

(declare-fun lt!278631 () Unit!13004)

(declare-fun Unit!13034 () Unit!13004)

(assert (=> b!181341 (= lt!278631 Unit!13034)))

(assert (=> b!181341 (= (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278676))) (currentByte!8935 (_2!8443 lt!278676)) (currentBit!8930 (_2!8443 lt!278676))) (bvsub (bvadd (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278642 () Unit!13004)

(declare-fun Unit!13035 () Unit!13004)

(assert (=> b!181341 (= lt!278642 Unit!13035)))

(declare-fun lt!278635 () Unit!13004)

(declare-fun Unit!13037 () Unit!13004)

(assert (=> b!181341 (= lt!278635 Unit!13037)))

(declare-fun lt!278671 () tuple2!15600)

(assert (=> b!181341 (= lt!278671 (reader!0 (_2!8443 lt!277709) (_2!8443 lt!278676)))))

(declare-fun lt!278677 () (_ BitVec 64))

(assert (=> b!181341 (= lt!278677 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278669 () Unit!13004)

(assert (=> b!181341 (= lt!278669 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8443 lt!277709) (buf!4719 (_2!8443 lt!278676)) lt!278677))))

(assert (=> b!181341 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!278676)))) ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277709))) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277709))) lt!278677)))

(declare-fun lt!278655 () Unit!13004)

(assert (=> b!181341 (= lt!278655 lt!278669)))

(declare-fun lt!278652 () tuple2!15622)

(assert (=> b!181341 (= lt!278652 (readNBitsLSBFirstsLoopPure!0 (_1!8445 lt!278671) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!150610 () Bool)

(assert (=> b!181341 (= res!150610 (= (_2!8456 lt!278652) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!125924 () Bool)

(assert (=> b!181341 (=> (not res!150610) (not e!125924))))

(assert (=> b!181341 e!125924))

(declare-fun lt!278658 () Unit!13004)

(declare-fun Unit!13041 () Unit!13004)

(assert (=> b!181341 (= lt!278658 Unit!13041)))

(declare-fun b!181342 () Bool)

(declare-fun e!125921 () Bool)

(assert (=> b!181342 (= e!125927 e!125921)))

(declare-fun res!150601 () Bool)

(assert (=> b!181342 (=> (not res!150601) (not e!125921))))

(declare-fun lt!278634 () tuple2!15622)

(assert (=> b!181342 (= res!150601 (= (_2!8456 lt!278634) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!278665 () tuple2!15600)

(assert (=> b!181342 (= lt!278634 (readNBitsLSBFirstsLoopPure!0 (_1!8445 lt!278665) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!278630 () Unit!13004)

(declare-fun lt!278637 () Unit!13004)

(assert (=> b!181342 (= lt!278630 lt!278637)))

(assert (=> b!181342 (validate_offset_bits!1 ((_ sign_extend 32) (size!4273 (buf!4719 (_2!8443 lt!278661)))) ((_ sign_extend 32) (currentByte!8935 (_2!8443 lt!277709))) ((_ sign_extend 32) (currentBit!8930 (_2!8443 lt!277709))) lt!278651)))

(assert (=> b!181342 (= lt!278637 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8443 lt!277709) (buf!4719 (_2!8443 lt!278661)) lt!278651))))

(assert (=> b!181342 e!125928))

(declare-fun res!150606 () Bool)

(assert (=> b!181342 (=> (not res!150606) (not e!125928))))

(assert (=> b!181342 (= res!150606 (and (= (size!4273 (buf!4719 (_2!8443 lt!277709))) (size!4273 (buf!4719 (_2!8443 lt!278661)))) (bvsge lt!278651 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181342 (= lt!278651 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!181342 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!181342 (= lt!278665 (reader!0 (_2!8443 lt!277709) (_2!8443 lt!278661)))))

(declare-fun b!181343 () Bool)

(declare-fun lt!278656 () tuple2!15598)

(assert (=> b!181343 (= lt!278656 (readBitPure!0 (readerFrom!0 (_2!8443 lt!278632) (currentBit!8930 (_2!8443 lt!277709)) (currentByte!8935 (_2!8443 lt!277709)))))))

(declare-fun res!150611 () Bool)

(assert (=> b!181343 (= res!150611 (and (= (_2!8444 lt!278656) lt!278679) (= (_1!8444 lt!278656) (_2!8443 lt!278632))))))

(declare-fun e!125922 () Bool)

(assert (=> b!181343 (=> (not res!150611) (not e!125922))))

(assert (=> b!181343 (= e!125925 e!125922)))

(declare-fun b!181344 () Bool)

(assert (=> b!181344 (= e!125922 (= (bitIndex!0 (size!4273 (buf!4719 (_1!8444 lt!278656))) (currentByte!8935 (_1!8444 lt!278656)) (currentBit!8930 (_1!8444 lt!278656))) (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278632))) (currentByte!8935 (_2!8443 lt!278632)) (currentBit!8930 (_2!8443 lt!278632)))))))

(declare-fun b!181345 () Bool)

(declare-fun res!150608 () Bool)

(assert (=> b!181345 (=> (not res!150608) (not e!125927))))

(assert (=> b!181345 (= res!150608 (= (size!4273 (buf!4719 (_2!8443 lt!277709))) (size!4273 (buf!4719 (_2!8443 lt!278661)))))))

(declare-fun b!181346 () Bool)

(assert (=> b!181346 (= e!125924 (= (_1!8456 lt!278652) (_2!8445 lt!278671)))))

(declare-fun b!181347 () Bool)

(assert (=> b!181347 (= e!125929 (= (_2!8444 lt!278666) (_2!8444 lt!278662)))))

(declare-fun b!181348 () Bool)

(declare-fun res!150609 () Bool)

(assert (=> b!181348 (= res!150609 (= (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!278632))) (currentByte!8935 (_2!8443 lt!278632)) (currentBit!8930 (_2!8443 lt!278632))) (bvadd (bitIndex!0 (size!4273 (buf!4719 (_2!8443 lt!277709))) (currentByte!8935 (_2!8443 lt!277709)) (currentBit!8930 (_2!8443 lt!277709))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!181348 (=> (not res!150609) (not e!125925))))

(declare-fun b!181349 () Bool)

(declare-fun res!150607 () Bool)

(assert (=> b!181349 (=> (not res!150607) (not e!125927))))

(assert (=> b!181349 (= res!150607 (isPrefixOf!0 (_2!8443 lt!277709) (_2!8443 lt!278661)))))

(declare-fun b!181350 () Bool)

(declare-fun Unit!13045 () Unit!13004)

(assert (=> b!181350 (= e!125923 (tuple2!15597 Unit!13045 (_2!8443 lt!277709)))))

(declare-fun lt!278629 () Unit!13004)

(assert (=> b!181350 (= lt!278629 (lemmaIsPrefixRefl!0 (_2!8443 lt!277709)))))

(assert (=> b!181350 call!2954))

(declare-fun lt!278644 () Unit!13004)

(assert (=> b!181350 (= lt!278644 lt!278629)))

(declare-fun b!181351 () Bool)

(declare-fun res!150604 () Bool)

(assert (=> b!181351 (= res!150604 (isPrefixOf!0 (_2!8443 lt!277709) (_2!8443 lt!278632)))))

(assert (=> b!181351 (=> (not res!150604) (not e!125925))))

(declare-fun b!181352 () Bool)

(assert (=> b!181352 (= e!125926 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!181353 () Bool)

(assert (=> b!181353 (= e!125921 (= (_1!8456 lt!278634) (_2!8445 lt!278665)))))

(assert (= (and d!63125 c!9362) b!181350))

(assert (= (and d!63125 (not c!9362)) b!181341))

(assert (= (and b!181341 res!150602) b!181348))

(assert (= (and b!181348 res!150609) b!181351))

(assert (= (and b!181351 res!150604) b!181343))

(assert (= (and b!181343 res!150611) b!181344))

(assert (= (and b!181341 res!150605) b!181347))

(assert (= (and b!181341 c!9361) b!181352))

(assert (= (and b!181341 (not c!9361)) b!181338))

(assert (= (and b!181341 res!150610) b!181346))

(assert (= (or b!181350 b!181341) bm!2951))

(assert (= (and d!63125 res!150603) b!181345))

(assert (= (and b!181345 res!150608) b!181339))

(assert (= (and b!181339 res!150600) b!181349))

(assert (= (and b!181349 res!150607) b!181342))

(assert (= (and b!181342 res!150606) b!181340))

(assert (= (and b!181342 res!150601) b!181353))

(declare-fun m!282281 () Bool)

(assert (=> b!181339 m!282281))

(assert (=> b!181339 m!281647))

(declare-fun m!282283 () Bool)

(assert (=> b!181340 m!282283))

(declare-fun m!282285 () Bool)

(assert (=> d!63125 m!282285))

(declare-fun m!282287 () Bool)

(assert (=> b!181343 m!282287))

(assert (=> b!181343 m!282287))

(declare-fun m!282289 () Bool)

(assert (=> b!181343 m!282289))

(declare-fun m!282291 () Bool)

(assert (=> b!181349 m!282291))

(declare-fun m!282293 () Bool)

(assert (=> b!181351 m!282293))

(declare-fun m!282295 () Bool)

(assert (=> b!181342 m!282295))

(declare-fun m!282297 () Bool)

(assert (=> b!181342 m!282297))

(declare-fun m!282299 () Bool)

(assert (=> b!181342 m!282299))

(declare-fun m!282301 () Bool)

(assert (=> b!181342 m!282301))

(declare-fun m!282303 () Bool)

(assert (=> b!181342 m!282303))

(declare-fun m!282305 () Bool)

(assert (=> b!181342 m!282305))

(declare-fun m!282307 () Bool)

(assert (=> b!181344 m!282307))

(declare-fun m!282309 () Bool)

(assert (=> b!181344 m!282309))

(declare-fun m!282311 () Bool)

(assert (=> b!181341 m!282311))

(declare-fun m!282313 () Bool)

(assert (=> b!181341 m!282313))

(declare-fun m!282315 () Bool)

(assert (=> b!181341 m!282315))

(declare-fun m!282317 () Bool)

(assert (=> b!181341 m!282317))

(declare-fun m!282319 () Bool)

(assert (=> b!181341 m!282319))

(declare-fun m!282321 () Bool)

(assert (=> b!181341 m!282321))

(declare-fun m!282323 () Bool)

(assert (=> b!181341 m!282323))

(assert (=> b!181341 m!282301))

(declare-fun m!282325 () Bool)

(assert (=> b!181341 m!282325))

(declare-fun m!282327 () Bool)

(assert (=> b!181341 m!282327))

(assert (=> b!181341 m!282303))

(assert (=> b!181341 m!282321))

(declare-fun m!282329 () Bool)

(assert (=> b!181341 m!282329))

(assert (=> b!181341 m!281647))

(declare-fun m!282331 () Bool)

(assert (=> b!181341 m!282331))

(declare-fun m!282333 () Bool)

(assert (=> b!181341 m!282333))

(declare-fun m!282335 () Bool)

(assert (=> b!181341 m!282335))

(declare-fun m!282337 () Bool)

(assert (=> b!181341 m!282337))

(declare-fun m!282339 () Bool)

(assert (=> b!181341 m!282339))

(declare-fun m!282341 () Bool)

(assert (=> b!181341 m!282341))

(declare-fun m!282343 () Bool)

(assert (=> b!181341 m!282343))

(declare-fun m!282345 () Bool)

(assert (=> b!181341 m!282345))

(declare-fun m!282347 () Bool)

(assert (=> b!181341 m!282347))

(declare-fun m!282349 () Bool)

(assert (=> b!181341 m!282349))

(declare-fun m!282351 () Bool)

(assert (=> b!181341 m!282351))

(declare-fun m!282353 () Bool)

(assert (=> b!181341 m!282353))

(declare-fun m!282355 () Bool)

(assert (=> b!181341 m!282355))

(declare-fun m!282357 () Bool)

(assert (=> b!181341 m!282357))

(declare-fun m!282359 () Bool)

(assert (=> b!181341 m!282359))

(declare-fun m!282361 () Bool)

(assert (=> b!181341 m!282361))

(declare-fun m!282363 () Bool)

(assert (=> b!181341 m!282363))

(declare-fun m!282365 () Bool)

(assert (=> b!181341 m!282365))

(declare-fun m!282367 () Bool)

(assert (=> b!181341 m!282367))

(declare-fun m!282369 () Bool)

(assert (=> b!181341 m!282369))

(assert (=> b!181350 m!282011))

(assert (=> b!181348 m!282309))

(assert (=> b!181348 m!281647))

(declare-fun m!282371 () Bool)

(assert (=> bm!2951 m!282371))

(assert (=> b!180927 d!63125))

(push 1)

(assert (not d!63099))

(assert (not d!63055))

(assert (not b!181110))

(assert (not b!181167))

(assert (not b!181350))

(assert (not d!63077))

(assert (not b!181344))

(assert (not bm!2951))

(assert (not b!181172))

(assert (not d!63073))

(assert (not d!63097))

(assert (not b!181166))

(assert (not b!181186))

(assert (not b!181174))

(assert (not b!181342))

(assert (not b!181179))

(assert (not b!181171))

(assert (not d!63053))

(assert (not d!63119))

(assert (not d!63065))

(assert (not b!181128))

(assert (not d!63105))

(assert (not d!63085))

(assert (not b!181343))

(assert (not b!181129))

(assert (not d!63087))

(assert (not d!63123))

(assert (not b!181175))

(assert (not b!181170))

(assert (not d!63079))

(assert (not b!181108))

(assert (not d!63113))

(assert (not b!181348))

(assert (not b!181178))

(assert (not b!181351))

(assert (not d!63057))

(assert (not b!181130))

(assert (not d!63071))

(assert (not b!181349))

(assert (not d!63083))

(assert (not b!181340))

(assert (not d!63067))

(assert (not b!181341))

(assert (not b!181181))

(assert (not b!181339))

(assert (not d!63103))

(assert (not d!63125))

(assert (not b!181184))

(assert (not d!63091))

(assert (not b!181131))

(assert (not b!181169))

(assert (not d!63095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

