; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55652 () Bool)

(assert start!55652)

(declare-fun b!258903 () Bool)

(declare-fun res!216881 () Bool)

(declare-fun e!179579 () Bool)

(assert (=> b!258903 (=> (not res!216881) (not e!179579))))

(declare-datatypes ((array!14122 0))(
  ( (array!14123 (arr!7173 (Array (_ BitVec 32) (_ BitVec 8))) (size!6186 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11294 0))(
  ( (BitStream!11295 (buf!6708 array!14122) (currentByte!12331 (_ BitVec 32)) (currentBit!12326 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11294)

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22152 0))(
  ( (tuple2!22153 (_1!12012 Bool) (_2!12012 BitStream!11294)) )
))
(declare-fun readBit!0 (BitStream!11294) tuple2!22152)

(assert (=> b!258903 (= res!216881 (not (= (_1!12012 (readBit!0 thiss!1754)) expected!109)))))

(declare-fun b!258904 () Bool)

(declare-fun res!216883 () Bool)

(assert (=> b!258904 (=> (not res!216883) (not e!179579))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258904 (= res!216883 (validate_offset_bits!1 ((_ sign_extend 32) (size!6186 (buf!6708 thiss!1754))) ((_ sign_extend 32) (currentByte!12331 thiss!1754)) ((_ sign_extend 32) (currentBit!12326 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258905 () Bool)

(declare-fun e!179580 () Bool)

(declare-fun array_inv!5927 (array!14122) Bool)

(assert (=> b!258905 (= e!179580 (array_inv!5927 (buf!6708 thiss!1754)))))

(declare-fun res!216882 () Bool)

(assert (=> start!55652 (=> (not res!216882) (not e!179579))))

(assert (=> start!55652 (= res!216882 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55652 e!179579))

(assert (=> start!55652 true))

(declare-fun inv!12 (BitStream!11294) Bool)

(assert (=> start!55652 (and (inv!12 thiss!1754) e!179580)))

(declare-fun lt!400673 () (_ BitVec 64))

(declare-fun lt!400672 () (_ BitVec 64))

(declare-fun b!258906 () Bool)

(assert (=> b!258906 (= e!179579 (and (not (= lt!400672 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400672 (bvand (bvsub lt!400673 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258906 (= lt!400672 (bvand lt!400673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258906 (= lt!400673 (bvadd (bitIndex!0 (size!6186 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754) (currentBit!12326 thiss!1754)) nBits!535))))

(declare-fun b!258907 () Bool)

(declare-fun res!216880 () Bool)

(assert (=> b!258907 (=> (not res!216880) (not e!179579))))

(assert (=> b!258907 (= res!216880 (not (= from!526 nBits!535)))))

(assert (= (and start!55652 res!216882) b!258904))

(assert (= (and b!258904 res!216883) b!258907))

(assert (= (and b!258907 res!216880) b!258903))

(assert (= (and b!258903 res!216881) b!258906))

(assert (= start!55652 b!258905))

(declare-fun m!388255 () Bool)

(assert (=> b!258904 m!388255))

(declare-fun m!388257 () Bool)

(assert (=> b!258905 m!388257))

(declare-fun m!388259 () Bool)

(assert (=> b!258906 m!388259))

(declare-fun m!388261 () Bool)

(assert (=> b!258903 m!388261))

(declare-fun m!388263 () Bool)

(assert (=> start!55652 m!388263))

(push 1)

(assert (not b!258903))

(assert (not b!258904))

(assert (not b!258905))

(assert (not b!258906))

(assert (not start!55652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86908 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86908 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6186 (buf!6708 thiss!1754))) ((_ sign_extend 32) (currentByte!12331 thiss!1754)) ((_ sign_extend 32) (currentBit!12326 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6186 (buf!6708 thiss!1754))) ((_ sign_extend 32) (currentByte!12331 thiss!1754)) ((_ sign_extend 32) (currentBit!12326 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21999 () Bool)

(assert (= bs!21999 d!86908))

(declare-fun m!388283 () Bool)

(assert (=> bs!21999 m!388283))

(assert (=> b!258904 d!86908))

(declare-fun d!86910 () Bool)

(assert (=> d!86910 (= (array_inv!5927 (buf!6708 thiss!1754)) (bvsge (size!6186 (buf!6708 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258905 d!86910))

(declare-fun d!86912 () Bool)

(declare-fun e!179604 () Bool)

(assert (=> d!86912 e!179604))

(declare-fun res!216907 () Bool)

(assert (=> d!86912 (=> (not res!216907) (not e!179604))))

(declare-fun lt!400769 () (_ BitVec 64))

(declare-fun lt!400764 () (_ BitVec 64))

(declare-fun lt!400767 () (_ BitVec 64))

(assert (=> d!86912 (= res!216907 (= lt!400767 (bvsub lt!400769 lt!400764)))))

(assert (=> d!86912 (or (= (bvand lt!400769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400764 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400769 lt!400764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86912 (= lt!400764 (remainingBits!0 ((_ sign_extend 32) (size!6186 (buf!6708 thiss!1754))) ((_ sign_extend 32) (currentByte!12331 thiss!1754)) ((_ sign_extend 32) (currentBit!12326 thiss!1754))))))

(declare-fun lt!400766 () (_ BitVec 64))

(declare-fun lt!400765 () (_ BitVec 64))

(assert (=> d!86912 (= lt!400769 (bvmul lt!400766 lt!400765))))

(assert (=> d!86912 (or (= lt!400766 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400765 (bvsdiv (bvmul lt!400766 lt!400765) lt!400766)))))

(assert (=> d!86912 (= lt!400765 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86912 (= lt!400766 ((_ sign_extend 32) (size!6186 (buf!6708 thiss!1754))))))

(assert (=> d!86912 (= lt!400767 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12331 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12326 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86912 (invariant!0 (currentBit!12326 thiss!1754) (currentByte!12331 thiss!1754) (size!6186 (buf!6708 thiss!1754)))))

(assert (=> d!86912 (= (bitIndex!0 (size!6186 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754) (currentBit!12326 thiss!1754)) lt!400767)))

(declare-fun b!258930 () Bool)

(declare-fun res!216906 () Bool)

(assert (=> b!258930 (=> (not res!216906) (not e!179604))))

(assert (=> b!258930 (= res!216906 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400767))))

(declare-fun b!258931 () Bool)

(declare-fun lt!400768 () (_ BitVec 64))

(assert (=> b!258931 (= e!179604 (bvsle lt!400767 (bvmul lt!400768 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258931 (or (= lt!400768 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400768 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400768)))))

(assert (=> b!258931 (= lt!400768 ((_ sign_extend 32) (size!6186 (buf!6708 thiss!1754))))))

(assert (= (and d!86912 res!216907) b!258930))

(assert (= (and b!258930 res!216906) b!258931))

(assert (=> d!86912 m!388283))

(declare-fun m!388295 () Bool)

(assert (=> d!86912 m!388295))

(assert (=> b!258906 d!86912))

(declare-fun d!86916 () Bool)

(assert (=> d!86916 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12326 thiss!1754) (currentByte!12331 thiss!1754) (size!6186 (buf!6708 thiss!1754))))))

(declare-fun bs!22001 () Bool)

(assert (= bs!22001 d!86916))

(assert (=> bs!22001 m!388295))

(assert (=> start!55652 d!86916))

(declare-fun d!86918 () Bool)

(declare-fun e!179611 () Bool)

(assert (=> d!86918 e!179611))

(declare-fun res!216910 () Bool)

(assert (=> d!86918 (=> (not res!216910) (not e!179611))))

(declare-datatypes ((Unit!18445 0))(
  ( (Unit!18446) )
))
(declare-datatypes ((tuple2!22158 0))(
  ( (tuple2!22159 (_1!12015 Unit!18445) (_2!12015 BitStream!11294)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11294) tuple2!22158)

(assert (=> d!86918 (= res!216910 (= (buf!6708 (_2!12015 (increaseBitIndex!0 thiss!1754))) (buf!6708 thiss!1754)))))

(declare-fun lt!400790 () Bool)

(assert (=> d!86918 (= lt!400790 (not (= (bvand ((_ sign_extend 24) (select (arr!7173 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12326 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400788 () tuple2!22152)

(assert (=> d!86918 (= lt!400788 (tuple2!22153 (not (= (bvand ((_ sign_extend 24) (select (arr!7173 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12326 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12015 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86918 (validate_offset_bit!0 ((_ sign_extend 32) (size!6186 (buf!6708 thiss!1754))) ((_ sign_extend 32) (currentByte!12331 thiss!1754)) ((_ sign_extend 32) (currentBit!12326 thiss!1754)))))

(assert (=> d!86918 (= (readBit!0 thiss!1754) lt!400788)))

(declare-fun lt!400784 () (_ BitVec 64))

(declare-fun lt!400785 () (_ BitVec 64))

(declare-fun b!258934 () Bool)

(assert (=> b!258934 (= e!179611 (= (bitIndex!0 (size!6186 (buf!6708 (_2!12015 (increaseBitIndex!0 thiss!1754)))) (currentByte!12331 (_2!12015 (increaseBitIndex!0 thiss!1754))) (currentBit!12326 (_2!12015 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400785 lt!400784)))))

(assert (=> b!258934 (or (not (= (bvand lt!400785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400784 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400785 lt!400784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258934 (= lt!400784 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258934 (= lt!400785 (bitIndex!0 (size!6186 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754) (currentBit!12326 thiss!1754)))))

(declare-fun lt!400786 () Bool)

(assert (=> b!258934 (= lt!400786 (not (= (bvand ((_ sign_extend 24) (select (arr!7173 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12326 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400787 () Bool)

(assert (=> b!258934 (= lt!400787 (not (= (bvand ((_ sign_extend 24) (select (arr!7173 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12326 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400789 () Bool)

(assert (=> b!258934 (= lt!400789 (not (= (bvand ((_ sign_extend 24) (select (arr!7173 (buf!6708 thiss!1754)) (currentByte!12331 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12326 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86918 res!216910) b!258934))

(declare-fun m!388297 () Bool)

(assert (=> d!86918 m!388297))

(declare-fun m!388299 () Bool)

(assert (=> d!86918 m!388299))

(declare-fun m!388301 () Bool)

(assert (=> d!86918 m!388301))

(declare-fun m!388303 () Bool)

(assert (=> d!86918 m!388303))

(assert (=> b!258934 m!388301))

(assert (=> b!258934 m!388259))

(assert (=> b!258934 m!388297))

(declare-fun m!388305 () Bool)

(assert (=> b!258934 m!388305))

(assert (=> b!258934 m!388299))

(assert (=> b!258903 d!86918))

(push 1)

(assert (not d!86908))

(assert (not d!86918))

(assert (not d!86916))

(assert (not b!258934))

(assert (not d!86912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

